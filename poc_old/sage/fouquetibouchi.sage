from hash_to_base import *
from utils import *
load("common.sage")

# BLS12381 curve
p = PrimeDict["BLS12_381_1"]
m = 1
q = p^m
F = GF(q)
A = F(0)
B = F(4)
E = EllipticCurve(F, [A,B])

assert q%12 == 7, "p not congruent to 7 mod 12"

h2c_suite = "H2C-BLS12_381_1-SHA512-FT-"

# Reference Implementation
def fouquetibouchi(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    S = sq_root(F(-3), q)

    t1 = (S * u) / (1 + B + u**2)
    x1 = ((-1 + S) / 2) - u * t1
    x2 = -1 - x1
    x3 = 1 + (1/t1**2)
    e = u^((q-1) / 2)
    if is_square(x1^3 + B):
        x = x1
        y = e * sq_root(x1^3+B,q)
    elif is_square(x2^3 + B):
        x = x2
        y = e * sq_root(x2^3+B,q)
    elif is_square(x3^3 + B):
        x = x3
        y = e * sq_root(x3^3+B,q)
    return E(x, y)

# Constants
SQRT_MINUS3    = sq_root(F(-3), q)
ONE_SQRT3_DIV2 = F((-1 + SQRT_MINUS3)/2)
ORDER_OVER_2   = ZZ((q - 1)/2)           # Integer arithmetic

# Constant Time Implementation
def fouquetibouchi_CT(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    tv("u ", u, 48)

    t1 = u^2
    t1 = t1 + B + 1
    t1 = mult_inv(t1, q)
    t1 = t1 * u
    t1 = t1 * SQRT_MINUS3
    assert t1 == F(sq_root(F(-3), q) * u / (u**2 + B + 1))
    tv("t1", t1, 48)

    x1 = u * t1
    x1 = ONE_SQRT3_DIV2 - x1
    assert x1 == F((-1 + sq_root(F(-3),q)) / 2 - sqrt(F(-3),q) * u**2 / (u**2 + B + 1))
    tv("x1", x1, 48)

    x2 = -1 - x1
    assert x2 == F(-1 - ((-1 + sqrt(F(-3),q)) / 2 - sqrt(F(-3),q) * u**2 / (u**2 + B + 1)))
    tv("x2", x2, 48)

    x3 = t1**2
    x3 = mult_inv(x3, q)
    x3 = x3 + 1
    assert x3 == F(1 + 1 / t1**2)
    tv("x3", x3, 48)

    e = u^ORDER_OVER_2
    assert e == legendre_symbol(u, q)
    tv("e", e, 48)

    gx1 = x1^3 + B
    gx2 = x2^3 + B
    gx3 = x3^3 + B
    e1 = is_QR(gx1, q)
    e2 = is_QR(gx2, q)

    x = CMOV(x3, x2, e2)
    x = CMOV(x, x1, e1)
    gx = CMOV(gx3, gx2, e2)
    gx = CMOV(gx, gx1, e1)
    y = e * sq_root(gx, q)
    return E(x, y)

if __name__ == "__main__":
    enable_debug()
    print "## Fouque-Tibouchi to BLS12-381 G1"
    for alpha in map2curve_alphas:
        print "\n~~~"
        print("Input:")
        print("")
        tv_text("alpha", pprint_hex(alpha))
        print("")
        print("Intermediate values:")
        print("")
        pA, pB = fouquetibouchi(alpha), fouquetibouchi_CT(alpha)
        assert pA == pB
        print("")
        print("Output:")
        print("")
        tv("x", pB[0], 48)
        tv("y", pB[1], 48)
        print "~~~"
