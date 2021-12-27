#!/usr/bin/python

import sys

P256 = ("NIST P-256",
        ("P256_XMD:SHA-256_SSWU_RO_"
        , "P256_XMD:SHA-256_SSWU_NU_"))

P384 = ("NIST P-384",
        ( "P384_XMD:SHA-384_SSWU_RO_"
        , "P384_XMD:SHA-384_SSWU_NU_"))

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
            ( "curve448_XOF:SHAKE256_ELL2_RO_"
            , "curve448_XOF:SHAKE256_ELL2_NU_"))

edwards448 = ("edwards448",
              ( "edwards448_XOF:SHAKE256_ELL2_RO_"
              , "edwards448_XOF:SHAKE256_ELL2_NU_"))

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

expand_message_xmd_sha256_long = ("expand_message_xmd(SHA-256) (long DST)", "expand_message_xmd_SHA256_256")
expand_message_xmd_sha256 = ("expand_message_xmd(SHA-256)", "expand_message_xmd_SHA256_38")
expand_message_xmd_sha512 = ("expand_message_xmd(SHA-512)", "expand_message_xmd_SHA512_38")
expand_message_xof_shake128_long = ("expand_message_xof(SHAKE128) (long DST)", "expand_message_xof_SHAKE128_256")
expand_message_xof_shake128 = ("expand_message_xof(SHAKE128)", "expand_message_xof_SHAKE128_36")
expand_message_xof_shake256 = ("expand_message_xof(SHAKE256)", "expand_message_xof_SHAKE256_36")

# section header
print("""
# Expand test vectors {#expand-testvectors}

This section gives test vectors for expand_message variants specified in {{hashtofield-expand}}.
The test vectors in this section were generated using code that is
available from {{hash2curve-repo}}.

Each test vector in this section lists the expand_message name, hash function, and DST,
along with a series of tuples of the function inputs (msg and len_in_bytes),
output (uniform_bytes), and intermediate values (dst_prime and msg_prime).
DST and msg are represented as ASCII strings.
Intermediate and output values are represented as byte strings in hexadecimal.
""")

for expander in (expand_message_xmd_sha256, expand_message_xmd_sha256_long, expand_message_xmd_sha512, expand_message_xof_shake128, expand_message_xof_shake128_long, expand_message_xof_shake256):
    print("## %s\n" % expander[0])
    with open("ascii/%s.txt" % expander[1], "r") as f:
        print("~~~\n")
        sys.stdout.write(f.read())
        print("~~~\n")
