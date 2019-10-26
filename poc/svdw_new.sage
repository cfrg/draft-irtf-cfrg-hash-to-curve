#!/usr/bin/sage
# vim: syntax=python

load("common.py")
load("z_selection.sage")

class GenericSvdW(object):
    def __init__(self, F, A, B):
        self.F = F
        self.A = F(A)
        self.B = F(B)
        self.Z = find_z_svdw(F, F(A), F(B))
        self.g = lambda x: F(x)**3 + F(A) * F(x) + F(B)
        self.E = EllipticCurve(F, [F(A), F(B)])

        # constants for straight-line impl
        mgZ = -self.g(self.Z)
        self.c1 = self.g(self.Z)
        self.c2 = F(-self.Z / F(2))
        self.c3 = (mgZ * (3 * self.Z^2 + 4 * F(A))).sqrt()
        self.c3 *= sgn0(self.c3)
        self.c4 = F(4) * mgZ / (3 * self.Z^2 + 4 * F(A))

        # values at which the map is undefined
        self.undefs = [ zz.sqrt() for zz in (F(1)/mgZ, F(-1)/mgZ) if zz.is_square() ]

    def is_square(self, x):
        return self.F(x).is_square()

    def inv0(self, x):
        if self.F(x) == 0:
            return self.F(0)
        return self.F(1) / self.F(x)

    def svdw_straight_line(self, u):
        u = self.F(u)
        t1 = u^2
        t1 = t1 * self.c1
        t2 = 1 + t1
        t1 = 1 - t1
        t3 = t1 * t2
        t3 = self.inv0(t3)
        t4 = u * t1
        t4 = t4 * t3
        t4 = t4 * self.c3
        x1 = self.c2 - t4
        gx1 = x1^2
        gx1 = gx1 + self.A
        gx1 = gx1 * x1
        gx1 = gx1 + self.B
        e1 = self.is_square(gx1)
        x2 = self.c2 + t4
        gx2 = x2^2
        gx2 = gx2 + self.A
        gx2 = gx2 * x2
        gx2 = gx2 + self.B
        e2 = self.is_square(gx2) and not e1     #// avoid short-circuit logic ops!
        x3 = t2^2
        x3 = x3 * t3
        x3 = x3^2
        x3 = x3 * self.c4
        x3 = x3 + self.Z
        x = CMOV(x3, x1, e1)      #// x = x1 if gx1 is square, else x = x3
        x = CMOV(x, x2, e2)       #// x = x2 if gx2 is square and gx1 is not
        gx = x^2
        gx = gx + self.A
        gx = gx * x
        gx = gx + self.B
        y = sqrt(gx)
        e3 = sgn0(u) == sgn0(y)
        y = CMOV(-y, y, e3)       #// select correct sign of y
        return (x, y)

    def svdw_not_straight_line(self, u):
        u = self.F(u)
        t1 = u^2 * self.g(self.Z)
        t2 = 1 + t1
        t1 = 1 - t1
        t3 = self.inv0(t1 * t2)
        t4 = u * t1 * t3 * sqrt(-self.g(self.Z) * (3 * self.Z^2 + 4 * self.A))
        x1 = -self.Z / 2 - t4
        x2 = -self.Z / 2 + t4
        t5 = 2 * t2^2 * t3 * sqrt(-self.g(self.Z) / (3 * self.Z^2 + 4 * self.A))
        x3 = self.Z + t5^2
        if self.is_square(self.g(x1)):
            x = x1
        elif self.is_square(self.g(x2)):
            x = x2
        else:
            x = x3
        y = sqrt(self.g(x))
        if sgn0(u) != sgn0(y):
            y = -y
        return (x, y)

    def svdw(self, u):
        (x1, y1) = self.svdw_straight_line(u)
        (x2, y2) = self.svdw_not_straight_line(u)

        assert (x1, y1) == (x2, y2)
        return self.E(x1, y1)

    def test_undef(self):
        for undef in self.undefs:
            self.svdw(undef)

def test_curve(F, A, B):
    hfn = GenericSvdW(F, A, B)
    hfn.test_undef()
    for _ in range(0, 256):
        hfn.svdw(F.random_element())

def test_random():
    p = random_prime(1 << 256)
    F = GF(p)
    A = B = None
    while A is None or B is None:
        A = F.random_element()
        B = F.random_element()
        if F(4 * A**3 + 27 * B**2) == F(0):
            A = B = None
    test_curve(F, A, B)

if __name__ == "__main__":
    for _ in range(0, 32):
        test_random()
