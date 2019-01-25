from hash_to_base import *
from utils import *

# P256
p = 115792089210356248762697446949407573530086143415290314195533631308867097853951
F = GF(p)
A = F(p - 3)
B = F(ZZ("5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b", 16))
E = EllipticCurve([A, B])
h2c_suite = "H2C-P256-SHA256-SSWU-"

def simple_swu_x(alpha):
    # t = F(alpha)
    t = h2b_from_label(h2c_suite, alpha)
    
    alpha = -(t^2)
    frac = (1 / (alpha^2 + alpha))
    x2 = (-B / A) * (1 + frac)
    
    x3 = alpha * x2
    
    return x2, x3

def simple_swu_h(alpha):
    # t = F(alpha)
    t = h2b_from_label(h2c_suite, alpha)
    
    alpha = -(t^2)
    frac = (1 / (alpha^2 + alpha))
    x2 = (-B / A) * (1 + frac)
    
    x3 = alpha * x2
    h2 = x2^3 + A * x2 + B
    h3 = x3^3 + A * x3 + B

    return h2, h3

# Section 7 of https://link.springer.com/content/pdf/10.1007/978-3-642-14623-7_13.pdf
def simple_swu(alpha, debug=True):
    # t = F(alpha)
    t = h2b_from_label(h2c_suite, alpha)
    tv("t = \n%s\n", t, 32)

    d1 = t^4 - t^2 
    tv("d1 = \n%s\n", d1, 32)  
    n1 = (1 / d1)
    tv("n1 = \n%s\n", n1, 32)

    x2 = (-B / A) * (1 + n1)
    tv("x2 = \n%s\n", x2, 32)
    
    x3 = -t^2 * x2
    tv("x3 = \n%s\n", x3, 32)
    h2 = x2^3 + A * x2 + B
    h3 = x3^3 + A * x3 + B

    if is_square(h2):
        return E(x2, h2^((p + 1) // 4))
    else:
        return E(x3, h3^((p + 1) // 4))

def simple_swu_straight(alpha, debug=True):
    orig = alpha
    t = h2b_from_label(h2c_suite, alpha)
    tv("t = \n%s\n", t, 32)
    alpha = t^2
    alpha = alpha * -1
    tv("alpha = \n%s\n", alpha, 32)
    
    right = alpha^2 + alpha
    right = right^(-1)
    right = right + 1
    tv("right = \n%s\n", right, 32)

    left = B * -1
    left = left / A
    tv("left = \n%s\n", left, 32)


    x2 = left * right
    tv("x2 = \n%s\n", x2, 32)
    x3 = alpha * x2
    tv("x3 = \n%s\n", x3, 32)

    tx2, tx3 = simple_swu_x(orig)
    assert tx2 == x2
    assert tx3 == x3

    h2 = x2 ^ 3
    i2 = x2 * A
    i2 = i2 + B
    h2 = h2 + i2
    tv("h2 = \n%s\n", h2, 32)

    h3 = x3 ^ 3
    i3 = x3 * A
    i3 = i3 + B
    h3 = h3 + i3
    tv("h3 = \n%s\n", h3, 32)

    th2, th3 = simple_swu_h(orig)
    assert h2 == th2
    assert h3 == th3

    y1 = h2^((p + 1) // 4)
    y2 = h3^((p + 1) // 4)

    # Is it square?
    e = y1^2 == h2

    x = x2
    if e != 1:
        x = x3
    
    y = y1
    if e != 1:
        y = y2

    tv("x = \n%s\n", x, 32)
    tv("y = \n%s\n", y, 32)

    return E(x, y)

def swu_jac_into_affine(alpha):
    # t = F(alpha)
    t = h2b_from_label(h2c_suite, alpha)

    alpha = t^2
    alpha = alpha * -1

    right = alpha^2 + alpha
    z = A * right

    X2 = - B * z * (right + 1)
    X3 = alpha * X2

    z2 = z^2
    z4 = z2^2
    z6 = z4 * z2

    Az4 = A * z4
    Bz6 = B * z6

    h2 = X2 ^ 3 + Az4 * X2 + Bz6
    h3 = X3 ^ 3 + Az4 * X3 + Bz6

    U = - alpha * t * h2
    T = h2 ^ (p - 1 - (p + 1)/4)

    Th2 = T * h2
    TU =  T  * U

    if (T * Th2 == 1):
        return E(X2/z^2, Th2/z^3)
    else:
        return E(X3/z^2, TU/z^3)

def swu_jac_into_projective(alpha):
    t = h2b_from_label(h2c_suite, alpha)
    # t = F(alpha)

    alpha = t^2
    alpha = alpha * -1

    right = alpha^2 + alpha
    z = A * right

    X2 = - B * z * (right + 1)
    X3 = alpha * X2

    z2 = z^2
    z4 = z2^2
    z6 = z4 * z2

    Az4 = A * z4
    Bz6 = B * z6

    h2 = X2 ^ 3 + Az4 * X2 + Bz6
    h3 = X3 ^ 3 + Az4 * X3 + Bz6

    U = - alpha * t * h2
    T = h2 ^ (p - 1 - (p + 1)/4)

    Th2 = T * h2
    TU =  T  * U

    if (T * Th2 == 1):
        return E(X2 * z, Th2, z ^ 3)
    else:
        return E(X3 * z, TU, z ^ 3)

if __name__ == "__main__":
    enable_debug()
    inputs = ["", "test", "\x00\x00\x00\x00\x00"]
    for t in inputs:
        print("Input: \n%s (\"%s\")\n" % (pprint_hex(t), t))
        pA, pB = simple_swu(t), simple_swu_straight(t)
        assert pA == pB
