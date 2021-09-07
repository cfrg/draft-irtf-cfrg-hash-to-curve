from sagelib.common import CMOV
# vim: syntax=python

def _get_lo(q):
    o = q - 1
    l = 0
    while o % 2 == 0:
        o = o // 2
        l = l + 1
    assert o * 2^l == q - 1
    return (l, o)

def find_S(F):
    (l, o) = _get_lo(F.order())
    ctr = F.gen()
    ll0 = 2^l
    ll1 = 2^(l-1)
    while True:
        S_cand = F(ctr)
        S_cand_o = S_cand ^ o
        s2l0 = S_cand_o ^ ll0
        s2l1 = S_cand_o ^ ll1
        if not S_cand.is_square():
            assert s2l1 != F(1)
            assert s2l0 == F(1)
            return S_cand
        ctr += 1

_s_vals = {}
def _get_s_val(F):
    global _s_vals
    if F in _s_vals:
        return _s_vals[F]
    pe = find_S(F)
    _s_vals[F] = pe
    return pe

_consts = {}
def _get_consts(F, Z):
    global _consts
    if (F, Z) in _consts:
        return _consts[(F, Z)]
    q = F.order()
    (l, o) = _get_lo(q)
    # c1, the largest integer such that 2^c1 divides q - 1.
    c1 = l
    c2 = (q - 1) / (2^c1)        # Integer arithmetic
    assert c2 == o
    c3 = (c2 - 1) / 2            # Integer arithmetic
    c4 = 2^c1 - 1                # Integer arithmetic
    c5 = 2^(c1 - 1)              # Integer arithmetic
    c6 = Z^c2
    c7 = Z^((c2 + 1) / 2)
    ret = (c1, c3, c4, c5, c6, c7)
    _consts[(F, Z)] = ret
    return ret

def sqrt_checked(F, x, S=None):
    x = F(x)
    isQR = True
    order = F.order()
    m = 0
    r = order - 1
    while r % 2 == 0:
        r = r / 2
        m += 1
    assert 2^m * r  == order-1, "bad initialization"
    if S is None:
        S = _get_s_val(F)
    z  = x^((r-1)/2)
    t = z * z * x # x^r
    z = z * x # x^((r+1)/2)
    c = S^r
    inital_tweak_z = S^((r+1)/2)
    if t^(2^(m-1)) != 1:
        isQR = false
        assert not is_square(x), "incorrect determination of squareness"
        z = z*inital_tweak_z
        t = t*c

    for i in range(m,1, -1):
        if t^(2^(i-2)) != 1:
            z = z * c
            t = t * c * c
        c = c * c
    if isQR:
        assert z*z == x, "incorrect square root: %s squared is not %s"%(z,x)
    if not isQR:
        assert z*z==x*S, "incorrect tweaked square root: %s squared is not %s"%(z,x*S)
    return (isQR, z)

def sqrt_ratio_straightline(F, u, v, Z=None):
    u = F(u)
    v = F(v)
    if Z is None:
        Z = _get_s_val(F)
    (c1, c3, c4, c5, c6, c7) = _get_consts(F, Z)

    isQR = True
    tv1 = c6
    tv2 = v^c4
    tv3 = tv2^2
    tv3 = tv3 * v
    tv5 = u * tv3
    tv5 = tv5^c3
    tv5 = tv5 * tv2
    tv2 = tv5 * v # y
    tv3 = tv5 * u # z
    tv4 = tv3 * tv2 # t
    tv5 = tv4^c5
    isQR = CMOV(isQR, False, tv5 != 1)
    tv3 = CMOV(tv3, tv3 * c7, tv5 != 1)
    tv4 = CMOV(tv4, tv4 * tv1, tv5 != 1)
    for i in range(c1, 1, -1):
       tv5 = i - 2
       tv5 = 2^tv5
       tv5 = tv4^tv5
       tv3 = CMOV(tv3, tv3 * tv1, tv5 != 1)
       tv4 = CMOV(tv4, tv4 * tv1, tv5 != 1)
       tv4 = CMOV(tv4, tv4 * tv1, tv5 != 1)
       tv1 = tv1 * tv1

    assert (isQR, tv3) == sqrt_checked(F, u/v, Z), "incorrect sqrt_ratio"
    return (isQR, tv3)

def test_sqrt_ratio():
    print("Testing sqrt_ratio")
    def _test(F):
        for _ in range(0, 256):
            u = F.random_element()
            v = F.random_element()
            while v == F(0):
                v = F.random_element()
            S = _get_s_val(F)

            is_square, s = sqrt_ratio_straightline(F, u, v)
            if (u / v).is_square():
                assert is_square == True
                assert s^2 == (u / v)
            else:
                assert is_square == False
                assert s^2 == (S * u / v)

    for _ in range(0, 128):
        p = random_prime(1 << 128)
        F = GF(p)
        _test(F)

if __name__ == "__main__":
    test_sqrt_ratio()
    print("Exhaustively testing small fields")
    for i in range(1, 256):
        sqrt_checked(GF(257), i)
    for i in range(1, 193):
        sqrt_checked(GF(193), i)
    for i in range(1, 419):
        sqrt_checked(GF(419), i)
    for i in range(1, 193):
        for j in range(1, 193):
            sqrt_ratio_straightline(GF(193), i, j)
