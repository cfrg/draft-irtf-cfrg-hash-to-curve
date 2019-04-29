from hash_to_base import *
from utils import *
load("common.sage")

# P256
p = PrimeDict["P256"]
m = 1
q = p^m
F = GF(q)
A = F(-3)
B = F(0x5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b)
E = EllipticCurve(F, [A, B])
Z = F(-2) # smallest in abs val s.t. Z is nonsquare and g(B / (Z * A)) is square
assert not Z.is_square()

h2c_suite = "H2C-P256-SHA256-SSWU-"

# Section 7 of https://link.springer.com/content/pdf/10.1007/978-3-642-14623-7_13.pdf
# Optimizations described in https://eprint.iacr.org/2019/403

def g(x):
    return x^3 + A*x + B

assert g(B / (Z * A)).is_square()

def X1(u):
    den = mult_inv(Z^2 * u^4 + Z * u^2, q)
    if den == 0:
        return B / (Z * A)
    return (-B / A) * (1 + den)

def X2(u):
    return Z * u^2 * X1(u)

def U(u):
    return u^3 * g(X1(u))

# Reference implementation
def simple_swu(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    x1 = X1(u)
    x2 = X2(u)
    assert mult_inv(Z^2 * u^4 + Z * u^2, q) == 0 or U(u)^2 * Z^3 == g(x1)*g(x2)
    t1 = sq_root(g(x1), q)
    if t1^2 == g(x1):
        # g(x1) is square
        return E(x1, sgn0(u) * t1)
    else:
        # if g(x1) is not square, then sqrt(g(x2)) == u^3 * t1
        return E(x2, u^3 * t1)

# Constants
MB_OVER_A = - B / A
M1_OVER_Z = - 1 / Z

# Constant Time Implementation
def simple_swu_CT(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    tv("u", u, 32)

    t1 = Z * u^2
    t2 = t1^2
    x1 = t2 + t1
    x1 = mult_inv(x1, q)
    e1 = x1 == 0
    x1 = x1 + 1
    x1 = CMOV(x1, M1_OVER_Z, e1)
    x1 = x1 * MB_OVER_A
    assert (e1 and x1 == (B / (Z * A))) or x1 == (-B/A) * (1 + 1 / (Z^2 * u^4 + Z * u^2))
    tv("x1", x1, 32)

    gx1 = x1 ^ 2
    gx1 = gx1 + A
    gx1 = gx1 * x1
    gx1 = gx1 + B      # gx1 = x1^3 + A*x1 + B
    assert gx1 == g(x1)
    tv("gx1", gx1, 32)

    x2 = t1 * x1       # x2 = Z * u^2 * x1
    assert x2 == Z * u^2 * x1
    tv("x2", x2, 32)

    t3 = pow(gx1, (p+1)//4, p)
    t4 = t3 * u^3               # if gx2 is square, this is the sqrt
    e2 = sgn0(u) == -1
    t3 = CMOV(t3, -t3, e2)      # if gx1 is square, this is the sqrt

    e3 = t3^2 == gx1
    x = CMOV(x2, x1, e3)
    y = CMOV(t4, t3, e3)
    return E(x, y)

if __name__ == "__main__":
    enable_debug()
    print "## Simple SWU to P-256"
    for alpha in map2curve_alphas:
        print "\n~~~"
        print("Input:")
        print("")
        tv_text("alpha", pprint_hex(alpha))
        print("")
        print("Intermediate values:")
        print("")
        pA, pB = simple_swu(alpha), simple_swu_CT(alpha)
        print("")
        print("Output:")
        print("")
        tv("x", pB[0], 32)
        tv("y", pB[1], 32)
        assert pA == pB
        print "~~~"
