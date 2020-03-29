#!/usr/bin/sage
# vim: syntax=python

def CMOV(x, y, b):
    """
    Returns x if b=False; otherwise returns y
    """
    return int(not bool(b))*x + int(bool(b))*y

ZZR = PolynomialRing(ZZ, name='XX')
def sgn0_be(x):
    """
    Returns -1 if x is 'negative' (big-endian sense), else 1.
    """
    p = x.base_ring().order()
    threshold = ZZ((p-1) // 2)
    degree = x.parent().degree()
    if degree == 1:
        # not a field extension
        xi_values = (ZZ(x),)
    else:
        # field extension
        xi_values = ZZR(x)  # extract vector repr of field element (faster than x._vector_())
    sign = 0
    # compute the sign in constant time
    for i in reversed(range(0, degree)):
        zz_xi = xi_values[i]
        # sign of this digit
        sign_i = CMOV(1, -1, zz_xi > threshold)
        sign_i = CMOV(sign_i, 0, zz_xi == 0)
        # set sign to this digit's sign if sign == 0
        sign = CMOV(sign, sign_i, sign == 0)
    return CMOV(sign, 1, sign == 0)

def sgn0(x):
    """
    Returns 1 if x is 'negative' (little-endian sense), else 0.
    """
    degree = x.parent().degree()
    if degree == 1:
        # not a field extension
        xi_values = (ZZ(x),)
    else:
        # field extension
        xi_values = ZZR(x)  # extract vector repr of field element (faster than x._vector_())
    sign = 0
    zero = 1
    # compute the sign in constant time
    for i in range(0, degree):
        zz_xi = xi_values[i]
        # sign of this digit
        sign_i = zz_xi % 2
        zero_i = zz_xi == 0
        # update sign and zero
        sign = sign | (zero & sign_i)
        zero = zero & zero_i
    return sign

def square_root_random_sign(x):
    a = square_root(x)
    if a is not None and randint(0, 1) == 1:
        return -a
    return a

# cache for per-p values
sqrt_cache = {}
def square_root(x):
    """
    Returns a square root defined through fixed formulas.
    (non-constant-time)
    """
    F = x.parent()
    p = F.order()

    if p % 16 == 1:
        return tonelli_shanks_ct(x)

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
            sqrt_sqrt_m1 = sqrt_m1.sqrt()
            sqrt_cache[p] = (F(1), sqrt_m1, sqrt_sqrt_m1, sqrt_sqrt_m1 * sqrt_m1)
        z = x ** ((p + 7) // 16)

    for mul in sqrt_cache[p]:
        sqrt_cand = z * mul
        if sqrt_cand ** 2 == x:
            return sqrt_cand

    return None

# constant-time Tonelli-Shanks
# Adapted from https://github.com/zkcrypto/jubjub/blob/master/src/fq.rs by Michael Scott.
# See also Cohen, "A Course in Computational # Algebraic Number Theory," Algorithm 1.5.1.
def tonelli_shanks_ct(x):
    F = x.parent()
    p = F.order()
    if sqrt_cache.get(p) is None:
        ts_precompute(p, F)

    (q, m, c) = sqrt_cache[p]
    z = x ** ((q - 1) // 2)
    t = z * z * x
    z = z * x
    b = t
    for i in range(m, 1, -1):
        for _ in range(1, i - 1):
            b = b * b
        z = CMOV(z, z * c, b != 1)
        c = c * c
        t = CMOV(t, t * c, b != 1)
        b = t

    if z ** 2 == x:
        return z
    assert not x.is_square()
    return None

# cache pre-computable values -- no need for CT here
def ts_precompute(p, F):
    q = p - 1
    m = 0
    while q % 2 == 0:
        q //= 2
        m += 1
    z = F.gen()
    while z.is_square():
        z += 1
    c = z ** q
    assert p == q * 2**m + 1
    sqrt_cache[p] = (q, m, c)

def test_ts():
    def _test(F):
        for _ in range(0, 256):
            x = F.random_element()
            a = tonelli_shanks_ct(x)
            if not x.is_square():
                assert a is None
            else:
                assert a^2 == x

    for _ in range(0, 32):
        p = random_prime(1 << 256)
        F = GF(p)
        _test(F)

    for _ in range(0, 32):
        p = random_prime(1 << 64)
        F = GF(p^2)
        _test(F)

    for _ in range(0, 32):
        p = random_prime(1 << 32)
        F = GF(p^3)
        _test(F)

if __name__ == "__main__":
    test_ts()
