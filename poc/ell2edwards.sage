from hash_to_base import *
from utils import *
load("common.sage")

# Curve25519
p = PrimeDict["Ed25519"]
m = 1
q = p^m
F = GF(q)
QUAD_NON_RES = F(2)
assert(not QUAD_NON_RES.is_square())
a = F(-1)
d = F(-121665/121666)
a1, a2, a3, a4, a6 = F(0), 2*(a+d)/(a-d), F(0), F(1), F(0)
E = EllipticCurve(F, [a1, a2, a3, a4, a6])
ZeroEdw = [F(0),F(1),F(0),F(1)] # (x,y,t,z)
sA = sqrt(F(-((2*(a+d)/(a-d))+2)))

h2c_suite = "H2C-Curve25519-SHA512-ELL2-"

def toMont(P):
    if len(P) == 2:
        x,y = P
        t = x*y
        z = 1
    elif len(P) == 4:
        x,y,t,z = P
    else:
        raise Exception("wrong number of coordinates")
    return E( x*(z+y) , sA*z*(z+y), x*(z-y) )

def toEdw(P):
    if P == E.point(0):
        return ZeroEdw
    u,v,w = P
    x = sA*u/v
    y = (u-w)/(u+w)
    Q = (x,y,x*y,1)
    if isEdwardsPoint(Q):
        return Q
    else:
        raise Exception("Point not in Edwards curve")

def isEdwardsPoint(P):
    if len(P) == 2:
        x,y = P
        t = x*y
        z = 1
    elif len(P) == 4:
        x,y,t,z = P
    else:
        raise Exception("wrong number of coordinates")

    return a*x**2 + y**2 == z**2 + d*t**2 and x*y == t*z

def areEqualEdw(P,Q):
    if len(P) == 2:
        x1,y1 = P
        t1 = x1*y1
        z1 = 1
    elif len(P) == 4:
        x1,y1,t1,z1 = P

    if len(Q) == 2:
        x2,y2 = Q
        t2 = x2*y2
        z2 = 1
    elif len(Q) == 4:
        x2,y2,t2,z2 = Q

    assert isEdwardsPoint(P), "P is not a point in Edw"
    assert isEdwardsPoint(Q), "Q is not a point in Edw"
    return (x1*z2 == x2*z1)  \
       and (y1*z2 == y2*z1)  \
       and (t1*z2 == t2*z1)

def toAffEdw(P):
    if len(P) == 2:
        x,y = P
        t = x*y
        z = 1
    elif len(p) == 4:
        x,y,t,z = P
    return (x/z,y/z,t*z,1)

# Textbook implementation
def ell2edwards(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    N = QUAD_NON_RES*u**2
    C1 = 2*(a+d)/(a-d)

    t1 = -C1 / (1 + N)
    t2 = -t1 - C1
    g1 = t1^3 + C1 * t1^2 + t1
    if is_square(g1):
        t = t1
    else:
        t = t2
    y = (t - 1) / (t + 1)
    x = sq_root((y**2 - 1) / (d * y**2 - a), q)
    Q = (x, y)
    if isEdwardsPoint(Q):
        return Q
    else:
        raise Exception("Point not in twisted Edwards curve")

# Constants
c1 = QUAD_NON_RES
c2 = 2*(a+d)/(a-d)
c3 = ZZ( (q-1)/2 )         #Integer Arithmetic

# Implementation
def ell2edwards_slp(alpha):
    u = h2b_from_label(h2c_suite, alpha)

    t1 = u^2
    t1 = c1 * t1
    t1 = t1 + 1
    t1 = mult_inv(t1, q)
    t1 = t1 * c2
    t1 = -t1
    tv("t1", t1, 32)

    t2 = -t1 - c2
    tv("t2", t2, 32)

    g1 = t1 + c2
    g1 = g1 * t1
    g1 = g1 + 1
    g1 = g1 * t1
    tv("g1", g1, 32)

    e = is_QR(g1, q)
    t3 = CMOV(t2, t1, e)
    t4 = t3 + 1
    t4 = mult_inv(t4, q)
    y = t3 - 1
    y = y * t4

    t5 = y**2
    gx = t5 * d
    gx = gx - a
    gx = mult_inv(gx, q)
    t5 = t5 - 1
    gx = gx * t5
    x = sq_root(gx, q)

    Q = (x, y)
    if isEdwardsPoint(Q):
        return Q
    else:
        raise Exception("Point not in twisted Edwards curve")


def test_equiv():
    for i in range(2**7):
        s = bytes(F.random_element())
        r0 = elligator2(s) == toMont(ell2edwards(s))
        r1 = areEqualEdw( ell2edwards(s) , toEdw(elligator2(s)) )
        assert r0 == r1, "not equal for s: {}" % s

if __name__ == "__main__":
    enable_debug()
    print "## Elligator2 to Curve25519"
    for alpha in map2curve_alphas:
        print "\n~~~"
        print("Input:")
        print("")
        tv_text("alpha", pprint_hex(alpha))
        print("")
        print("Intermediate values:")
        print("")
        pA, pB = ell2edwards(alpha), ell2edwards_slp(alpha)
        assert pA == pB
        print("")
        print("Output:")
        print("")
        tv("x", pB[0], 32)
        tv("y", pB[1], 32)
        print "~~~"
