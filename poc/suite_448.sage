#!/usr/bin/sage
# vim: syntax=python

import hashlib
import sys
from hash_to_field import XOFExpander
try:
    from sagelib.common import test_dst
    from sagelib.h2c_suite import BasicH2CSuiteDef, EdwH2CSuiteDef, EdwH2CSuite, MontyH2CSuite
    from sagelib.suite_25519 import _test_suite
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

p = 2^448 - 2^224 - 1
F = GF(p)
Ap = F(156326)  # Bp * y^2 = x^3 + Ap * x^2 + x
Bp = F(1)
a = F(1)        # a * v^2 + w^2 = 1 + d * v^2 * w^2
d = F(-39081)

def m2e_448(P):
    (u, v, z) = P
    u = F(u)
    v = F(v)
    z = F(z)
    if z == 0:
        return (0, 1, 0)
    u = u / z
    v = v / z
    assert Bp * v^2 == u^3 + Ap * u^2 + u, "bad input point"
    xn = 4 * v * (u^2 - 1)
    xd = (u^4 - 2 * u^2 + 4 * v^2 + 1)
    yn = -(u^5 - 2 * u^3 - 4 * u * v^2 + u)
    yd = (u^5 - 2 * u^2 * v^2 - 2 * u^3 - 2 * v^2 + u)
    if xd * yd == 0:
        return (0, 1, 0)
    return (xn / xd, yn / yd, 1)

def monty_suite(suite_name, is_ro):
    dst = test_dst(suite_name)
    k = 224
    expander = XOFExpander(dst, hashlib.shake_256, k)
    return BasicH2CSuiteDef("curve448", F, Ap, Bp, expander, hashlib.shake_256, 84, None, 4, k, is_ro, expander.dst)

def edw_suite(suite_name, is_ro):
    return EdwH2CSuiteDef(monty_suite(suite_name, is_ro)._replace(E="edwards448",Aa=a, Bd=d), Ap, Bp, m2e_448)

suite_name = "edwards448_XOF:SHAKE256_ELL2_RO_"
edw448_hash_ro = EdwH2CSuite(suite_name,edw_suite(suite_name, True))

suite_name = "curve448_XOF:SHAKE256_ELL2_RO_"
monty448_hash_ro = MontyH2CSuite(suite_name,monty_suite(suite_name, True))

suite_name = "edwards448_XOF:SHAKE256_ELL2_NU_"
edw448_hash_nu = EdwH2CSuite(suite_name,edw_suite(suite_name, False))

suite_name = "curve448_XOF:SHAKE256_ELL2_NU_"
monty448_hash_nu = MontyH2CSuite(suite_name,monty_suite(suite_name, False))

assert edw448_hash_ro.m2c.Z == edw448_hash_nu.m2c.Z == -1
assert monty448_hash_ro.m2c.Z == monty448_hash_nu.m2c.Z == -1

group_order = 2^446 - 0x8335dc163bb124b65129c96fde933d8d723a70aadc873d6d54a7bb0d
curve448_order = group_order
curve448_p = p
curve448_F = F
curve448_A = Ap
curve448_B = Bp
edwards449_order = group_order
edwards449_p = p
edwards449_F = F
edwards449_A = a
edwards449_B = a

def test_suite_448():
    _test_suite(edw448_hash_ro, monty448_hash_ro, m2e_448, group_order)
    _test_suite(edw448_hash_nu, monty448_hash_nu, m2e_448, group_order)
    # make sure that when we use the same DST, we get the same result from edw and monty
    suite_name = "XXX_TEST_SUITE_XXX"
    _test_suite(EdwH2CSuite(suite_name, edw_suite(suite_name, True)),
                MontyH2CSuite(suite_name, monty_suite(suite_name, True)),
                m2e_448, group_order, nreps=128, is_equal=True)

if __name__ == "__main__":
    test_suite_448()
