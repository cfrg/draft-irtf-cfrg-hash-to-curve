from hash_to_base import *
from utils import *
load("common.sage")

p = PrimeDict["SS132"]
m = 1
q = p^m
F = GF(q)
A = F(0)
B = F(1)
E = EllipticCurve(F, [A, B])

h2c_suite = "H2C-SS132-SHA256-BF-"

# Reference implementation
def bonehfranklin(alpha):
    assert q%3 == 2
    u = h2b_from_label(h2c_suite, alpha)
    x = (u^2 - B)^((2*p-1)//3)
    return E(x, u) # raises expection if not on curve

# Constants
ONE_THIRD = (2 * p - 1) // 3 # Integer Arithmetic

# Constant Time Implementation
def bonehfranklin_CT(alpha):
    u = h2b_from_label(h2c_suite, alpha)
    tv("u ", u, 17)

    t1 = u ^ 2
    t1 = t1 - B
    assert t1 == u^2 - B
    tv("t1", t1, 17)

    x = t1 ^ ONE_THIRD
    assert x == ((u^2 - B)^((2*p-1)//3))
    y = u
    return E(x, y)

if __name__ == "__main__":
    enable_debug()
    print "## Boneh-Franklin to Supersingular132"
    for alpha in map2curve_alphas:
        print "\n~~~"
        print("Input:")
        print("")
        tv_text("alpha", pprint_hex(alpha))
        print("")
        print("Intermediate values:")
        print("")
        pA, pB = bonehfranklin(alpha), bonehfranklin_CT(alpha)
        assert pA == pB
        print("")
        print("Output:")
        print("")
        tv("x", pB[0], 17)
        tv("y", pB[1], 17)
        print "~~~"
