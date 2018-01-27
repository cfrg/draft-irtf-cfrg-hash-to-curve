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

    r = F(alpha)

    # u is a fixed nonsquare value, eg -1 if p==3 mod 4.
    u = F(2) # F(2)
    assert(not u.is_square())
    
    # If f(-A/(1+ur^2)) is square, return its square root.
    # Else, return the square root of f(-Aur^2/(1+ur^2)).
    x = -A / (1 + (u * r^2))
    y = curve25519(x)
    if y.is_square(): # is this point square?
        y = y.square_root()
    else:
        x = (-A * u * r^2) / (1 + (u * r^2))
        y = curve25519(x).square_root()
    
    # return E(f_input, y) # raises an exception if the point is not on the curve
    return E(x, y)
    # return x

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

def elligator2_legendre_ct(alpha):
    r = F(alpha)

    r = r^2
    r = r * 2
    r = r + 1
    r = r^(-1)
    v = A * r
    v = v * -1 # d

    v2 = v^2
    v3 = v * v2
    e = v3 + v
    v2 = v2 * A
    e = v2 + e

    # Legendre symbol -- is it a point on the curve?
    e = e^((p - 1) / 2)

    nv = v * -1
    if e != 1:
        v = nv

    v2 = 0
    if e != 1:
        v2 = A
    
    u = v - v2
    
    return E(u, curve25519(u).square_root())

inputs = [1, 7, 13, 1<<7, 1<<8, 1<<64, 1<<64-1, p-1, p+1]
tts = [(alpha, elligator2(alpha), elligator2_legendre(alpha), elligator2_legendre_ct(alpha)) for alpha in inputs]

for pair in tts:
    assert pair[1] == pair[2] == pair[3]
    # print pair[0], pair[1], pair[2]