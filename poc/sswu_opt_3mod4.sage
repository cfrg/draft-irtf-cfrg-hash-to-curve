#!/usr/bin/sage
# vim: syntax=python

import sys
try:
    from sagelib.common import CMOV
    from sagelib.sswu_optimized import OptimizedSSWU
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

class OptimizedSSWU_3mod4(OptimizedSSWU):
    def __init__(self, F, A, B):
        assert F.order() % 4 == 3
        super(OptimizedSSWU_3mod4, self).__init__(F, A, B)

        # constants
        Z = self.Z
        q = F.order()
        c1 = (q - 3) / 4     # Integer arithmetic
        c2 = sqrt(-Z)
        (self.c1, self.c2) = (c1, c2)

        # map for testing
        self.ref_map = OptimizedSSWU(F, self.A, self.B)

    def sqrt_ratio_3mod4(self, u, v):
        c1 = self.c1
        c2 = self.c2

        tv1 = v^2
        tv2 = u * v
        tv1 = tv1 * tv2
        y1 = tv1^c1
        y1 = y1 * tv2
        y2 = y1 * c2
        tv3 = y1^2
        tv3 = tv3 * v
        isQR = tv3 == u
        y = CMOV(y2, y1, isQR)

        return (isQR, y)

    def sqrt_ratio(self, u, v):
        (b1, y1) = super(OptimizedSSWU_3mod4, self).sqrt_ratio(u, v)
        (b2, y2) = self.sqrt_ratio_3mod4(u, v)
        assert b1 == b2
        assert y1^2 == y2^2
        return (b2, y2)

    def test_map(self, u=None):
        F = self.F
        A = self.A
        B = self.B
        if u is None:
            u = F.random_element()
        (xn, yn, zn) = self.map_to_curve(u)
        x = xn / zn
        y = yn / zn
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
