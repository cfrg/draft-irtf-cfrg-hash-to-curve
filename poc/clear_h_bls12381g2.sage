#!/usr/bin/sage
# vim: syntax=python

try:
    from sagelib.common import ZZR
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

# base field characteristic equation
b12p = (x^2 - 2 * x + 1) * (x^4 - x^2 + 1)/3 + x
bls12381_x = -0xd201000000010000
p = ZZ(b12p(x=bls12381_x))
assert is_prime(p)

F2.<II> = GF(p^2, modulus=[1,0,1])
Ell = EllipticCurve(F2, [0, 4 * (1 + II)])

r = 52435875175126190479447740508185965837690552500527637822603658699938581184513
assert Ell.order() % r == 0
h = Ell.order() // r
h_eff = 3 * (bls12381_x^2 - 1) * h

def _random_projective(P):
    xd = F2.random_element()
    yd = F2.random_element()
    xn = P[0] * xd / P[2]
    yn = P[1] * yd / P[2]
    return (xn, xd, yn, yd)

def _from_projective(xn, xd, yn, yd):
    z = xd * yd
    x = xn * yd
    y = yn * xd
    return Ell(x, y, z)

def frobenius(x):
    assert x.parent() == F2
    zzx = ZZR(x)
    x0 = zzx[0]
    x1 = zzx[1]

    a = x0 - II * x1
    return a

def _psi(xn, xd, yn, yd):
    c1 = 1 / (1 + II)^((p - 1) / 3)           # in GF(p^2)
    c2 = 1 / (1 + II)^((p - 1) / 2)           # in GF(p^2)

    qxn = c1 * frobenius(xn)
    qxd = frobenius(xd)
    qyn = c2 * frobenius(yn)
    qyd = frobenius(yd)
    return (qxn, qxd, qyn, qyd)

def psi(P):
    return _from_projective(*_psi(*_random_projective(P)))

def _psi2(xn, xd, yn, yd):
    c1 = 1 / F2(2)^((p - 1) / 3)             # in GF(p^2)

    qxn = c1 * xn
    qyn = -yn
    return (qxn, xd, qyn, yd)

def psi2(P):
    return _from_projective(*_psi2(*_random_projective(P)))

def clear_cofactor_bls12381_g2(P):
    c1 = -15132376222941642752       # the BLS parameter for BLS12-381
    assert c1 == bls12381_x

    t1 = c1 * P
    t2 = psi(P)
    t3 = 2 * P
    t3 = psi2(t3)
    t3 = t3 - t2
    t2 = t1 + t2
    t2 = c1 * t2
    t3 = t3 + t2
    t3 = t3 - t1
    Q = t3 - P
    return Q

def test_frobenius(ntests):
    for _ in range(0, ntests):
        a = F2.random_element()
        assert a.frobenius() == frobenius(a)

def test_psi(ntests):
    for _ in range(0, ntests):
        P = Ell.random_element()
        assert psi(psi(P)) - (bls12381_x + 1) * psi(P) + p * P == Ell(0, 1, 0)

def test_psi2(ntests):
    for _ in range(0, ntests):
        P = Ell.random_element()
        Q1 = psi(psi(P))
        Q2 = psi2(P)
        assert Q1 == Q2

def test_clear_cofactor_bls12381_g2(ntests):
    for _ in range(0, ntests):
        P = Ell.random_element()
        Q1 = h_eff * P
        Q2 = clear_cofactor_bls12381_g2(P)
        assert Q1 == Q2

if __name__ == "__main__":
    test_frobenius(4)
    test_psi(4)
    test_psi2(4)
    test_clear_cofactor_bls12381_g2(8)
