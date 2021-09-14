#!/usr/bin/sage
# vim: syntax=python

import hashlib
import sys
from hash_to_field import XMDExpander
try:
    from sagelib.common import test_dst
    from sagelib.h2c_suite import BasicH2CSuiteDef, BasicH2CSuite
    from sagelib.svdw_generic import GenericSvdW
    from sagelib.sswu_generic import GenericSSWU
    from sagelib.suite_p256 import _test_suite
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

p = 2^384 - 2^128 - 2^96 + 2^32 - 1
F = GF(p)
A = F(-3)
B = F(0xb3312fa7e23ee7e4988e056be3f82d19181d9c6efe8141120314088f5013875ac656398d8a2ed19d2a85c8edd3ec2aef)

def p384_sswu(suite_name, is_ro):
    dst = test_dst(suite_name)
    k = 192
    expander = XMDExpander(dst, hashlib.sha384, k)
    return BasicH2CSuiteDef("NIST P-384", F, A, B, expander, hashlib.sha384, 72, GenericSSWU, 1, k, is_ro, expander.dst)

def p384_svdw(suite_name, is_ro):
    return p384_sswu(suite_name, is_ro)._replace(MapT=GenericSvdW)

suite_name = "P384_XMD:SHA-384_SSWU_RO_"
p384_sswu_ro = BasicH2CSuite(suite_name,p384_sswu(suite_name, True))

suite_name = "P384_XMD:SHA-384_SVDW_RO_"
p384_svdw_ro = BasicH2CSuite(suite_name,p384_svdw(suite_name, True))

suite_name = "P384_XMD:SHA-384_SSWU_NU_"
p384_sswu_nu = BasicH2CSuite(suite_name,p384_sswu(suite_name, False))

suite_name = "P384_XMD:SHA-384_SVDW_NU_"
p384_svdw_nu = BasicH2CSuite(suite_name,p384_svdw(suite_name, False))

assert p384_sswu_ro.m2c.Z == p384_sswu_nu.m2c.Z == -12
assert p384_svdw_ro.m2c.Z == p384_svdw_nu.m2c.Z == -1

p384_order = 0xffffffffffffffffffffffffffffffffffffffffffffffffc7634d81f4372ddf581a0db248b0a77aecec196accc52973
p384_p = p
p384_F = F
p384_A = A
p384_B = B

def test_suite_p384():
    _test_suite(p384_sswu_ro, p384_order)
    _test_suite(p384_svdw_ro, p384_order)
    _test_suite(p384_sswu_nu, p384_order)
    _test_suite(p384_svdw_nu, p384_order)

if __name__ == "__main__":
    test_suite_p384()
