#!/usr/bin/sage
# vim: syntax=python

class GenericMap(object):
    F = None
    undefs = None
    straight_line = None
    not_straight_line = None

    def map_to_curve(self, u):
        (x1, y1) = self.straight_line(u)
        (x2, y2) = self.not_straight_line(u)
        assert (x1, y1) == (x2, y2)
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

    @classmethod
    def test_curve(cls, F, A, B):
        hfn = cls(F, A, B)
        hfn.test_undef()
        for _ in range(0, 256):
            hfn.map_to_curve(F.random_element())

    @classmethod
    def test_random(cls):
        p = random_prime(1 << 256)
        F = GF(p)
        A = B = None
        while A is None:
            A = F.random_element()
            B = F.random_element()
            if F(4 * A**3 + 27 * B**2) == F(0):
                A = None
        cls.test_curve(F, A, B)
