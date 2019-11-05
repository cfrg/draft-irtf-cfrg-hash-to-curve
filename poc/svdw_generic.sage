#!/usr/bin/sage
# vim: syntax=python

load("common.sage")
load("z_selection.sage")
load("generic_map.sage")

class GenericSvdW(GenericMap):
    def __init__(self, F, A, B):
        self.F = F
        A = F(A)
        B = F(B)
        self.A = A
        self.B = B
        self.Z = find_z_svdw(F, A, B)
        self.g = lambda x: F(x)**3 + A * F(x) + B
        self.E = EllipticCurve(F, [A, B])

        # constants for straight-line impl
        mgZ = -self.g(self.Z)
        self.c1 = self.g(self.Z)
        self.c2 = F(-self.Z / F(2))
        self.c3 = (mgZ * (3 * self.Z^2 + 4 * A)).sqrt()
        self.c3 *= self.sgn0(self.c3)
        self.c4 = F(4) * mgZ / (3 * self.Z^2 + 4 * A)

        # values at which the map is undefined
        self.undefs = []
        for zz in (F(1)/mgZ, F(-1)/mgZ):
            if zz.is_square():
                sqrt_zz = zz.sqrt()
                self.undefs += [sqrt_zz, -sqrt_zz]

    def set_sgn0_help(self):
        self.c3 *= self.sgn0(self.c3)

    def straight_line(self, u):
        u = self.F(u)
        inv0 = self.inv0
        is_square = self.is_square
        sgn0 = self.sgn0
        c1 = self.c1
        c2 = self.c2
        c3 = self.c3
        c4 = self.c4
        A = self.A
        B = self.B
        Z = self.Z

        t1 = u^2
        t1 = t1 * c1
        t2 = 1 + t1
        t1 = 1 - t1
        t3 = t1 * t2
        t3 = inv0(t3)
        t4 = u * t1
        t4 = t4 * t3
        t4 = t4 * c3
        x1 = c2 - t4
        gx1 = x1^2
        gx1 = gx1 + A
        gx1 = gx1 * x1
        gx1 = gx1 + B
        e1 = is_square(gx1)
        x2 = c2 + t4
        gx2 = x2^2
        gx2 = gx2 + A
        gx2 = gx2 * x2
        gx2 = gx2 + B
        e2 = is_square(gx2) and not e1     #// avoid short-circuit logic ops
        x3 = t2^2
        x3 = x3 * t3
        x3 = x3^2
        x3 = x3 * c4
        x3 = x3 + Z
        x = CMOV(x3, x1, e1)      #// x = x1 if gx1 is square, else x = x3
        x = CMOV(x, x2, e2)       #// x = x2 if gx2 is square and gx1 is not
        gx = x^2
        gx = gx + A
        gx = gx * x
        gx = gx + B
        y = sqrt(gx)
        e3 = sgn0(u) == sgn0(y)
        y = CMOV(-y, y, e3)       #// select correct sign of y
        return (x, y)

    def not_straight_line(self, u):
        g = self.g
        A = self.A
        Z = self.Z
        inv0 = self.inv0
        is_square = self.is_square
        sgn0 = self.sgn0
        u = self.F(u)

        t1 = u^2 * g(Z)
        t2 = 1 + t1
        t1 = 1 - t1
        t3 = inv0(t1 * t2)
        t4 = sqrt(-g(Z) * (3 * Z^2 + 4 * A))
        t4 = t4 * sgn0(t4)                          #// sgn0(t4) == 1
        t5 = u * t1 * t3 * t4
        x1 = -Z / 2 - t5
        x2 = -Z / 2 + t5
        x3 = Z - 4 * g(Z) * (t2^2 * t3)^2 / (3 * Z^2 + 4 * A)
        if is_square(g(x1)):
            x = x1
            y = sqrt(g(x1))
        elif is_square(g(x2)):
            x = x2
            y = sqrt(g(x2))
        else:
            x = x3
            y = sqrt(g(x3))
        if sgn0(u) != sgn0(y):
            y = -y
        return (x, y)
