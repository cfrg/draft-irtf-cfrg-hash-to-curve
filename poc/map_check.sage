#!/usr/bin/sage
# vim: syntax=python

def check_edwards():
    # from @armfazh in https://github.com/cfrg/draft-irtf-cfrg-hash-to-curve/issues/134
    RE.<x,y,a,d> = QQ[]
    E = a*x**2+y**2 - ( 1 + d*x**2*y**2 )
    FE = Frac(RE.quotient_ring(E))

    RM.<u,v,A,B> = QQ[]
    M = B*v**2 - (u**3+A*u**2+u )
    FM = Frac(RM.quotient_ring(M))

    RW.<s,t,C,sqrtD> = QQ[]
    W = t**2 - (s**3+C*s**2+sqrtD**2*s )
    FW = Frac(RW.quotient_ring(W))

    E_to_M = E.subs(x=(u/v),y=(u-1)/(u+1),a=(A+2)/B,d=(A-2)/B)
    M_to_E = M.subs(u=(1+y)/(1-y),v=(1+y)/(x*(1-y)),A=2*(a+d)/(a-d),B=4/(a-d))

    assert FM( E_to_M ) == 0, "do not match E -> M "
    assert FE( M_to_E ) == 0, "do not match M -> E "

    W_to_E = W.subs(s=(1+y)/((4/(a-d))*(1-y)),t=(1+y)/((4/(a-d))*x*(1-y)),C=(a+d)/2,sqrtD=(a-d)/4)
    E_to_W = E.subs(x=s/t,y=(s/sqrtD-1)/(s/sqrtD+1),a=C+2*sqrtD,d=C-2*sqrtD)

    assert FE( W_to_E ) == 0, "do not match W -> E "
    assert FW( E_to_W ) == 0, "do not match E -> W "

# The functions below are adapted from code in
# Bernstein, Birkner, Joyhe, Lange, and Peters,
# "Twisted Edwards Curves.", AFRICACRYPT 2008,
# Theorem 3.2
# https://eprint.iacr.org/2008/013

# Montgomery curve equation
Rm.<s,t,J,K> = QQ[]
Monty = lambda s, t, J, K: K * t^2 - (s^3 + J * s^2 + s)
MC = Rm.quotient(Monty(s, t, J, K))

# Short Weierstrass curve equation
Rw.<x,y,A,B> = QQ[]
SWeier = lambda x, y, A, B: y^2 - (x^3 + A * x + B)
SWC = Rw.quotient(SWeier(x, y, A, B))

# Long Weierstrass curve equation (used by Elligator)
Raw.<X,Y,C,sqrtD> = QQ[]
LWeier = lambda X, Y, C, sqrtD: Y^2 - (X^3 + C * X^2 + sqrtD^2 * X)
LWC = Raw.quotient(LWeier(X, Y, C, sqrtD))

# Edwards curve equation
Re.<v,w,a,d> = QQ[]
Edw = lambda v, w, a, d: a * v^2 + w^2 - (1 + d * v^2 * w^2)
TEC = Re.quotient(Edw(v, w, a, d))

def check_m2aw():
    C = J / K
    sqrtD = 1 / K
    X = s / K
    Y = t / K
    assert 0 == MC(LWeier(X, Y, C, sqrtD).numerator())

def check_aw2m():
    J = C / sqrtD
    K = 1 / sqrtD
    s = X / sqrtD
    t = Y / sqrtD
    assert 0 == LWC(Monty(s, t, J, K).numerator())

def check_e2aw():
    C = (a + d) / 2
    invSqrtD = 4 / (a - d)
    X = (1 + w) / (invSqrtD * (1 - w))
    Y = (1 + w) / (invSqrtD * v * (1 - w))
    assert 0 == TEC(LWeier(X, Y, C, 1 / invSqrtD).numerator())

def check_aw2e():
    a = C + 2 * sqrtD
    d = C - 2 * sqrtD
    v = X / Y
    w = (X / sqrtD - 1) / (X / sqrtD + 1)
    assert 0 == LWC(Edw(v, w, a, d).numerator())

def check_e2m():
    J = 2 * (a + d) / (a - d)
    K = 4 / (a - d)
    s = (1 + w) / (1 - w)
    t = (1 + w) / (v * (1 - w))
    assert 0 == TEC(Monty(s, t, J, K).numerator())

def check_m2e():
    a = (J + 2) / K
    d = (J - 2) / K
    v = s / t
    w = (s - 1) / (s + 1)
    assert 0 == MC(Edw(v, w, a, d).numerator())

def check_m2w():
    A = (3 - J^2) / (3 * K^2)
    B = (2 * J^3 - 9 * J) / (27 * K^3)
    x = (3 * s + J) / (3 * K)
    y = t / K
    assert 0 == MC(SWeier(x, y, A, B).numerator())

def check_e2w():
    A = (a-d)^2/16 - (a+d)^2/12
    B = (a+d)^3/108 - 2*(a+d)*(a-d)^2/192
    x = (1 + w) * (a - d) / (4 * (1 - w)) + (a + d) / 6
    y = (1 + w) * (a - d) / (4 * v * (1 - w))
    assert 0 == TEC(SWeier(x, y, A, B).numerator())

def check_aw2w():
    D = sqrtD^2
    A = D - C^2 / 3
    B = (2 * C^3 - 9 * C * D) / 27
    x = X + C / 3
    y = Y
    assert 0 == LWC(SWeier(x, y, A, B).numerator())

# NOTE: no w2aw, w2m, or w2e in the general case, because not all Weierstrass
#       curves can be converted to a Montgomery or twisted Edwards curve

def map_check():
    check_m2aw()
    check_aw2m()

    check_e2aw()
    check_aw2e()

    check_e2m()
    check_m2e()

    check_m2w()
    check_e2w()
    check_aw2w()

    check_edwards()

if __name__ == "__main__":
    map_check()
