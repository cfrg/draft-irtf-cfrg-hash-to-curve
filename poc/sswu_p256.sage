#!/usr/bin/sage
# vim: syntax=python

load("common.sage")
load("sswu_generic.sage")

p = 2^256 - 2^224 + 2^192 + 2^96 - 1
F = GF(p)
A = F(-3)
B = F(0x5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b)

p256_map = GenericSSWU(F, A, B)
assert p256_map.Z == F(-10)

def map_to_curve_simple_swu_p256(u):
    Z = F(-10)
    c1 = B / F(3)
    c2 = (p - 3) // 4
    c3 = F(-Z^3).sqrt()

    t1 = u^2
    t3 = Z * t1
    t2 = t3^2
    xd = t2 + t3
    x1n = xd + 1
    x1n = x1n * B
    xd = xd * 3
    e1 = xd == 0
    xd = CMOV(xd, A * Z, e1)
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

def test_map_p256(u=None):
    if u is None:
        u = F.random_element()
    (xn, xd, yn, yd) = map_to_curve_simple_swu_p256(u)
    x = xn / xd
    y = yn / yd
    assert y^2 == x^3 + A * x + B
    (xp, yp, zp) = p256_map.map_to_curve(u)
    xp = xp / zp
    yp = yp / zp
    assert xp == x
    assert yp == y

def test_p256():
    for und in p256_map.undefs:
        test_map_p256(und)
    for _ in range(0, 1024):
        test_map_p256()

if __name__ == "__main__":
    test_p256()
