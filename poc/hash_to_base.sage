import hashlib
from utils import *

# Format the input as `"h2b" || label || len(x) || x` (where || is concatenation)
# Since label is a fixed string, and len(x) is fixed to 4 bytes,
# this encoding is unambiguous
def format_input(label, x):
    return "h2b%s%s%s" % (label, i2osp(len(x), 4), x)

# Hash bytestring input to a field element.
def hash_to_base(x, H, hbits, p, label):
    assert type(x) is bytes
    F = GF(p)
    min_bits = floor(log(p, 2).n()) + 1
    assert hbits >= min_bits, "Need at least %d bits to hash p. H only outputs %d" % (min_bits, hbits)
    xin = format_input(label, x) # concatenate inputs
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
def h2b_from_label(label, x):
    cs = Ciphersuite(label)
    H = cs.hash.H
    hbits = cs.hash.hbits()
    p = cs.curve.p

    value = hash_to_base(x, H, hbits, p, label)
    if len(x) == 0 and DEBUG:
        print("hash2base('" + label + "', nil ) = \n\t" + str(value))
    elif DEBUG:
        print("hash2base('" + label + "', " + pprint_hex(x) + ") = \n\t" + str(value))
    return value

if __name__ == "__main__":
    print "## Sample hash2base"
    print ""

    DEBUG = False
    print "~~~"
    print("hash2base(\"%s\", %s) \n\t= %s\n" % ("H2C-Curve25519-SHA256-Elligator-Clear", pprint_hex("\x12\x34"), Hex(h2b_from_label("H2C-Curve25519-SHA256-Elligator-Clear", "\x12\x34"))))
    print("hash2base(\"%s\", %s) \n\t= %s\n" % ("H2C-P256-SHA512-SWU-", pprint_hex("\x12\x34"), Hex(h2b_from_label("H2C-P256-SHA512-SWU-", "\x12\x34"))))
    print("hash2base(\"%s\", %s) \n\t= %s\n" % ("H2C-P256-SHA512-SSWU-", pprint_hex("\x12\x34"), Hex(h2b_from_label("H2C-P256-SHA512-SSWU-", "\x12\x34"))))
    print "~~~"
