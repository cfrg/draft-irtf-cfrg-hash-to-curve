#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.common import CMOV
    from sagelib.sswu_optimized import OptimizedSSWU
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

class OptimizedSSWU_5mod8(OptimizedSSWU):
    def __init__(self, F, A, B):
        assert F.order() % 8 == 5
        super(OptimizedSSWU_5mod8, self).__init__(F, A, B)

        # constants
        Z = self.Z
        q = F.order()
        self.Z = Z
        c1 = (q - 5) // 8             # Integer arithmetic
        c2 = sqrt(F(-1))
        c3 = sqrt(Z / c2)
        (self.c1, self.c2, self.c3) = (c1, c2, c3)

        # map for testing
        self.ref_map = OptimizedSSWU(F, self.A, self.B)

    def sqrt_ratio_5mod8(self, u, v):
        c1 = self.c1
        c2 = self.c2
        c3 = self.c3
        Z = self.Z

        tv1 = v^2
        tv2 = tv1 * v
        tv1 = tv1^2
        tv2 = tv2 * u
        tv1 = tv1 * tv2
        y1 = tv1^c1
        y1 = y1 * tv2
        tv1 = y1 * c2
        tv2 = tv1^2
        tv2 = tv2 * v
        e1 = tv2 == u
        y1 = CMOV(y1, tv1, e1)
        tv2 = y1^2
        tv2 = tv2 * v
        isQR = tv2 == u
        y2 = y1 * c3
        tv1 = y2 * c2
        tv2 = tv1^2
        tv2 = tv2 * v
        tv3 = Z * u
        e2 = tv2 == tv3
        y2 = CMOV(y2, tv1, e2)
        y = CMOV(y2, y1, isQR)

        return (isQR, y)

    def sqrt_ratio(self, u, v):
        (b1, y1) = super(OptimizedSSWU_5mod8, self).sqrt_ratio(u, v)
        (b2, y2) = self.sqrt_ratio_5mod8(u, v)
        assert b1 == b2
        assert y1^2 == y2^2
        return (b2, y2)

    def test_map(self, u=None):
        F = self.F
        A = self.A
        B = self.B
        if u is None:
            u = F.random_element()
        (xn, yn, zn) = self.map_to_curve(u)
        x = xn / zn
        y = yn / zn
        assert y^2 == x^3 + A * x + B
        (xp, yp, zp) = self.ref_map.map_to_curve(u)
        xp = xp / zp
        yp = yp / zp
        assert xp == x
        assert yp == y

    def test(self):
        for und in self.ref_map.undefs:
            self.test_map(und)
        for _ in range(0, 256):
            self.test_map()

def test_sswu_5mod8():
    print("Testing random curves (q = 5 mod 8): ", end="")
    for _ in range(0, 8):
        p = 0
        while p % 8 != 5:
            p = random_prime(1 << 256)
        F = GF(p)
        A = F.random_element()
        B = F.random_element()
        OptimizedSSWU_5mod8(F, A, B).test()
        sys.stdout.write('.')
        sys.stdout.flush()
    print()

if __name__ == "__main__":
    test_sswu_5mod8()
