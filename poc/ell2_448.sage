#!/usr/bin/sage
# vim: syntax=python
load("common.sage")

p = 2^448 - 2^224 - 1
F = GF(p)

def sqrt(x):
    assert F(x).is_square()
    return F(x).sqrt()

def ell2_curve448(u):
    A = F(156326)
    B = F(1)

    den = F(1 - u^2)
    if den == 0:
        den = F(1)
    x1 = -A / den
    gx1 = x1^3 + A * x1^2 + B * x1
    x2 = -x1 - A
    gx2 = x2^3 + A * x2^2 + B * x2

    if F(gx1).is_square():
        x = x1
        y = sqrt(gx1)
    else:
        x = x2
        y = sqrt(gx2)

    if sgn0(u) != sgn0(y):
        y = -y
    assert sgn0(u) == sgn0(y)

    return (x, y)

def curve448_to_edwards448(u, v):
    x = 4 * v * (u^2 - 1) / (u^4 - 2 * u^2 + 4 * v^2 + 1)
    y = -(u^5 - 2 * u^3 - 4 * u * v^2 + u) / (u^5 - 2 * u^2 * v^2 - 2 * u^3 - 2 * v^2 + u)
    return (x, y)

def map_to_curve_elligator2_curve448(u):
    c1 = (p - 3) / 4

    t1 = u^2
    xd = 1 - t1
    e1 = xd == 0
    xd = CMOV(xd, 1, e1)
    x1n = CMOV(-156326, 1, e1)
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
    return (xEn, xEd, yEn, yEd)

def test_curve448():
    u = F.random_element()
    (xn, xd, yn, yd) = map_to_curve_elligator2_curve448(u)
    x = xn / xd
    y = yn / yd
    A = F(156326)
    B = F(1)
    assert B * y^2 == x^3 + A * x^2 + x
    (xp, yp) = ell2_curve448(u)
    assert xp == x
    assert yp == y

def test_edwards448():
    u = F.random_element()
    (xn, xd, yn, yd) = map_to_curve_elligator2_edwards448(u)
    x = xn / xd
    y = yn / yd
    a = F(1)
    d = F(-39081)
    assert a * x^2 + y^2 == 1 + d * x^2 * y^2
    (xp, yp) = curve448_to_edwards448(*ell2_curve448(u))
    assert xp == x
    assert yp == y

def test_448():
    for _ in range(0, 1024):
        test_curve448()
        test_edwards448()

if __name__ == "__main__":
    test_448()
