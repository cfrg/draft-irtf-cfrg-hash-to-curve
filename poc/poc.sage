from sage.all import *

# P-256
p = 115792089210356248762697446949407573530086143415290314195533631308867097853951
Fp = GF(p)
a = -3
b = 41058363725152142129326129780047268409114441015993725554835256314039467401291
E = EllipticCurve(Fp, [a, b])
n = E.order()
assert is_prime(n)

# TODO(caw): write me

# P-384

# P384
# https://github.com/yahoo/coname/commit/c91ef2610df97fe1da05f741e676f514d0724a35

def icart(u):
    p = 39402006196394479212279040100143613805079739270465446667948293404245721771496870329047266088258938001861606973112319
    F = GF(p)
    A = p - 3
    B = 0xb3312fa7e23ee7e4988e056be3f82d19181d9c6efe8141120314088f5013875ac656398d8a2ed19d2a85c8edd3ec2aef
    q = 39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942643
    E = EllipticCurve([F(A), F(B)])
    g = E(0xaa87ca22be8b05378eb1c71ef320ad746e1d3b628ba79b9859f741e082542a385502f25dbf55296c3a545e3872760ab7, 0x3617de4a96262c6f5d9e98bf9292dc29f8f41dbd289a147ce9da3113b5f0b8c00a60b1ce1d7e819d7a431d7c90ea0e5f)
    E.set_order(q)

    u = F(u)
    v = (3*A - u**4) / (6*u)
    x = (v**2 - B - ((u**6)/27)) ** ((2*p-1) / 3) + u**(2/3)
    y = u*x + v
    return E(x, y)

inputs = [1, 7, 13, 1<<7, 1<<8, 1<<64, 1<<64-1, p-1, p+1]
tts = [(u, icart(u)) for u in inputs]

print tts

# Curve25519 
# y^2 = x^3+486662x^2+x 
# modulo p = 2^255 - 19 
p = 2**255 - 19
Fp = GF(p)
A = 486662
E = EllipticCurve(Fp, [0, A, 0, 1, 0])
alpha = Fp.random_element()

def curve25519(x):
	return x**3 + (486662 * x**2) + x

# Compute whether f(-A/(1+ur^2)) is square.  If so, compute its square root.
# If not, compute the square root of f(-Aur^2/(1+ur^2)) = ur^2 * f(-A/(1+ur^2)).
# if curve25519_f().is_square

# The other important optimization is to compute both square roots in one 
# step.  For example, if p == 3 mod 4, then u=-1 and x^((p+1)/4) = 
# sqrt(+-x).  So compute f(...)^((p+1)/4).  If it comes out as 
# sqrt(f(...)), good.  If not, it's sqrt(-f(...)) but you want 
# sqrt(-r^2f(...)).  So multiply it by r and you're good.  In 5-mod-8 
# world, sqrt(-1) takes the place of -1 here.
def elligator2(Fp, E, A, alpha):
    # Map alpha to an element of Fp
    # TODO(caw): short circuit
    r = Fp.random_element()

    # u is a fixed nonsquare value, eg -1 if p==3 mod 4.
    u = Fp(2) 
    assert(not u.is_square())
    
    # If f(-A/(1+ur^2)) is square, return its square root.
    # Else, return the square root of f(-Aur^2/(1+ur^2)).
    f_input = -A / (1 + (u * r**2))
    y = curve25519(f_input)
    if y.is_square(): # is this point square?
        y = y.square_root()
    else:
        f_input = (-A * u * r**2) / (1 + (u * r**2))
        y = curve25519(f_input).square_root()
    return E(f_input, y) # raises an exception if the point is not on the curve

for i in range(1000):
    print elligator2(Fp, E, A, None)

def elligator2_fast(Fp, E, A, alpha):
    # Port goldilocks variant
    pass
