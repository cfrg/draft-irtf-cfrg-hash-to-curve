#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.common import sgn0, square_root, square_root_random_sign
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

class GenericMap(object):
    undefs = None
    E = None
    F = None
    straight_line = None
    not_straight_line = None
    sgn0 = staticmethod(sgn0)
    sqrt = staticmethod(square_root)
    name = None

    def __dict__(self):
        return {
            "name" :  self.name,
        }

    def set_sqrt(self, fn):
        self.sqrt = fn

    def map_to_curve(self, u):
        (x1, y1) = self.straight_line(u)
        (x2, y2) = self.not_straight_line(u)
        assert (x1, y1) == (x2, y2), "straight-line / non-straight-line mismatch"
        return self.E(*self.to_weierstrass(x1, y1))

    def is_square(self, x):
        return self.F(x).is_square()

    def inv0(self, x):
        if self.F(x) == 0:
            return self.F(0)
        return self.F(1) / self.F(x)

    def test_undef(self):
        for undef in self.undefs:
            self.map_to_curve(undef)

    def test(self):
        self.test_undef()
        for _ in range(0, 256):
            self.map_to_curve(self.F.random_element())

    def to_weierstrass(self, xin, yin):
        return (xin, yin)

    @classmethod
    def get_random(cls):
        while True:
            p = random_prime(1 << 128)
            F = GF(p)
            A = B = None
            while A is None:
                A = F.random_element()
                B = F.random_element()
                if F(4 * A**3 + 27 * B**2) == F(0):
                    A = None
            try:
                ret = cls(F, A, B)
                # sign of sqrt shouldn't matter --- make sure by returning random sign
                ret.set_sqrt(square_root_random_sign)
            except ValueError:
                # constructor threw ValueError: this curve is not valid for this map
                continue
            return ret

    @classmethod
    def test_random(cls):
        cls.get_random().test()
