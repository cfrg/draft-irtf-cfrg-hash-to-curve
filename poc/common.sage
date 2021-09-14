#!/usr/bin/sage
# vim: syntax=python

def test_dst(suite_name, L = 0):
    length = len("QUUX-V01-CS02-with-") + len(suite_name) + 1
    dst = "-".join(filter(None, ["QUUX-V01-CS02-with", suite_name, "1" * max(0, L - length)]))
    return dst

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
    (c1, c3, c5) = sqrt_cache[p]

    z = x^c3
    t = z * z
    t = t * x
    z = z * x
    b = t
    c = c5
    for i in range(c1, 1, -1):
        for j in range(1, i - 1):
             b = b * b
        e = b == 1
        zt = z * c
        z = CMOV(zt, z, e)
        c = c * c
        tt = t * c
        t = CMOV(tt, t, e)
        b = t

    if z ** 2 == x:
        return z
    assert not x.is_square()
    return None

# cache pre-computable values -- no need for CT here
def ts_precompute(p, F):
    c2 = p - 1
    c1 = 0
    while c2 % 2 == 0:
        c2 //= 2
        c1 += 1
    assert c2 == (p - 1) // (2^c1)
    c4 = F.gen()
    while c4.is_square():
        c4 += 1
    assert p == c2 * 2**c1 + 1
    c3 = (c2 - 1) // 2
    c5 = c4^c2
    sqrt_cache[p] = (c1, c3, c5)

def is_square_quadratic(x):
    F = x.parent()
    I = F.gen()
    (x_1, x_2) = (list(x.polynomial()) + [0, 0])[:2]
    p = F.characteristic()
    c1 = (p - 1) // 2               # Integer arithmetic

    tv1 = x_1^2
    tv2 = I * x_2
    tv2 = tv2^2
    tv1 = tv1 - tv2
    tv1 = tv1^c1
    e1 = tv1 != -1
    return e1

def test_ts():
    print("Testing Tonelli-Shanks")
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

def test_issq():
    print("Testing is_square for quadratic extensions")
    for _ in range(0, 8):
        p = random_prime(1<<64)
        b = 2
        while True:
            try:
                F.<X> = GF(p^2, modulus=[b,0,1])
            except:
                b += 1
                continue
            break
        for _ in range(0, 128):
            a = F.random_element()
            assert a.is_square() == is_square_quadratic(a)

def test_sqrt_issq():
    test_ts()
    test_issq()

if __name__ == "__main__":
    test_ts()
    test_sqrt_issq()
