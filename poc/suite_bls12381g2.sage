#!/usr/bin/sage
# vim: syntax=python

import hashlib
import sys
try:
    from sagelib.common import sgn0_be
    from sagelib.h2c_suite import BasicH2CSuiteDef, BasicH2CSuite, IsoH2CSuiteDef, IsoH2CSuite
    from sagelib.svdw_generic import GenericSvdW
    from sagelib.sswu_generic import GenericSSWU
    from sagelib.suite_p256 import _test_suite
    from sagelib.iso_values import iso_bls12381g2
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

p = 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab
F.<II> = GF(p^2, modulus=[1,0,1])
A = F(0)
B = F(4 * (1 + II))
Ap = F(240 * II)
Bp = F(1012 * (1 + II))
h2 = 0x5d543a95414e7f1091d50792876a202cd91de4547085abaa68a205b2e5a7ddfa628f1cb4d9e82ef21537e293a6691ae1616ec6e786f0c70cf1c38e31c7238e5
ell_u = 0xd201000000010000
h_eff = h2 * (3 * ell_u^2 - 3)
iso_map = iso_bls12381g2()

bls12381g2_svdw_def = BasicH2CSuiteDef(F, A, B, sgn0_be, hashlib.sha256, 64, GenericSvdW, h_eff, True, "asdf")
bls12381g2_sswu_def = IsoH2CSuiteDef(bls12381g2_svdw_def._replace(MapT=GenericSSWU), Ap, Bp, iso_map)
bls12381g2_svdw = BasicH2CSuite(bls12381g2_svdw_def)
bls12381g2_sswu = IsoH2CSuite(bls12381g2_sswu_def)
assert bls12381g2_sswu.m2c.Z == F(-2 - II)
assert bls12381g2_svdw.m2c.Z == F(II)

bls12381g2_order = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001

def test_suite_bls12381g2():
    _test_suite(bls12381g2_sswu, bls12381g2_order, 8)
    _test_suite(bls12381g2_svdw, bls12381g2_order, 8)

if __name__ == "__main__":
    test_suite_bls12381g2()
