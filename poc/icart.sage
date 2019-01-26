from hash_to_base import *
from utils import *

# P384
p = 2^384 - 2^128 - 2^96 + 2^32 - 1 
F = GF(p)
A = p - 3
B = 0xb3312fa7e23ee7e4988e056be3f82d19181d9c6efe8141120314088f5013875ac656398d8a2ed19d2a85c8edd3ec2aef
E = EllipticCurve([F(A), F(B)])

h2c_suite = "H2C-P384-SHA512-Icart-"

def icart(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    if u == 0:
        return E(0)
    u = F(u)
    v = (3*A - u^4)//(6*u)
    x = (v^2 - B - u^6/27)^((2*p-1)//3) + u^2/3
    y = u*x + v
    return E(x, y) # raises expection if not on curve

ONE_THIRD = (2 * p - 1) // 3 # in ZZ
INV_3 = F(3) ^ -1 # in Fp
INV_27 = F(27) ^ -1 # in Fp

def icart_slp(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    tv("u  = \n%s\n", u, 48)
    u = F(u)
    u2 = u ^ 2
    u4 = u2 ^ 2
    assert u4 == u^4
    tv("u4 = \n%s\n", u4, 48)

    v = 3 * F(A) # over Fp
    v = v - u4
    t1 = 6 * u
    t1 = t1 ^ (-1)
    v = v * t1
    assert v == (3 * A - u^4) // (6 * u)
    tv("v  = \n%s\n", v, 48)

    x1 = v ^ 2
    x1 = x1 - B
    assert x1 == (v^2 - B)
    tv("x1 = \n%s\n", x1, 48)

    u6 = INV_27 * u4
    u6 = u6 * u2
    assert u6 == ((u^6) / 27)
    tv("u6 = \n%s\n", u6, 48)
    
    x1 = x1 - u6
    x1 = x1 ^ ONE_THIRD
    assert x1 == ((v^2 - B - u^6/27)^((2*p-1)//3))
    tv("x1 = \n%s\n", x1, 48)
    
    t1 = u2  * INV_3
    x = x1 + t1
    y = u * x
    y = y + v
    tv("x  = \n%s\n", x, 48)
    tv("y  = \n%s\n", y, 48)

    assert x^3 + A*x + B == y^2
    return E(x, y)



def icart_jac_into_affine(t):
    t = F(t)
    v = 36 * (3* A * t^4 - 1)
    x = (v^2 - 46656 * B * t ^6 - 1728) ^ ((2*p-1)//3) + 12
    y = 6 * x + v
    z = 6 * t
    return E(x/z^2, y/z^3) # raises expection if not on curve

def icart_jac_into_projective(t):
    t = F(t)
    t2 = t ^ 2
    t3 = t2 * t
    t4 = t2 ^ 2
    t6 = t3 ^ 2
    v = 36 * (3* A * t4 - 1)
    x = (v^2 - 46656 * B * t6 - 1728) ^ ((2*p-1)//3) + 12
    y = 6 * x + v
    z = 6 * t
    z3 = 216 * t3
    return E(x * z, y, z3) # raises exception if not on curve



if __name__ == "__main__":
    # enable_debug()
    inputs = ["", "test", "\x00\x00\x00\x00\x00"]
    tts = [(u, icart(u), icart_slp(u)) for u in inputs]

    for pair in tts:
        assert pair[1] == pair[2], pair
    # icart_slp("testvector")
