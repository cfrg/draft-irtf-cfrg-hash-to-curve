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

DST = "QUUX-V01-CS02"
p = 2^384 - 2^128 - 2^96 + 2^32 - 1
F = GF(p)
A = F(-3)
B = F(0xb3312fa7e23ee7e4988e056be3f82d19181d9c6efe8141120314088f5013875ac656398d8a2ed19d2a85c8edd3ec2aef)

p384_sswu_def = BasicH2CSuiteDef("P384", F, A, B, sgn0_le, hashlib.sha512, 72, GenericSSWU, 1, True, DST)
p384_svdw_def = p384_sswu_def._replace(MapT=GenericSvdW)
p384_sswu_ro = BasicH2CSuite("P384-SHA512-SSWU-RO-",p384_sswu_def)
p384_svdw_ro = BasicH2CSuite("P384-SHA512-SVDW-RO-",p384_svdw_def)
p384_sswu_nu = BasicH2CSuite("P384-SHA512-SSWU-NU-",p384_sswu_def._replace(is_ro=False))
p384_svdw_nu = BasicH2CSuite("P384-SHA512-SVDW-NU-",p384_svdw_def._replace(is_ro=False))
assert p384_sswu_ro.m2c.Z == p384_sswu_nu.m2c.Z == -12
assert p384_svdw_ro.m2c.Z == p384_svdw_nu.m2c.Z == -1

p384_order = 0xffffffffffffffffffffffffffffffffffffffffffffffffc7634d81f4372ddf581a0db248b0a77aecec196accc52973

def test_suite_p384():
    _test_suite(p384_sswu_ro, p384_order)
    _test_suite(p384_svdw_ro, p384_order)
    _test_suite(p384_sswu_nu, p384_order)
    _test_suite(p384_svdw_nu, p384_order)

if __name__ == "__main__":
    test_suite_p384()
