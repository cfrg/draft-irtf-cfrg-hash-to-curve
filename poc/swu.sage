# P256
p = 2^256 - 2^224 + 2^192 + 2^96 - 1 
F = GF(p)
A = 3
B = 41058363725152142129326129780047268409114441015993725554835256314039467401291
E = EllipticCurve(F, [0, A, 0, B, 0])

def simple_swu(alpha):
    t = F(alpha)
    a = A
    b = B
    
    alpha = -t^2
    x2 = -b / a * (1 + 1 / (alpha^2 + alpha))
    x3 = alpha * x2
    h2 = x2^3 + a * x2 + b
    h3 = x3^3 + a * x3 + b
    if is_square(h2):
        return (x2,h2^((p+1)//4))
    else:
        return (x3,h3^((p+1)//4))

inputs = [1, 7, 13, 1<<7, 1<<8, 1<<64, 1<<64-1, p-1, p+1]
tts = [(u, icart(u), icart_slp(u)) for u in inputs]

for pair in tts:
    assert pair[1] == pair[2]