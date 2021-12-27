#!/usr/bin/python
# vim: syntax=python

import hashlib
import json
import math
import struct
from random import choice
import sys
if sys.version_info[0] == 3:
    xrange = range
    _as_bytes = lambda x: x if isinstance(x, bytes) else bytes(x, "utf-8")
    _strxor = lambda str1, str2: bytes( s1 ^ s2 for (s1, s2) in zip(str1, str2) )
else:
    _as_bytes = lambda x: x
    _strxor = lambda str1, str2: ''.join( chr(ord(s1) ^ ord(s2)) for (s1, s2) in zip(str1, str2) )

def to_hex(octet_string):
    if isinstance(octet_string, str):
        return "".join("{:02x}".format(ord(c)) for c in octet_string)
    assert isinstance(octet_string, bytes)
    return "".join("{:02x}".format(c) for c in octet_string)

# defined in RFC 3447, section 4.1
def I2OSP(val, length):
    val = int(val)
    if val < 0 or val >= (1 << (8 * length)):
        raise ValueError("bad I2OSP call: val=%d length=%d" % (val, length))
    ret = [0] * length
    val_ = val
    for idx in reversed(xrange(0, length)):
        ret[idx] = val_ & 0xff
        val_ = val_ >> 8
    ret = struct.pack("=" + "B" * length, *ret)
    assert OS2IP(ret, True) == val
    return ret

# defined in RFC 3447, section 4.2
def OS2IP(octets, skip_assert=False):
    ret = 0
    for octet in struct.unpack("=" + "B" * len(octets), octets):
        ret = ret << 8
        ret += octet
    if not skip_assert:
        assert octets == I2OSP(ret, len(octets))
    return ret

# from draft-irtf-cfrg-hash-to-curve-07
def hash_to_field(msg, count, modulus, degree, blen, expander):
    len_in_bytes = count * degree * blen
    uniform_bytes = expander.expand_message(msg, len_in_bytes)
    u_vals = [None] * count
    for i in xrange(0, count):
        e_vals = [None] * degree
        for j in xrange(0, degree):
            elm_offset = blen * (j + i * degree)
            tv = uniform_bytes[elm_offset : (elm_offset + blen)]
            e_vals[j] = OS2IP(tv) % modulus
        u_vals[i] = e_vals
    return u_vals

# from draft-irtf-cfrg-hash-to-curve-07
# hash_fn should be, e.g., hashlib.shake_128 (available in Python3 only)
def expand_message_xof(msg, dst, len_in_bytes, hash_fn, security_param, result_set=[]):
    if len(dst) > 255:
        raise ValueError("dst len should be at most 255 bytes")

    # compute prefix-free encoding of DST
    dst_prime = dst + I2OSP(len(dst), 1)
    assert len(dst_prime) == len(dst) + 1

    msg_prime = _as_bytes(msg) + I2OSP(len_in_bytes, 2) + dst_prime
    uniform_bytes = hash_fn(msg_prime).digest(int(len_in_bytes))

    vector = {
        "msg": msg,
        "len_in_bytes": "0x%x" % len_in_bytes,
        "k": "0x%x" % security_param,
        "DST_prime": to_hex(dst_prime),
        "msg_prime": to_hex(msg_prime),
        "uniform_bytes": to_hex(uniform_bytes),
    }
    result_set.append(vector)

    return uniform_bytes

# from draft-irtf-cfrg-hash-to-curve-07
# hash_fn should be, e.g., hashlib.sha256
def expand_message_xmd(msg, dst, len_in_bytes, hash_fn, security_param, result_set=[]):
    # sanity checks and basic parameters
    b_in_bytes = hash_fn().digest_size
    r_in_bytes = hash_fn().block_size
    assert 8 * b_in_bytes >= 2 * security_param
    if len(dst) > 255:
        raise ValueError("dst len should be at most 255 bytes")

    # compute ell and check that sizes are as we expect
    ell = (len_in_bytes + b_in_bytes - 1) // b_in_bytes
    if ell > 255:
        raise ValueError("bad expand_message_xmd call: ell was %d" % ell)

    # compute prefix-free encoding of DST
    dst_prime = dst + I2OSP(len(dst), 1)
    assert len(dst_prime) == len(dst) + 1

    # padding and length strings
    Z_pad = I2OSP(0, r_in_bytes)
    l_i_b_str = I2OSP(len_in_bytes, 2)

    # compute blocks
    b_vals = [None] * ell
    msg_prime = Z_pad + _as_bytes(msg) + l_i_b_str + I2OSP(0, 1) + dst_prime
    b_0 = hash_fn(msg_prime).digest()
    b_vals[0] = hash_fn(b_0 + I2OSP(1, 1) + dst_prime).digest()
    for i in xrange(1, ell):
        b_vals[i] = hash_fn(_strxor(b_0, b_vals[i - 1]) + I2OSP(i + 1, 1) + dst_prime).digest()

    # assemble output
    uniform_bytes = (b'').join(b_vals)
    output = uniform_bytes[0 : len_in_bytes]

    vector = {
        "msg": msg,
        "len_in_bytes": "0x%x" % len_in_bytes,
        "k": "0x%x" % security_param,
        "DST_prime": to_hex(dst_prime),
        "msg_prime": to_hex(msg_prime),
        "uniform_bytes": to_hex(output),
    }
    result_set.append(vector)

    return output

class Expander(object):
    def __init__(self, name, dst, dst_prime, hash_fn, security_param):
        self.name = name
        self._dst = dst_prime
        self.dst = dst
        self.hash_fn = hash_fn
        self.security_param = security_param
        self.test_vectors = []

    def expand_message(self, msg, len_in_bytes):
        raise Exception("Not implemented")

    def hash_name(self):
        name = self.hash_fn().name.upper()
        # Python incorrectly says SHAKE_128 rather than SHAKE128
        if name[:6] == "SHAKE_":
            name = "SHAKE" + name[6:]
        return name

    def __dict__(self):
        return {
            "name": self.name,
            "dst": to_hex(self.dst),
            "hash": self.hash_name(),
            "k": "0x%x" % self.security_param,
            "tests": json.dumps(self.test_vectors),
        }

class XMDExpander(Expander):
    def __init__(self, dst, hash_fn, security_param):
        dst_prime = _as_bytes(dst)
        if len(dst_prime) > 255:
            # https://cfrg.github.io/draft-irtf-cfrg-hash-to-curve/draft-irtf-cfrg-hash-to-curve.html#name-using-dsts-longer-than-255-
            dst_prime = hash_fn(_as_bytes("H2C-OVERSIZE-DST-") + _as_bytes(dst)).digest()
        else:
            dst_prime = _as_bytes(dst)
        super(XMDExpander, self).__init__("expand_message_xmd", dst, dst_prime, hash_fn, security_param)

    def expand_message(self, msg, len_in_bytes):
        return expand_message_xmd(msg, self._dst, len_in_bytes, self.hash_fn, self.security_param, self.test_vectors)

class XOFExpander(Expander):
    def __init__(self, dst, hash_fn, security_param):
        dst_prime = _as_bytes(dst)
        if len(dst_prime) > 255:
            # https://cfrg.github.io/draft-irtf-cfrg-hash-to-curve/draft-irtf-cfrg-hash-to-curve.html#name-using-dsts-longer-than-255-
            dst_prime = hash_fn(_as_bytes("H2C-OVERSIZE-DST-") + _as_bytes(dst)).digest(math.ceil(2 * security_param / 8))
        super(XOFExpander, self).__init__("expand_message_xof", dst, dst_prime, hash_fn, security_param)

    def expand_message(self, msg, len_in_bytes):
        return expand_message_xof(msg, self._dst, len_in_bytes, self.hash_fn, self.security_param, self.test_vectors)

def _random_string(strlen):
    return ''.join( chr(choice(range(65, 65 + 26))) for _ in range(0, strlen))

def _test_xmd():
    msg = _random_string(48)
    dst = _as_bytes(_random_string(16))
    ress = {}
    for l in range(16, 8192):
        result = expand_message_xmd(msg, dst, l, hashlib.sha512, 256)
        # check for correct length
        assert l == len(result)
        # check for unique outputs
        key = result[:16]
        ress[key] = ress.get(key, 0) + 1
    assert all( x == 1 for x in ress.values() )

def _test_xof():
    msg = _random_string(48)
    dst = _as_bytes(_random_string(16))
    ress = {}
    for l in range(16, 8192):
        result = expand_message_xof(msg, dst, l, hashlib.shake_128, 128)
        # check for correct length
        assert l == len(result)
        # check for unique outputs
        key = result[:16]
        ress[key] = ress.get(key, 0) + 1
    assert all( x == 1 for x in ress.values() )

def test_expand():
    _test_xmd()
    if sys.version_info[0] == 3:
        _test_xof()

if __name__ == "__main__":
    test_expand()
