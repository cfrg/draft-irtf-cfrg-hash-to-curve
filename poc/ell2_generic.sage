#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.common import CMOV
    from sagelib.generic_map import GenericMap
    from sagelib.z_selection import find_z_ell2
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

class GenericEll2(GenericMap):
    def __init__(self, F, A, B):
        self.name = "ELL2"
        self.F = F
        A = F(A)
        B = F(B)
        assert A != 0, "Ell2 requires A != 0"
        assert B != 0, "Ell2 requires B != 0"
        test = A**2 - 4 * B
        assert test != 0 and not test.is_square(), "Ell2 requires A^2 - 4B != 0 and nonsquare"
        self.A = A
        self.B = B
        self.Z = find_z_ell2(F)
        self.E = EllipticCurve(F, [0, A, 0, B, 0])

        # values at which the map is undefined
        self.undefs = []
        if (F(-1) / self.Z).is_square():
            ex = sqrt(F(-1) / self.Z)
            self.undefs += [ex, -ex]

    def not_straight_line(self, u):
        is_square = self.is_square
        inv0 = self.inv0
        sgn0 = self.sgn0
        sqrt = self.sqrt
        u = self.F(u)
        C = self.A
        D = self.B
        Z = self.Z

        X1 = -C * inv0(1 + Z * u^2)
        if X1 == 0:
            X1 = -C
        gX1 = X1^3 + C * X1^2 + D * X1
        X2 = -X1 - C
        gX2 = X2^3 + C * X2^2 + D * X2
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
        inv0 = self.inv0
        is_square = self.is_square
        sgn0 = self.sgn0
        sqrt = self.sqrt
        u = self.F(u)
        C = self.A
        D = self.B
        Z = self.Z

        tv1 = u^2
        tv1 = Z * tv1             # Z * u^2
        e1 = tv1 == -1           # exceptional case: Z * u^2 == -1
        tv1 = CMOV(tv1, 0, e1)    # if tv1 == -1, set tv1 = 0
        X1 = tv1 + 1
        X1 = inv0(X1)
        X1 = -C * X1             # X1 = -C / (1 + Z * u^2)
        gX1 = X1 + C
        gX1 = gX1 * X1
        gX1 = gX1 + D
        gX1 = gX1 * X1            # gX1 = X1^3 + C * X1^2 + D * X1
        X2 = -X1 - C
        gX2 = tv1 * gX1
        e2 = is_square(gX1)
        X = CMOV(X2, X1, e2)    # If is_square(gX1), X = X1, else X = X2
        Y2 = CMOV(gX2, gX1, e2)  # If is_square(gX1), Y2 = gX1, else Y2 = gX2
        Y = sqrt(Y2)
        e3 = sgn0(u) == sgn0(Y)  # Fix sign of Y
        Y = CMOV(-Y, Y, e3)
        return (X, Y)

if __name__ == "__main__":
    for _ in range(0, 32):
        GenericEll2.test_random()
