from sagelib.common import CMOV

_primitive_elements = {}
def _get_primitive_element(F):
    global _primitive_elements
    if F in _primitive_elements:
        return _primitive_elements[F]
    pe = F.primitive_element()
    _primitive_elements[F] = pe
    return pe

def sqrt_checked(F, x):
    x = F(x)
    isQR = True
    order = F.order()
    m = 0
    r = order - 1
    while r % 2 == 0:
        r = r / 2
        m += 1
    assert 2^m * r  == order-1, "bad initialization"
    h = _get_primitive_element(F)
    z  = x^((r-1)/2)
    t = z * z * x # x^r
    z = z * x # x^((r+1)/2)
    c = h^r
    inital_tweak_z = h^((r+1)/2)
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
        assert z*z==x*h, "incorrect tweaked square root: %s squared is not %s"%(z,x*h)
    return (isQR, z)

def sqrt_ratio_straightline(F, u, v):
    u = F(u)
    v = F(v)
    S = _get_primitive_element(F)
    q = F.order()

    isQR = True
    m = 0
    r = q - 1
    while r % 2 == 0:
       r = r / 2
       m = m + 1
    tv0 = S^r
    tv1 = r + 1
    tv1 = tv1 / 2
    tv1 = S^tv1
    tv2 = 2^m
    tv2 = tv2 - 1
    tv2 = v^tv2
    tv3 = tv2^2
    tv3 = tv3 * v
    tv4 = r - 1
    tv4 = tv4 / 2
    tv5 = u * tv3
    tv5 = tv5^tv4
    tv5 = tv5 * tv2
    tv2 = tv5 * v # y
    tv3 = tv5 * u # z
    tv4 = tv3 * tv2 # t
    tv5 = m - 1
    tv5 = 2^tv5
    tv5 = tv4^tv5
    isQR = CMOV(isQR, False, tv5 != 1)
    tv3 = CMOV(tv3, tv3 * tv1, tv5 != 1)
    tv4 = CMOV(tv4, tv4 * tv0, tv5 != 1)
    for i in range(m, 1, -1):
       tv5 = i - 2
       tv5 = 2^tv5
       tv5 = tv4^tv5
       tv3 = CMOV(tv3, tv3 * tv0, tv5 != 1)
       tv4 = CMOV(tv4, tv4 * tv0, tv5 != 1)
       tv4 = CMOV(tv4, tv4 * tv0, tv5 != 1)
       tv0 = tv0 * tv0


    
    assert 2^m * r  == q - 1, "bad initialization"
    assert (isQR, tv3) == sqrt_checked(F, u/v), "incorrect sqrt_ratio"
    return (isQR, tv3)

def test_sqrt_ratio():
    print("Testing sqrt_ratio")
    def _test(F):
        for _ in range(0, 256):
            u = F.random_element()
            v = F.random_element()
            S = _get_primitive_element(F)

            is_square, s = sqrt_ratio_straightline(F, u, v)
            if (u / v).is_square():
                assert is_square == True
                assert s^2 == (u / v)
            else:
                assert is_square == False
                assert s^2 == (S * u / v)

    for _ in range(0, 32):
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
