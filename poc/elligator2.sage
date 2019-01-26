## Elligator2: https://eprint.iacr.org/2013/325

from hash_to_base import *
from utils import *

# Curve25519
p = 2**255 - 19
F = GF(p)
A = 486662
B = 1

N = F(2)
assert(not N.is_square())

# Curve448
# p = 2^448 - 2^224 - 1
# F = GF(p)
# A = 156326

E = EllipticCurve(F, [0, A, 0, 1, 0])

def g(x):
    return x^3 + A * x^2 + B*x

def elligator2(alpha):
    u = h2b_from_label("H2C-Curve25519-SHA512-Elligator2-Clear", alpha)

    # If f(-A/(1+ur^2)) is square, return its square root.
    # Else, return the square root of f(-Aur^2/(1+ur^2)).
    v = -A / (1 + (N * u^2))
    e = legendre_symbol(g(v), p)
    assert e == legendre_ct(g(v))

    if u == 0:
        E(0)
    else:
        x = e*v - (1 - e) * F(A) / 2
        tv("x = \n%s\n", x, 32)
        y = -e * sqrt(g(x))
        tv("y = \n%s\n", y, 32)
        return E(x, y)

def legendre_ct(x):
    return x^((p - 1) / 2)

# def curve25519_straight(x):
#     t = x + A # x + A
#     t = t * x # x^2 + Ax
#     t = t + B # x^2 + Ax + B
#     t = t * x # x^3 + Ax^2 + Bx
#     return t

A_OVER_2 = F(A / 2)
ORDER_OVER_2 = (p - 1)/2

def elligator2_straight(alpha):
    u = h2b_from_label("H2C-Curve25519-SHA512-Elligator2-Clear", alpha)

    t1 = u^2
    t1 = N * t1
    t1 = 1 + t1
    t1 = t1^(-1)
    v = A * t1
    v = -v
    tv("v = \n%s\n", v, 32)
    assert v == -A / (1 + N*u^2)

    gv = v + A
    gv = gv * v
    gv = gv + B
    gv =  gv * v # gv = v^3 + Av^2 + Bv
    tv("gv = \n%s\n", gv, 32)
    assert gv == g(v)

    e = gv^ORDER_OVER_2
    x = e*v
    ne = -e
    t1 = 1 + ne
    t1 = t1 * A_OVER_2
    x = x - t1 # x = ev - (1 - e)*A/2
    tv("x = \n%s\n", x, 32)
    assert x == legendre_symbol(gv, p)*v - (1 - legendre_symbol(gv, p)) * A_OVER_2

    y = x + A # x + A
    y = y * x # x^2 + Ax
    y = y + B # x^2 + Ax + B
    y = y * x # x^3 + Ax^2 + Bx
    y = sqrt(y)
    y = y * ne # y = -e * sqrt(x^3 + Ax^2 + Bx)

    tv("y = \n%s\n", y, 32)
    assert y == - legendre_symbol(gv, p) * sqrt(g(x))

    if u == 0:
        return E(0)
    else:
        return E(x, y)

if __name__ == "__main__":
    # enable_debug()
    inputs = ["", "test", "\x00\x00\x00\x00\x00"]
    tts = [(alpha, elligator2(alpha), elligator2_straight(alpha)) for alpha in inputs]

    for pair in tts:
        assert pair[1] == pair[2], pair
