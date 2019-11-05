#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.bf_generic import GenericBF
    from sagelib.common import test_ts
    from sagelib.ell2_generic import GenericEll2
    from sagelib.ell2a0_generic import GenericEll2A0
    from sagelib.ell2edw_generic import GenericEll2Edw
    from sagelib.sswu_generic import GenericSSWU
    from sagelib.svdw_generic import GenericSvdW
    from sagelib.ell2_25519_opt import test_25519
    from sagelib.ell2_448_opt import test_448
    from sagelib.sswu_opt import test_sswu
    from sagelib.map_check import map_check
    from sagelib.curves import MontgomeryCurve, EdwardsCurve
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

if __name__ == "__main__":
    print "Testing Tonelli-Shanks"
    test_ts()

    print "Checking maps"
    map_check()

    print "Testing 'native' Montgomery curve impl"
    MontgomeryCurve.test()

    print "Testing 'native' Edwards curve impl"
    EdwardsCurve.test()

    print "Testing optimized Elligator2"
    print "Testing Curve25519"
    test_25519()
    print "Testing Curve448"
    test_448()

    print "Testing optimized SSWU"
    test_sswu()

    print "Testing generic maps"
    for m in (GenericBF, GenericEll2, GenericEll2A0, GenericEll2Edw, GenericSSWU, GenericSvdW):
        print "Testing %s" % m.__name__
        for _ in range(0, 32):
            m.test_random()