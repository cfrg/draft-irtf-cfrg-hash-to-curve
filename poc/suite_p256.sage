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
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

p = 2^256 - 2^224 + 2^192 + 2^96 - 1
F = GF(p)
A = F(-3)
B = F(0x5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b)

def p256_sswu(suite_name, is_ro):
    dst = test_dst(suite_name)
    k = 128
    expander = XMDExpander(dst, hashlib.sha256, k)
    return BasicH2CSuiteDef("NIST P-256", F, A, B, expander, hashlib.sha256, 48, GenericSSWU, 1, k, is_ro, expander.dst)

def p256_svdw(suite_name, is_ro):
    return p256_sswu(suite_name, is_ro)._replace(MapT=GenericSvdW)

suite_name = "P256_XMD:SHA-256_SSWU_RO_"
p256_sswu_ro = BasicH2CSuite(suite_name,p256_sswu(suite_name, True))

suite_name = "P256_XMD:SHA-256_SVDW_RO_"
p256_svdw_ro = BasicH2CSuite(suite_name,p256_svdw(suite_name, True))

suite_name = "P256_XMD:SHA-256_SSWU_NU_"
p256_sswu_nu = BasicH2CSuite(suite_name,p256_sswu(suite_name, False))

suite_name = "P256_XMD:SHA-256_SVDW_NU_"
p256_svdw_nu = BasicH2CSuite(suite_name,p256_svdw(suite_name, False))

assert p256_sswu_ro.m2c.Z == p256_sswu_nu.m2c.Z == -10
assert p256_svdw_ro.m2c.Z == p256_svdw_nu.m2c.Z ==  -3

p256_order = 0xffffffff00000000ffffffffffffffffbce6faada7179e84f3b9cac2fc632551
p256_p = p
p256_F = F
p256_A = A
p256_B = B

def _test_suite(suite, group_order, nreps=128):
    accum = suite('asdf')
    for _ in range(0, nreps):
        msg = ''.join( chr(randrange(32, 126)) for _ in range(0, 32) )
        accum += suite(msg)
    assert (accum * group_order).is_zero()

def test_suite_p256():
    _test_suite(p256_sswu_ro, p256_order)
    _test_suite(p256_svdw_ro, p256_order)
    _test_suite(p256_sswu_nu, p256_order)
    _test_suite(p256_svdw_nu, p256_order)

if __name__ == "__main__":
    test_suite_p256()
