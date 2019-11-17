import hashlib
from utils import *

# Format the input as `"h2b" || label || len(x) || x` (where || is concatenation)
# Since label is a fixed string, and len(x) is fixed to 4 bytes,
# this encoding is unambiguous
def format_input(label, x):
    return "h2b%s%s%s" % (label, i2osp(len(x), 4), x)

# Hash bytestring input to a field element.
def hash_to_base(x, H, p, label, words_per_elm, n_elms, ctr):
    assert type(x) is bytes
    F = GF(p)
    
    # first, hash the input
    ### NOTE that when computing hash_to_base multiple times on
    ###      the same x and different ctr values, one can optimize
    ###      what's below by only computing H(xin).
    xin = format_input(label, x)
    h = H()
    h.update(xin)
    m_prime = h.digest() + i2osp(ctr, 1)
    del h

    # create the requested outputs
    ret_vals = [None] * n_elms
    for idx in range(0, n_elms):
        # for each output, evaluate the hash words_per_elm times
        t = b""
        for jdx in range(0, words_per_elm):
            h = H()
            h.update(m_prime + i2osp(idx, 1) + i2osp(jdx, 1))
            t += h.digest()
        ret_vals[idx] = F(os2ip(t))

    return ret_vals

# Helper function to extract parameters from a ciphersuite label
def h2b_from_label(label, x, m=1, k=128, ctr=0):
    cs = Ciphersuite(label)
    H = cs.hash.H
    hbits = cs.hash.hbits()
    p = cs.curve.p

    if m < 1:
        raise RuntimeError("invalid extension degree; must be >= 1")

    if len(x) == 0 and DEBUG:
        print("hash2base('" + label + "', nil ) = \n\t" + str(value))
    elif DEBUG:
        print("hash2base('" + label + "', " + pprint_hex(x) + ") = \n\t" + str(value))

    # round up number of words per element
    words_per_elm = (int(p).bit_length() + k + hbits - 1) // hbits
    vals = hash_to_base(x, H, p, label, words_per_elm, m, ctr)
    if m == 1:
        return vals[0]
    return vals

if __name__ == "__main__":
    print "## Sample hash2base"
    print ""

    DEBUG = False
    print "~~~"
    print("hash2base(\"%s\", %s) \n\t= %s\n" % ("H2C-Curve25519-SHA256-Elligator-Clear", pprint_hex("\x12\x34"), Hex(h2b_from_label("H2C-Curve25519-SHA256-Elligator-Clear", "\x12\x34"))))
    print("hash2base(\"%s\", %s) \n\t= %s\n" % ("H2C-P256-SHA512-SWU-", pprint_hex("\x12\x34"), Hex(h2b_from_label("H2C-P256-SHA512-SWU-", "\x12\x34"))))
    print("hash2base(\"%s\", %s) \n\t= %s\n" % ("H2C-P256-SHA512-SSWU-", pprint_hex("\x12\x34"), Hex(h2b_from_label("H2C-P256-SHA512-SSWU-", "\x12\x34"))))
    print "~~~"
