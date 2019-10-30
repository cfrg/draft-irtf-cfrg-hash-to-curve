#!/usr/bin/sage
# vim: syntax=python

bnPrime = lambda x : 36*x**4 + 36*x**3 + 24*x**2 + 6*x + 1
blsPrime = lambda x : (x-1)**2*(x**4-x**2+1)//3 + x
# List of primes
PrimeDict = {
    # SS-132 from rfc5091
    "SS132": 2**132-2**130-2**21-2**20-13,
    # Curve25519
    "Curve25519": 2**255-19,
    "Ed25519": 2**255-19,
    # NIST P-256
    "P256": 2**256-2**224+2**192+2**96-1,
    # NIST P-384
    "P384": 2**384-2**128-2**96+2**32-1,
    # Curve448
    "Curve448": 2**448-2**224-1,
    "Ed448": 2**448-2**224-1,
    # SECP256K1
    "SECP256K1": 2**256 - 2**32 - 2**9 - 2**8 - 2**7 - 2**6 - 2**4 - 1,
    # SIKE-P503
    "SIKEP503": 2**250*3**159-1,
    # NIST P-521
    "P521": 2**521-1,
    # BN254 by Pereira, Simplicio, Naehrig, Barreto
    "BN254": bnPrime(-(2**62 + 2**55 + 1)),
    # BN256 by Naehrig, Niederhagen, Schwabe
    "BN256": bnPrime(6518589491078791937),
    # Old SNARKs and zCash prime (BN254)
    "zCASH": 21888242871839275222246405745257275088696311157297823662689037894645226208583,
    # New zCash prime 381 is slight below the new 384 bits for 128-bit security
    "BLS12_381_1": blsPrime(-0xd201000000010000),
    "BLS12_381_2": blsPrime(-0xd201000000010000),
    # Scott ia.cr/2019/077 (new 128-bit security)
    "BLS12_384": blsPrime(0x10008000001001200),
    # Barreto curve y = x^3+2
    "BN382": bnPrime(-(2^94 + 2^78 + 2^67 + 2^64 + 2^48 + 1)),
}

def CMOV(x, y, b):
    """
    Returns x if b=False; otherwise returns y
    """
    return int(not(bool(b)))*x + int(bool(b))*y

def sgn0(x):
    """
    Returns -1 if x is 'negative', else 1.
    """
    p = x.base_ring().order()
    threshold = ZZ((p-1) // 2)
    if x.parent().degree() == 1:
        # not a field extension
        xi_values = (x,)
    else:
        # field extension
        xi_values = x._vector_()
    sign = 0
    # compute the sign in constant time
    for xi in reversed(xi_values):
        zz_xi = ZZ(xi)
        # sign of this digit
        sign_i = CMOV(1, -1, zz_xi > threshold)
        sign_i = CMOV(sign_i, 0, zz_xi == 0)
        # set sign to this digit's sign if sign == 0
        sign = CMOV(sign, sign_i, sign == 0)
    return CMOV(sign, 1, sign == 0)

def is_QR(x, p):
    """
    Returns True if x is a quadratic residue; otherwise returns False
    """
    z = pow(int(x), (p-1)//2, p)
    is_qr = z != (p - 1)
    assert is_qr == GF(p)(x).is_square()
    return is_qr

def mult_inv(x, p):
    """
    Returns the inverse of x modulo p. If x is zero, returns 0.
    """
    return pow(int(x), p-2, p)

def absolute(x, _):
    """
    Returns |x|=x if x is positive, else -x
    """
    return CMOV(x, -x, sgn0(x) == -1)

sqrt_cache = {}
def sq_root(x, p):
    """
    Returns the principal square root defined through fixed formulas.
    (non-constant-time)
    """
    if p % 16 == 1:
        tonelli_shanks_ct(x, p)

    F = GF(p)
    if p % 4 == 3:
        if sqrt_cache.get(p) is None:
            sqrt_cache[p] = (F(1),)
        z = x ** ((p + 1) // 4)

    if p % 8 == 5:
        if sqrt_cache.get(p) is None:
            sqrt_cache[p] = (F(1), F(-1).sqrt())
        z = x ** ((p + 3) // 8)

    elif p % 16 == 9:
        if sqrt_cache.get(p) is None:
            sqrt_m1 = F(-1).sqrt()
            sqrt_cache[p] = (F(1), sqrt_m1, sqrt_m1.sqrt(), -sqrt_m1.sqrt())
        z = x ** ((p + 7) // 16)

    for mul in sqrt_cache[p]:
        sqrt_cand = z * mul
        if sqrt_cand ** 2 == x:
            return sqrt_cand

    return None

# constant-time Tonelli-Shanks
# Adapted from https://github.com/zkcrypto/jubjub/blob/master/src/fq.rs by Michael Scott.
# See also Cohen, "A Course in Computational # Algebraic Number Theory," Algorithm 1.5.1.
def tonelli_shanks_ct(x, p):
    F = GF(p)
    x = F(x)
    if sqrt_cache.get(p) is None:
        ts_precompute(p, F)

    (q, m, z, c) = sqrt_cache[p]
    r = x ** ((q - 1) // 2)
    t = r * r * x
    r *= x
    b = t
    for k in range(m, 1, -1):
        for _ in range(1, k - 1):
            b *= b
        b_is_good = b != F(1)
        r = CMOV(r, r * c, b_is_good)
        c *= c
        t = CMOV(t, t * c, b_is_good)
        b = t

    if r ** 2 == x:
        assert r == x.sqrt() or -r == x.sqrt()
        return r
    assert not x.is_square()
    return None

# cache pre-computable values -- no need for CT here
def ts_precompute(p, F):
    q = p - 1
    m = 0
    while q % 2 == 0:
        q //= 2
        m += 1
    z = F(1)
    while z.is_square():
        z += 1
    c = z ** q
    assert p == q * 2**m + 1
    sqrt_cache[p] = (q, m, z, c)
