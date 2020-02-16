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

    tv1 = u^2
    e1 = tv1 == 1
    tv1 = CMOV(tv1, 0, e1)    # If Z * u^2 == -1, set tv1 = 0
    xd = 1 - tv1
    x1n = -156326
    tv2 = xd^2
    gxd = tv2 * xd            # gxd = xd^3
    gx1 = 156326 * xd         # 156326 * xd
    gx1 = gx1 + x1n           # x1n + 156326 * xd
    gx1 = gx1 * x1n           # x1n^2 + 156326 * x1n * xd
    gx1 = gx1 + tv2           # x1n^2 + 156326 * x1n * xd + xd^2
    gx1 = gx1 * x1n           # x1n^3 + 156326 * x1n^2 * xd + x1n * xd^2
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
    e3 = sgn0(u) == sgn0(y)  # Fix sign of y
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
