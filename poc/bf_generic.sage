#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.generic_map import GenericMap
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

class GenericBF(GenericMap):
    def __init__(self, F, _, B):
        self.F = F
        B = F(B)
        self.A = F(0)
        self.B = B
        q = F.order()
        assert q % 3 == 2, "BF requires q % 3 == 2"
        assert self.B != 0, "BF requires B != 0"
        self.Z = None
        self.E = EllipticCurve(F, [0, B])

        # constants for straight-line impl
        self.c1 = (2 * q - 1) // 3

    def not_straight_line(self, u):
        q = self.F.order()
        u = self.F(u)
        B = self.B

        w = (2 * q - 1) // 3
        x = (u^2 - B)^w
        y = u
        return (x, y)

    def straight_line(self, u):
        u = self.F(u)
        B = self.B
        c1 = self.c1

        t1 = u^2
        t1 = t1 - B
        x = t1^c1
        y = u
        return (x, y)

if __name__ == "__main__":
    for _ in range(0, 32):
        GenericBF.test_random()
