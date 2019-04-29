# vim: syntax=python
from hash_to_base import *
from utils import *
load("common.sage")

# SECP256k1 curve
p = PrimeDict["SECP256K1"]
m = 1
q = p^m
F = GF(q)
A = F(0)
B = F(7)
E = EllipticCurve(F, [A,B])
Z = F(1)

h2c_suite = "H2C-SECP256K1-SHA512-SVDW-"

# Curve equation: y^2 = g(x) = x^3 + B
def g(x):
    return F(x ** 3 + B)

# Reference Implementation
def svdw(alpha):
    u = h2b_from_label(h2c_suite, alpha)

    # handle exceptional case by computing inv0(u^2 * (u^2 + g(Z)))
    t1 = F(u^2 + g(Z))
    t2 = F(u^2 * t1)
    if t2 != 0:
        t2 = 1 / t2

    # compute x1, x2, x3
    t3 = u^4 * t2 * sqrt(F(-3 * Z^2))
    x1 = ((sqrt(-3 * Z^2) - Z) / 2) - t3
    x2 = t3 - ((sqrt(-3 * Z^2) + Z) / 2)
    x3 = Z - (t1^3 * t2 / F(3 * Z^2))

    # sign of resulting point is given by sign of u
    negate = sgn0(u)

    gx1 = g(x1)
    gx2 = g(x2)
    gx3 = g(x3)
    if gx1.is_square():
        x = x1
        y = negate * sq_root(gx1, q)

    elif gx2.is_square():
        x = x2
        y = negate * sq_root(gx2, q)

    elif gx3.is_square():
        x = x3
        y = negate * sq_root(gx3, q)

    else:
        raise ValueError("none of gx1, gx2, gx3 are square")

    return E(x, y)

# Constants
SQRT_M3_ZSQ = F(-3 * Z^2) ** ((p + 1) // 4)
CX1 = F(SQRT_M3_ZSQ - Z) / F(2)
CX2 = F(SQRT_M3_ZSQ + Z) / F(2)
INV_3_ZSQ = 1 / F(3 * Z^2)
G_Z = g(Z)
# Z is required to meet the following
assert g(CX1).is_square()

# Constant Time Implementation
def svdw_CT(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    tv("u ", u, 32)

    t1 = u^2
    t2 = t1 + G_Z
    t3 = t1 * t2
    t4 = mult_inv(t3, q)    # 1 / (u^2 * (u^2 + g(Z)))
    t3 = t1^2
    t3 = t3 * t4
    t3 = t3 * SQRT_M3_ZSQ   # u^2 * sqrt(-3 * Z^2) / (u^2 + g(Z))
    assert t3 == u^4 * t4 * F(-3 * Z^2) ** ((p + 1) // 4)
    tv("t3", t3, 32)

    x1 = CX1 - t3
    gx1 = x1^2
    gx1 = x1 * gx1
    gx1 = gx1 + B
    e1 = is_QR(gx1, q)
    tv("x1", x1, 32)
    assert x1 == (SQRT_M3_ZSQ - Z) / F(2) - F(u^2) * SQRT_M3_ZSQ / F(u^2 + g(Z))

    x2 = t3 - CX2
    gx2 = x2^2
    gx2 = x2 * gx2
    gx2 = gx2 + B
    e2 = is_QR(gx2, q)
    tv("x2", x2, 32)
    assert x2 == - (SQRT_M3_ZSQ + Z) / F(2) + F(u^2) * SQRT_M3_ZSQ / F(u^2 + g(Z))

    x3 = t2^2
    x3 = x3 * t2
    x3 = x3 * t4
    x3 = x3 * INV_3_ZSQ
    x3 = Z - x3
    gx3 = x3^2
    gx3 = x3 * gx3
    gx3 = gx3 + B
    tv("x3", x3, 32)
    e3 = e1 or e2
    assert x3 == Z - (F(u^2) + g(Z))^2 / F(3 * Z^2 * u^2)

    x = CMOV(x2, x1, e1)        # select x and gx based on e1, e2, e3
    x = CMOV(x3, x, e3)
    gx = CMOV(gx2, gx1, e1)
    gx = CMOV(gx3, gx, e3)

    y = gx ** ((p + 1) // 4)
    e4 = sgn0(u) == -1
    y = CMOV(y, -y, e4)

    return E(x, y)

if __name__ == "__main__":
    enable_debug()
    print "## Shallue-van de Woestijne to Secp256k1"
    for alpha in map2curve_alphas:
        print "\n~~~"
        print("Input:")
        print("")
        tv_text("alpha", pprint_hex(alpha))
        print("")
        print("Intermediate values:")
        print("")
        pA, pB = svdw(alpha), svdw_CT(alpha)
        assert pA == pB
        print("")
        print("Output:")
        print("")
        tv("x", pB[0], 32)
        tv("y", pB[1], 32)
        print "~~~"
