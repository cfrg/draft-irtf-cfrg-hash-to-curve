from hash_to_base import *
from utils import *
load("common.sage")

# P256
p = PrimeDict["P256"]
m = 1
q = p^m
F = GF(q)
A = F(-3)
B = F(41058363725152142129326129780047268409114441015993725554835256314039467401291)
E = EllipticCurve(F, [A, B])

h2c_suite = "H2C-P256-SHA512-SWU-"

# https://arxiv.org/pdf/0706.1448.pdf
# https://eprint.iacr.org/2009/340.pdf
# http://www.crypto-uni.lu/jscoron/cours/mics3crypto/swu.pdf

def g(x):
    return x^3 + A*x + B

def X1(u, v):
    return v

def X2(u, v):
    return (-B / A) * (1 + (1 / (u^4 * g(v)^2 + u^2 * g(v))))

def X3(u, v):
    return u^2 * g(v) * X2(u, v)

def U(u, v):
    return u^3 * g(v)^2 * g(X2(u, v))

# Reference Implementation
def swu(alpha):
    u = h2b_from_label(h2c_suite, alpha + i2osp(0,1))
    v = h2b_from_label(h2c_suite, alpha + i2osp(1,1))

    x1 = X1(u, v)
    x2 = X2(u, v)
    x3 = X3(u, v)
    assert U(u, v)^2 == (g(x1) * g(x2) * g(x3))

    if is_square(g(x1)):
        return E(x1, sq_root(g(x1),q))
    elif is_square(g(x2)):
        return E(x2, sq_root(g(x2),q))
    else:
        return E(x3, sq_root(g(x3),q))

# Constants
B_OVER_A =  - B / A
ORDER_OVER_2 = (q - 1)/2

# Constant Time Implementation
def swu_CT(alpha):
    u = h2b_from_label(h2c_suite, alpha + i2osp(0,1))
    x1 = h2b_from_label(h2c_suite, alpha + i2osp(1,1))
    tv("u", u, 32)
    tv("x1", x1, 32)

    gx1 = x1 ^ 2
    gx1 = gx1 + A
    gx1 = gx1 * x1
    gx1 = gx1 + B      # gx1 = x1^3 + A*x1 + B
    tv("gx1", gx1, 32)
    assert gx1 == g(x1)

    t1 = u^2
    t1 = t1 * gx1
    t2 = t1^2
    t2 = t2 + t1
    t2 = mult_inv(t2, q)
    x2 = t2 + 1
    x2 = x2 * B_OVER_A
    tv("x2", x2, 32)
    assert x2 == (-B / A) * (1 + 1 / (u^4 * g(x1)^2 + u^2 * g(x1)))

    gx2 = x2 ^ 2
    gx2 = gx2 + A
    gx2 = gx2 * x2
    gx2 = gx2 + B      # gx2 = x2^3 + A*x2 + B
    tv("gx2", gx2, 32)
    assert gx2 == g(x2)

    x3 = t1 * x2
    tv("x3", x3, 32)
    assert x3 == u^2 * g(x1) * x2

    gx3 = x3 ^ 2
    gx3 = gx3 + A
    gx3 = gx3 * x3
    gx3 = gx3 + B      # gx3 = x3^3 + A*x3 + B
    tv("gx3", gx3, 32)
    assert gx3 == g(x3)

    e1 = is_QR(gx1, q)
    e2 = is_QR(gx2, q)

    x = CMOV(x3, x2, e2)
    x = CMOV(x, x1, e1)
    gx = CMOV(gx3, gx2, e2)
    gx = CMOV(gx, gx1, e1)
    y = sq_root(gx, q)
    return E(x, y)

if __name__ == "__main__":
    enable_debug()
    print "## SWU to P-256"
    for alpha in map2curve_alphas:
        print "\n~~~"
        print("Input:")
        print("")
        tv_text("alpha", pprint_hex(alpha))
        print("")
        print("Intermediate values:")
        print("")
        pA, pB = swu(alpha), swu_CT(alpha)
        assert pA == pB
        print("")
        print("Output:")
        print("")
        tv("x", pB[0], 32)
        tv("y", pB[1], 32)
        print "~~~"
