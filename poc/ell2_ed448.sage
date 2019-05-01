from hash_to_base import *
from utils import *
load("common.sage")

# Ed448
p = PrimeDict["Ed448"]
m = 1
q = p^m
F = GF(q)
Z = F(-1)
edw_a = F(1)
edw_d = F(-39081)
A = (edw_a + edw_d) / F(2)
BB = F(4) / (edw_a - edw_d)
B = (1 / BB) ** 2
E = EllipticCurve(F, [0, A, 0, B, 0])

assert not Z.is_square()

h2c_suite = "H2C-Ed448-SHA512-ELL2-"

# constant for converting sqrt(gx1) to sqrt(gx2)
c1 = Z ** ((q + 1) // 4)

def to_edwards(P):
    xx = BB * P[0]
    yy = BB * P[1]

    t1 = xx + 1
    t2 = yy * t1
    t2 = mult_inv(t2, q)

    x = t1 * t2
    x = x * xx

    y = xx - 1
    y = y * t2
    y = y * yy
    e = y == 0
    y = CMOV(y, 1, e)

    assert (t2 == 0 and x == 0) or x == xx / yy
    assert (t2 == 0 and y == 1) or y == (xx - 1) / (xx + 1)
    assert F(edw_a * x^2 + y^2) == F(1 + edw_d * x^2 * y^2)

    return (x, y)

# reference impl
def ellig448_help(u):
    t1 = F(1 + Z * u^2)
    if t1 == 0:
        x1 = -A
    else:
        x1 = -A / t1

    gx1 = x1 ** 3 + A * x1 ** 2 + B * x1

    x2 = -x1 - A
    gx2 = Z * u^2 * gx1
    assert gx2 == x2 ** 3 + A * x2 ** 2 + B * x2

    y = sq_root(gx1, q)
    if is_square(gx1):
        x = x1
        y = -y
    else:
        x = x2
        y = sgn0(u) * u * y * c1

    return E(x, y)

def map2curve_ellig2(alpha):
    u = F(h2b_from_label(h2c_suite, alpha))
    P = ellig448_help(u)
    return to_edwards(P)

# constant-time
def ellig448_CT_help(u):
    t1 = u^2
    t1 = Z * t1
    x1 = t1 + 1
    x1 = mult_inv(x1, q)
    e = x1 == 0
    x1 = CMOV(x1, 1, e)
    x1 = -A * x1
    tv(" x1", x1, 56)       # x1 = -A / (1 + Z * u^2)

    gx1 = x1 + A
    gx1 = gx1 * x1
    gx1 = gx1 + B
    gx1 = gx1 * x1
    tv("gx1", gx1, 56)      # x1^3 + A * x1^2 + B * x1

    x2 = -x1 - A
    tv(" x2", x2, 56)

    gx2 = t1 * gx1
    tv("gx2", gx2, 56)

    y1 = gx1 ** ((q + 1) // 4)
    e2 = sgn0(u) == -1
    y2 = y1 * u
    y2 = y2 * c1
    y2 = CMOV(y2, -y2, e2)
    y1 = -y1
    e3 = y1 ** 2 == gx1

    x = CMOV(x2, x1, e3)
    y = CMOV(y2, y1, e3)

    return E(x, y)

def map2curve_ellig2_CT(alpha):
    u = F(h2b_from_label(h2c_suite, alpha))
    P = ellig448_CT_help(u)
    return to_edwards(P)

if __name__ == "__main__":
    enable_debug()
    print "## Elligator2 to Ed448"
    for alpha in map2curve_alphas:
        print "\n~~~"
        print("Input:")
        print("")
        tv_text("alpha", pprint_hex(alpha))
        print("")
        print("Intermediate values:")
        print("")
        pA, pB = map2curve_ellig2(alpha), map2curve_ellig2_CT(alpha)
        assert pA == pB
        print("")
        print("Output:")
        print("")
        tv("x", pB[0], 56)
        tv("y", pB[1], 56)
        print "~~~"
