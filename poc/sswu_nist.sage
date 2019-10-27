#!/usr/bin/sage
# vim: syntax=python

load("sswu_generic.sage")
load("z_selection.sage")

class OptimizedSSWU(object):
    def __init__(self, p, B):
        assert p % 4 == 3
        assert B != 0
        F = GF(p)
        self.F = F
        self.A = F(-3)
        self.B = F(B)

        # constants
        Z = find_z_sswu(F, self.A, self.B)
        self.Z = Z
        self.c1 = F(B) / F(3)
        self.c2 = (p - 3) // 4
        self.c3 = sqrt(-Z^3)

        # map for testing
        self.ref_map = GenericSSWU(F, self.A, self.B)

    def map_to_curve(self, u):
        A = self.A
        B = self.B
        F = self.F
        Z = self.Z
        c1 = self.c1
        c2 = self.c2
        c3 = self.c3
        u = F(u)

        t1 = u^2
        t3 = Z * t1
        t2 = t3^2
        xd = t2 + t3
        x1n = xd + 1
        x1n = x1n * B
        xd = xd * 3
        e1 = xd == 0
        xd = CMOV(xd, Z * A, e1)        #// If xd == 0, set xd = Z * A
        t2 = xd^2
        gxd = t2 * xd                   #// gxd == xd^3
        t2 = -3 * t2
        gx1 = x1n^2
        gx1 = gx1 + t2                  #// x1n^2 + A * xd^2
        gx1 = gx1 * x1n                 #// x1n^3 + A * x1n * xd^2
        t2 = B * gxd
        gx1 = gx1 + t2                  #// x1n^3 + A * x1n * xd^2 + B * xd^3
        t4 = gxd^2
        t2 = gx1 * gxd
        t4 = t4 * t2                    #// gx1 * gxd^3
        y1 = t4^c2                      #// (gx1 * gxd^3)^((p - 3) / 4)
        y1 = y1 * t2                    #// gx1 * gxd * (gx1 * gxd^3)^((p - 3) / 4)
        x2n = t3 * x1n                  #// x2 = x2n / xd = -10 * u^2 * x1n / xd
        y2 = y1 * c3                    #// y2 = y1 * sqrt(-Z^3)
        y2 = y2 * t1
        y2 = y2 * u
        t2 = y1^2
        t2 = t2 * gxd
        e2 = t2 == gx1
        xn = CMOV(x2n, x1n, e2)         #// If e2, x = x1, else x = x2
        y = CMOV(y2, y1, e2)            #// If e2, y = y1, else y = y2
        e3 = sgn0(u) == sgn0(y)         #// Fix sign of y
        y = CMOV(-y, y, e3)
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

p_p256 = 2^256 - 2^224 + 2^192 + 2^96 - 1
B_p256 = 0x5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b
test_p256 = OptimizedSSWU(p_p256, B_p256)
assert test_p256.Z == GF(p_p256)(-10)

p_p384 = 2^384 - 2^128 - 2^96 + 2^32 - 1
B_p384 = 0xb3312fa7e23ee7e4988e056be3f82d19181d9c6efe8141120314088f5013875ac656398d8a2ed19d2a85c8edd3ec2aef
test_p384 = OptimizedSSWU(p_p384, B_p384)
assert test_p384.Z == GF(p_p384)(-12)

p_p521 = 2^521 - 1
B_p521 = 0x51953eb9618e1c9a1f929a21a0b68540eea2da725b99b315f3b8b489918ef109e156193951ec7e937b1652c0bd3bb1bf073573df883d2c34f1ef451fd46b503f00
test_p521 = OptimizedSSWU(p_p521, B_p521)
assert test_p521.Z == GF(p_p521)(-4)

if __name__ == "__main__":
    print("Testing P-256")
    test_p256.test()
    print("Testing P-384")
    test_p384.test()
    print("Testing P-521")
    test_p521.test()
