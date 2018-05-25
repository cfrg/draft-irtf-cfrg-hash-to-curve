from p256 import *
from speclib import *

a256 = felem(p256.prime - 3)
b256 = felem(41058363725152142129326129780047268409114441015993725554835256314039467401291)

def hash2curveSimpleSWU(t:felem_t) -> point_t:
    alpha = felem(fmul(-1, fsqr(t)))
    frac = finv(fadd(fsqr(alpha), alpha))

    x2 = fmul(fmul(fmul(-1, b256), finv(a256)), fadd(1, frac))
    x3 = fmul(alpha,  x2)

    h2 = fadd(fadd(fexp(x2, 3), fmul(a256, x2)), b256)
    h3 = fadd(fadd(fexp(x3, 3), fmul(a256, x3)), b256)

    sqr = fexp(h2, (p + 1) // 4)
    if sqr == x2^2:
        return x2
    else:
        return x3

