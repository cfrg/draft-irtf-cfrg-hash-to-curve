#!/usr/bin/sage
# vim: syntax=python

import hashlib
import sys
try:
    from sagelib.common import sgn0_le
    from sagelib.h2c_suite import BasicH2CSuiteDef, BasicH2CSuite, IsoH2CSuiteDef, IsoH2CSuite
    from sagelib.svdw_generic import GenericSvdW
    from sagelib.sswu_generic import GenericSSWU
    from sagelib.suite_p256 import _test_suite
    from sagelib.iso_values import iso_secp256k1
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

DST = "QUUX-V01-CS02"
p = 2^256 - 2^32 - 2^9 - 2^8 - 2^7 - 2^6 - 2^4 - 1
F = GF(p)
A = F(0)
B = F(7)
# Ap and Bp define isogenous curve y^2 = x^3 + Ap * x + Bp
Ap = F(0x3f8731abdd661adca08a5558f0f5d272e953d363cb6f0e5d405447c01a444533)
Bp = F(1771)
iso_map = iso_secp256k1()

secp256k1_svdw_def = BasicH2CSuiteDef("secp256k1", F, A, B, sgn0_le, hashlib.sha256, 48, GenericSvdW, 1, True, DST)
secp256k1_sswu_def = IsoH2CSuiteDef(secp256k1_svdw_def._replace(MapT=GenericSSWU), Ap, Bp, iso_map)
secp256k1_sswu_ro = IsoH2CSuite("secp256k1-SHA256-SSWU-RO-",secp256k1_sswu_def)
secp256k1_svdw_ro = BasicH2CSuite("secp256k1-SHA256-SVDW-RO-",secp256k1_svdw_def)
secp256k1_sswu_nu = IsoH2CSuite("secp256k1-SHA256-SSWU-NU-",secp256k1_sswu_def._replace(base=secp256k1_sswu_def.base._replace(is_ro=False)))
secp256k1_svdw_nu = BasicH2CSuite("secp256k1-SHA256-SVDW-NU-",secp256k1_svdw_def._replace(is_ro=False))
assert secp256k1_sswu_ro.m2c.Z == secp256k1_sswu_nu.m2c.Z == -11
assert secp256k1_svdw_ro.m2c.Z == secp256k1_svdw_nu.m2c.Z == 1

secp256k1_order = 0xfffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141

def test_suite_secp256k1():
    _test_suite(secp256k1_sswu_ro, secp256k1_order)
    _test_suite(secp256k1_svdw_ro, secp256k1_order)
    _test_suite(secp256k1_sswu_nu, secp256k1_order)
    _test_suite(secp256k1_svdw_nu, secp256k1_order)

if __name__ == "__main__":
    test_suite_secp256k1()
