#!/usr/bin/sage
# vim: syntax=python
load("common.sage")

p = 2^256 - 2^224 + 2^192 + 2^96 - 1
F = GF(p)
A = F(-3)
B = F(0x5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b)
Z = F(-10)

def sqrt(x):
    assert F(x).is_square()
    return F(x).sqrt()

def is_square(x):
    return F(x).is_square()

def inv0(x):
    if x == 0:
        return 0
    return 1 / F(x)

def sswu_p256(u):
    den = Z^2 * u^4 + Z * u^2
    if den == 0:
        x1 = B / (Z * A)
        skip_gx2_assert = True
    else:
        x1 = (-B / A) * (1 + 1 / den)
        skip_gx2_assert = False

    gx1 = x1^3 + A * x1 + B

    x2 = Z * u^2 * x1
    gx2 = x2^3 + A * x2 + B
    assert skip_gx2_assert or gx2 == Z^3 * u^6 * gx1

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

def map_to_curve_simple_swu_p256(u):
    c1 = B / F(3)
    c2 = (p - 3) // 4
    c3 = F(1000).sqrt()

    t1 = u^2
    t3 = -10 * t1
    t2 = t3^2
    xd = t2 + t3
    x1n = xd + 1
    x1n = x1n * B
    xd = xd * 3
    e1 = xd == 0
    xd = CMOV(xd, 30, e1)
    t2 = xd^2
    gxd = t2 * xd
    t2 = -3 * t2
    gx1 = x1n^2
    gx1 = gx1 + t2
    gx1 = gx1 * x1n
    t2 = B * gxd
    gx1 = gx1 + t2
    t4 = gxd^2
    t2 = gx1 * gxd
    t4 = t4 * t2
    y1 = t4^c2
    y1 = y1 * t2
    x2n = t3 * x1n
    y2 = y1 * c3
    y2 = y2 * t1
    y2 = y2 * u
    t2 = y1^2
    t2 = t2 * gxd
    e2 = t2 == gx1
    xn = CMOV(x2n, x1n, e2)
    y = CMOV(y2, y1, e2)
    e3 = sgn0(u) == sgn0(y)
    y = CMOV(-y, y, e3)
    return (xn, xd, y, 1)

def map_to_curve_simple_swu(u):
    c1 = -B / A
    c2 = -1 / Z

    t1 = Z * u^2
    t2 = t1^2
    x1 = t1 + t2
    x1 = inv0(x1)
    e1 = x1 == 0
    x1 = x1 + 1
    x1 = CMOV(x1, c2, e1)
    x1 = x1 * c1
    gx1 = x1^2
    gx1 = gx1 + A
    gx1 = gx1 * x1
    gx1 = gx1 + B
    x2 = t1 * x1
    t2 = t1 * t2
    gx2 = gx1 * t2
    e2 = is_square(gx1)
    x = CMOV(x2, x1, e2)
    y2 = CMOV(gx2, gx1, e2)
    y = sqrt(y2)
    e3 = sgn0(u) == sgn0(y)
    y = CMOV(-y, y, e3)
    return (x, y)

def test_map_p256(u=None):
    if u is None:
        u = F.random_element()
    (xn, xd, yn, yd) = map_to_curve_simple_swu_p256(u)
    x = xn / xd
    y = yn / yd
    assert y^2 == x^3 + A * x + B
    (xp, yp) = sswu_p256(u)
    assert xp == x
    assert yp == y
    (xpp, ypp) = map_to_curve_simple_swu(u)
    assert xpp == x
    assert ypp == y

def test_p256():
    test_map_p256(F(0))
    for _ in range(0, 1024):
        test_map_p256()

if __name__ == "__main__":
    test_p256()
