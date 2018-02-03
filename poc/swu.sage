# P256
p = 115792089210356248762697446949407573530086143415290314195533631308867097853951
F = GF(p)
A = p - 3
B = ZZ("5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b", 16)
E = EllipticCurve([F(A), F(B)])

# Section 7 of https://link.springer.com/content/pdf/10.1007/978-3-642-14623-7_13.pdf
def simple_swu(alpha):
    t = F(alpha)

    a = F(A)
    b = F(B)
    
    alpha = -(t^2)
    frac = (1 / (alpha^2 + alpha))
    x2 = (-b / a) * (1 + frac)
    
    x3 = alpha * x2
    h2 = x2^3 + a * x2 + b
    h3 = x3^3 + a * x3 + b
    if is_square(h2):
        return E(x2, h2^((p + 1) // 4))
    else:
        return E(x3, h3^((p + 1) // 4))

inputs = [7, 13, 1<<7, 1<<8, 1<<64, 1<<64-1]
for t in inputs:
    point = simple_swu(t)
