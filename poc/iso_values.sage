#!/usr/bin/sage
# vim: syntax=python

ZZR.<XX> = PolynomialRing(ZZ)
def show_elm(val):
    if val.parent().degree() == 1:
        return "0x%x" % val
    if val == 0:
        return "0"
    vals = [ (ii, vv) for (ii, vv) in enumerate(ZZR(val)) if vv > 0 ]
    ostrs = [None] * len(vals)
    for (idx, (ii, vv)) in enumerate(vals):
        if ii == 0:
            ostrs[idx] = "0x%x" % vv
        elif ii == 1:
            ostrs[idx] = "0x%x * I" % vv
        else:
            ostrs[idx] = "0x%x * I^%d" % (vv, ii)
    return " + ".join(ostrs)

def show_iso(iso):
    (xm, ym) = iso.rational_maps()
    maps = (xm.numerator(), xm.denominator(), ym.numerator(), ym.denominator())
    strs = ("x\\_num", "x\\_den", "y\\_num", "y\\_den")
    mstr = ""
    for (idx, (m, s)) in enumerate(zip(maps, strs), 1):
        max_jdx = -1
        skipped_one = False
        for ((jdx, _), val) in sorted(m.dict().items()):
            if val == 1 and jdx + 1 == len(m.dict()):
                skipped_one = True
                continue
            if jdx > max_jdx:
                max_jdx = jdx
            print("- k\\_(%d,%d) = %s" % (idx, jdx, show_elm(val)))
        if skipped_one:
            max_jdx += 1
            ostr = "x'^%d" % (max_jdx)
        else:
            ostr = "k\\_(%d,%d) * x'^%d" % (idx, max_jdx, max_jdx)
        start = max(0, max_jdx - 2)
        for jdx in reversed(range(start, max_jdx)):
            ostr += " + k\\_(%d,%d)" % (idx, jdx)
            if jdx > 0:
                ostr += " * x'"
                if jdx > 1:
                    ostr += "^%d" % jdx
        if start > 0:
            if start > 1:
                ostr += " + ..."
            ostr += " + k\\_(%d,0)" % idx
        mstr += "  - %s = %s\n" % (s, ostr)
        print()
    print()
    print(mstr)
    print()


# SECP256k1 iso
_iso_secp256k1 = None
def iso_secp256k1():
    global _iso_secp256k1
    if _iso_secp256k1 is not None:
        return _iso_secp256k1
    p = 2^256 - 2^32 - 2^9 - 2^8 - 2^7 - 2^6 - 2^4 - 1
    A = 0
    B = 7
    E = EllipticCurve(GF(p), [A, B])
    Ap = 0x3f8731abdd661adca08a5558f0f5d272e953d363cb6f0e5d405447c01a444533
    Bp = 1771
    Ep = EllipticCurve(GF(p), [Ap, Bp])
    iso = EllipticCurveIsogeny(E=E, kernel=None, codomain=Ep, degree=3).dual()
    if (- iso.rational_maps()[1])(1, 1) > iso.rational_maps()[1](1, 1):
        iso.switch_sign()
    _iso_secp256k1 = iso
    return iso

# BLS12-381 G1 iso
_iso_bls12381g1 = None
def iso_bls12381g1():
    global _iso_bls12381g1
    if _iso_bls12381g1 is not None:
        return _iso_bls12381g1
    p = 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab
    A = 0
    B = 4
    E = EllipticCurve(GF(p), [A, B])
    Ap = 0x144698a3b8e9433d693a02c96d4982b0ea985383ee66a8d8e8981aefd881ac98936f8da0e0f97f5cf428082d584c1d
    Bp = 0x12e2908d11688030018b12e8753eee3b2016c1f0f24f4070a0b9c14fcef35ef55a23215a316ceaa5d1cc48e98e172be0
    Ep = EllipticCurve(GF(p), [Ap, Bp])
    iso = EllipticCurveIsogeny(E=E, kernel=None, codomain=Ep, degree=11).dual()
    if (- iso.rational_maps()[1])(1, 1) > iso.rational_maps()[1](1, 1):
        iso.switch_sign()
    _iso_bls12381g1 = iso
    return iso

# BLS12-381 G2 iso
_iso_bls12381g2 = None
def iso_bls12381g2():
    global _iso_bls12381g2
    if _iso_bls12381g2 is not None:
        return _iso_bls12381g2
    p = 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab
    F.<II> = GF(p^2, modulus=[1,0,1])
    A = 0
    B = 4 * (1 + II)
    E = EllipticCurve(F, [A, B])
    Ap = 240 * II
    Bp = 1012 * (1 + II)
    Ep = EllipticCurve(F, [Ap, Bp])
    iso_kernel = [6 * (1 - II), 1]
    iso = EllipticCurveIsogeny(E=Ep, kernel=iso_kernel, codomain=E, degree=3)
    if (- iso.rational_maps()[1])(1, 1) > iso.rational_maps()[1](1, 1):
        iso.switch_sign()
    _iso_bls12381g2 = iso
    return iso

if __name__ == "__main__":
    print("** SECP256k1\n")
    show_iso(iso_secp256k1())
    print("** BLS12-381 G1\n")
    show_iso(iso_bls12381g1())
    print("** BLS12-381 G2\n")
    show_iso(iso_bls12381g2())
