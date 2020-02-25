#!/usr/bin/sage
# vim: syntax=python

import hashlib
import sys
from hash_to_field import expand_message_md
try:
    from sagelib.common import sgn0_be
    from sagelib.h2c_suite import BasicH2CSuiteDef, BasicH2CSuite, IsoH2CSuiteDef, IsoH2CSuite
    from sagelib.svdw_generic import GenericSvdW
    from sagelib.sswu_generic import GenericSSWU
    from sagelib.suite_p256 import _test_suite
    from sagelib.iso_values import iso_bls12381g1
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

DST = "QUUX-V01-CS02"
p = 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab
F = GF(p)
A = F(0)
B = F(4)
# Ap and Bp define isogenous curve y^2 = x^3 + Ap * x + Bp
Ap = F(0x144698a3b8e9433d693a02c96d4982b0ea985383ee66a8d8e8981aefd881ac98936f8da0e0f97f5cf428082d584c1d)
Bp = F(0x12e2908d11688030018b12e8753eee3b2016c1f0f24f4070a0b9c14fcef35ef55a23215a316ceaa5d1cc48e98e172be0)
h_eff = 0xd201000000010001
iso_map = iso_bls12381g1()

bls12381g1_svdw_def = BasicH2CSuiteDef("BLS12381G1", F, A, B, sgn0_be, expand_message_md, hashlib.sha256, 64, GenericSvdW, h_eff, 128, True, DST)
bls12381g1_sswu_def = IsoH2CSuiteDef(bls12381g1_svdw_def._replace(MapT=GenericSSWU), Ap, Bp, iso_map)
bls12381g1_svdw_ro = BasicH2CSuite("BLS12381G1-XMD:SHA.256-SVDW-RO-",bls12381g1_svdw_def)
bls12381g1_sswu_ro = IsoH2CSuite("BLS12381G1-XMD:SHA.256-SSWU-RO-",bls12381g1_sswu_def)
bls12381g1_svdw_nu = BasicH2CSuite("BLS12381G1-XMD:SHA.256-SVDW-NU-",bls12381g1_svdw_def._replace(is_ro=False))
bls12381g1_sswu_nu = IsoH2CSuite("BLS12381G1-XMD:SHA.256-SSWU-NU-",bls12381g1_sswu_def._replace(base=bls12381g1_sswu_def.base._replace(is_ro=False)))
assert bls12381g1_sswu_ro.m2c.Z == bls12381g1_sswu_nu.m2c.Z == 11
assert bls12381g1_svdw_ro.m2c.Z == bls12381g1_svdw_nu.m2c.Z == -3

bls12381g1_order = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001

def test_suite_bls12381g1():
    _test_suite(bls12381g1_sswu_ro, bls12381g1_order)
    _test_suite(bls12381g1_svdw_ro, bls12381g1_order)
    _test_suite(bls12381g1_sswu_nu, bls12381g1_order)
    _test_suite(bls12381g1_svdw_nu, bls12381g1_order)

if __name__ == "__main__":
    test_suite_bls12381g1()
