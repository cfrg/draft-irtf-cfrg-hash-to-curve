#!/usr/bin/sage
# vim: syntax=python

load("z_selection.sage")
load("generic_map.sage")

class GenericEll2A0(GenericMap):
    def __init__(self, F, _, B):
        self.F = F
        q = F.order()
        assert q % 4 == 3, "Ell2A0 requires F = GF(q), q = 3 (mod 4)"
        A = F(0)
        B = F(B)
        test = A**2 - 4 * B
        assert test != 0 and not test.is_square(), "Ell2A0 requires -4B != 0 and nonsquare"
        self.A = A
        self.B = B
        self.Z = None
        self.E = EllipticCurve(F, [0, A, 0, B, 0])

        # constant for straight-line
        self.c1 = (q + 1) // 4

    def not_straight_line(self, u):
        is_square = self.is_square
        sgn0 = self.sgn0
        u = self.F(u)
        B = self.B

        x1 = u
        gx1 = x1^3 + B * x1
        x2 = -x1
        gx2 = -gx1
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
        sgn0 = self.sgn0
        u = self.F(u)
        B = self.B
        c1 = self.c1

        x1 = u
        x2 = -x1
        gx1 = x1^2
        gx1 = gx1 + B
        gx1 = gx1 * x1
        y = gx1^c1
        e1 = (y^2) == gx1
        x = CMOV(x2, x1, e1)
        e2 = sgn0(u) == sgn0(y)
        y = CMOV(-y, y, e2)
        return (x, y)
