#!/usr/bin/sage
# vim: syntax=python

load("common.sage")
load("z_selection.sage")
load("generic_map.sage")

class GenericEll2(GenericMap):
    def __init__(self, F, A, B):
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
        A = self.A
        B = self.B
        Z = self.Z

        x1 = -A * inv0(1 + Z * u^2)
        if x1 == 0:
            x1 = -A
        gx1 = x1^3 + A * x1^2 + B * x1
        x2 = -x1 - A
        gx2 = x2^3 + A * x2^2 + B * x2
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
        sgn0 = self.sgn0
        sqrt = self.sqrt
        u = self.F(u)
        A = self.A
        B = self.B
        Z = self.Z

        t1 = u^2
        t1 = Z * t1                 # Z * u^2
        e1 = t1 == -1               # detect exceptional case
        t1 = CMOV(t1, 0, e1)        # if t1 == -1, set t1 = 0
        x1 = t1 + 1
        x1 = inv0(x1)
        x1 = -A * x1                # x1 = -A / (1 + Z * u^2)
        gx1 = x1 + A
        gx1 = gx1 * x1
        gx1 = gx1 + B
        gx1 = gx1 * x1              # gx1 = x1^3 + A * x1^2 + B * x1
        x2 = -x1 - A
        gx2 = t1 * gx1
        e2 = is_square(gx1)
        x = CMOV(x2, x1, e2)        # If is_square(gx1), x = x1, else x = x2
        y2 = CMOV(gx2, gx1, e2)     # If is_square(gx1), y2 = gx1, else y2 = gx2
        y = sqrt(y2)
        e3 = sgn0(u) == sgn0(y)     # Fix sign of y
        y = CMOV(-y, y, e3)
        return (x, y)
