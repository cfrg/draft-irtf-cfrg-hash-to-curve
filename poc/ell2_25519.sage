#!/usr/bin/sage
# vim: syntax=python
load("common.sage")

p = 2^255 - 19
F = GF(p)

def sqrt(x):
    assert F(x).is_square()
    return F(x).sqrt()

def ell2_curve25519(u):
    den = F(1 + 2 * u^2)
    A = F(486662)
    B = F(1)

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

def curve25519_to_edwards25519(u, v):
    c1 = sqrt(F(-486664))
    c1 = sgn0(c1) * c1
    assert sgn0(c1) == 1

    x = c1 * u / v
    y = (u - 1) / (u + 1)

    return (x, y)

def map_to_curve_elligator2_curve25519(u):
    c1 = (p + 3) // 8
    c2 = F(2)^c1
    c3 = sqrt(F(-1))
    c4 = (p - 5) // 8

    t1 = u^2
    t1 = 2 * t1
    xd = t1 + 1
    x1n = F(-486662)
    gxd = xd^2
    gxd = gxd * xd
    t2 = x1n^2
    gx1 = t2 * x1n
    t2 = t2 * xd
    t2 = t2 * F(486662)
    gx1 = gx1 + t2
    t2 = xd^2
    t2 = t2 * x1n
    gx1 = gx1 + t2
    t3 = gxd^2
    t2 = t3^2
    t3 = t3 * gxd
    t3 = t3 * gx1
    t2 = t2 * t3
    y11 = t2^c4
    y11 = y11 * t3
    y12 = y11 * c3
    t2 = y11^2
    t2 = t2 * gxd
    e1 = t2 == gx1
    y1 = CMOV(y12, y11, e1)
    x2n = x1n * t1
    y21 = y11 * u
    y21 = y21 * c2
    y22 = y21 * c3
    gx2 = gx1 * t1
    t2 = y21^2
    t2 = t2 * gxd
    e2 = t2 == gx2
    y2 = CMOV(y22, y21, e2)
    t2 = y1^2
    t2 = t2 * gxd
    e3 = t2 == gx1
    xn = CMOV(x2n, x1n, e3)
    y = CMOV(y2, y1, e3)
    e4 = sgn0(u) == sgn0(y)
    y = CMOV(-y, y, e4)
    return (xn, xd, y, 1)

def map_to_curve_elligator2_edwards25519(u):
    c1 = sqrt(F(-486664))
    c1 = sgn0(c1) * c1
    assert sgn0(c1) == 1

    (xMn, xMd, yMn, yMd) = map_to_curve_elligator2_curve25519(u)
    xn = xMn * yMd
    xn = xn * c1
    xd = xMd * yMn
    yn = xMn - xMd
    yd = xMn + xMd
    return (xn, xd, yn, yd)

def test_curve25519():
    u = F.random_element()
    (xn, xd, yn, yd) = map_to_curve_elligator2_curve25519(u)
    x = xn / xd
    y = yn / yd
    A = F(486662)
    B = F(1)
    assert B * y^2 == x^3 + A * x^2 + x
    (xp, yp) = ell2_curve25519(u)
    assert xp == x
    assert yp == y

def test_edwards25519():
    u = F.random_element()
    (xn, xd, yn, yd) = map_to_curve_elligator2_edwards25519(u)
    x = xn / xd
    y = yn / yd
    a = F(-1)
    d = -F(121665) / F(121666)
    assert a * x^2 + y^2 == 1 + d * x^2 * y^2
    (xp, yp) = curve25519_to_edwards25519(*ell2_curve25519(u))
    assert xp == x
    assert yp == y

if __name__ == "__main__":
    for _ in range(0, 1024):
        test_curve25519()
        test_edwards25519()
