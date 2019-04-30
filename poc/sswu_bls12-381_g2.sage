from hash_to_base import *
from utils import *
load("common.sage")

# BLS12-381 G1 curve
ell_u = -0xd201000000010000
p = 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab
F = GF(p)
Ell = EllipticCurve(F, [0,4])
h = 3 * 11**2 * 10177**2 * 859267**2 * 52437899**2 # co-factor for G1
assert h == (ell_u-1)**2 // 3
assert Ell.order() % h == 0
r = Ell.order() // h
assert r == (ell_u**4 - ell_u**2 + 1)

# BLS12-381 G2 curve
q = p ** 2
F2.<X> = GF(q, modulus=[1, 0, 1])
Ell2 = EllipticCurve(F2, [0, 4 * (1 + X)])
h2 = Ell2.order() // r
assert Ell2.order() % r == 0

##
## clear cofactor via untwist-Frobenius-twist endomorphism
##
# this is based on
#   Budroni and Pintore, "Efficient Hash Maps to G2 on BLS curves."
#   ePrint 2017/419, https://eprint.iacr.org/2017/419
##
# constants for Psi, the untwist-Frobenius-twist map
iwsc_0 = 0xd0088f51cbff34d258dd3db21a5d66bb23ba5c279c2895fb39869507b587b120f55ffff58a9ffffdcff7fffffffd556
iwsc = F2(iwsc_0 * (1 + X) - X)
k_qi_x = 0x1a0111ea397fe699ec02408663d4de85aa0d857d89759ad4897d29650fb85f9b409427eb4f49fffd8bfd00000000aaad
k_qi_y = 0x6af0e0437ff400b6831e36d6bd17ffe48395dabc2d3435e77f76e17009241c5ee67992f72ec05f4c81084fbede3cc09
k_cx = F2(X * 0x1a0111ea397fe699ec02408663d4de85aa0d857d89759ad4897d29650fb85f9b409427eb4f49fffd8bfd00000000aaad)
k_cy = 0x135203e60180a68ee2e9c448d77a2cd91c3dedd930b1cf60ef396489f61eb45e304466cf3e67fa0af1ee7b04121bdea2
k_cy = F2(k_cy * (1 - X))
onei = F2(1 + X)

# shortcut for evaluating untwist without resorting to Fp12 arithmetic --- X coordinate
def qi_x(x):
    vec = x._vector_()
    return F2(k_qi_x * (vec[0] - X * vec[1]))

# shortcut for evaluating untwist without resorting to Fp12 arithmetic --- Y coordinate
def qi_y(y):
    vec = y._vector_()
    return k_qi_y * F2(vec[0] + vec[1] + X * (vec[0] - vec[1]))

# untwist-Frobenius-twist
def psi(P):
    x = onei * qi_x(iwsc * P[0])
    y = onei * qi_y(iwsc * P[1])
    return Ell2(x, y)

# construction for Barreto-Lynn-Scott curves with embedding degree 12,
# given in section 4.1 of Budroni and Pintore
def clear_h2(P):
    pP = psi(P)
    pp2P = psi(psi(2 * P))
    first = (ell_u ** 2 - ell_u - 1) * P
    second = (ell_u - 1) * pP
    return first + second + pp2P

# roots of unity for use in computing square roots
rv1 = 0x6af0e0437ff400b6831e36d6bd17ffe48395dabc2d3435e77f76e17009241c5ee67992f72ec05f4c81084fbede3cc09
roots_of_unity = (F2(1), F2(X), F2(rv1 + X * rv1), F2(rv1 - X * rv1))
del rv1

# 3-isogenous curve to Ell2
Ell2p_a = F2(240 * X)
Ell2p_b = F2(1012 * (1 + X))
Ell2p = EllipticCurve(F2, [Ell2p_a, Ell2p_b])

# isogeny map back to Ell2
xnum = ( F2(0x5c759507e8e333ebb5b7a9a47d7ed8532c52d39fd3a042a88b58423c50ae15d5c2638e343d9c71c6238aaaaaaaa97d6 +
            X * 0x5c759507e8e333ebb5b7a9a47d7ed8532c52d39fd3a042a88b58423c50ae15d5c2638e343d9c71c6238aaaaaaaa97d6),
         F2(X * 0x11560bf17baa99bc32126fced787c88f984f87adf7ae0c7f9a208c6b4f20a4181472aaa9cb8d555526a9ffffffffc71a),
         F2(0x11560bf17baa99bc32126fced787c88f984f87adf7ae0c7f9a208c6b4f20a4181472aaa9cb8d555526a9ffffffffc71e +
            X * 0x8ab05f8bdd54cde190937e76bc3e447cc27c3d6fbd7063fcd104635a790520c0a395554e5c6aaaa9354ffffffffe38d),
         F2(0x171d6541fa38ccfaed6dea691f5fb614cb14b4e7f4e810aa22d6108f142b85757098e38d0f671c7188e2aaaaaaaa5ed1) )
xden = ( F2(X * 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaa63),
         F2(0xc +
            X * 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaa9f),
         F2(1) )
ynum = ( F2(0x1530477c7ab4113b59a4c18b076d11930f7da5d4a07f649bf54439d87d27e500fc8c25ebf8c92f6812cfc71c71c6d706 +
            X * 0x1530477c7ab4113b59a4c18b076d11930f7da5d4a07f649bf54439d87d27e500fc8c25ebf8c92f6812cfc71c71c6d706),
         F2(X * 0x5c759507e8e333ebb5b7a9a47d7ed8532c52d39fd3a042a88b58423c50ae15d5c2638e343d9c71c6238aaaaaaaa97be),
         F2(0x11560bf17baa99bc32126fced787c88f984f87adf7ae0c7f9a208c6b4f20a4181472aaa9cb8d555526a9ffffffffc71c +
            X * 0x8ab05f8bdd54cde190937e76bc3e447cc27c3d6fbd7063fcd104635a790520c0a395554e5c6aaaa9354ffffffffe38f),
         F2(0x124c9ad43b6cf79bfbf7043de3811ad0761b0f37a1e26286b0e977c69aa274524e79097a56dc4bd9e1b371c71c718b10) )
yden = ( F2(0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffa8fb +
            X * 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffa8fb),
         F2(X * 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffa9d3),
         F2(0x12 +
            X * 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaa99),
         F2(1) )
def iso2(P):
    (x, y, _) = P
    mapvals = [None] * 4
    # compute the numerator and denominator of the X and Y maps via Horner's rule
    for (idx, coeffs) in enumerate((xnum, xden, ynum, yden)):
        mapvals[idx] = coeffs[-1]
        for coeff in reversed(coeffs[:-1]):
            mapvals[idx] *= x
            mapvals[idx] += coeff
    return Ell2(mapvals[0] / mapvals[1], y * mapvals[2] / mapvals[3])

h2c_suite = "H2C-BLS12_381_2-SHA512-OSSWU-"

# xi is the distinguished non-square for the SWU map
Z = F2(1 + X)
# eta values for converting a failed attempt at sqrt(g(X0(t))) to sqrt(g(X1(t)))
ev1 = 0x2c4a7244a026bd3e305cc456ad9e235ed85f8b53954258ec8186bb3d4eccef7c4ee7b8d4b9e063a6c88d0aa3e03ba01
ev2 = 0x85fa8cd9105715e641892a0f9a4bb2912b58b8d32f26594c60679cc7973076dc6638358daf3514d6426a813ae01f51a
etas = (F2(ev1), F2(X * ev1), F2(ev2 + X * ev2), F2(ev2 - X * ev2))
del ev1, ev2

# y^2 = g2p(x) is the curve equation for Ell2p
def g2p(x):
    return F2(x**3 + Ell2p_a * x + Ell2p_b)

# apply optimized simplified SWU map to a point t
def osswu2_help(u):
    # compute the value X0(t)
    num_den_common = F2(Z ** 2 * u ** 4 + Z * u ** 2)
    if num_den_common == 0:
        # exceptional case: use x0 = Ell2p_b / (Z * Ell2p_a), which is square by design
        x0 = F2(Ell2p_b) / F2(Z * Ell2p_a)
    else:
        x0 = F2(-Ell2p_b * (num_den_common + 1)) / F2(Ell2p_a * num_den_common)

    # g(X0), where y^2 = g(x) is the curve 3-isogenous to BLS12-381 Ell2
    gx0 = g2p(x0)

    # check whether gx0 is square by computing gx0 ^ ((p+1)/4)
    sqrt_candidate = gx0 ** ((p**2 + 7) // 16)
    # the square root will be given by sqrt_candidate times a root of unity; check them all
    for root_of_unity in roots_of_unity:
        y0_candidate = sqrt_candidate * root_of_unity
        if y0_candidate ** 2 == gx0:
            # found y0
            y0 = sgn0(u) * y0_candidate
            return iso2(Ell2p(x0, y0))

    # if we got here, the g(X0(u)) was not square
    # X1(u) == xi u^2 X0(u), g(X1(u)) = xi^2 t^6 X0(u)
    x1 = F2(Z * u ** 2 * x0)
    gx1 = Z ** 3 * u ** 6 * gx0
    assert gx1 == g2p(x1)

    # if g(X0(u)) is not square, then sqrt(g(X1(u))) == eta * u^3 * g(X0(u)) ^ ((p+7)/16) for one of the etas above
    for eta_value in etas:
        y1_candidate = sqrt_candidate * eta_value * u ** 3
        if y1_candidate ** 2 == gx1:
            # found y1
            # don't need to negate because t^3 preserves the sign of t
            y1 = y1_candidate
            return iso2(Ell2p(x1, y1))

    # if we got here, something went very wrong
    assert False, "osswu2_help failed"

# map from a string, optionally clearing the cofactor
def map2curve_osswu2(alpha):
    (u1, u2) = h2b_from_label(h2c_suite, alpha, 2)
    P = osswu2_help(F2(u1 + X * u2))
    return P

MB_OVER_A = -Ell2p_b / Ell2p_a
M1_OVER_Z = -1 / Z

def tv2(n, x, l):
    vec = x._vector_()
    tv("%s.1" % n, vec[0], l)
    tv("%s.2" % n, vec[1], l)

def osswu2_CT_help(u):
    # compute the value X0(t)
    t1 = Z * u ** 2
    t2 = t1 ** 2
    x1 = t1 + t2
    x1 = mult_inv(x1, q)
    e1 = x1 == 0
    x1 = x1 + 1
    x1 = CMOV(x1, M1_OVER_Z, e1)
    x1 = x1 * MB_OVER_A
    assert (e1 and x1 == (Ell2p_b / (Z * Ell2p_a))) or \
           x1 == -(Ell2p_b / Ell2p_a) * (1 + 1 / (Z ** 2 * u ** 4 + Z * u ** 2))
    tv2(" x1", x1, 48)

    gx1 = x1 ** 2
    gx1 = gx1 + Ell2p_a
    gx1 = gx1 * x1
    gx1 = gx1 + Ell2p_b
    assert gx1 == g2p(x1)
    tv2("gx1", gx1, 48)

    x2 = t1 * x1
    assert x2 == Z * u ** 2 * x1
    tv2(" x2", x2, 48)

    t3 = gx1 ** ((q + 7) // 16)
    for root_of_unity in roots_of_unity:
        t3_cand = t3 * root_of_unity
        e2 = t3_cand ** 2 == gx1
        t3 = CMOV(t3, t3_cand, e2)

    gx2 = Z ** 3 * u ** 6 * gx1
    tv2("gx2", gx2, 48)
    t4 = t3 * u ** 3
    e3 = sgn0(u) == -1
    t3 = CMOV(t3, -t3, e3)
    for eta_value in etas:
        t4_cand = t4 * eta_value
        e4 = t4_cand ** 2 == gx2
        t4 = CMOV(t4, t4_cand, e4)

    e5 = t3 ** 2 == gx1
    x = CMOV(x2, x1, e5)
    y = CMOV(t4, t3, e5)
    return iso2(Ell2p(x, y))

# map from a string using CT impl; always clear cofactor
def map2curve_osswu2_CT(alpha):
    (u1, u2) = h2b_from_label(h2c_suite, alpha, 2)
    P = osswu2_CT_help(F2(u1 + X * u2))
    return clear_h2(P)

if __name__ == "__main__":
    enable_debug()
    print "## Optimized Simplified SWU to BLS12-381 G2"
    for alpha in map2curve_alphas:
        tv_text("alpha", pprint_hex(alpha))
    for alpha in map2curve_alphas:
        print "\n~~~"
        print("Input:")
        print("")
        tv_text("alpha", pprint_hex(alpha))
        print("")
        P = map2curve_osswu2(alpha)
        Pc = map2curve_osswu2_CT(alpha)
        assert P * h2 * (3 * ell_u ** 2 - 3) == Pc  # make sure fast cofactor clear method worked
        assert Pc * r == Ell2(0,1,0)                # make sure that Pc is of the correct order
        print("Output:")
        print("")
        tv2("  x", Pc[0], 48)
        tv2("  y", Pc[1], 48)
        print "~~~"
