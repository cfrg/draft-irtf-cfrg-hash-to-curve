#!/usr/bin/sage
# vim: syntax=python

load("ell2_generic.sage")

class GenericEll2Edw(GenericMap):
    def __init__(self, F, a, d):
        self.F = F
        a = F(a)
        d = F(d)
        self.a = a
        self.d = d
        assert a != 0, "Edwards curve requires a != 0"
        assert d != 0, "Edwards curve requires d != 0"
        assert a != d, "Edwards curve requires a != d"

        # equivalent Montgomery curve
        self.A = (a + d) / F(2)
        self.B = (a - d)^2 / F(16)
        self.Bp = F(4) / (a - d)
        self.ell2_map = GenericEll2(F, self.A, self.B)

        # Montgomery points at which the rational map is undefined
        self.undefs = [(0, 0)]
        xtest = -F(1) / self.Bp
        y2test = xtest^3 + self.A * xtest^2 + self.B * xtest
        if y2test.is_square():
            ytest = y2test.sqrt()
            self.undefs += [(xtest, ytest), (xtest, -ytest)]

    def not_straight_line(self, u):
        (xp, yp) = self.ell2_map.not_straight_line(u)
        return self.nsl_map(xp, yp)

    def nsl_map(self, xp, yp):
        Bp = self.Bp

        xnum = xp
        xden = yp
        ynum = Bp * xp - 1
        yden = Bp * xp + 1
        if xden * yden == 0:
            return (0, 1)
        return (xnum / xden, ynum / yden)

    def nsl_map_inv(self, x, y):
        Bp = self.Bp
        xnum = ynum = 1 + y
        xden = Bp * (1 - y)
        yden = xden * x
        if xden * yden == 0:
            return (0, 0)
        return (xnum / xden, ynum / yden)

    def straight_line(self, u):
        (xp, yp) = self.ell2_map.straight_line(u)
        return self.sl_map(xp, yp)

    def sl_map(self, xp, yp):
        Bp = self.Bp

        t1 = xp * Bp
        t2 = t1 + 1
        t3 = yp * t2
        t3 = self.inv0(t3)
        x = t2 * t3
        x = x * xp
        y = t1 - 1
        y = y * yp
        y = y * t3
        e = y == 0
        y = CMOV(y, 1, e)
        return (x, y)

    def map_to_curve(self, u):
        (x1, y1) = self.straight_line(u)
        (x2, y2) = self.not_straight_line(u)
        assert (x1, y1) == (x2, y2), "straight-line / non-straight-line mismatch"
        assert self.a * x1^2 + y1^2 == 1 + self.d * x1^2 * y1^2
        (x3, y3) = self.nsl_map_inv(x1, y1)
        ret = self.ell2_map.map_to_curve(u)
        assert (x3, y3) == (ret[0], ret[1])
        return ret

    def test_map(self, xp, yp):
        (x1, y1) = self.nsl_map(xp, yp)
        (x2, y2) = self.sl_map(xp, yp)
        assert (x1, y1) == (x2, y2)
        assert self.a * x1^2 + y1^2 == 1 + self.d * x1^2 * y1^2

    def test_undef(self):
        for undef in self.undefs:
            self.test_map(*undef)
        for undef in self.ell2_map.undefs:
            self.map_to_curve(undef)
