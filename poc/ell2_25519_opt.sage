#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.common import CMOV, sgn0, square_root_random_sign
    from sagelib.ell2_generic import GenericEll2
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

p = 2^255 - 19
F = GF(p)
A = F(486662)
B = F(1)
ref_map = GenericEll2(F, A, B)
sqrt = square_root_random_sign
ref_map.set_sqrt(sqrt)

def map_to_curve_elligator2_curve25519(u):
    c1 = (p + 3) // 8
    c2 = F(2)^c1
    c3 = sqrt(F(-1))
    c4 = (p - 5) // 8

    tv1 = u^2
    tv1 = 2 * tv1
    xd = tv1 + 1             # Nonzero: -1 is square (mod p), tv1 is not
    x1n = -486662             # x1 = x1n / xd = -486662 / (1 + 2 * u^2)
    tv2 = xd^2
    gxd = tv2 * xd            # gxd = xd^3
    gx1 = 486662 * tv1        # x1n + 486662 * xd
    gx1 = gx1 * x1n           # x1n^2 + 486662 * x1n * xd
    gx1 = gx1 + tv2           # x1n^2 + 486662 * x1n * xd + xd^2
    gx1 = gx1 * x1n           # x1n^3 + 486662 * x1n^2 * xd + x1n * xd^2
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
    e4 = sgn0(u) == sgn0(y)  # Fix sign of y
    y = CMOV(-y, y, e4)
    return (xn, xd, y, 1)

def map_to_curve_elligator2_edwards25519(u):
    c1 = sqrt(F(-486664))
    if sgn0(c1) == 1:
        c1 = -c1
    assert sgn0(c1) == 0

    (xMn, xMd, yMn, yMd) = map_to_curve_elligator2_curve25519(u)
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

def test_curve25519(u=None):
    if u is None:
        u = F.random_element()
    (xn, xd, yn, yd) = map_to_curve_elligator2_curve25519(u)
    x = xn / xd
    y = yn / yd
    assert B * y^2 == x^3 + A * x^2 + x
    (xp, yp, _) = ref_map.map_to_curve(u)
    assert xp == x
    assert yp == y

def curve25519_to_edwards25519(u, v, _):
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
    a = F(-1)
    d = -F(121665) / F(121666)

    if u is None:
        u = F.random_element()
    (xn, xd, yn, yd) = map_to_curve_elligator2_edwards25519(u)
    x = xn / xd
    y = yn / yd
    assert a * x^2 + y^2 == 1 + d * x^2 * y^2
    (xp, yp) = curve25519_to_edwards25519(*ref_map.map_to_curve(u))
    assert xp == x
    assert yp == y

def test_25519():
    test_curve25519(F(0))
    test_edwards25519(F(0))
    for und in ref_map.undefs:
        test_curve25519(und)
        test_edwards25519(und)
    for _ in range(0, 1024):
        test_curve25519()
        test_edwards25519()

if __name__ == "__main__":
    test_25519()
