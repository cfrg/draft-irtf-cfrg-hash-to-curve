#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.common import CMOV
    from sagelib.ell2_generic import GenericEll2
    from sagelib.generic_map import GenericMap
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

class GenericEll2Edw(GenericMap):
    def __init__(self, F, a, d):
        self.F = F
        a = F(a)
        d = F(d)
        self.a = a
        self.d = d
        if a == 0:
            raise ValueError("Edwards curve requires a != 0")
        if d == 0:
            raise ValueError("Edwards curve requires d != 0")
        if a == d:
            raise ValueError("Edwards curve requires a != d")

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

    def nsl_map(self, X, Y):
        invSqrtD = self.Bp

        xnum = X
        xden = Y
        ynum = invSqrtD * X - 1
        yden = invSqrtD * X + 1
        if xden * yden == 0:
            return (0, 1)
        return (xnum / xden, ynum / yden)

    def nsl_map_inv(self, v, w):
        invSqrtD = self.Bp

        xnum = ynum = 1 + w
        xden = invSqrtD * (1 - w)
        yden = xden * v
        if xden * yden == 0:
            return (0, 0)
        return (xnum / xden, ynum / yden)

    def straight_line(self, u):
        (xp, yp) = self.ell2_map.straight_line(u)
        return self.sl_map(xp, yp)

    def sl_map(self, X, Y):
        invSqrtD = self.Bp
        inv0 = self.inv0

        tv1 = X * invSqrtD
        tv2 = tv1 + 1
        tv3 = Y * tv2
        tv3 = inv0(tv3)
        v = tv2 * tv3
        v = v * X
        w = tv1 - 1
        w = w * Y
        w = w * tv3
        e = w == 0
        w = CMOV(w, 1, e)
        return (v, w)

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

if __name__ == "__main__":
    for _ in range(0, 32):
        GenericEll2Edw.test_random()
