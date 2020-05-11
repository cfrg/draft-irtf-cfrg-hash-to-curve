#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.common import CMOV, sgn0, square_root_random_sign
    from sagelib.ell2_generic import GenericEll2
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

class OptimizedEll2_K1_5mod8(object):
    def __init__(self, F, J):
        assert F.order() % 8 == 5
        J = F(J)
        assert J != 0
        testval = (J^2 - 4)
        assert testval != 0
        assert not testval.is_square()
        self.F = F
        self.J = J

        # constants
        q = F.order()
        c1 = (q + 3) // 8           # Integer arithmetic
        c2 = F(2)^c1
        c3 = sqrt(F(-1))
        c4 = (q - 5) // 8           # Integer arithmetic
        (self.c1, self.c2, self.c3, self.c4) = (c1, c2, c3, c4)

        # reference map for testing
        self.ref_map = GenericEll2(F, self.J, 1)
        self.ref_map.set_sqrt(square_root_random_sign)

    def map_to_curve(self, u):
        sgn0 = self.ref_map.sgn0
        J = self.J
        F = self.F
        c1 = self.c1
        c2 = self.c2
        c3 = self.c3
        c4 = self.c4
        u = F(u)

        tv1 = u^2
        tv1 = 2 * tv1
        xd = tv1 + 1             # Nonzero: -1 is square (mod p), tv1 is not
        x1n = -J                  # x1 = x1n / xd = -J / (1 + 2 * u^2)
        tv2 = xd^2
        gxd = tv2 * xd            # gxd = xd^3
        gx1 = J * tv1             # x1n + J * xd
        gx1 = gx1 * x1n           # x1n^2 + J * x1n * xd
        gx1 = gx1 + tv2           # x1n^2 + J * x1n * xd + xd^2
        gx1 = gx1 * x1n           # x1n^3 + J * x1n^2 * xd + x1n * xd^2
        tv3 = gxd^2
        tv2 = tv3^2               # gxd^4
        tv3 = tv3 * gxd           # gxd^3
        tv3 = tv3 * gx1           # gx1 * gxd^3
        tv2 = tv2 * tv3           # gx1 * gxd^7
        y11 = tv2^c4              # (gx1 * gxd^7)^((p - 5) / 8)
        y11 = y11 * tv3           # gx1 * gxd^3 * (gx1 * gxd^7)^((p - 5) / 8)
        y12 = y11 * c3
        tv2 = y11^2
        tv2 = tv2 * gxd
        e1 = tv2 == gx1
        y1 = CMOV(y12, y11, e1)  # If g(x1) is square, this is its sqrt
        x2n = x1n * tv1           # x2 = x2n / xd = 2 * u^2 * x1n / xd
        y21 = y11 * u
        y21 = y21 * c2
        y22 = y21 * c3
        gx2 = gx1 * tv1           # g(x2) = gx2 / gxd = 2 * u^2 * g(x1)
        tv2 = y21^2
        tv2 = tv2 * gxd
        e2 = tv2 == gx2
        y2 = CMOV(y22, y21, e2)  # If g(x2) is square, this is its sqrt
        tv2 = y1^2
        tv2 = tv2 * gxd
        e3 = tv2 == gx1
        xn = CMOV(x2n, x1n, e3)  # If e3, x = x1, else x = x2
        y = CMOV(y2, y1, e3)    # If e3, y = y1, else y = y2
        e4 = sgn0(y) == 1        # Fix sign of y
        y = CMOV(y, -y, e3 ^^ e4)
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

class OptimizedEll2_5mod8(object):
    def __init__(self, F, J, K):
        assert F.order() % 8 == 5
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
        c1 = (q + 3) // 8           # Integer arithmetic
        c2 = F(2)^c1
        c3 = sqrt(F(-1))
        c4 = (q - 5) // 8           # Integer arithmetic
        c5 = K^2
        (self.c1, self.c2, self.c3, self.c4, self.c5) = (c1, c2, c3, c4, c5)

        self.ref_map = GenericEll2(F, self.J, self.K)
        self.ref_map.set_sqrt(square_root_random_sign)

    def map_to_curve(self, u):
        sgn0 = self.ref_map.sgn0
        J = self.J
        K = self.K
        F = self.F
        c1 = self.c1
        c2 = self.c2
        c3 = self.c3
        c4 = self.c4
        c5 = self.c5
        u = F(u)

        tv1 = u^2
        tv1 = 2 * tv1
        xd = tv1 + 1             # Nonzero: -1 is square (mod p), tv1 is not
        xd = xd * K
        x1n = -J                  # x1 = x1n / xd = -J / (K * (1 + 2 * u^2))
        tv2 = xd^2
        gxd = tv2 * xd
        gxd = gxd * c5            # gxd = xd^3 * K^2
        gx1 = x1n * K
        tv3 = xd * J
        tv3 = gx1 + tv3           # x1n * K + xd * J
        gx1 = gx1 * tv3           # K^2 * x1n^2 + J * K * x1n * xd
        gx1 = gx1 + tv2           # K^2 * x1n^2 + J * K * x1n * xd + xd^2
        gx1 = gx1 * x1n           # K^2 * x1n^3 + J * K * x1n^2 * xd + x1n * xd^2
        tv3 = gxd^2
        tv2 = tv3^2               # gxd^4
        tv3 = tv3 * gxd           # gxd^3
        tv3 = tv3 * gx1           # gx1 * gxd^3
        tv2 = tv2 * tv3           # gx1 * gxd^7
        y11 = tv2^c4              # (gx1 * gxd^7)^((q - 5) / 8)
        y11 = y11 * tv3           # gx1 * gxd^3 * (gx1 * gxd^7)^((q - 5) / 8)
        y12 = y11 * c3
        tv2 = y11^2
        tv2 = tv2 * gxd
        e1 = tv2 == gx1
        y1 = CMOV(y12, y11, e1)  # If g(x1) is square, this is its sqrt
        x2n = x1n * tv1           # x2 = x2n / xd = 2 * u^2 * x1n / xd
        y21 = y11 * u
        y21 = y21 * c2
        y22 = y21 * c3
        gx2 = gx1 * tv1           # g(x2) = gx2 / gxd = 2 * u^2 * g(x1)
        tv2 = y21^2
        tv2 = tv2 * gxd
        e2 = tv2 == gx2
        y2 = CMOV(y22, y21, e2)  # If g(x2) is square, this is its sqrt
        tv2 = y1^2
        tv2 = tv2 * gxd
        e3 = tv2 == gx1
        xn = CMOV(x2n, x1n, e3)  # If e3, x = x1, else x = x2
        xn = xn * K
        y = CMOV(y2, y1, e3)    # If e3, y = y1, else y = y2
        e4 = sgn0(y) == 1        # Fix sign of y
        y = CMOV(y, -y, e3 ^^ e4)
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

p_25519 = 2^255 - 19
F_25519 = GF(p_25519)
J_25519 = F_25519(486662)
K_25519 = F_25519(1)
test_curve25519 = OptimizedEll2_K1_5mod8(F_25519, J_25519)
test2_curve25519 = OptimizedEll2_5mod8(F_25519, J_25519, K_25519)

def map_to_curve_elligator2_edwards25519(u):
    F = test_curve25519.F
    c1 = sqrt(F(-486664))
    if sgn0(c1) == 1:
        c1 = -c1
    assert sgn0(c1) == 0

    (xMn, xMd, yMn, yMd) = test_curve25519.map_to_curve(u)
    assert test2_curve25519.map_to_curve(u) == (xMn, xMd, yMn, yMd)
    xn = xMn * yMd
    xn = xn * c1
    xd = xMd * yMn       # xn / xd = c1 * xM / yM
    yn = xMn - xMd
    yd = xMn + xMd       # (n / d - 1) / (n / d + 1) = (n - d) / (n + d)
    tv1 = xd * yd
    e = tv1 == 0
    xn = CMOV(xn, 0, e)
    xd = CMOV(xd, 1, e)
    yn = CMOV(yn, 1, e)
    yd = CMOV(yd, 1, e)
    return (xn, xd, yn, yd)

def curve25519_to_edwards25519(u, v, _):
    F = test_curve25519.F
    c1 = sqrt(F(-486664))
    if sgn0(c1) == 1:
        c1 = -c1
    assert sgn0(c1) == 0

    if v == 0 or u == -1:
        return (F(0), F(1))
    x = c1 * u / v
    y = (u - 1) / (u + 1)

    return (x, y)

def test_edwards25519(u=None):
    F = test_curve25519.F
    a = F(-1)
    d = -F(121665) / F(121666)

    if u is None:
        u = F.random_element()
    (xn, xd, yn, yd) = map_to_curve_elligator2_edwards25519(u)
    x = xn / xd
    y = yn / yd
    assert a * x^2 + y^2 == 1 + d * x^2 * y^2
    (xp, yp) = curve25519_to_edwards25519(*test_curve25519.ref_map.map_to_curve(u))
    assert xp == x
    assert yp == y

def test_ell2_25519():
    print("Testing curve25519 and edwards25519")
    F = test_curve25519.F
    test_curve25519.test_map(F(0))
    test2_curve25519.test_map(F(0))
    test_edwards25519(F(0))
    for und in test_curve25519.ref_map.undefs:
        test_curve25519.test_map(und)
        test2_curve25519.test_map(und)
        test_edwards25519(und)
    for _ in range(0, 256):
        test_curve25519.test_map()
        test2_curve25519.test_map()
        test_edwards25519()

def test_ell2_K1_5mod8_random():
    print("Testing random curves (q = 5 mod 8, K == 1): ", end="")
    for _ in range(0, 8):
        p = 0
        while p % 8 != 5:
            p = random_prime(1 << 256)
        F = GF(p)
        while True:
            J = F.random_element()
            try:
                test = OptimizedEll2_K1_5mod8(F, J)
            except:
                continue
            break
        test.test()
        sys.stdout.write('.')
        sys.stdout.flush()
    print()

def test_ell2_5mod8_random():
    print("Testing random curves (q = 5 mod 8, K != 1): ", end="")
    for _ in range(0, 8):
        p = 0
        while p % 8 != 5:
            p = random_prime(1 << 256)
        F = GF(p)
        while True:
            J = F.random_element()
            K = F.random_element()
            try:
                test = OptimizedEll2_5mod8(F, J, K)
            except:
                continue
            break
        test.test()
        sys.stdout.write('.')
        sys.stdout.flush()
    print()

def test_ell2_5mod8():
    test_ell2_25519()
    test_ell2_K1_5mod8_random()
    test_ell2_5mod8_random()

if __name__ == "__main__":
    test_ell2_5mod8()
