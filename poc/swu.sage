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
    u = F(alpha)
    x1v = x1(t, u)
    x2v = x2(t, u)
    x3v = x3(t, u)
    Utu = U(t, u)^2
    
    assert is_square(Utu)
    assert Utu == (g(x1v) * g(x2v) * g(x3v))

    if is_square(g(x1v)):
        return E(x1v, sqrt(g(x1v)))
    elif is_square(g(x2v)):
        return E(x2v, sqrt(g(x2v))) 
    else:
        return E(x3v, sqrt(g(x3v)))

inputs = [7, 13, 1<<7, 1<<8, 1<<64, 1<<64-1]
for t in inputs:
    print swu(t)
