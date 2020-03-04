#!/usr/bin/sage
# vim: syntax=python

import hashlib
import sys
from hash_to_field import expand_message_xmd
try:
    from sagelib.common import sgn0_le
    from sagelib.h2c_suite import BasicH2CSuiteDef, EdwH2CSuiteDef, EdwH2CSuite, MontyH2CSuite
    from sagelib.suite_25519 import _test_suite
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

DST = "QUUX-V01-CS02"
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

monty_suite = BasicH2CSuiteDef("curve448", F, Ap, Bp, sgn0_le, expand_message_xmd, hashlib.sha512, 84, None, 4, 224, True, DST)
edw_suite = EdwH2CSuiteDef(monty_suite._replace(E="edwards448",Aa=a, Bd=d), Ap, Bp, m2e_448)
edw448_hash_ro = EdwH2CSuite("edwards448-XMD:SHA.512-EDELL2-RO-",edw_suite)
monty448_hash_ro = MontyH2CSuite("curve448-XMD:SHA.512-ELL2-RO-",monty_suite)
edw448_hash_nu = EdwH2CSuite("edwards448-XMD:SHA.512-EDELL2-NU-",edw_suite._replace(base=edw_suite.base._replace(is_ro=False)))
monty448_hash_nu = MontyH2CSuite("curve448-XMD:SHA.512-ELL2-NU-",monty_suite._replace(is_ro=False))
assert edw448_hash_ro.m2c.Z == edw448_hash_nu.m2c.Z == -1
assert monty448_hash_ro.m2c.Z == monty448_hash_nu.m2c.Z == -1

group_order = 2^446 - 0x8335dc163bb124b65129c96fde933d8d723a70aadc873d6d54a7bb0d

def test_suite_448():
    _test_suite(edw448_hash_ro, monty448_hash_ro, m2e_448, group_order)
    _test_suite(edw448_hash_nu, monty448_hash_nu, m2e_448, group_order)

if __name__ == "__main__":
    test_suite_448()
