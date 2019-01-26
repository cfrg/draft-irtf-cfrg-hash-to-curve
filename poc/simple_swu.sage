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

def simple_swu_straight(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    tv("u = \n%s\n", u, 32)

    u2 = u^2
    u2 = -u2
    u4 = u2^2
    t1 = u4 + u2
    t1 = t1^(-1)
    n1 = 1 + t1
    tv("n1 = \n%s\n", n1, 32)
    assert n1 == 1 + 1 / (u^4  - u^2)

    x1 = B_OVER_A * n1
    tv("x1 = \n%s\n", x1, 32)

    gx1 = x1 ^ 3 # gv = v^3
    t1 = A * x1
    gx1 = gx1 + t1
    gx1 = gx1 + B # gv = v^3 + Av + B = g(v)
    tv("gx1 = \n%s\n", gx1, 32)
    assert gx1 == g(x1) # g(v)

    x2 = u2 * x1 # = -u^2 * x1
    tv("x2 = \n%s\n", x2, 32)

    gx2 = x2^3
    t1 = A * x2
    gx2 = gx2 + t1
    gx2 = gx2 + B # gx2 = x2^3 + Ax2 + B = g(x2)
    tv("gx2 = \n%s\n", gx2, 32)
    assert gx2 == g(x2) # g(v)

    l1 = gx1^ORDER_OVER_2
    if l1 == 1:
        y1 = sqrt(gx1)
        tv("y1 = \n%s\n", y1, 32)
        return E(x1, y1)
    else:
        y2 = sqrt(gx2)
        tv("y2 = \n%s\n", y2, 32)
        return E(x2, y2)

# def swu_jac_into_affine(alpha):
#     # t = F(alpha)
#     t = h2b_from_label(h2c_suite, alpha)

#     alpha = t^2
#     alpha = alpha * -1

#     right = alpha^2 + alpha
#     z = A * right

#     X2 = - B * z * (right + 1)
#     X3 = alpha * X2

#     z2 = z^2
#     z4 = z2^2
#     z6 = z4 * z2

#     Az4 = A * z4
#     Bz6 = B * z6

#     h2 = X2 ^ 3 + Az4 * X2 + Bz6
#     h3 = X3 ^ 3 + Az4 * X3 + Bz6

#     U = - alpha * t * h2
#     T = h2 ^ (p - 1 - (p + 1)/4)

#     Th2 = T * h2
#     TU =  T  * U

#     if (T * Th2 == 1):
#         return E(X2/z^2, Th2/z^3)
#     else:
#         return E(X3/z^2, TU/z^3)

# def swu_jac_into_projective(alpha):
#     t = h2b_from_label(h2c_suite, alpha)
#     # t = F(alpha)

#     alpha = t^2
#     alpha = alpha * -1

#     right = alpha^2 + alpha
#     z = A * right

#     X2 = - B * z * (right + 1)
#     X3 = alpha * X2

#     z2 = z^2
#     z4 = z2^2
#     z6 = z4 * z2

#     Az4 = A * z4
#     Bz6 = B * z6

#     h2 = X2 ^ 3 + Az4 * X2 + Bz6
#     h3 = X3 ^ 3 + Az4 * X3 + Bz6

#     U = - alpha * t * h2
#     T = h2 ^ (p - 1 - (p + 1)/4)

#     Th2 = T * h2
#     TU =  T  * U

#     if (T * Th2 == 1):
#         return E(X2 * z, Th2, z ^ 3)
#     else:
#         return E(X3 * z, TU, z ^ 3)

if __name__ == "__main__":
    # enable_debug()
    inputs = ["", "test", "\x00\x00\x00\x00\x00"]
    for t in inputs:
        # print("Input: \n%s (\"%s\")\n" % (pprint_hex(t), t))
        pA, pB = simple_swu(t), simple_swu_straight(t)
        assert pA == pB
