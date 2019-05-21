from hash_to_base import *
from utils import *
load("common.sage")

# BLS12-381 G1 curve
ell_u = -0xd201000000010000
p = 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab
q = p
F = GF(q)
Ell = EllipticCurve(F, [0,4])
h = 3 * 11**2 * 10177**2 * 859267**2 * 52437899**2 # co-factor for G1
assert h == (ell_u-1)**2 // 3
assert Ell.order() % h == 0
r = Ell.order() // h
assert r == (ell_u**4 - ell_u**2 + 1)

# 11-isogenous curve Ell'
EllP_a = F(0x144698a3b8e9433d693a02c96d4982b0ea985383ee66a8d8e8981aefd881ac98936f8da0e0f97f5cf428082d584c1d)
EllP_b = F(0x12e2908d11688030018b12e8753eee3b2016c1f0f24f4070a0b9c14fcef35ef55a23215a316ceaa5d1cc48e98e172be0)
kpoly = [ 0x133341fb0962a34cb0504a9c4fada0a5090d38679b4c040d5d1c3afb023a3409fcc0815fea66d8b02bbef9c8b5a66e07
        , 0x264908af037bcede00d054cf5d4775e83eb6cf63c76b969f8ed174fb59fcff78d201f46f6cfc4ed6552e59ce75177b0
        , 0x1335c502c1f54c49aceea65e87fd7203ba0f626f305fc0cfd606a5dae9f3c8e81a4b3b69600129fabd307c69bf319d39
        , 0x94440f65f408a6e930e16e3e92dd17bf60d6e9679a8d3d58593de55ac23703042d609537eb3549aac234d896ca82944
        , 0x4afe09d5cf4956a23b6b71f59d2b3407b415a774b7be81bbb6fa99cbc798e0ac98ba725a5bc328016b1c268b4766e85
        , 0x1
        ]
EllP = EllipticCurve(F, [EllP_a, EllP_b])
# the isogeny map
iso = EllipticCurveIsogeny(EllP, kpoly, codomain=Ell, degree=11)
iso.switch_sign()  # we use the isogeny with the opposite sign for y; the choice is arbitrary

h2c_suite = "H2C-BLS12_381_1-SHA512-OSSWU-"

# y^2 = g1p(x) is the curve equation for EllP
def g1p(x):
    return F(x**3 + EllP_a * x + EllP_b)

def osswu_help(u):
    # compute the value X0(t)
    num_den_common = F(Z ** 2 * u ** 4 + Z * u ** 2)
    if num_den_common == 0:
        # exceptional case: use x0 = EllP_b / (Z * EllP_a), which is square by design
        x0 = F(EllP_b) / F(Z * EllP_a)
    else:
        x0 = F(-EllP_b * (num_den_common + 1)) / F(EllP_a * num_den_common)

    # g(X0), where y^2 = g(x) is the curve 11-isogenous to BLS12-381
    gx0 = g1p(x0)

    # check whether gx0 is square by computing gx0 ^ ((p+1)/4)
    sqrt_candidate = F(pow(gx0, (p+1)//4, p))

    if sqrt_candidate ** 2 == gx0:
        # gx0 is square, and we found the square root
        (x, y) = (x0, sqrt_candidate)

    else:
        # g(X0(t)) was not square
        # X1(t) == xi t^2 X0(t)
        x1 = F(Z * u ** 2 * x0)

        # if g(X0(t)) is not square, then sqrt(g(X1(t))) == t^3 * g(X0(t)) ^ ((p+1)/4)
        # don't need to negate y1 because t^3 preserves the sign of t
        y1 = sqrt_candidate * u ** 3
        assert y1 ** 2 == g1p(x1)
        (x, y) = (x1, y1)

    y = y * sgn0(u) * sgn0(y)
    assert sgn0(u) == sgn0(y)
    return iso(EllP(x, y))

# map from a string; never clear the cofactor
def map2curve_osswu(alpha):
    u = F(h2b_from_label(h2c_suite, alpha))
    P = osswu_help(u)
    return P

# xi is the distinguished non-square for the SWU map
Z = F(-1)
MB_OVER_A = -EllP_b / EllP_a
M1_OVER_Z = -1 / Z

def osswu_CT_help(u):
    # compute the value X0(t)
    t1 = Z * u ** 2
    t2 = t1 ** 2
    x1 = t1 + t2
    x1 = mult_inv(x1, q)
    e1 = x1 == 0
    x1 = x1 + 1
    x1 = CMOV(x1, M1_OVER_Z, e1)
    x1 = x1 * MB_OVER_A
    assert (e1 and x1 == (EllP_b / (Z * EllP_a))) or \
           x1 == -(EllP_b / EllP_a) * (1 + 1 / (Z ** 2 * u ** 4 + Z * u ** 2))
    tv("x1 ", x1, 48)

    gx1 = x1 ** 2
    gx1 = gx1 + EllP_a
    gx1 = gx1 * x1
    gx1 = gx1 + EllP_b  # gx1 = x1^3 + A * x1 + B
    assert gx1 == g1p(x1)
    tv("gx1", gx1, 48)

    x2 = t1 * x1
    assert x2 == Z * u ** 2 * x1
    tv("x2 ", x2, 48)

    t3 = gx1 ** ((p + 1) // 4)
    t4 = t3 * u ** 3            # sqrt(g(x2)) if g(x2) is square

    e2 = t3 ** 2 == gx1
    x = CMOV(x2, x1, e2)
    y = CMOV(t4, t3, e2)

    e3 = sgn0(u) == sgn0(y)
    y = CMOV(-y, y, e3)

    return iso(EllP(x, y))

# map from a string using CT impl; always clear the cofactor
def map2curve_osswu_CT(alpha):
    u = F(h2b_from_label(h2c_suite, alpha))
    tv("u  ", u, 48)
    P = osswu_CT_help(u)
    return (1 - ell_u) * P

if __name__ == "__main__":
    assert osswu_CT_help(F(0)) == osswu_help(F(0))  # check exceptional case
    enable_debug()
    print "## Optimized Simplified SWU to BLS12-381 G1"
    for alpha in map2curve_alphas:
        tv_text("alpha", pprint_hex(alpha))
    for alpha in map2curve_alphas:
        print "\n~~~"
        print("Input:")
        print("")
        tv_text("alpha", pprint_hex(alpha))
        print("")
        P = map2curve_osswu(alpha)
        Pc = map2curve_osswu_CT(alpha)
        assert P * (1 - ell_u) == Pc  # make sure that Pc is correct relative to P
        assert Pc * r == Ell(0,1,0)   # make sure that Pc is of the correct order
        print("Output:")
        print("")
        tv("x", Pc[0], 48)
        tv("y", Pc[1], 48)
        print "~~~"
