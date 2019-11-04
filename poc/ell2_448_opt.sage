#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.common import CMOV, sgn0_le, square_root_random_sign
    from sagelib.ell2_generic import GenericEll2
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

p = 2^448 - 2^224 - 1
F = GF(p)
A = F(156326)
B = F(1)
ref_map = GenericEll2(F, A, B)
sgn0 = sgn0_le
ref_map.set_sgn0(sgn0)
sqrt = square_root_random_sign
ref_map.set_sqrt(sqrt)

def map_to_curve_elligator2_curve448(u):
    c1 = (p - 3) // 4

    t1 = u^2
    e1 = t1 == 1
    t1 = CMOV(t1, 0, e1)
    xd = 1 - t1
    x1n = -156326
    t2 = xd^2
    gxd = t2 * xd
    gx1 = 156326 * xd
    gx1 = gx1 + x1n
    gx1 = gx1 * x1n
    gx1 = gx1 + t2
    gx1 = gx1 * x1n
    t3 = gxd^2
    t2 = gx1 * gxd
    t3 = t3 * t2
    y1 = t3^c1
    y1 = y1 * t2
    x2n = -t1 * x1n
    y2 = y1 * u
    y2 = CMOV(y2, 0, e1)
    t2 = y1^2
    t2 = t2 * gxd
    e2 = t2 == gx1
    xn = CMOV(x2n, x1n, e2)
    y = CMOV(y2, y1, e2)
    e3 = sgn0(u) == sgn0(y)
    y = CMOV(-y, y, e3)
    return (xn, xd, y, 1)

def map_to_curve_elligator2_edwards448(u):
    (xn, xd, yn, yd) = map_to_curve_elligator2_curve448(u)
    xn2 = xn^2
    xd2 = xd^2
    xd4 = xd2^2
    yn2 = yn^2
    yd2 = yd^2
    xEn = xn2 - xd2
    t2 = xEn - xd2
    xEn = xEn * xd2
    xEn = xEn * yd
    xEn = xEn * yn
    xEn = xEn * 4
    t2 = t2 * xn2
    t2 = t2 * yd2
    t3 = 4 * yn2
    t1 = t3 + yd2
    t1 = t1 * xd4
    xEd = t1 + t2
    t2 = t2 * xn
    t4 = xn * xd4
    yEn = t3 - yd2
    yEn = yEn * t4
    yEn = yEn - t2
    t1 = xn2 + xd2
    t1 = t1 * xd2
    t1 = t1 * xd
    t1 = t1 * yn2
    t1 = -2 * t1
    yEd = t2 + t1
    t4 = t4 * yd2
    yEd = yEd + t4
    t1 = xEd * yEd
    e = t1 == 0
    xEn = CMOV(xEn, 0, e)
    xEd = CMOV(xEd, 1, e)
    yEn = CMOV(yEn, 1, e)
    yEd = CMOV(yEd, 1, e)
    return (xEn, xEd, yEn, yEd)

def test_curve448(u=None):
    if u is None:
        u = F.random_element()
    (xn, xd, yn, yd) = map_to_curve_elligator2_curve448(u)
    x = xn / xd
    y = yn / yd
    assert B * y^2 == x^3 + A * x^2 + x
    (xp, yp, _) = ref_map.map_to_curve(u)
    assert xp == x
    assert yp == y

def curve448_to_edwards448(u, v, _):
    xn = 4 * v * (u^2 - 1)
    xd = (u^4 - 2 * u^2 + 4 * v^2 + 1)
    yn = -(u^5 - 2 * u^3 - 4 * u * v^2 + u)
    yd = (u^5 - 2 * u^2 * v^2 - 2 * u^3 - 2 * v^2 + u)
    if xd * yd == 0:
        return (0, 1)
    return (xn / xd, yn / yd)

def test_edwards448(u=None):
    a = F(1)
    d = F(-39081)

    if u is None:
        u = F.random_element()
    (xn, xd, yn, yd) = map_to_curve_elligator2_edwards448(u)
    x = xn / xd
    y = yn / yd
    assert a * x^2 + y^2 == 1 + d * x^2 * y^2
    (xp, yp) = curve448_to_edwards448(*ref_map.map_to_curve(u))
    assert xp == x
    assert yp == y

def test_448():
    test_curve448(F(0))
    test_edwards448(F(0))
    for und in ref_map.undefs:
        test_curve448(und)
        test_edwards448(und)
    for _ in range(0, 1024):
        test_curve448()
        test_edwards448()

if __name__ == "__main__":
    test_448()
