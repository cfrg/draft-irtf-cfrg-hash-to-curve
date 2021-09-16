#!/usr/bin/sage
# vim: syntax=python

import hashlib
import sys
from hash_to_field import XMDExpander
try:
    from sagelib.common import test_dst
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
# Ap and Bp define isogenous curve y^2 = x^3 + Ap * x + Bp
Ap = F(240 * II)
Bp = F(1012 * (1 + II))
h2 = 0x5d543a95414e7f1091d50792876a202cd91de4547085abaa68a205b2e5a7ddfa628f1cb4d9e82ef21537e293a6691ae1616ec6e786f0c70cf1c38e31c7238e5
ell_u = 0xd201000000010000
h_eff = h2 * (3 * ell_u^2 - 3)
iso_map = iso_bls12381g2()

def bls12381g2_svdw(suite_name, is_ro):
    dst = test_dst(suite_name)
    k = 128
    expander = XMDExpander(dst, hashlib.sha256, k)
    return BasicH2CSuiteDef("BLS12-381 G2", F, A, B, expander, hashlib.sha256, 64, GenericSvdW, h_eff, k, is_ro, expander.dst)

def bls12381g2_sswu(suite_name, is_ro):
    return IsoH2CSuiteDef(bls12381g2_svdw(suite_name, is_ro)._replace(MapT=GenericSSWU), Ap, Bp, iso_map)

suite_name = "BLS12381G2_XMD:SHA-256_SVDW_RO_"
bls12381g2_svdw_ro = BasicH2CSuite(suite_name,bls12381g2_svdw(suite_name, True))

suite_name = "BLS12381G2_XMD:SHA-256_SSWU_RO_"
bls12381g2_sswu_ro = IsoH2CSuite(suite_name,bls12381g2_sswu(suite_name, True))

suite_name = "BLS12381G2_XMD:SHA-256_SVDW_NU_"
bls12381g2_svdw_nu = BasicH2CSuite(suite_name,bls12381g2_svdw(suite_name, False))

suite_name = "BLS12381G2_XMD:SHA-256_SSWU_NU_"
bls12381g2_sswu_nu = IsoH2CSuite(suite_name,bls12381g2_sswu(suite_name, False))

assert bls12381g2_sswu_ro.m2c.Z == bls12381g2_sswu_nu.m2c.Z == F(-2 - II)
assert bls12381g2_svdw_ro.m2c.Z == bls12381g2_svdw_nu.m2c.Z == F(-1)

bls12381g2_order = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001

def test_suite_bls12381g2():
    _test_suite(bls12381g2_sswu_ro, bls12381g2_order, 8)
    _test_suite(bls12381g2_svdw_ro, bls12381g2_order, 8)
    _test_suite(bls12381g2_sswu_nu, bls12381g2_order, 8)
    _test_suite(bls12381g2_svdw_nu, bls12381g2_order, 8)

if __name__ == "__main__":
    test_suite_bls12381g2()
