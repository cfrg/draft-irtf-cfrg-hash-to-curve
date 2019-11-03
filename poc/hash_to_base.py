#!/usr/bin/python2
# vim: syntax=python
#
# This code was originally published as part of bls_sigs_ref,
#   https://github.com/kwantam/bls_sigs_ref

import hashlib
import hmac
import struct
import sys
if sys.version_info[0] != 2:
    raise RuntimeError("this code is geared toward Python2/Sage, not Python3")

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

# per RFC5869
def hkdf_extract(salt, ikm, hash_fn):
    if salt is None:
        salt = '\x00' * hash_fn().digest_size
    return hmac.HMAC(salt, ikm, hash_fn).digest()
def hkdf_expand(prk, info, length, hash_fn):
    digest_size = hash_fn().digest_size
    if len(prk) < digest_size:
        raise ValueError("length of prk must be at least Hashlen")
    nreps = (length + digest_size - 1) // digest_size
    if nreps == 0 or nreps > 255:
        raise ValueError("length arg to hkdf_expand cannot be longer than 255 * Hashlen")
    if info is None:
        info = ''
    last = okm = ''
    for rep in range(0, nreps):
        last = hmac.HMAC(prk, last + info + I2OSP(rep + 1, 1), hash_fn).digest()
        okm += last
    return okm[:length]

# from draft-irtf-cfrg-hash-to-curve
def hash_to_base(msg, ctr, dst, modulus, degree, blen, hash_fn):
    rets = [None] * degree
    msg_prime = hkdf_extract(dst, msg + '\x00', hash_fn)
    info_pfx = 'H2C' + I2OSP(ctr, 1)
    for i in range(0, degree):
        info = info_pfx + I2OSP(i + 1, 1)
        t = hkdf_expand(msg_prime, info, blen, hash_fn)
        rets[i] = OS2IP(t) % modulus
    return rets

def test():
    # test cases from RFC5869
    test_cases = [ ( hashlib.sha256
                   , '\x0b' * 22
                   , I2OSP(0x000102030405060708090a0b0c, 13)
                   , I2OSP(0xf0f1f2f3f4f5f6f7f8f9, 10)
                   , 42
                   , I2OSP(0x077709362c2e32df0ddc3f0dc47bba6390b6c73bb50f9c3122ec844ad7c2b3e5, 32)
                   , I2OSP(0x3cb25f25faacd57a90434f64d0362f2a2d2d0a90cf1a5a4c5db02d56ecc4c5bf34007208d5b887185865, 42)
                   ),
                   ( hashlib.sha256
                   , I2OSP(0x000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f, 80)
                   , I2OSP(0x606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeaf, 80)
                   , I2OSP(0xb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff, 80)
                   , 82
                   , I2OSP(0x06a6b88c5853361a06104c9ceb35b45cef760014904671014a193f40c15fc244, 32)
                   , I2OSP(0xb11e398dc80327a1c8e7f78c596a49344f012eda2d4efad8a050cc4c19afa97c59045a99cac7827271cb41c65e590e09da3275600c2f09b8367793a9aca3db71cc30c58179ec3e87c14c01d5c1f3434f1d87, 82)
                   ),
                   ( hashlib.sha256
                   , '\x0b' * 22
                   , ''
                   , ''
                   , 42
                   , I2OSP(0x19ef24a32c717b167f33a91d6f648bdf96596776afdb6377ac434c1c293ccb04, 32)
                   , I2OSP(0x8da4e775a563c18f715f802a063c5a31b8a11f5c5ee1879ec3454e5f3c738d2d9d201395faa4b61a96c8, 42)
                   ),
                   ( hashlib.sha1
                   , '\x0b' * 11
                   , I2OSP(0x000102030405060708090a0b0c, 13)
                   , I2OSP(0xf0f1f2f3f4f5f6f7f8f9, 10)
                   , 42
                   , I2OSP(0x9b6c18c432a7bf8f0e71c8eb88f4b30baa2ba243, 20)
                   , I2OSP(0x085a01ea1b10f36933068b56efa5ad81a4f14b822f5b091568a9cdd4f155fda2c22e422478d305f3f896, 42)
                   ),
                   ( hashlib.sha1
                   , I2OSP(0x000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f, 80)
                   , I2OSP(0x606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeaf, 80)
                   , I2OSP(0xb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff, 80)
                   , 82
                   , I2OSP(0x8adae09a2a307059478d309b26c4115a224cfaf6, 20)
                   , I2OSP(0x0bd770a74d1160f7c9f12cd5912a06ebff6adcae899d92191fe4305673ba2ffe8fa3f1a4e5ad79f3f334b3b202b2173c486ea37ce3d397ed034c7f9dfeb15c5e927336d0441f4c4300e2cff0d0900b52d3b4, 82)
                   ),
                   ( hashlib.sha1
                   , '\x0b' * 22
                   , ''
                   , ''
                   , 42
                   , I2OSP(0xda8c8a73c7fa77288ec6f5e7c297786aa0d32d01, 20)
                   , I2OSP(0x0ac1af7002b3d761d1e55298da9d0506b9ae52057220a306e07b6b87e8df21d0ea00033de03984d34918, 42)
                   ),
                   ( hashlib.sha1
                   , '\x0c' * 22
                   , None
                   , ''
                   , 42
                   , I2OSP(0x2adccada18779e7c2077ad2eb19d3f3e731385dd, 20)
                   , I2OSP(0x2c91117204d745f3500d636a62f64f0ab3bae548aa53d423b0d1f27ebba6f5e5673a081d70cce7acfc48, 42)
                   )
                 ]
    for (h, i, s, n, l, p, o) in test_cases:
        pp = hkdf_extract(s, i, h)
        op = hkdf_expand(pp, n, l, h)
        assert pp == p, "prk mismatch"
        assert op == o, "okm mismatch"

if __name__ == "__main__":
    test()
