from hash_to_base import *
from utils import *

# P256
p = 115792089210356248762697446949407573530086143415290314195533631308867097853951
F = GF(p)
A = F(p - 3)
B = F(ZZ("5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b", 16))
E = EllipticCurve([A, B])
h2c_suite = "H2C-P256-SHA256-SSWU-"

def g(x):
    return F(x^3 + A*x + B)

def x1(u):
    return (-B / A) * (1 + (1 / (u^4-  u^2)))

def x2(u):
    return - u^2 * x1(u)

def U(u):
    return u^3 * g(x1(u))

# Section 7 of https://link.springer.com/content/pdf/10.1007/978-3-642-14623-7_13.pdf
def simple_swu(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    x1v = x1(u)
    x2v = x2(u)
    assert U(u)^2 == -g(x1v)*g(x2v)
    if is_square(g(x1v)):
        return E(x1v, sqrt(g(x1v)))
    else:
        return E(x2v, sqrt(g(x2v)))

A_INV = (A ^ -1)
B_OVER_A =  - B * A_INV
ORDER_OVER_2 = (p - 1)/2

def simple_swu_slp(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    tv("u", u, 32)

    u2 = u^2
    u2 = -u2
    u4 = u2^2
    t1 = u4 + u2
    t1 = t1^(-1)
    n1 = 1 + t1
    tv("n1", n1, 32)
    assert n1 == 1 + 1 / (u^4  - u^2)

    x1 = B_OVER_A * n1
    tv("x1", x1, 32)

    gx1 = x1 ^ 3 # gv = v^3
    t1 = A * x1
    gx1 = gx1 + t1
    gx1 = gx1 + B # gv = v^3 + Av + B = g(v)
    tv("gx1", gx1, 32)
    assert gx1 == g(x1) # g(v)

    x2 = u2 * x1 # = -u^2 * x1
    tv("x2", x2, 32)

    gx2 = x2^3
    t1 = A * x2
    gx2 = gx2 + t1
    gx2 = gx2 + B # gx2 = x2^3 + Ax2 + B = g(x2)
    tv("gx2", gx2, 32)
    assert gx2 == g(x2) # g(v)

    l1 = gx1^ORDER_OVER_2
    if l1 == 1:
        y1 = sqrt(gx1)
        tv("y1", y1, 32)
        return E(x1, y1)
    else:
        y2 = sqrt(gx2)
        tv("y2", y2, 32)
        return E(x2, y2)

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
        pA, pB = simple_swu(alpha), simple_swu_slp(alpha)
        print("")
        print("Output:")
        print("")
        tv("x", pB[0], 32)
        tv("y", pB[1], 32)
        assert pA == pB
        print "~~~"
