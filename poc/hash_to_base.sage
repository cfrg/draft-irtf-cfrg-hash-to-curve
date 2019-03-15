import hashlib
from utils import *

# Format the input as `"h2c" || label || len(x) || x` (where || is concatenation)
# Since label is a fixed string, and len(x) is fixed to 4 bytes,
# this encoding is unambiguous
def format_input(label, x):
    prefix = "h2c"
    tv_text("prefix", pprint_hex(prefix))
    tv_text("label ", pprint_hex(label))
    tv_text("len(x)", pprint_hex(i2osp(len(x), 4)))
    tv_text("x     ", pprint_hex(x))
    m = "%s%s%s%s" % (prefix, label, i2osp(len(x), 4), x)
    tv_text("m     ", pprint_hex(m))
    return m

# Hash bytestring input to a field element.
def hash_to_base(x, H, hbits, p, label):
    assert type(x) is bytes
    F = GF(p)
    min_bits = floor(log(p, 2).n()) + 1
    assert not(min_bits >= hbits) , "Need at least %d bits to hash p. H only outputs %d" % (min_bits, hbits)
    xin = format_input(label, x) # concatenate inputs

    h = H()
    h.update(xin)
    t1 = h.digest()
    tv_text("H(m)  ",pprint_hex(t1))
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

    return hash_to_base(x, H, hbits, p, label)

if __name__ == "__main__":
    print "## Hash2base\n"

    vectors =[
        ["H2C-Curve25519-SHA256-Elligator-Clear", "ABC"],
        ["H2C-P256-SHA512-SSWU-", "ABC"],
        ["H2C-P384-SHA512-ICART-", "ABC"],
    ]
    enable_debug()
    for suite, input in vectors:
        print "~~~"
        print("y = hash2base(\"%s\", \"%s\")\n" % (suite, input))
        y = h2b_from_label(suite, input)
        tv_text("y     ",Hex(y))
        print "~~~"
