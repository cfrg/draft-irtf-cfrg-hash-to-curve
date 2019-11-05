#!/usr/bin/sage
# vim: syntax=python

import hashlib
import sys
try:
    from sagelib.common import sgn0_le
    from sagelib.h2c_suite import BasicH2CSuiteDef, EdwH2CSuiteDef, EdwH2CSuite, MontyH2CSuite
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

p = 2^255 - 19
F = GF(p)
Ap = F(486662)
Bp = F(1)
sqrt486664 = F(-486664).sqrt()
sqrt486664 *= sgn0_le(sqrt486664)
a = F(-1)
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

monty_suite = BasicH2CSuiteDef(F, Ap, Bp, sgn0_le, hashlib.sha256, 48, None, 8, True, "asdf")
edw_suite = EdwH2CSuiteDef(monty_suite._replace(Aa=a, Bd=d), Ap, Bp, m2e_25519)
edw_hash = EdwH2CSuite(edw_suite)
monty_hash = MontyH2CSuite(monty_suite)
group_order = 2^252 + 0x14def9dea2f79cd65812631a5cf5d3ed

def test_suite_25519():
    for _ in range(0, 128):
        msg = ''.join( chr(randrange(32, 126)) for _ in range(0, 32) )
        edw_out = edw_hash(msg)
        monty_out = monty_hash(msg)
        assert tuple(edw_out) == m2e_25519(monty_out)
        assert (edw_out * group_order).is_zero()
        assert (monty_out * group_order).is_zero()
