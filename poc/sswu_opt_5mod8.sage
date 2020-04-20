#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.common import CMOV, square_root_random_sign
    from sagelib.sswu_generic import GenericSSWU
    from sagelib.z_selection import find_z_sswu
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

class OptimizedSSWU_5mod8(object):
    def __init__(self, F, A, B):
        assert F.order() % 8 == 5
        assert A != 0
        assert B != 0
        self.F = F
        self.A = F(A)
        self.B = F(B)

        # constants
        q = F.order()
        Z = find_z_sswu(F, self.A, self.B)
        self.Z = Z
        c1 = (q - 5) // 8             # Integer arithmetic
        c2 = sqrt(F(-1))
        c3 = sqrt(Z^3 / c2)
        (self.c1, self.c2, self.c3) = (c1, c2, c3)

        # map for testing
        self.ref_map = GenericSSWU(F, self.A, self.B)
        self.ref_map.set_sqrt(square_root_random_sign)

    def map_to_curve(self, u):
        sgn0 = self.ref_map.sgn0
        A = self.A
        B = self.B
        F = self.F
        Z = self.Z
        c1 = self.c1
        c2 = self.c2
        c3 = self.c3
        u = F(u)

        tv1 = u^2
        tv3 = Z * tv1
        tv5 = tv3^2
        xd = tv5 + tv3
        x1n = xd + 1
        x1n = x1n * B
        xd = -A * xd
        e1 = xd == 0
        xd = CMOV(xd, Z * A, e1)   # If xd == 0, set xd = Z * A
        tv2 = xd^2
        gxd = tv2 * xd              # gxd == xd^3
        tv2 = A * tv2
        gx1 = x1n^2
        gx1 = gx1 + tv2             # x1n^2 + A * xd^2
        gx1 = gx1 * x1n             # x1n^3 + A * x1n * xd^2
        tv2 = B * gxd
        gx1 = gx1 + tv2             # x1n^3 + A * x1n * xd^2 + B * xd^3
        tv4 = gxd^2
        tv2 = tv4 * gxd             # gxd^3
        tv4 = tv4^2                 # gxd^4
        tv2 = tv2 * gx1             # gx1 * gxd^3
        tv4 = tv4 * tv2             # gx1 * gxd^7
        y = tv4^c1                # (gx1 * gxd^7)^((q - 5) / 8)
        y = y * tv2               # This is almost sqrt(gx1)
        tv4 = y * c2                # check the two possible sqrts
        tv2 = tv4^2
        tv2 = tv2 * gxd
        e2 = tv2 == gx1
        y = CMOV(y, tv4, e2)
        gx2 = gx1 * tv5
        gx2 = gx2 * tv3             # gx2 = gx1 * Z^3 * u^6
        tv1 = y * tv1
        tv1 = tv1 * u               # This is almost sqrt(gx2)
        tv1 = tv1 * c3              # check the two possible sqrts
        tv4 = tv1 * c2
        tv2 = tv4^2
        tv2 = tv2 * gxd
        e3 = tv2 == gx2
        tv1 = CMOV(tv1, tv4, e3)
        tv2 = y^2
        tv2 = tv2 * gxd
        e4 = tv2 == gx1
        y = CMOV(tv1, y, e4)      # choose correct y-coordinate
        tv2 = tv3 * x1n             # x2n = x2n / xd = Z * u^2 * x1n / xd
        xn = CMOV(tv2, x1n, e4)    # choose correct x-coordinate
        e5 = sgn0(u) == sgn0(y)    # Fix sign of y
        y = CMOV(-y, y, e5)
        return (xn, xd, y, 1)

    def test_map(self, u=None):
        F = self.F
        A = self.A
        B = self.B
        if u is None:
            u = F.random_element()
        (xn, xd, yn, yd) = self.map_to_curve(u)
        x = xn / xd
        y = yn / yd
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
