import hashlib
import struct

# Curve25519
p = 2**255 - 19
F = GF(p)
A = 486662
B = 1

# Curve448
# p = 2^448 - 2^224 - 1
# F = GF(p)
# A = 156326

prime = p
<<<<<<< HEAD
H = hashlib.sha512
hbits = 512
assert hbits >= floor(log(p, 2).n()) + 2
label = "H2C-Curve25519-SHA512-Elligator2-Clear".encode()
=======
H = hashlib.sha256
hbits = 256
assert hbits >= floor(log(p, 2).n()) + 2
label = "h2b-curve25519-sha256".encode()
>>>>>>> WIP specifics of HashToBase.

def hash_to_base(x, i):
    i =  i2osp(i, 4) # interpret i as a 4-byte le unsigned integer
    xin = "h2c".encode() + label + i + x # concatenate inputs
    h = H()
    h.update(xin)
    t1 = h.digest()
    t1 = os2ip(t1) # recover integer from hash output
    s = t1 >> (hbits - 1)
    t2 = t1 & ((1 << (hbits - 1)) - 1)
    t3 = ZZ(t2)
    y = t3 % prime
    return (F(y), s)

# Convert an non-negative integer into n bytes
def i2osp(i, n):
    res = [0]*n
    for idx in range(n-1, -1, -1):
        res[idx] = i & 0xff
        i = i >> 8
    if i > 0:
        raise ValueError("Integer %s cannot fit into %s bytes" % (i, n))
    return struct.pack("<" + "B" * n, *res)

# Convert octal string into to integer
def os2ip(os):
    res = 0
    for (idx, b) in enumerate(struct.unpack("<" + "B" * len(os), os)):
        res = res << 8
        res += b
    return res

print("HashToBase(\"%s\", %s) = %s" % ("test", 0, hash_to_base("test", 0)))