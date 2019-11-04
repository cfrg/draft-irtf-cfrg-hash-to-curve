#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.bf_generic import GenericBF
    from sagelib.ell2_generic import GenericEll2
    from sagelib.ell2a0_generic import GenericEll2A0
    from sagelib.ell2edw_generic import GenericEll2Edw
    from sagelib.sswu_generic import GenericSSWU
    from sagelib.svdw_generic import GenericSvdW
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

if __name__ == "__main__":
    for _ in range(0, 32):
        GenericSSWU.test_random()
        GenericSvdW.test_random()
        GenericEll2.test_random()
        GenericEll2Edw.test_random()
        GenericBF.test_random()
        GenericEll2A0.test_random()
