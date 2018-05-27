# P256
# y^2 = x^3-3x+41058363725152142129326129780047268409114441015993725554835256314039467401291 
p = 2^256 - 2^224 + 2^192 + 2^96 - 1 # 115792089210356248762697446949407573530086143415290314195533631308867097853951
F = GF(p)
A = F(3)
B = F(41058363725152142129326129780047268409114441015993725554835256314039467401291)
E = EllipticCurve(F, [A, B])

# https://arxiv.org/pdf/0706.1448.pdf
# https://eprint.iacr.org/2009/340.pdf
# http://www.crypto-uni.lu/jscoron/cours/mics3crypto/swu.pdf

def g(x):
    return F(x^3 + A*x + B)

def x1(t, u):
    return u

def x2(t, u):
    return (-B / A) * (1 + (1 / (t^4 * g(u)^2 + t^2 * g(u))))

def x3(t, u):
    return t^2 * g(u) * x2(t, u)

def U(t, u):
    return t^3 * g(u)^2 * g(x2(t, u))

def swu(alpha):
    t = F(alpha)
    u = F(alpha + 1)
    x1v = x1(t, u)
    x2v = x2(t, u)
    x3v = x3(t, u)
    Utu = U(t, u)^2

    #print x1v, x2v, x3v
    #print g(x1v), g(x2v), g(x3v)
    
    assert is_square(Utu)
    assert Utu == (g(x1v) * g(x2v) * g(x3v))

    if is_square(g(x1v)):
        return E(x1v, sqrt(g(x1v)))
    elif is_square(g(x2v)):
        return E(x2v, sqrt(g(x2v))) 
    else:
        return E(x3v, sqrt(g(x3v)))

def swu_straight(alpha):
    t = F(alpha)
    u = F(alpha + 1)

    t2 = t^2
    t4 = t2^2
    gu = u^3
    gu = gu + (A * u)
    gu = gu + B

    x1 = u
    x2 = B * -1
    x2 = x2 / A
    gx1 = x1^3
    gx1 = gx1 + (A * x1)
    gx1 = gx1 + B

    d1 = gu^2
    d1 = d1 * t4
    d2 = t2 * gu
    d3 = d1 + d2
    d3 = d3^(-1)
    n1 = 1 + d3
    x2 = x2 * n1
    gx2 = x2^3
    gx2 = gx2 + (A * x2)
    gx2 = gx2 + B

    x3 = t2 * gu
    x3 = x3 * x2
    gx3 = x3^3
    gx3 = gx3 + (A * x3)
    gx3 = gx3 + B

    #print x1, x2, x3
    #print gx1, gx2, gx3

    l1 = gx1^((p - 1) / 2)
    if l1 == 1:
        return E(x1, sqrt(gx1))

    l2 = gx2^((p - 1) / 2)
    if l2 == 1:
        return E(x2, sqrt(gx2))

    return E(x3, sqrt(gx3))

inputs = [7, 13, 1<<7, 1<<8, 1<<64, 1<<64-1]
for t in inputs:
    assert swu(t) == swu_straight(t)
