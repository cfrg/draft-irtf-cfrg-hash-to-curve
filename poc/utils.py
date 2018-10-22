import struct

# Convert an non-negative integer into n bytes
def i2osp(i, n):
    i = int(i)
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

def pprint_hex(os):
    return " ".join("{:02x}".format(ord(c)) for c in os)

def from_hex_string(str):
    os = "".join(chr(int(b, 16)) for b in str.split(" "))
    return os2ip(os)

def tv(debug, fmt, v, len):
    if debug:
        print(fmt % pprint_hex(i2osp(v, len)))