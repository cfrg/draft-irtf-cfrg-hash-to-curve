#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.common import CMOV, square_root_random_sign
    from sagelib.sswu_generic import GenericSSWU
    from sagelib.z_selection import find_z_sswu
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

class OptimizedSSWU_9mod16(object):
    def __init__(self, F, A, B):
        assert F.order() % 16 == 9
        assert A != 0
        assert B != 0
        self.F = F
        self.A = F(A)
        self.B = F(B)

        # constants
        q = F.order()
        Z = find_z_sswu(F, self.A, self.B)
        self.Z = Z
        c1 = (q - 9) // 16            # Integer arithmetic
        c2 = sqrt(F(-1))
        c3 = sqrt(c2)
        c4 = sqrt(Z^3 / c3)
        c5 = sqrt(Z^3 / (c2 * c3))
        (self.c1, self.c2, self.c3, self.c4, self.c5) = (c1, c2, c3, c4, c5)

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
        c4 = self.c4
        c5 = self.c5
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
        tv2 = tv2 * tv4             # gxd^7
        tv2 = tv2 * gx1             # gx1 * gxd^7
        tv4 = tv4^2                 # gxd^8
        tv4 = tv2 * tv4             # gx1 * gxd^15
        y = tv4^c1                # (gx1 * gxd^15)^((q - 9) / 16)
        y = y * tv2               # This is almost sqrt(gx1)
        tv4 = y * c2                # check the four possible sqrts
        tv2 = tv4^2
        tv2 = tv2 * gxd
        e2 = tv2 == gx1
        y = CMOV(y, tv4, e2)
        tv4 = y * c3
        tv2 = tv4^2
        tv2 = tv2 * gxd
        e3 = tv2 == gx1
        y = CMOV(y, tv4, e3)
        tv4 = tv4 * c2
        tv2 = tv4^2
        tv2 = tv2 * gxd
        e4 = tv2 == gx1
        y = CMOV(y, tv4, e4)      # if x1 is square, this is its sqrt
        gx2 = gx1 * tv5
        gx2 = gx2 * tv3             # gx2 = gx1 * Z^3 * u^6
        tv5 = y * tv1
        tv5 = tv5 * u               # This is almost sqrt(gx2)
        tv1 = tv5 * c4              # check the four possible sqrts
        tv4 = tv1 * c2
        tv2 = tv4^2
        tv2 = tv2 * gxd
        e5 = tv2 == gx2
        tv1 = CMOV(tv1, tv4, e5)
        tv4 = tv5 * c5
        tv2 = tv4^2
        tv2 = tv2 * gxd
        e6 = tv2 == gx2
        tv1 = CMOV(tv1, tv4, e6)
        tv4 = tv4 * c2
        tv2 = tv4^2
        tv2 = tv2 * gxd
        e7 = tv2 == gx2
        tv1 = CMOV(tv1, tv4, e7)
        tv2 = y^2
        tv2 = tv2 * gxd
        e8 = tv2 == gx1
        y = CMOV(tv1, y, e8)      # choose correct y-coordinate
        tv2 = tv3 * x1n             # x2n = x2n / xd = Z * u^2 * x1n / xd
        xn = CMOV(tv2, x1n, e8)    # choose correct x-coordinate
        e9 = sgn0(u) == sgn0(y)    # Fix sign of y
        y = CMOV(-y, y, e9)
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

# curve isogenous to BLS12-381 G2
p_bls12381 = 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab
F.<II> = GF(p_bls12381^2, modulus=[1,0,1])
Ap_bls12381g2 = 240 * II
Bp_bls12381g2 = 1012 * (1 + II)
test_bls12381g2 = OptimizedSSWU_9mod16(F, Ap_bls12381g2, Bp_bls12381g2)
assert test_bls12381g2.Z == -2 - II

def test_sswu_9mod16():
    print("Testing BLS12-381 G2 isogeny")
    test_bls12381g2.test()

if __name__ == "__main__":
    test_sswu_9mod16()
