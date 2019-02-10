import hashlib
from utils import *

# Format the input as `"h2b" || label || i || len(x) || x` (where || is concatenation)
# Since label is a fixed string, and i, len(x) are fixed to 4 bytes,
# this encoding is unambiguous
def format_input(label, i, x):
    return "h2b%s%s%s%s" % (label, i, i2osp(len(x), 4), x)

# Hash bytestring input to a field element.
def hash_to_base(x, i, H, hbits, p, label):
    assert type(x) is bytes
    F = GF(p)
    min_bits = floor(log(p, 2).n()) + 1
    assert hbits >= min_bits, "Need at least %d bits to hash p. H only outputs %d" % (min_bits, hbits)
    i =  i2osp(i, 4) # interpret i as a 4-byte le unsigned integer
    xin = format_input(label, i, x) # concatenate inputs
    h = H()
    h.update(xin)
    t1 = h.digest()
    t1 = os2ip(t1) # recover integer from hash output
    # s = t1 >> (hbits - 1)
    t2 = t1 & ((1 << hbits) - 1)
    t3 = ZZ(t2)
    y = t3 % p
    return F(y)

# Helper function to extract parameters from a ciphersuite label
def h2b_from_label(label, x, i=0):
    cs = Ciphersuite(label)
    H = cs.hash.H
    hbits = cs.hash.hbits()
    p = cs.curve.p

    value = hash_to_base(x, i, H, hbits, p, label)
    if len(x) == 0 and DEBUG:
        print("HashToBase('" + label + "', nil, " + str(i) + ") = \n\t" + str(value))
    elif DEBUG:
        print("HashToBase('" + label + "', " + pprint_hex(x) + ", " + str(i) + ") = \n\t" + str(value))
    return value

if __name__ == "__main__":
    print "## Sample HashToBase"
    print ""

    DEBUG = False
    print "~~~"
    print("HashToBase(\"%s\", %s, %d) \n\t = %s\n" % ("H2C-Curve25519-SHA256-Elligator-Clear", pprint_hex("\x12\x34"), 0, h2b_from_label("H2C-Curve25519-SHA256-Elligator-Clear", "\x12\x34", 0)))
    print("HashToBase(\"%s\", %s, %d) \n\t = %s\n" % ("H2C-Curve25519-SHA256-Elligator-Clear", pprint_hex("\x12\x34"), 1, h2b_from_label("H2C-Curve25519-SHA256-Elligator-Clear", "\x12\x34", 1)))
    print("HashToBase(\"%s\", %s, %d) \n\t= %s\n" % ("H2C-P256-SHA512-SWU-", pprint_hex("\x12\x34"), 0, h2b_from_label("H2C-P256-SHA512-SWU-", "\x12\x34", 0)))
    print("HashToBase(\"%s\", %s, %d) \n\t= %s\n" % ("H2C-P256-SHA512-SWU-", pprint_hex("\x12\x34"), 1, h2b_from_label("H2C-P256-SHA512-SWU-", "\x12\x34", 1)))
    print "~~~"
