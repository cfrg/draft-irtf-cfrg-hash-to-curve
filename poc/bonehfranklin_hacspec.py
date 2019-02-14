from hacspec.speclib import *

prime = 2**250*3**159-1

felem_t = refine_t(nat_t, lambda x: x < prime)
affine_t = tuple2(felem_t, felem_t)

@typechecked
def to_felem(x: nat_t) -> felem_t:
    return felem_t(nat(x % prime))


@typechecked
def fadd(x: felem_t, y: felem_t) -> felem_t:
    return to_felem(x + y)


@typechecked
def fsub(x: felem_t, y: felem_t) -> felem_t:
    return to_felem(x - y)


@typechecked
def fmul(x: felem_t, y: felem_t) -> felem_t:
    return to_felem(x * y)


@typechecked
def fsqr(x: felem_t) -> felem_t:
    return to_felem(x * x)


@typechecked
def fexp(x: felem_t, n: nat_t) -> felem_t:
    return to_felem(pow(x, n, prime))


@typechecked
def finv(x: felem_t) -> felem_t:
    return to_felem(pow(x, prime-2, prime))

a503 = to_felem(0)
b503 = to_felem(1)

@typechecked
def map2p503(u:felem_t) -> affine_t:
    t0 = fsqr(u)
    t1 = fsub(t0,b503)
    x = fexp(t1, (2 * prime - 1) // 3)
    return (x, u)
