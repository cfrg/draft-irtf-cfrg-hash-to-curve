#!/usr/bin/sage
# vim: syntax=python

import hashlib
import sys
try:
    from sagelib.common import sgn0_le
    from sagelib.h2c_suite import BasicH2CSuiteDef, BasicH2CSuite
    from sagelib.svdw_generic import GenericSvdW
    from sagelib.sswu_generic import GenericSSWU
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

p = 2^256 - 2^224 + 2^192 + 2^96 - 1
F = GF(p)
A = F(-3)
B = F(0x5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b)

p256_sswu_def = BasicH2CSuiteDef(F, A, B, sgn0_le, hashlib.sha256, 48, GenericSSWU, 1, True, "asdf")
p256_svdw_def = p256_sswu_def._replace(MapT=GenericSvdW)
p256_sswu = BasicH2CSuite(p256_sswu_def)
p256_svdw = BasicH2CSuite(p256_svdw_def)
assert p256_sswu.m2c.Z == -10
assert p256_svdw.m2c.Z == -3

p256_order = 0xffffffff00000000ffffffffffffffffbce6faada7179e84f3b9cac2fc632551

def _test_suite(suite, group_order, nreps=128):
    accum = suite('asdf')
    for _ in range(0, nreps):
        msg = ''.join( chr(randrange(32, 126)) for _ in range(0, 32) )
        accum += suite(msg)
    assert (accum * group_order).is_zero()

def test_suite_p256():
    _test_suite(p256_sswu, p256_order)
    _test_suite(p256_svdw, p256_order)

if __name__ == "__main__":
    test_suite_p256()
