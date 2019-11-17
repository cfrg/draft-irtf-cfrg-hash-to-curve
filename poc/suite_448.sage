#!/usr/bin/sage
# vim: syntax=python

import hashlib
import sys
try:
    from sagelib.common import sgn0_le
    from sagelib.h2c_suite import BasicH2CSuiteDef, EdwH2CSuiteDef, EdwH2CSuite, MontyH2CSuite
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

monty_suite = BasicH2CSuiteDef(F, Ap, Bp, sgn0_le, hashlib.sha512, 84, None, 4, True, DST)
edw_suite = EdwH2CSuiteDef(monty_suite._replace(Aa=a, Bd=d), Ap, Bp, m2e_448)
edw_hash = EdwH2CSuite(edw_suite)
monty_hash = MontyH2CSuite(monty_suite)
assert edw_hash.m2c.Z == -1
assert monty_hash.m2c.Z == -1

group_order = 2^446 - 0x8335dc163bb124b65129c96fde933d8d723a70aadc873d6d54a7bb0d

def test_suite_448():
    accumE = edw_hash('asdf')
    accumM = monty_hash('asdf')
    for _ in range(0, 128):
        msg = ''.join( chr(randrange(32, 126)) for _ in range(0, 32) )
        edw_out = edw_hash(msg)
        monty_out = monty_hash(msg)
        assert tuple(edw_out) == m2e_448(monty_out)
        assert (edw_out * group_order).is_zero()
        accumE += edw_out
        accumM += monty_out
    assert (edw_out * group_order).is_zero()
    assert (monty_out * group_order).is_zero()

if __name__ == "__main__":
    test_suite_448()
