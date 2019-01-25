from hash_to_base import *
from utils import *

# Curve25519
p = 2**255 - 19
F = GF(p)
A = 486662
B = 1

# Curve448
# p = 2^448 - 2^224 - 1
# F = GF(p)
# A = 156326

E = EllipticCurve(F, [0, A, 0, 1, 0])

def curve25519(x):
    # x(x^2 + Ax + B)
    return x^3 + (A * x^2) + x


def elligator2(alpha):
    r = h2b_from_label("H2C-Curve25519-SHA512-Elligator2-Clear", alpha)

    # u is a fixed nonsquare value, eg -1 if p==3 mod 4.
    u = F(2) # F(2)
    assert(not u.is_square())
    
    # If f(-A/(1+ur^2)) is square, return its square root.
    # Else, return the square root of f(-Aur^2/(1+ur^2)).
    v = -A / (1 + (u * r^2))
    e = legendre_symbol(curve25519(v))
    if r == 0:
        E(0)
    else:
        x = e*v - (1 - e) * A / 2
        y = -e * sqrt(curve25519(x))
        return E(x, y)

def legendre_ct(x):
    return x^((p - 1) / 2)

def curve25519_straight(x):
    t = x + A # x + A
    t = t * x # x^2 + Ax
    t = t + B # x^2 + Ax + B
    t = t * x # x^3 + Ax^2 + Bx
    return t

def elligator2_straight(alpha):
    r = h2b_from_label("H2C-Curve25519-SHA512-Elligator2-Clear", alpha)

    u = F(2) # F(2)
    assert(not u.is_square())

    t1 = r^2
    t1 = u * r^2

    t2 = t1^(-1)
    v = -A * t2
    fv = curve25519_straight(v)
    e = legendre_ct(fv)
    

    y = x + A # x + A
    y = x * y # x^2 + Ax
    y = y + B # x^2 + Ax + B
    y = x * y # x^3 + Ax^2 + Bx
    e = e^((p - 1) / 2)


def elligator2_legendre(alpha):
    r = F(alpha)

    u = F(2) # for 25519, u is nonsquare, which is required for the field
    d = -A / (1 + u * r^2) # 2 == u
    e = (d^3 + A * d^2 + d)

    # Compute the Legendre symbol
    # 1 if (e) is a quadratic residue mod p and e != 0, -1 if quadratic non-residue, 0 otherwise
    e = e^((p - 1) / 2)

    # Do a conditional move here
    u = d
    if e != 1:
        u = u * -1

    v = 0
    if e != 1:
        v = F(A)
    
    u = u - v

    return E(u, curve25519(u).square_root())

inputs = ["", "test", "\x00\x00\x00\x00\x00"]
tts = [(alpha, elligator2(alpha), elligator2_legendre(alpha), elligator2_legendre_ct(alpha)) for alpha in inputs]

for pair in tts:
    assert pair[1] == pair[2] == pair[3]
    # print pair[0], pair[1], pair[2]