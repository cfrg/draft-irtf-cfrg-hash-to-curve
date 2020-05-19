#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.common import CMOV, sgn0, square_root_random_sign
    from sagelib.ell2_generic import GenericEll2
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

class OptimizedEll2_K1_3mod4(object):
    def __init__(self, F, J):
        assert F.order() % 4 == 3
        J = F(J)
        # check that this is a valid Montgomery curve
        assert J != 0
        testval = (J^2 - 4)
        assert testval != 0
        assert not testval.is_square()
        self.F = F
        self.J = J

        # constants
        q = F.order()
        c1 = (q - 3) // 4           # Integer arithmetic
        self.c1 = c1

        # reference map for testing
        self.ref_map = GenericEll2(F, self.J, 1)
        self.ref_map.set_sqrt(square_root_random_sign)

    def map_to_curve(self, u):
        sgn0 = self.ref_map.sgn0
        J = self.J
        F = self.F
        c1 = self.c1
        u = F(u)

        tv1 = u^2
        e1 = tv1 == 1
        tv1 = CMOV(tv1, 0, e1)    # If Z * u^2 == -1, set tv1 = 0
        xd = 1 - tv1
        x1n = -J
        tv2 = xd^2
        gxd = tv2 * xd            # gxd = xd^3
        gx1 = -J * tv1            # x1n + J * xd
        gx1 = gx1 * x1n           # x1n^2 + J * x1n * xd
        gx1 = gx1 + tv2           # x1n^2 + J * x1n * xd + xd^2
        gx1 = gx1 * x1n           # x1n^3 + J * x1n^2 * xd + x1n * xd^2
        tv3 = gxd^2
        tv2 = gx1 * gxd           # gx1 * gxd
        tv3 = tv3 * tv2           # gx1 * gxd^3
        y1 = tv3^c1              # (gx1 * gxd^3)^((p - 3) / 4)
        y1 = y1 * tv2            # gx1 * gxd * (gx1 * gxd^3)^((p - 3) / 4)
        x2n = -tv1 * x1n          # x2 = x2n / xd = -1 * u^2 * x1n / xd
        y2 = y1 * u
        y2 = CMOV(y2, 0, e1)
        tv2 = y1^2
        tv2 = tv2 * gxd
        e2 = tv2 == gx1
        xn = CMOV(x2n, x1n, e2)  # If e2, x = x1, else x = x2
        y = CMOV(y2, y1, e2)    # If e2, y = y1, else y = y2
        e3 = sgn0(y) == 1        # Fix sign of y
        y = CMOV(y, -y, e2 ^^ e3)
        return (xn, xd, y, 1)

    def test_map(self, u=None):
        F = self.F
        J = self.J
        if u is None:
            u = F.random_element()
        (xn, xd, yn, yd) = self.map_to_curve(u)
        x = xn / xd
        y = yn / yd
        assert y^2 == x^3 + J * x^2 + x
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

class OptimizedEll2_3mod4(object):
    def __init__(self, F, J, K):
        assert F.order() % 4 == 3
        J = F(J)
        K = F(K)
        assert J != 0
        assert K != 0
        testval = (J^2 - 4) / K^2
        assert testval != 0
        assert not testval.is_square()
        self.F = F
        self.J = J
        self.K = K

        q = F.order()
        c1 = (q - 3) // 4           # Integer arithmetic
        c2 = K^2
        (self.c1, self.c2) = (c1, c2)

        self.ref_map = GenericEll2(F, self.J, self.K)
        self.ref_map.set_sqrt(square_root_random_sign)

    def map_to_curve(self, u):
        sgn0 = self.ref_map.sgn0
        J = self.J
        K = self.K
        F = self.F
        c1 = self.c1
        c2 = self.c2
        u = F(u)

        tv1 = u^2
        e1 = tv1 == 1
        tv1 = CMOV(tv1, 0, e1)    # If Z * u^2 == -1, set tv1 = 0
        xd = 1 - tv1
        xd = xd * K
        x1n = -J                  # x1 = x1n / xd = -J / (K * (1 + 2 * u^2))
        tv2 = xd^2
        gxd = tv2 * xd
        gxd = gxd * c2            # gxd = xd^3 * K^2
        gx1 = x1n * K
        tv3 = xd * J
        tv3 = gx1 + tv3           # x1n * K + xd * J
        gx1 = gx1 * tv3           # K^2 * x1n^2 + J * K * x1n * xd
        gx1 = gx1 + tv2           # K^2 * x1n^2 + J * K * x1n * xd + xd^2
        gx1 = gx1 * x1n           # K^2 * x1n^3 + J * K * x1n^2 * xd + x1n * xd^2
        tv3 = gxd^2
        tv2 = gx1 * gxd           # gx1 * gxd
        tv3 = tv3 * tv2           # gx1 * gxd^3
        y1 = tv3^c1              # (gx1 * gxd^3)^((q - 3) / 4)
        y1 = y1 * tv2            # gx1 * gxd * (gx1 * gxd^3)^((q - 3) / 4)
        x2n = -tv1 * x1n          # x2 = x2n / xd = -1 * u^2 * x1n / xd
        y2 = y1 * u
        y2 = CMOV(y2, 0, e1)
        tv2 = y1^2
        tv2 = tv2 * gxd
        e2 = tv2 == gx1
        xn = CMOV(x2n, x1n, e2)  # If e2, x = x1, else x = x2
        xn = xn * K
        y = CMOV(y2, y1, e2)    # If e2, y = y1, else y = y2
        e3 = sgn0(y) == 1        # Fix sign of y
        y = CMOV(y, -y, e2 ^^ e3)
        y = y * K
        return (xn, xd, y, 1)

    def test_map(self, u=None):
        F = self.F
        J = self.J
        K = self.K
        if u is None:
            u = F.random_element()
        (xn, xd, yn, yd) = self.map_to_curve(u)
        x = xn / xd
        y = yn / yd
        assert K * y^2 == x^3 + J * x^2 + x
        (xp, yp, zp) = self.ref_map.map_to_curve(u)
        xp = xp / zp
        yp = yp / zp
        assert xp * K == x
        assert yp * K == y

    def test(self):
        for und in self.ref_map.undefs:
            self.test_map(und)
        for _ in range(0, 256):
            self.test_map()

p_448 = 2^448 - 2^224 - 1
F_448 = GF(p_448)
J_448 = F_448(156326)
K_448 = F_448(1)
test_curve448 = OptimizedEll2_K1_3mod4(F_448, J_448)
test2_curve448 = OptimizedEll2_3mod4(F_448, J_448, K_448)

def map_to_curve_elligator2_edwards448(u):
    (xn, xd, yn, yd) = test_curve448.map_to_curve(u)
    assert test2_curve448.map_to_curve(u) == (xn, xd, yn, yd)
    xn2 = xn^2
    xd2 = xd^2
    xd4 = xd2^2
    yn2 = yn^2
    yd2 = yd^2
    xEn = xn2 - xd2
    tv2 = xEn - xd2
    xEn = xEn * xd2
    xEn = xEn * yd
    xEn = xEn * yn
    xEn = xEn * 4
    tv2 = tv2 * xn2
    tv2 = tv2 * yd2
    tv3 = 4 * yn2
    tv1 = tv3 + yd2
    tv1 = tv1 * xd4
    xEd = tv1 + tv2
    tv2 = tv2 * xn
    tv4 = xn * xd4
    yEn = tv3 - yd2
    yEn = yEn * tv4
    yEn = yEn - tv2
    tv1 = xn2 + xd2
    tv1 = tv1 * xd2
    tv1 = tv1 * xd
    tv1 = tv1 * yn2
    tv1 = -2 * tv1
    yEd = tv2 + tv1
    tv4 = tv4 * yd2
    yEd = yEd + tv4
    tv1 = xEd * yEd
    e = tv1 == 0
    xEn = CMOV(xEn, 0, e)
    xEd = CMOV(xEd, 1, e)
    yEn = CMOV(yEn, 1, e)
    yEd = CMOV(yEd, 1, e)
    return (xEn, xEd, yEn, yEd)

def curve448_to_edwards448(u, v, _):
    xn = 4 * v * (u^2 - 1)
    xd = (u^4 - 2 * u^2 + 4 * v^2 + 1)
    yn = -(u^5 - 2 * u^3 - 4 * u * v^2 + u)
    yd = (u^5 - 2 * u^2 * v^2 - 2 * u^3 - 2 * v^2 + u)
    if xd * yd == 0:
        return (0, 1)
    return (xn / xd, yn / yd)

def test_edwards448(u=None):
    F = test_curve448.F
    a = F(1)
    d = F(-39081)

    if u is None:
        u = F.random_element()
    (xn, xd, yn, yd) = map_to_curve_elligator2_edwards448(u)
    x = xn / xd
    y = yn / yd
    assert a * x^2 + y^2 == 1 + d * x^2 * y^2
    (xp, yp) = curve448_to_edwards448(*test_curve448.ref_map.map_to_curve(u))
    assert xp == x
    assert yp == y

def test_ell2_448():
    print("Testing curve448 and edwards448")
    F = test_curve448.F
    test_curve448.test_map(F(0))
    test2_curve448.test_map(F(0))
    test_edwards448(F(0))
    for und in test_curve448.ref_map.undefs:
        test_curve448.test_map(und)
        test2_curve448.test_map(und)
        test_edwards448(und)
    for _ in range(0, 1024):
        test_curve448.test_map()
        test2_curve448.test_map()
        test_edwards448()

def test_ell2_K1_3mod4_random():
    print("Testing random curves (q = 5 mod 8, K == 1): ", end="")
    for _ in range(0, 8):
        p = 0
        while p % 4 != 3:
            p = random_prime(1 << 256)
        F = GF(p)
        while True:
            J = F.random_element()
            try:
                test = OptimizedEll2_K1_3mod4(F, J)
            except:
                continue
            break
        test.test()
        sys.stdout.write('.')
        sys.stdout.flush()
    print()

def test_ell2_3mod4_random():
    print("Testing random curves (q = 5 mod 8, K != 1): ", end="")
    for _ in range(0, 8):
        p = 0
        while p % 4 != 3:
            p = random_prime(1 << 256)
        F = GF(p)
        while True:
            J = F.random_element()
            K = F.random_element()
            try:
                test = OptimizedEll2_3mod4(F, J, K)
            except:
                continue
            break
        test.test()
        sys.stdout.write('.')
        sys.stdout.flush()
    print()

def test_ell2_3mod4():
    test_ell2_448()
    test_ell2_K1_3mod4_random()
    test_ell2_3mod4_random()

if __name__ == "__main__":
    test_ell2_3mod4()
