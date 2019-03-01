from hacspec.speclib import *

t = -(2**62 + 2**55 + 1)
pp = lambda x: 36*x**4 + 36*x**3 + 24*x**2 + 6*x + 1
prime = pp(t)

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


@typechecked
def fsqrt(x: felem_t) -> felem_t:
    return to_felem(pow(x, (prime+1)//4, prime))

aBN256 = to_felem(0)
bBN256 = to_felem(1)

@typechecked
def map2BN256(u:felem_t) -> affine_t:
    ZERO = to_felem(0)
    ONE = to_felem(1)
    SQRT_MINUS3 = fsqrt(to_felem(-3))
    ONE_SQRT3_DIV2 = fmul(finv(to_felem(2)),fsub(SQRT_MINUS3,ONE))

    fcurve = lambda x: fadd(fexp(x, 3), fadd(fmul(to_felem(aBN256), x), to_felem(bBN256)))
    flegendre = lambda x: fexp(u, (prime - 1) // 2)

    w = finv(fadd(fadd(fsqr(u),B),ONE))
    w = fmul(fmul(w,SQRT_MINUS3),u)
    e = flegendre(u)

    x1 = fsub(ONE_SQRT3_DIV2,fmul(u,w))
    fx1 = fcurve(x1)
    s1 = flegendre(fx1)
    if s1 == 1:
        y1 = fmul(fsqrt(fx1),e)
        return (x1,y1)

    x2 = fsub(ZERO,fadd(ONE,x1))
    fx2 = fcurve(x2)
    s2 = flegendre(fx2)
    if s2 == 1:
        y2 = fmul(fsqrt(fx2),e)
        return (x2,y2)

    x3 = fadd(finv(fsqr(w)),ONE)
    fx3 = fcurve(x3)
    y3 = fmul(fsqrt(fx3),e)
    return (x3,y3)
