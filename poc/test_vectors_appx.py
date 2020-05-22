#!/usr/bin/python

import sys

P256 = ("NIST P-256",
        ("P256_XMD:SHA-256_SSWU_RO_"
        , "P256_XMD:SHA-256_SSWU_NU_"))

P384 = ("NIST P-384",
        ( "P384_XMD:SHA-512_SSWU_RO_"
        , "P384_XMD:SHA-512_SSWU_NU_"))

P521 = ("NIST P-521",
        ( "P521_XMD:SHA-512_SSWU_RO_"
        , "P521_XMD:SHA-512_SSWU_NU_"))

curve25519 = ("curve25519",
              ( "curve25519_XMD:SHA-512_ELL2_RO_"
              , "curve25519_XMD:SHA-512_ELL2_NU_"))

edwards25519 = ("edwards25519",
                ( "edwards25519_XMD:SHA-512_ELL2_RO_"
                , "edwards25519_XMD:SHA-512_ELL2_NU_"))

curve448 = ("curve448",
            ( "curve448_XMD:SHA-512_ELL2_RO_"
            , "curve448_XMD:SHA-512_ELL2_NU_"))

edwards448 = ("edwards448",
              ( "edwards448_XMD:SHA-512_ELL2_RO_"
              , "edwards448_XMD:SHA-512_ELL2_NU_"))

secp256k1 = ("secp256k1",
             ( "secp256k1_XMD:SHA-256_SSWU_RO_"
             , "secp256k1_XMD:SHA-256_SSWU_NU_"))

bls12381g1 = ("BLS12-381 G1",
              ( "BLS12381G1_XMD:SHA-256_SSWU_RO_"
              , "BLS12381G1_XMD:SHA-256_SSWU_NU_"))

bls12381g2 = ("BLS12-381 G2",
              ( "BLS12381G2_XMD:SHA-256_SSWU_RO_"
              , "BLS12381G2_XMD:SHA-256_SSWU_NU_"))

# section header
print("""
# Suite test vectors {#testvectors}

This section gives test vectors for each suite defined in {{suites}}.
The test vectors in this section were generated using code that is
available from {{hash2curve-repo}}.

Each test vector in this section lists values computed by the
appropriate encoding function, with variable names defined as
in {{roadmap}}.
For example, for a suite whose encoding type is random oracle,
the test vector gives the value for msg, u, Q0, Q1, and the
output point P.
""")

for curve in (P256, P384, P521, curve25519, edwards25519, curve448, edwards448, secp256k1, bls12381g1, bls12381g2):
    print("## %s\n" % curve[0])
    for suite in curve[1]:
        print("### %s\n\n~~~" % suite.replace("_", "\\_"))
        with open("ascii/%s.txt" % suite, "r") as f:
            sys.stdout.write(f.read())
        print("~~~\n")

expand_message_xmd_sha256 = ("expand_message_xmd(SHA-256)", "expand_message_xmd_SHA256")
expand_message_xmd_sha512 = ("expand_message_xmd(SHA-512)", "expand_message_xmd_SHA512")
expand_message_xof_shake128 = ("expand_message_xof(SHAKE-128)", "expand_message_xof_SHAKE_128")

# section header
print("""
# Expand test vectors {#expand-testvectors}

This section gives test vectors for expand_message variants specified in {{hashtofield-expand}}.
Each test vector in this section lists the expand_message name, hash, DST, and
security parameter, along with a series of tuples of the function inputs (msg),
outputs (pseudo_random_bytes), and intermediary values (dst_prime and msg_prime).
The expand_message input msg is represented as an ASCII string. Intermediate and
output values are represented as hexadecimal strings.
""")

for expander in (expand_message_xmd_sha256, expand_message_xmd_sha512, expand_message_xof_shake128):
    print("## %s\n" % expander[0])
    with open("ascii/%s.txt" % expander[1], "r") as f:
        print("~~~\n")
        sys.stdout.write(f.read())
        print("~~~\n")
