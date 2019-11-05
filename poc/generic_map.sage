#!/usr/bin/sage
# vim: syntax=python

load("common.sage")

class GenericMap(object):
    undefs = []
    F = None
    straight_line = None
    not_straight_line = None
    sgn0 = staticmethod(sgn0_le)

    def set_sgn0_help(self):
        pass

    def set_sgn0(self, fn):
        self.sgn0 = fn
        self.set_sgn0_help()

    def map_to_curve(self, u):
        (x1, y1) = self.straight_line(u)
        (x2, y2) = self.not_straight_line(u)
        assert (x1, y1) == (x2, y2), "straight-line / non-straight-line mismatch"
        return self.E(x1, y1)

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

    @classmethod
    def get_random(cls):
        while True:
            p = random_prime(1 << 256)
            F = GF(p)
            A = B = None
            while A is None:
                A = F.random_element()
                B = F.random_element()
                if F(4 * A**3 + 27 * B**2) == F(0):
                    A = None
            try:
                ret = cls(F, A, B)
                # randomly pick sgn0_le or sgn0_be
                if randint(0, 1) == 1:
                    ret.set_sgn0(sgn0_be)
            except:
                # constructor threw exception
                continue
            return ret

    @classmethod
    def test_random(cls):
        cls.get_random().test()
