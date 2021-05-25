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
    h = F.primitive_element()
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

if __name__ == "__main__":
    for i in range(1, 256):
        sqrt_checked(GF(257), i)
    for i in range(1, 193):
        sqrt_checked(GF(193), i)
    for i in range(1, 419):
        sqrt_checked(GF(419), i)
