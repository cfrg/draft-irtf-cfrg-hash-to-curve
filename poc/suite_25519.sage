#!/usr/bin/sage
# vim: syntax=python

import hashlib
import sys
from hash_to_field import XMDExpander
try:
    from sagelib.common import sgn0, test_dst
    from sagelib.h2c_suite import BasicH2CSuiteDef, EdwH2CSuiteDef, EdwH2CSuite, MontyH2CSuite
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

p = 2^255 - 19
F = GF(p)
Ap = F(486662)  # Bp * y^2 = x^3 + Ap * x^2 + x
Bp = F(1)
sqrt_minus_486664 = F(-486664).sqrt()
if sgn0(sqrt_minus_486664) == 1:
    sqrt_minus_486664 = -sqrt_minus_486664
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
    v = sqrt_minus_486664 * x / y
    w = (x - 1) / (x + 1)
    assert a * v^2 + w^2 == 1 + d * v^2 * w^2, "bad output point"
    return (v, w, 1)

def monty_suite(suite_name, hash_fn, is_ro):
    dst = test_dst(suite_name)
    k = 128
    expander = XMDExpander(dst, hash_fn, k)
    return BasicH2CSuiteDef("curve25519", F, Ap, Bp, expander, hash_fn, 48, None, 8, k, is_ro, expander.dst)

def edw_suite(suite_name, hash_fn, is_ro):
    return EdwH2CSuiteDef(monty_suite(suite_name, hash_fn, is_ro)._replace(E="edwards25519",Aa=a, Bd=d), Ap, Bp, m2e_25519)

suite_name = "edwards25519_XMD:SHA-256_ELL2_RO_"
edw25519_sha256_ro = EdwH2CSuite(suite_name,edw_suite(suite_name, hashlib.sha256, True))

suite_name = "curve25519_XMD:SHA-256_ELL2_RO_"
monty25519_sha256_ro = MontyH2CSuite(suite_name,monty_suite(suite_name, hashlib.sha256, True))

suite_name = "edwards25519_XMD:SHA-256_ELL2_NU_"
edw25519_sha256_nu = EdwH2CSuite(suite_name,edw_suite(suite_name, hashlib.sha256, False))

suite_name = "curve25519_XMD:SHA-256_ELL2_NU_"
monty25519_sha256_nu = MontyH2CSuite(suite_name,monty_suite(suite_name, hashlib.sha256, False))

suite_name = "edwards25519_XMD:SHA-512_ELL2_RO_"
edw25519_sha512_ro = EdwH2CSuite(suite_name,edw_suite(suite_name, hashlib.sha512, True))

suite_name = "curve25519_XMD:SHA-512_ELL2_RO_"
monty25519_sha512_ro = MontyH2CSuite(suite_name,monty_suite(suite_name, hashlib.sha512, True))

suite_name = "edwards25519_XMD:SHA-512_ELL2_NU_"
edw25519_sha512_nu = EdwH2CSuite(suite_name,edw_suite(suite_name, hashlib.sha512, False))

suite_name = "curve25519_XMD:SHA-512_ELL2_NU_"
monty25519_sha512_nu = MontyH2CSuite(suite_name,monty_suite(suite_name, hashlib.sha512, False))

assert edw25519_sha256_ro.m2c.Z == edw25519_sha256_nu.m2c.Z == 2
assert monty25519_sha256_ro.m2c.Z == monty25519_sha256_nu.m2c.Z == 2
assert edw25519_sha512_ro.m2c.Z == edw25519_sha512_nu.m2c.Z == 2
assert monty25519_sha512_ro.m2c.Z == monty25519_sha512_nu.m2c.Z == 2

group_order = 2^252 + 0x14def9dea2f79cd65812631a5cf5d3ed
curve25519_order = group_order
curve25519_p = p
curve25519_F = F
curve25519_A = Ap
curve25519_B = Bp
edwards25519_order = group_order
edwards25519_p = p
edwards25519_F = F
edwards25519_A = a
edwards25519_B = a

def _test_suite(edw_hash, monty_hash, m2e, grp_ord, nreps=128, is_equal=False):
    accumE = edw_hash('asdf')
    accumM = monty_hash('asdf')
    for _ in range(0, nreps):
        msg = ''.join( chr(randrange(32, 126)) for _ in range(0, 32) )
        edw_out = edw_hash(msg)
        monty_out = monty_hash(msg)
        assert (tuple(edw_out) == m2e(monty_out)) == is_equal
        accumE += edw_out
        accumM += monty_out
    assert (edw_out * grp_ord).is_zero()
    assert (monty_out * grp_ord).is_zero()

def test_suite_25519():
    _test_suite(edw25519_sha256_ro, monty25519_sha256_ro, m2e_25519, group_order)
    _test_suite(edw25519_sha256_nu, monty25519_sha256_nu, m2e_25519, group_order)
    _test_suite(edw25519_sha512_ro, monty25519_sha512_ro, m2e_25519, group_order)
    _test_suite(edw25519_sha512_nu, monty25519_sha512_nu, m2e_25519, group_order)
    # make sure that when we use the same DST, we get the same result from edw and monty
    suite_name = "XXX_TEST_SUITE_XXX"
    _test_suite(EdwH2CSuite(suite_name, edw_suite(suite_name, hashlib.sha512, True)),
                MontyH2CSuite(suite_name, monty_suite(suite_name, hashlib.sha512, True)),
                m2e_25519, group_order, nreps=128, is_equal=True)

if __name__ == "__main__":
    test_suite_25519()
