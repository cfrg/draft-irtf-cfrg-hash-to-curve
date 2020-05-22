#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.common import sgn0_be
    from sagelib.z_selection import find_z_sswu, find_z_svdw, find_z_ell2
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

def print_neg(x):
    sign_str = "" if sgn0_be(x) == 1 else "-"
    x_str = str(min(x, -x))
    if x.parent().degree() > 1 and sign_str == "-":
        return "%s(%s)" % (sign_str, x_str)
    return "%s%s" % (sign_str, x_str)

# NIST P-256
F = GF(2^256 - 2^224 + 2^192 + 2^96 - 1)
A = F(-3)
B = F(0x5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b)
print("** NIST P-256")
print("SSWU Z:", print_neg(find_z_sswu(F, A, B)))
print("SvdW Z:", print_neg(find_z_svdw(F, A, B)))
print()

# NIST P-384
F = GF(2^384 - 2^128 - 2^96 + 2^32 - 1)
A = F(-3)
B = F(0xb3312fa7e23ee7e4988e056be3f82d19181d9c6efe8141120314088f5013875ac656398d8a2ed19d2a85c8edd3ec2aef)
print("** NIST P-384")
print("SSWU Z:", print_neg(find_z_sswu(F, A, B)))
print("SvdW Z:", print_neg(find_z_svdw(F, A, B)))
print()

# NIST P-521
F = GF(2^521 - 1)
A = F(-3)
B = F(0x51953eb9618e1c9a1f929a21a0b68540eea2da725b99b315f3b8b489918ef109e156193951ec7e937b1652c0bd3bb1bf073573df883d2c34f1ef451fd46b503f00)
print("** NIST P-521")
print("SSWU Z:", print_neg(find_z_sswu(F, A, B)))
print("SvdW Z:", print_neg(find_z_svdw(F, A, B)))
print()

# Curve25519
F = GF(2^255 - 19)
print("** Curve25519")
print("Ell2 Z:", print_neg(find_z_ell2(F)))
print()

# Curve448
F = GF(2^448 - 2^224 - 1)
print("** Curve448")
print("Ell2 Z:", print_neg(find_z_ell2(F)))
print()

# secp256k1
F = GF(2^256 - 2^32 - 2^9 - 2^8 - 2^7 - 2^6 - 2^4 - 1)
A = 0
B = 7
Ap = 0x3f8731abdd661adca08a5558f0f5d272e953d363cb6f0e5d405447c01a444533
Bp = 1771
# make sure E' is isogenous to E
assert EllipticCurve(F, [A, B]).order() == EllipticCurve(F, [Ap, Bp]).order()
print("** secp256k1")
print("SSWU Z:", print_neg(find_z_sswu(F, Ap, Bp)))
print("SvdW Z:", print_neg(find_z_svdw(F, A, B)))
print()

# BLS12-381 G1
F = GF(0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab)
A = 0
B = 4
Ap = 0x144698a3b8e9433d693a02c96d4982b0ea985383ee66a8d8e8981aefd881ac98936f8da0e0f97f5cf428082d584c1d
Bp = 0x12e2908d11688030018b12e8753eee3b2016c1f0f24f4070a0b9c14fcef35ef55a23215a316ceaa5d1cc48e98e172be0
# make sure that E' is isogenous to E
assert EllipticCurve(F, [A, B]).order() == EllipticCurve(F, [Ap, Bp]).order()
print("** BLS12-381 G1")
print("SSWU Z:", print_neg(find_z_sswu(F, Ap, Bp)))
print("SvdW Z:", print_neg(find_z_svdw(F, A, B)))
print()

# BLS12-381 G2
p = 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab
F.<II> = GF(p**2, modulus=[1, 0, 1])
A = 0
B = 4 * (1 + II)
Ap = 240 * II
Bp = 1012 * (1 + II)
# make sure that E' is isogenous to E
assert EllipticCurve(F, [A, B]).order() == EllipticCurve(F, [Ap, Bp]).order()
print("** BLS12-381 G2")
print("SSWU Z:", print_neg(find_z_sswu(F, Ap, Bp)))
print("SvdW Z:", print_neg(find_z_svdw(F, A, B)))
print()
