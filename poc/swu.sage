# P256
# y^2 = x^3-3x+41058363725152142129326129780047268409114441015993725554835256314039467401291 
p = 2^256 - 2^224 + 2^192 + 2^96 - 1 # 115792089210356248762697446949407573530086143415290314195533631308867097853951
F = GF(p)
A = F(3)
B = F(41058363725152142129326129780047268409114441015993725554835256314039467401291)
E = EllipticCurve([A, B])

# https://arxiv.org/pdf/0706.1448.pdf
# https://eprint.iacr.org/2009/340.pdf
# http://www.crypto-uni.lu/jscoron/cours/mics3crypto/swu.pdf

def g(x):
    return x^3 + A*x + B

def swu(alpha):
    t = F(alpha)
    alpha = -(t^2)
    frac = (1 / (alpha^2 + alpha))
    x2 = (-B / A) * (1 + frac)
    x3 = alpha * x2

    y2 = -1 * g(x2) * g(x3)
    assert is_square(y2)

    y = y2.square_root()

    print t, y, y2
    print E(t, y)

    return (t, y)

def swu_straight(alpha):
    orig = alpha
    t = F(alpha)

    alpha = t^2
    alpha = alpha * -1
    
    right = alpha^2 + alpha
    right = right^(-1)
    right = right + 1

    left = B * -1
    left = left / A

    x2 = left * right
    x3 = alpha * x2

    y2 = -g(x2) * g(x3)
    assert y2.is_square()

    y = y2.square_root()

    return (t, y)

inputs = [7, 13, 1<<7, 1<<8, 1<<64, 1<<64-1]
for t in inputs:
    pA, pB = swu(t), swu_straight(t)
    assert pA == pB
