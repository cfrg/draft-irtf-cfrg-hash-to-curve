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
    def __init__(self, F, J, K):
        self.name = "ELL2"
        self.F = F
        J = F(J)
        K = F(K)
        if J == 0:
            raise ValueError("Ell2 requires J != 0")
        if K == 0:
            raise ValueError("Ell2 requires K != 0")
        test = (J^2 - 4) / (K^2)
        if test == 0 or test.is_square():
            raise ValueError("Ell2 requires (J^2 - 4) / K^2 != 0 and nonsquare")
        self.J = J
        self.K = K
        self.Z = find_z_ell2(F)
        self.E = EllipticCurve(F, [0, J / K, 0, 1 / K^2, 0])

        # values at which the map is undefined
        self.undefs = []
        if (F(-1) / self.Z).is_square():
            ex = sqrt(F(-1) / self.Z)
            self.undefs += [ex, -ex]

    def to_weierstrass(self, s, t):
        x = s / self.K
        y = t / self.K
        return (x, y)

    def not_straight_line(self, u):
        is_square = self.is_square
        inv0 = self.inv0
        sgn0 = self.sgn0
        sqrt = self.sqrt
        u = self.F(u)
        J = self.J
        K = self.K
        Z = self.Z

        x1 = -(J / K) * inv0(1 + Z * u^2)
        if x1 == 0:
            x1 = -(J / K)
        gx1 = x1^3 + (J / K) * x1^2 + x1 / K^2
        x2 = -x1 - (J / K)
        gx2 = x2^3 + (J / K) * x2^2 + x2 / K^2
        if is_square(gx1):
            x = x1
            y = sqrt(gx1)
            if sgn0(y) == 0:
                y = -y
            assert sgn0(y) == 1
        else:
            x = x2
            y = sqrt(gx2)
            if sgn0(y) == 1:
                y = -y
            assert sgn0(y) == 0
        s = x * K
        t = y * K
        return (s, t)

    def straight_line(self, u):
        inv0 = self.inv0
        is_square = self.is_square
        sgn0 = self.sgn0
        sqrt = self.sqrt
        u = self.F(u)
        J = self.J
        K = self.K
        Z = self.Z

        c1 = J / K
        c2 = 1 / K^2

        tv1 = u^2
        tv1 = Z * tv1             # Z * u^2
        e1 = tv1 == -1           # exceptional case: Z * u^2 == -1
        tv1 = CMOV(tv1, 0, e1)    # if tv1 == -1, set tv1 = 0
        x1 = tv1 + 1
        x1 = inv0(x1)
        x1 = -c1 * x1             # x1 = -(J / K) / (1 + Z * u^2)
        gx1 = x1 + c1
        gx1 = gx1 * x1
        gx1 = gx1 + c2
        gx1 = gx1 * x1            # gx1 = x1^3 + (J / K) * x1^2 + x1 / K^2
        x2 = -x1 - c1
        gx2 = tv1 * gx1
        e2 = is_square(gx1)
        x = CMOV(x2, x1, e2)    # If is_square(gx1), x = x1, else x = x2
        y2 = CMOV(gx2, gx1, e2)  # If is_square(gx1), y2 = gx1, else y2 = gx2
        y = sqrt(y2)
        e3 = sgn0(y) == 1
        y = CMOV(y, -y, e2 ^^ e3)    # fix sign of y
        s = x * K
        t = y * K
        return (s, t)

if __name__ == "__main__":
    for _ in range(0, 32):
        GenericEll2.test_random()
