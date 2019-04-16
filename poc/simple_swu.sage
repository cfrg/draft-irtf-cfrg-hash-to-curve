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

h2c_suite = "H2C-P256-SHA256-SSWU-"

# Section 7 of https://link.springer.com/content/pdf/10.1007/978-3-642-14623-7_13.pdf

def g(x):
    return x^3 + A*x + B

def X1(u):
    return (-B / A) * (1 + mult_inv(u^4 - u^2,q))

def X2(u):
    return - u^2 * X1(u)

def U(u):
    return u^3 * g(X1(u))

# Reference implementation
def simple_swu(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    x1 = X1(u)
    x2 = X2(u)
    assert U(u)^2 == -g(x1)*g(x2)
    if is_square(g(x1)):
        return E(x1, sq_root(g(x1),q))
    else:
        return E(x2, sq_root(g(x2),q))

# Constants
B_OVER_A = - B / A

# Constant Time Implementation
def simple_swu_CT(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    tv("u", u, 32)

    t1 = -u^2
    t2 = t1^2
    x1 = t2 + t1
    x1 = mult_inv(x1, q)
    x1 = x1 + 1
    x1 = x1 * B_OVER_A
    assert x1 == (-B/A) * (1 + 1 / (u^4  - u^2))
    tv("x1", x1, 32)

    gx1 = x1 ^ 2
    gx1 = gx1 + A
    gx1 = gx1 * x1
    gx1 = gx1 + B      # gx1 = x1^3 + A*x1 + B
    assert gx1 == g(x1)
    tv("gx1", gx1, 32)

    x2 = t1 * x1       # x2 = -u^2 * x1
    assert x2 == -u^2 * x1
    tv("x2", x2, 32)

    gx2 = x2 ^ 2
    gx2 = gx2 + A
    gx2 = gx2 * x2
    gx2 = gx2 + B      # gx2 = x2^3 + A*x2 + B
    tv("gx1", gx2, 32)
    assert gx2 == g(x2)

    e = is_QR(gx1, q)
    x = CMOV(x2, x1, e)
    gx = CMOV(gx2, gx1, e)
    y = sq_root(gx, q)
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
