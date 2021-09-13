#!/usr/bin/sage
# vim: syntax=python

import sys

from hash_to_field import test_expand

print("Importing modules...")

try:
    from sagelib.common import test_sqrt_issq
    from sagelib.sqrt import test_sqrt_ratio
    from sagelib.clear_h_bls12381g2 import test_clear_cofactor_bls12381_g2
    from sagelib.ell2_generic import GenericEll2
    from sagelib.ell2edw_generic import GenericEll2Edw
    from sagelib.sswu_generic import GenericSSWU
    from sagelib.sswu_optimized import OptimizedSSWU
    from sagelib.svdw_generic import GenericSvdW
    from sagelib.ell2_opt_3mod4 import test_ell2_3mod4
    from sagelib.ell2_opt_5mod8 import test_ell2_5mod8
    from sagelib.sswu_opt_3mod4 import test_sswu_3mod4
    from sagelib.sswu_opt_5mod8 import test_sswu_5mod8
    from sagelib.map_check import map_check
    from sagelib.curves import MontgomeryCurve, EdwardsCurve
    from sagelib.suite_25519 import test_suite_25519
    from sagelib.suite_448 import test_suite_448
    from sagelib.suite_p256 import test_suite_p256
    from sagelib.suite_p384 import test_suite_p384
    from sagelib.suite_p521 import test_suite_p521
    from sagelib.suite_secp256k1 import test_suite_secp256k1
    from sagelib.suite_bls12381g1 import test_suite_bls12381g1
    from sagelib.suite_bls12381g2 import test_suite_bls12381g2
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

if __name__ == "__main__":
    print("Testing expand_message functions")
    test_expand()

    print("Testing sqrt and is_square functions")
    test_sqrt_issq()

    print("Testing sqrt_ratio function")
    test_sqrt_ratio()

    print("Checking maps")
    map_check()

    print("Checking clear_cofactor_bls12381_g2")
    test_clear_cofactor_bls12381_g2(8)

    print("Testing 'native' Montgomery curve impl")
    MontgomeryCurve.test()

    print("Testing 'native' Edwards curve impl")
    EdwardsCurve.test()

    print("Testing optimized Elligator2")
    test_ell2_3mod4()
    test_ell2_5mod8()

    print("Testing optimized SSWU")
    test_sswu_3mod4()
    test_sswu_5mod8()

    print("Testing generic maps")
    for m in (GenericEll2, GenericEll2Edw, GenericSSWU, OptimizedSSWU, GenericSvdW):
        print("Testing %s" % m.__name__)
        for _ in range(0, 32):
            m.test_random()

    print("Testing curve25519/edwards25519 suites")
    test_suite_25519()

    print("Testing curve448/edwards448 suites")
    test_suite_448()

    print("Testing P256 suites")
    test_suite_p256()

    print("Testing P384 suites")
    test_suite_p384()

    print("Testing P521 suites")
    test_suite_p521()

    print("Testing secp256k1 suites")
    test_suite_secp256k1()

    print("Testing BLS12-381 G1 suites")
    test_suite_bls12381g1()

    print("Testing BLS12-381 G2 suites")
    test_suite_bls12381g2()
