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
# https://eprint.iacr.org/2019/013

# Montgomery curve equation
Rm.<s,t,Ap,Bp> = QQ[]
Monty = (Bp * t^2) - (s^3 + Ap * s^2 + s)
M = Rm.quotient(Monty)

# Weierstrass curve equation
Rw.<x,y,A,B> = QQ[]
Weier = y^2 - (x^3 + A * x + B)
W = Rw.quotient(Weier)

# Alt Weierstrass curve equation (used by Elligator)
Raw.<xx,yy,AA,sqrtBB> = QQ[]
AWeier = yy^2 - (xx^3 + AA * xx^2 + sqrtBB^2 * xx)
AW = Raw.quotient(AWeier)

# Edwards curve equation
Re.<v,w,a,d> = QQ[]
Edw = a * v^2 + w^2 - (1 + d * v^2 * w^2)
E = Re.quotient(Edw)

def check_m2aw():
    AA = Ap/Bp
    sqrtBB = 1/Bp
    xx = s/Bp
    yy = t/Bp
    assert 0 == M((yy^2 - (xx^3 + AA * xx^2 + sqrtBB^2 * xx)).numerator())

def check_aw2m():
    Ap = AA / sqrtBB
    Bp = 1 / sqrtBB
    s = xx / sqrtBB
    t = yy / sqrtBB
    assert 0 == AW((Bp * t^2 - (s^3 + Ap * s^2 + s)).numerator())

def check_e2aw():
    AA = (a + d) / 2
    sqrtBB = (a - d) / 4
    Bp = 1 / sqrtBB
    xx = (1 + w) / (Bp * (1 - w))
    yy = (1 + w) / (Bp * v * (1 - w))
    assert 0 == E((yy^2 - (xx^3 + AA * xx^2 + sqrtBB^2 * xx)).numerator())

def check_aw2e():
    a = AA + 2 * sqrtBB
    d = AA - 2 * sqrtBB
    v = xx / yy
    w = (xx - sqrtBB) / (xx + sqrtBB)
    assert 0 == AW((a * v^2 + w^2 - (1 + d * v^2 * w^2)).numerator())

def check_e2m():
    Ap = 2 * (a + d) / (a - d)
    Bp = 4 / (a - d)
    s = (1 + w) / (1 - w)
    t = (1 + w) / (v * (1 - w))
    assert 0 == E((Bp * t^2 - (s^3 + Ap * s^2 + s)).numerator())

def check_m2e():
    a = (Ap + 2) / Bp
    d = (Ap - 2) / Bp
    v = s / t
    w = (s - 1) / (s + 1)
    assert 0 == M((a * v^2 + w^2 - (1 + d * v^2 * w^2)).numerator())

def check_m2w():
    A = (3 - Ap^2) / (3 * Bp^2)
    B = (2 * Ap^3 - 9 * Ap) / (27 * Bp^3)
    x = (3 * s + Ap) / (3 * Bp)
    y = t / Bp
    assert 0 == M((y^2 - (x^3 + A * x + B)).numerator())

def check_e2w():
    A = (a-d)^2/16 - (a+d)^2/12
    B = (a+d)^3/108 - 2*(a+d)*(a-d)^2/192
    x = (1 + w) * (a - d) / (4 * (1 - w)) + (a + d) / 6
    y = (1 + w) * (a - d) / (4 * v * (1 - w))
    assert 0 == E((y^2 - (x^3 + A * x + B)).numerator())

def check_aw2w():
    BB = sqrtBB^2
    A = BB - AA^2 / 3
    B = (2 * AA^3 - 9 * AA * BB) / 27
    x = xx + AA / 3
    y = yy
    assert 0 == AW((y^2 - (x^3 + A * x + B)).numerator())

# NOTE: no w2aw, w2m, or w2e in the general case, because not all Weierstrass
#       curves can be converted to a Montgomery or twisted Edwards curve

if __name__ == "__main__":
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
