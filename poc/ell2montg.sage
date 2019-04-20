from hash_to_base import *
from utils import *
load("common.sage")

# Curve25519
p = PrimeDict["Curve25519"]
m = 1
q = p^m
F = GF(q)
QUAD_NON_RES = F(2)
a1, a2, a3, a4, a6 = F(0), F(486662), F(0), F(1), F(0)
A = a2
B = a4
E = EllipticCurve(F, [a1, a2, a3, a4, a6])

assert(not QUAD_NON_RES.is_square())

h2c_suite = "H2C-Curve25519-SHA512-ELL2-"

# Reference Implementation
def elligator2(alpha):
    u = h2b_from_label(h2c_suite, alpha)

    x1 = -A / (1 + (QUAD_NON_RES * u^2))
    gx1 = x1^3 + A * x1^2 + B * x1
    x2 = -x1 - A
    gx2 = x2^3 + A * x2^2 + B * x2
    e = gx1^((q-1) / 2)
    if is_square(gx1):
        x = x1
        y = -e * sq_root(gx1, q)
    else:
        x = x2
        y = -e * sq_root(gx2, q)
    return E(x, y)

# Constants
c1 = QUAD_NON_RES
c2 = ZZ( (q-1)/2 )         #Integer Arithmetic

# Constant Time Implementation
def elligator2_CT(alpha):
    u = h2b_from_label(h2c_suite, alpha)

    x1 = u^2
    x1 = c1 * x1
    x1 = x1 + 1
    x1 = mult_inv(x1, q)
    x1 = x1 * A
    x1 = -x1
    tv("x1", x1, 32)

    gx1 = x1 + A
    gx1 = gx1 * x1
    gx1 = gx1 + B
    gx1 = gx1 * x1
    tv("gx1", gx1, 32)

    x2 = -x1 - A
    tv("x2", x2, 32)

    gx2 = x2 + A
    gx2 = gx2 * x2
    gx2 = gx2 + B
    gx2 = gx2 * x2
    tv("gx2", gx2, 32)

    e = is_QR(gx1, q)
    x = CMOV(x2, x1, e)
    gx = CMOV(gx2, gx1, e)
    y2 = sq_root(gx, q)
    y1 = -y2
    y = CMOV(y2, y1, e)

    return E(x, y)

if __name__ == "__main__":
    enable_debug()
    print "## Elligator2 to Curve25519"
    for alpha in map2curve_alphas:
        print "\n~~~"
        print("Input:")
        print("")
        tv_text("alpha", pprint_hex(alpha))
        print("")
        print("Intermediate values:")
        print("")
        pA, pB = elligator2(alpha), elligator2_CT(alpha)
        assert pA == pB
        print("")
        print("Output:")
        print("")
        tv("x", pB[0], 32)
        tv("y", pB[1], 32)
        print "~~~"
