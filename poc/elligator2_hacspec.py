from curve25519 import *
from speclib import *

a25519 = felem(486662)
b25519 = felem(1)
u25519 = felem(2)

def f_25519(x:felem_t) -> felem_t:
    return fadd(fmul(x, fsqr(x)), fadd(fmul(a25519, fsqr(x)), x))

def hash2curve25519(r:felem_t) -> point_t:
    d = felem(p25519 - fmul(a25519,finv(fadd(1,fmul(u25519,fsqr(r))))))
    power = nat((p25519 - 1) // 2)
    e = fexp(f_25519(d), power)
    if e != 1:
        return fsub(-d, a25519)
    else:
        return d