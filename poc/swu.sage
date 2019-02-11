from hash_to_base import *

# P256
# y^2 = x^3-3x+41058363725152142129326129780047268409114441015993725554835256314039467401291
p = 2^256 - 2^224 + 2^192 + 2^96 - 1 # 115792089210356248762697446949407573530086143415290314195533631308867097853951
F = GF(p)
A = F(3)
B = F(41058363725152142129326129780047268409114441015993725554835256314039467401291)
E = EllipticCurve(F, [A, B])
h2c_suite = "H2C-P256-SHA512-SWU-"

# https://arxiv.org/pdf/0706.1448.pdf
# https://eprint.iacr.org/2009/340.pdf
# http://www.crypto-uni.lu/jscoron/cours/mics3crypto/swu.pdf

def g(x):
    return F(x^3 + A*x + B)

def x1(u, v):
    return v

def x2(u, v):
    return (-B / A) * (1 + (1 / (u^4 * g(v)^2 + u^2 * g(v))))

def x3(u, v):
    return u^2 * g(v) * x2(u, v)

def U(u, v):
    return u^3 * g(v)^2 * g(x2(u, v))

def swu(alpha):
    u = h2b_from_label("H2C-P256-SHA512-SWU-", alpha, 0)
    v = h2b_from_label("H2C-P256-SHA512-SWU-", alpha, 1)

    x1v = x1(u, v)
    x2v = x2(u, v)
    x3v = x3(u, v)
    assert U(u, v)^2 == (g(x1v) * g(x2v) * g(x3v))

    if is_square(g(x1v)):
        return E(x1v, sqrt(g(x1v)))
    elif is_square(g(x2v)):
        return E(x2v, sqrt(g(x2v)))
    else:
        return E(x3v, sqrt(g(x3v)))

A_INV = (A ^ -1)
B_OVER_A =  - B * A_INV
ORDER_OVER_2 = (p - 1)/2

def swu_slp(alpha):
    u = h2b_from_label(h2c_suite, alpha, 0)
    v = h2b_from_label(h2c_suite, alpha, 1)

    tv("u", u, 32)
    tv("v", v, 32)

    x1 = v
    tv("x1", x1, 32)
    gv = v ^ 3 # gv = v^3
    t1 = A * v
    gv = gv + t1
    gv = gv + B # gv = v^3 + Av + B = g(v)
    tv("gv", gv, 32)
    assert gv == g(v) # g(v)

    gx1 = gv # x = u, g(x) = g(u)
    tv("gx1", gx1, 32)

    u2 = u^2
    t1 = gv * u2
    t2 = t1^2
    t2 = t1 + t2
    t2 = t2^(-1)
    n1 = 1 + t2
    tv("n1", n1, 32)
    assert n1 == 1 + 1 / (u^4 * g(v)^2 + u^2 * g(v))

    x2 = B_OVER_A * n1
    tv("x2", x2, 32)

    gx2 = x2^3
    t2 = A * x2
    gx2 = gx2 + t2
    gx2 = gx2 + B # gx2 = x2^3 + Ax2 + B = g(x2)
    tv("gx2", gx2, 32)
    assert gx2 == g(x2) # g(v)


    x3 = x2 * t1 # x2 * u^2 g(v)
    tv("x3", x3, 32)

    gx3 = x3^3
    t2 = A * x3
    gx3 = gx3 + t2
    gx3 = gx3 + B # gx3 = x3^3 + Ax3 + B = g(x3)
    tv("gx3", gx3, 32)
    assert gx3 == g(x3)

    l1 = gx1^ORDER_OVER_2
    if l1 == 1:
        y1 = sqrt(gx1)
        tv("y1", y1, 32)
        return E(x1, y1)

    l2 = gx2^ORDER_OVER_2
    if l2 == 1:
        y2 = sqrt(gx2)
        tv("y2", y2, 32)
        return E(x2, y2)

    y3 = sqrt(gx3)
    tv("y3", y3, 32)
    return E(x3, y3)

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
        pA, pB = swu(alpha), swu_slp(alpha)
        assert pA == pB
        print("")
        print("Output:")
        print("")
        tv("x", pB[0], 32)
        tv("y", pB[1], 32)
        print "~~~"
