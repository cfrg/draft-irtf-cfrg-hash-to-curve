#!/usr/bin/sage
# vim: syntax=python

import hashlib
import sys
try:
    from sagelib.common import sgn0_le
    from sagelib.h2c_suite import BasicH2CSuiteDef, BasicH2CSuite
    from sagelib.svdw_generic import GenericSvdW
    from sagelib.sswu_generic import GenericSSWU
    from sagelib.suite_p256 import _test_suite
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

p = 2^521 - 1
F = GF(p)
A = F(-3)
B = F(0x51953eb9618e1c9a1f929a21a0b68540eea2da725b99b315f3b8b489918ef109e156193951ec7e937b1652c0bd3bb1bf073573df883d2c34f1ef451fd46b503f00)

p521_sswu_def = BasicH2CSuiteDef(F, A, B, sgn0_le, hashlib.sha512, 96, GenericSSWU, 1, True, "asdf")
p521_svdw_def = p521_sswu_def._replace(MapT=GenericSvdW)
p521_sswu = BasicH2CSuite(p521_sswu_def)
p521_svdw = BasicH2CSuite(p521_svdw_def)
assert p521_sswu.m2c.Z == -4
assert p521_svdw.m2c.Z == 1

p521_order = 0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffa51868783bf2f966b7fcc0148f709a5d03bb5c9b8899c47aebb6fb71e91386409

def test_suite_p521():
    _test_suite(p521_sswu, p521_order)
    _test_suite(p521_svdw, p521_order)

if __name__ == "__main__":
    test_suite_p521()
