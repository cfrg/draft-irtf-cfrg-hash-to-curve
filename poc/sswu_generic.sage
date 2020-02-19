#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.common import CMOV
    from sagelib.generic_map import GenericMap
    from sagelib.z_selection import find_z_sswu
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

class GenericSSWU(GenericMap):
    def __init__(self, F, A, B, sgn0 = None):
        self.F = F
        self.A = F(A)
        self.B = F(B)
        assert self.A != 0, "S-SWU requires A != 0"
        assert self.B != 0, "S-SWU requires B != 0"
        self.Z = find_z_sswu(F, F(A), F(B))
        self.E = EllipticCurve(F, [F(A), F(B)])
        if sgn0 is not None:
            self.sgn0 = sgn0

        # constants for straight-line impl
        self.c1 = -F(B) / F(A)
        self.c2 = -F(1) / self.Z

        # values at which the map is undefined
        # i.e., when Z^2 * u^4 + Z * u^2 = 0
        # which is at u = 0 and when Z * u^2 = -1
        self.undefs = [F(0)]
        if self.c2.is_square():
            ex = self.c2.sqrt()
            self.undefs += [ex, -ex]

    def not_straight_line(self, u):
        inv0 = self.inv0
        is_square = self.is_square
        sgn0 = self.sgn0
        sqrt = self.sqrt
        u = self.F(u)
        A = self.A
        B = self.B
        Z = self.Z

        tv1 = inv0(Z^2 * u^4 + Z * u^2)
        x1 = (-B / A) * (1 + tv1)
        if tv1 == 0:
            x1 = B / (Z * A)
        gx1 = x1^3 + A * x1 + B
        x2 = Z * u^2 * x1
        gx2 = x2^3 + A * x2 + B
        if is_square(gx1):
            x = x1
            y = sqrt(gx1)
        else:
            x = x2
            y = sqrt(gx2)
        if sgn0(u) != sgn0(y):
            y = -y
        return (x, y)

    def straight_line(self, u):
        inv0 = self.inv0
        is_square = self.is_square
        sgn0 = self.sgn0
        sqrt = self.sqrt
        u = self.F(u)
        A = self.A
        B = self.B
        Z = self.Z
        c1 = self.c1
        c2 = self.c2

        tv1 = Z * u^2
        tv2 = tv1^2
        x1 = tv1 + tv2
        x1 = inv0(x1)
        e1 = x1 == 0
        x1 = x1 + 1
        x1 = CMOV(x1, c2, e1)    # If (tv1 + tv2) == 0, set x1 = -1 / Z
        x1 = x1 * c1      # x1 = (-B / A) * (1 + (1 / (Z^2 * u^4 + Z * u^2)))
        gx1 = x1^2
        gx1 = gx1 + A
        gx1 = gx1 * x1
        gx1 = gx1 + B             # gx1 = g(x1) = x1^3 + A * x1 + B
        x2 = tv1 * x1            # x2 = Z * u^2 * x1
        tv2 = tv1 * tv2
        gx2 = gx1 * tv2           # gx2 = (Z * u^2)^3 * gx1
        e2 = is_square(gx1)
        x = CMOV(x2, x1, e2)    # If is_square(gx1), x = x1, else x = x2
        y2 = CMOV(gx2, gx1, e2)  # If is_square(gx1), y2 = gx1, else y2 = gx2
        y = sqrt(y2)
        e3 = sgn0(u) == sgn0(y)  # Fix sign of y
        y = CMOV(-y, y, e3)
        return (x, y)

if __name__ == "__main__":
    for _ in range(0, 32):
        GenericSSWU.test_random()
