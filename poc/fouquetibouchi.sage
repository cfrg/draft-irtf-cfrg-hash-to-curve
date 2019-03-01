from hash_to_base import *
from utils import *

# BN curve
t = -(2**62 + 2**55 + 1)
pp = lambda x: 36*x**4 + 36*x**3 + 24*x**2 + 6*x + 1
p = pp(t)
assert is_prime(p)
assert p%3 == 1
F = GF(p)
A = F(0)
B = F(1)
E = EllipticCurve([A,B])
S = sqrt(F(-3))
assert is_square(1+B) == false

h2c_suite = "H2C-BN256-SHA512-FT-"

def f(x):
    return F(x**3 + A*x + B)

def fouquetibouchi(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    u = F(u)

    w = (S*u)/(1+B+u**2)
    x1 = (-1+S)/2-u*w
    x2 = -1-x1
    x3 = 1+1/w**2
    e = legendre_symbol(u,p)
    if is_square( f(x1) ) :
        return E( [ x1, e * sqrt(f(x1)) ])
    elif is_square( f(x2) ) :
        return E( [ x2, e * sqrt(f(x2)) ])
    else:
        return E( [ x3, e * sqrt(f(x3)) ])


SQRT_MINUS3 = sqrt(F(-3))              # Field arithmetic
ONE_SQRT3_DIV2 = F((-1+SQRT_MINUS3)/2) # Field arithmetic
ORDER_OVER_2 = ZZ((p - 1)/2)           # Integer arithmetic

def fouquetibouchi_slp(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    tv("u ", u, 32)

    u = F(u)
    t0 = u**2                 # u^2
    t0 = t0+B+1               # u^2+B+1
    t0 = 1/t0                 # 1/(u^2+B+1)
    t0 = t0*u                 # u/(u^2+B+1)
    t0 = t0*SQRT_MINUS3       # sqrt(-3)u/(u^2+B+1)
    assert t0 == F(sqrt(F(-3))*u/(u**2+B+1))
    tv("t0", t0, 32)

    x1 = ONE_SQRT3_DIV2-u*t0  # (-1+sqrt(-3))/2-sqrt(-3)u^2/(u^2+B+1)
    assert x1 == F((-1+sqrt(F(-3)))/2-sqrt(F(-3))*u**2/(u**2+B+1))
    tv("x1", x1, 32)

    x2 = -1-x1
    assert x2 == F(-1-((-1+sqrt(F(-3)))/2-sqrt(F(-3))*u**2/(u**2+B+1)))
    tv("x2", x2, 32)

    t1 = t0**2
    t1 = 1/t1
    x3 = t1+1
    assert x3 == F(1+1/t0**2)
    tv("x3", x3, 32)

    e = u^ORDER_OVER_2
    assert e == legendre_symbol(u,p)
    tv("e", e, 32)

    fx1 = x1^3+B
    assert fx1 == F(x1**3+B)
    tv("fx1", fx1, 32)

    s1 = fx1^ORDER_OVER_2
    if s1 == 1:
        y1 = e*sqrt(fx1)
        tv("y1", y1, 32)
        return E(x1, y1)

    fx2 = x2^3+B
    assert fx2 == F(x2**3+B)
    tv("fx2", fx2, 32)

    s2 = fx2^ORDER_OVER_2
    if s2 == 1:
        y2 = e*sqrt(fx2)
        tv("y2", y2, 32)
        return E(x2, y2)

    fx3 = x3^3+B
    assert fx3 == F(x3**3+B)
    tv("fx3", fx3, 32)

    y3 = e*sqrt(fx3)
    tv("y3", y3, 32)
    return E(x3, y3)


if __name__ == "__main__":
    enable_debug()
    print "## Fouque-Tibouchi to BN256"
    for alpha in map2curve_alphas:
        print "\n~~~"
        print("Input:")
        print("")
        tv_text("alpha", pprint_hex(alpha))
        print("")
        print("Intermediate values:")
        print("")
        pA, pB = fouquetibouchi(alpha), fouquetibouchi_slp(alpha)
        assert pA == pB
        print("")
        print("Output:")
        print("")
        tv("x", pB[0], 32)
        tv("y", pB[1], 32)
        print "~~~"
