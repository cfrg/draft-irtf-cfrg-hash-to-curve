# Curve25519
p = 2**255 - 19
F = GF(p)
A = 486662
E = EllipticCurve(F, [0, A, 0, 1, 0])
D = F(-121665 / 121666) # From Ed25519 [https://ed25519.cr.yp.to/ed25519-20110926.pdf]

def curve25519(x):
    return x**3 + (486662 * x**2) + x

def elligator2(r):
    r = F(r)

    # u is a fixed nonsquare value, eg -1 if p==3 mod 4.
    u = F(2) 
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

def elligator2_straight(r):
    r = F(r)
    x = r^2
    L3 = x^2
    y = L3
    L4 = -y
    L4 = L4 + 1
    L2 = L4^2
    L7 = L2 * (D - 1)^2
    L8 = L3 * 4*(D + 1)^2
    y = L8 * L7
    L8 = L2 * 4*D*(D - 1)
    L7 = y - L8
    L6 = y * (-2 - 2 * D)
    L5 = L7 * L6
    L8 = L5 * L4
    L4 = L5 * L6
    L5 = L7 * L8
    L8 = L5 * L4
    L4 = L7 * L8
    L6 = F(1) / L4.sqrt()
    L4 = L5 * L6
    L5 = L6^2
    L6 = L8 * L5
    L8 = L7 * L6
    L6 = x
    x = x + 1
    L5 = L5 + 1
    x = L6 - L5
    L5 = L4 * x
    L4 = L3 + L3
    L3 = L4 + L2
    L3 = L3 - 2
    L2 = L3 * L8
    L3 = L2 * 2*(D + 1)*(D - 1)
    L2 = L3 + y
    y = L7 * L2
    y = y + (-L8)

    return E(x, y)

inputs = [1, 7, 13, 1<<7, 1<<8, 1<<64, 1<<64-1, p-1, p+1]
tts = [(u, elligator2(u), elligator2_straight(u)) for u in inputs]

for pair in tts:
    #assert pair[1] == pair[2]
    print pair