#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.common import CMOV, square_root_random_sign
    from sagelib.sswu_generic import GenericSSWU
    from sagelib.z_selection import find_z_sswu
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

class OptimizedSSWU_3mod4(object):
    def __init__(self, F, A, B):
        assert F.order() % 4 == 3
        assert A != 0
        assert B != 0
        self.F = F
        self.A = F(A)
        self.B = F(B)

        # constants
        Z = find_z_sswu(F, self.A, self.B)
        q = F.order()
        self.Z = Z
        c1 = (q - 3) // 4           # Integer arithmetic
        c2 = sqrt(-Z^3)
        (self.c1, self.c2) = (c1, c2)

        # map for testing
        self.ref_map = GenericSSWU(F, self.A, self.B)
        self.ref_map.set_sqrt(square_root_random_sign)

    def map_to_curve(self, u):
        sgn0 = self.ref_map.sgn0
        A = self.A
        B = self.B
        F = self.F
        Z = self.Z
        c1 = self.c1
        c2 = self.c2
        u = F(u)

        tv1 = u^2
        tv3 = Z * tv1
        tv2 = tv3^2
        xd = tv2 + tv3
        x1n = xd + 1
        x1n = x1n * B
        xd = -A * xd
        e1 = xd == 0
        xd = CMOV(xd, Z * A, e1)  # If xd == 0, set xd = Z * A
        tv2 = xd^2
        gxd = tv2 * xd             # gxd == xd^3
        tv2 = A * tv2
        gx1 = x1n^2
        gx1 = gx1 + tv2            # x1n^2 + A * xd^2
        gx1 = gx1 * x1n            # x1n^3 + A * x1n * xd^2
        tv2 = B * gxd
        gx1 = gx1 + tv2            # x1n^3 + A * x1n * xd^2 + B * xd^3
        tv4 = gxd^2
        tv2 = gx1 * gxd
        tv4 = tv4 * tv2            # gx1 * gxd^3
        y1 = tv4^c1               # (gx1 * gxd^3)^((q - 3) / 4)
        y1 = y1 * tv2             # gx1 * gxd * (gx1 * gxd^3)^((q - 3) / 4)
        x2n = tv3 * x1n            # x2 = x2n / xd = Z * u^2 * x1n / xd
        y2 = y1 * c2              # y2 = y1 * sqrt(-Z^3)
        y2 = y2 * tv1
        y2 = y2 * u
        tv2 = y1^2
        tv2 = tv2 * gxd
        e2 = tv2 == gx1
        xn = CMOV(x2n, x1n, e2)   # If e2, x = x1, else x = x2
        y = CMOV(y2, y1, e2)     # If e2, y = y1, else y = y2
        e3 = sgn0(u) == sgn0(y)   # Fix sign of y
        y = CMOV(-y, y, e3)
        return (xn, xd, y, 1)

    def test_map(self, u=None):
        F = self.F
        A = self.A
        B = self.B
        if u is None:
            u = F.random_element()
        (xn, xd, yn, yd) = self.map_to_curve(u)
        x = xn / xd
        y = yn / yd
        assert y^2 == x^3 + A * x + B
        (xp, yp, zp) = self.ref_map.map_to_curve(u)
        xp = xp / zp
        yp = yp / zp
        assert xp == x
        assert yp == y

    def test(self):
        for und in self.ref_map.undefs:
            self.test_map(und)
        for _ in range(0, 256):
            self.test_map()

p_p256 = 2^256 - 2^224 + 2^192 + 2^96 - 1
F_p256 = GF(p_p256)
B_p256 = 0x5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b
test_p256 = OptimizedSSWU_3mod4(F_p256, -3, B_p256)
assert test_p256.Z == F_p256(-10)

p_p384 = 2^384 - 2^128 - 2^96 + 2^32 - 1
F_p384 = GF(p_p384)
B_p384 = 0xb3312fa7e23ee7e4988e056be3f82d19181d9c6efe8141120314088f5013875ac656398d8a2ed19d2a85c8edd3ec2aef
test_p384 = OptimizedSSWU_3mod4(F_p384, -3, B_p384)
assert test_p384.Z == F_p384(-12)

p_p521 = 2^521 - 1
F_p521 = GF(p_p521)
B_p521 = 0x51953eb9618e1c9a1f929a21a0b68540eea2da725b99b315f3b8b489918ef109e156193951ec7e937b1652c0bd3bb1bf073573df883d2c34f1ef451fd46b503f00
test_p521 = OptimizedSSWU_3mod4(F_p521, -3, B_p521)
assert test_p521.Z == F_p521(-4)

# curve isogenous to secp256k1
p_secp256k1 = 2^256 - 2^32 - 2^9 - 2^8 - 2^7 - 2^6 - 2^4 - 1
F_secp256k1 = GF(p_secp256k1)
Ap_secp256k1 = 0x3f8731abdd661adca08a5558f0f5d272e953d363cb6f0e5d405447c01a444533
Bp_secp256k1 = 1771
test_secp256k1 = OptimizedSSWU_3mod4(F_secp256k1, Ap_secp256k1, Bp_secp256k1)
assert test_secp256k1.Z == F_secp256k1(-11)

# curve isogenous to BLS12-381 G1
p_bls12381 = 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab
F_bls12381 = GF(p_bls12381)
Ap_bls12381g1 = 0x144698a3b8e9433d693a02c96d4982b0ea985383ee66a8d8e8981aefd881ac98936f8da0e0f97f5cf428082d584c1d
Bp_bls12381g1 = 0x12e2908d11688030018b12e8753eee3b2016c1f0f24f4070a0b9c14fcef35ef55a23215a316ceaa5d1cc48e98e172be0
test_bls12381g1 = OptimizedSSWU_3mod4(F_bls12381, Ap_bls12381g1, Bp_bls12381g1)
assert test_bls12381g1.Z == F_bls12381(11)

def test_sswu_3mod4():
    print("Testing P-256")
    test_p256.test()
    print("Testing P-384")
    test_p384.test()
    print("Testing P-521")
    test_p521.test()
    print("Testing secp256k1 isogeny")
    test_secp256k1.test()
    print("Testing BLS12-381 G1 isogeny")
    test_bls12381g1.test()

if __name__ == "__main__":
    test_sswu_3mod4()
