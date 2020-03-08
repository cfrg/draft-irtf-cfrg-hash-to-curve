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
        J = F(2) * (a + d) / (a - d)
        K = F(4) / (a - d)
        self.ell2_map = GenericEll2(F, J, K)

        # Montgomery points at which the rational map is undefined
        self.undefs = [(0, 0)]
        stest = -F(1)
        t2test = (stest^3 + J * stest^2 + stest) / K
        if t2test.is_square():
            ttest = t2test.sqrt()
            self.undefs += [(stest, ttest), (stest, -ttest)]

    def not_straight_line(self, u):
        (s, t) = self.ell2_map.not_straight_line(u)
        return self.nsl_map(s, t)

    @staticmethod
    def nsl_map(s, t):
        vnum = s
        vden = t
        wnum = (s - 1)
        wden = (s + 1)
        if vden * wden == 0:
            return (0, 1)
        return (vnum / vden, wnum / wden)

    def to_weierstrass(self, v, w):
        snum = tnum = 1 + w
        sden = 1 - w
        tden = sden * v
        if sden * tden == 0:
            (s, t) = (0, 0)
        else:
            (s, t) = (snum / sden, tnum / tden)
        return self.ell2_map.to_weierstrass(s, t)

    def straight_line(self, u):
        (s, t) = self.ell2_map.straight_line(u)
        return self.sl_map(s, t)

    def sl_map(self, s, t):
        inv0 = self.inv0

        tv1 = s + 1
        tv2 = tv1 * t        # (s + 1) * t
        tv2 = inv0(tv2)      # 1 / ((s + 1) * t)
        v = tv2 * tv1      # 1 / t
        v = v * s          # s / t
        w = tv2 * t        # 1 / (s + 1)
        tv1 = s - 1
        w = w * tv1        # (s - 1) / (s + 1)
        e = tv2 == 0
        w = CMOV(w, 1, e)  # handle exceptional case
        return (v, w)

    def map_to_curve(self, u):
        (v1, w1) = self.straight_line(u)
        (v2, w2) = self.not_straight_line(u)
        assert (v1, w1) == (v2, w2), "straight-line / non-straight-line mismatch"
        assert self.a * v1^2 + w1^2 == 1 + self.d * v1^2 * w1^2
        (x, y) = self.to_weierstrass(v1, w1)
        ret = self.ell2_map.map_to_curve(u)
        assert (x, y) == (ret[0], ret[1])
        return ret

    def test_map(self, s, t):
        (v1, w1) = self.nsl_map(s, t)
        (v2, w2) = self.sl_map(s, t)
        assert (v1, w1) == (v2, w2)
        assert self.a * v1^2 + w1^2 == 1 + self.d * v1^2 * w1^2

    def test_undef(self):
        for undef in self.undefs:
            self.test_map(*undef)
        for undef in self.ell2_map.undefs:
            self.map_to_curve(undef)

if __name__ == "__main__":
    for _ in range(0, 32):
        GenericEll2Edw.test_random()
