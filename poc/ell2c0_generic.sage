#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.common import CMOV
    from sagelib.generic_map import GenericMap
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

class GenericEll2C0(GenericMap):
    def __init__(self, F, _, B):
        self.F = F
        q = F.order()
        assert q % 4 == 3, "Ell2C0 requires F = GF(q), q = 3 (mod 4)"
        A = F(0)
        B = F(B)
        test = A**2 - 4 * B
        assert test != 0 and not test.is_square(), "Ell2C0 requires -4B != 0 and nonsquare"
        self.A = A
        self.B = B
        self.Z = None
        self.E = EllipticCurve(F, [0, A, 0, B, 0])

        # constant for straight-line
        self.c1 = (q + 1) // 4

    def not_straight_line(self, u):
        is_square = self.is_square
        sgn0 = self.sgn0
        sqrt = self.sqrt
        u = self.F(u)
        D = self.B

        X1 = u
        gX1 = X1^3 + D * X1
        X2 = -X1
        gX2 = -gX1
        if is_square(gX1):
            X = X1
            Y = sqrt(gX1)
        else:
            X = X2
            Y = sqrt(gX2)
        if sgn0(u) != sgn0(Y):
            Y = -Y
        return (X, Y)

    def straight_line(self, u):
        sgn0 = self.sgn0
        u = self.F(u)
        D = self.B
        c1 = self.c1

        X1 = u
        X2 = -X1
        gX1 = X1^2
        gX1 = gX1 + D
        gX1 = gX1 * X1           # gX1 = X1^3 + D * X1
        Y = gX1^c1             # This is either sqrt(gX1) or sqrt(gX2)
        e1 = (Y^2) == gX1
        X = CMOV(X2, X1, e1)
        e2 = sgn0(u) == sgn0(Y)
        Y = CMOV(-Y, Y, e2)
        return (X, Y)

if __name__ == "__main__":
    for _ in range(0, 32):
        GenericEll2C0.test_random()
