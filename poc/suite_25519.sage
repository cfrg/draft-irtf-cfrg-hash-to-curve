#!/usr/bin/sage
# vim: syntax=python

import hashlib
import sys
from hash_to_field import expand_message_xmd
try:
    from sagelib.common import sgn0_le
    from sagelib.h2c_suite import BasicH2CSuiteDef, EdwH2CSuiteDef, EdwH2CSuite, MontyH2CSuite
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

DST = "QUUX-V01-CS02"
p = 2^255 - 19
F = GF(p)
Ap = F(486662)  # Bp * y^2 = x^3 + Ap * x^2 + x
Bp = F(1)
sqrt486664 = F(-486664).sqrt()
sqrt486664 *= sgn0_le(sqrt486664)
a = F(-1)       # a * v^2 + w^2 = 1 + d * v^2 * w^2
d = F(0x52036cee2b6ffe738cc740797779e89800700a4d4141d8ab75eb4dca135978a3)

def m2e_25519(P):
    (x, y, z) = P
    x = F(x)
    y = F(y)
    z = F(z)
    if z == 0:
        return (0, 1, 0)
    x = x / z
    y = y / z
    assert Bp * y^2 == x^3 + Ap * x^2 + x, "bad input point"
    if x == 0 and y == 0:
        return (0, -1, 0)
    if y == 0 or x == -1:
        return (0, 1, 0)
    v = sqrt486664 * x / y
    w = (x - 1) / (x + 1)
    assert a * v^2 + w^2 == 1 + d * v^2 * w^2, "bad output point"
    return (v, w, 1)

monty_suite = BasicH2CSuiteDef("curve25519", F, Ap, Bp, sgn0_le, expand_message_xmd, hashlib.sha256, 48, None, 8, 128, True, DST)
edw_suite = EdwH2CSuiteDef(monty_suite._replace(E="edwards25519",Aa=a, Bd=d), Ap, Bp, m2e_25519)
edw25519_sha256_ro = EdwH2CSuite("edwards25519_XMD:SHA-256_EDELL2_RO_",edw_suite)
monty25519_sha256_ro = MontyH2CSuite("curve25519_XMD:SHA-256_ELL2_RO_",monty_suite)
edw25519_sha256_nu = EdwH2CSuite("edwards25519_XMD:SHA-256_EDELL2_NU_",edw_suite._replace(base=edw_suite.base._replace(is_ro=False)))
monty25519_sha256_nu = MontyH2CSuite("curve25519_XMD:SHA-256_ELL2_NU_",monty_suite._replace(is_ro=False))

edw25519_sha512_ro = EdwH2CSuite("edwards25519_XMD:SHA-512_EDELL2_RO_",edw_suite._replace(base=edw_suite.base._replace(H=hashlib.sha512)))
monty25519_sha512_ro = MontyH2CSuite("curve25519_XMD:SHA-512_ELL2_RO_",monty_suite._replace(H=hashlib.sha512))
edw25519_sha512_nu = EdwH2CSuite("edwards25519_XMD:SHA-512_EDELL2_NU_",edw_suite._replace(base=edw_suite.base._replace(H=hashlib.sha512,is_ro=False)))
monty25519_sha512_nu = MontyH2CSuite("curve25519_XMD:SHA-512_ELL2_NU_",monty_suite._replace(H=hashlib.sha512,is_ro=False))
assert edw25519_sha256_ro.m2c.Z == edw25519_sha256_nu.m2c.Z == 2
assert monty25519_sha256_ro.m2c.Z == monty25519_sha256_nu.m2c.Z == 2
assert edw25519_sha512_ro.m2c.Z == edw25519_sha512_nu.m2c.Z == 2
assert monty25519_sha512_ro.m2c.Z == monty25519_sha512_nu.m2c.Z == 2

group_order = 2^252 + 0x14def9dea2f79cd65812631a5cf5d3ed

def _test_suite(edw_hash, monty_hash, m2e, group_order, nreps=128):
    accumE = edw_hash('asdf')
    accumM = monty_hash('asdf')
    for _ in range(0, 128):
        msg = ''.join( chr(randrange(32, 126)) for _ in range(0, 32) )
        edw_out = edw_hash(msg)
        monty_out = monty_hash(msg)
        assert tuple(edw_out) == m2e(monty_out)
        accumE += edw_out
        accumM += monty_out
    assert (edw_out * group_order).is_zero()
    assert (monty_out * group_order).is_zero()

def test_suite_25519():
    _test_suite(edw25519_sha256_ro, monty25519_sha256_ro, m2e_25519, group_order)
    _test_suite(edw25519_sha256_nu, monty25519_sha256_nu, m2e_25519, group_order)
    _test_suite(edw25519_sha512_ro, monty25519_sha512_ro, m2e_25519, group_order)
    _test_suite(edw25519_sha512_nu, monty25519_sha512_nu, m2e_25519, group_order)

if __name__ == "__main__":
    test_suite_25519()
