import hashlib
from utils import *

# Hash bytestring input to a field element.
def hash_to_base(x, i, H, hbits, p, label):
    F = GF(p)
    assert hbits >= floor(log(p, 2).n()) + 1
    i =  i2osp(i, 4) # interpret i as a 4-byte le unsigned integer
    xin = "h2c".encode() + label + i + x # concatenate inputs
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
def h2b_from_ciphersuite(x, i, label):
    (_, curve, hash_name, _, _) = label.split("-")
    if curve == "Curve25519":
        p = 2** 255 - 19
    elif curve == "P256":
        p = 2^256 - 2^224 + 2^192 + 2^96 - 1
    elif curve == "P384":
        p = 2^384 - 2^128  - 2^96 + 2^32 - 1
    else:
        raise ValueError("Curve %s is not recognied" % curve)

    if hash_name == "SHA256":
        H = hashlib.sha256
        hbits = H().digest_size * 8
    elif hash_name == "SHA384":
        H = hashlib.sha384
        hbits = H().digest_size * 8
    elif hash_name == "SHA512":
        H = hashlib.sha512
        hbits = H().digest_size * 8
    else:
        raise ValueError("Hash %s is not recognied" % curve)

    return hash_to_base(x, i, H, hbits, p, label)

if __name__ == "__main__":
    print("HashToBase(\"%s\", %s) = %s" % ("test", 0, h2b_from_ciphersuite("test", 0, "H2C-Curve25519-SHA256-Elligator-Clear")))
    print("HashToBase(\"%s\", %s) = %s" % ("test", 0, h2b_from_ciphersuite("test", 0, "H2C-P256-SHA512-SWU-")))
