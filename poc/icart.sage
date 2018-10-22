# P384
p = 39402006196394479212279040100143613805079739270465446667948293404245721771496870329047266088258938001861606973112319
F = GF(p)
A = p - 3
B = 0xb3312fa7e23ee7e4988e056be3f82d19181d9c6efe8141120314088f5013875ac656398d8a2ed19d2a85c8edd3ec2aef
q = 39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942643
E = EllipticCurve([F(A), F(B)])
g = E(0xaa87ca22be8b05378eb1c71ef320ad746e1d3b628ba79b9859f741e082542a385502f25dbf55296c3a545e3872760ab7, 0x3617de4a96262c6f5d9e98bf9292dc29f8f41dbd289a147ce9da3113b5f0b8c00a60b1ce1d7e819d7a431d7c90ea0e5f)
E.set_order(q)

def icart(u):
    if u == 0:
        return E(0)
    u = F(u)
    v = (3*A - u^4)//(6*u)
    x = (v^2 - B - u^6/27)^((2*p-1)//3) + u^2/3
    y = u*x + v
    return E(x, y) # raises expection if not on curve

ONE_THIRD = (2 * p - 1) // 3 # in ZZ
INV_27 = F(27) ^ -1 # in Fp

def icart_slp(u):
    u = F(u)
    u2 = u ^ 2
    u4 = u2 ^ 2
    assert u4 == u^4

    v = 3 * F(A) # over Fp
    v = v - u4
    t1 = 6 * u
    t1 = t1 ^ (-1)
    v = v * t1
    assert v == (3 * A - u^4) // (6 * u)

    x1 = v ^ 2
    x1 = x1 - B
    assert x1 == (v^2 - B)

    t1 = INV_27 * u4
    t1 = t1 * u2
    assert t1 == ((u^6) / 27)
    
    x1 = x1 - t1
    x1 = x1 ^ ONE_THIRD
    assert x1 == ((v^2 - B - u^6/27)^((2*p-1)//3))
    
    t1 = u2 / 3
    x = x1 + t1
    y = u * x
    y = y + v
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


inputs = [1, 7, 13, 1<<7, 1<<8, 1<<64, 1<<64-1, p-1, p+1]
tts = [(u, icart(u), icart_slp(u)) for u in inputs]

for pair in tts:
    assert pair[1] == pair[2]
