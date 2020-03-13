#!/usr/bin/python

import sys

P256 = ("NIST P-256",
        ("P256_XMD:SHA-256_SSWU_RO_"
        , "P256_XMD:SHA-256_SSWU_NU_"
        , "P256_XMD:SHA-256_SVDW_RO_"
        , "P256_XMD:SHA-256_SVDW_NU_"))

P384 = ("NIST P-384",
        ( "P384_XMD:SHA-512_SSWU_RO_"
        , "P384_XMD:SHA-512_SSWU_NU_"
        , "P384_XMD:SHA-512_SVDW_RO_"
        , "P384_XMD:SHA-512_SVDW_NU_"))

P521 = ("NIST P-521",
        ( "P521_XMD:SHA-512_SSWU_RO_"
        , "P521_XMD:SHA-512_SSWU_NU_"
        , "P521_XMD:SHA-512_SVDW_RO_"
        , "P521_XMD:SHA-512_SVDW_NU_"))

curve25519 = ("curve25519",
              ( "curve25519_XMD:SHA-256_ELL2_RO_"
              , "curve25519_XMD:SHA-256_ELL2_NU_"
              , "curve25519_XMD:SHA-512_ELL2_RO_"
              , "curve25519_XMD:SHA-512_ELL2_NU_"))

edwards25519 = ("edwards25519",
                ( "edwards25519_XMD:SHA-256_ELL2_RO_"
                , "edwards25519_XMD:SHA-256_ELL2_NU_"
                , "edwards25519_XMD:SHA-512_ELL2_RO_"
                , "edwards25519_XMD:SHA-512_ELL2_NU_"))

curve448 = ("curve448",
            ( "curve448_XMD:SHA-512_ELL2_RO_"
            , "curve448_XMD:SHA-512_ELL2_NU_"))

edwards448 = ("edwards448",
              ( "edwards448_XMD:SHA-512_ELL2_RO_"
              , "edwards448_XMD:SHA-512_ELL2_NU_"))

secp256k1 = ("secp256k1",
             ( "secp256k1_XMD:SHA-256_SSWU_RO_"
             , "secp256k1_XMD:SHA-256_SSWU_NU_"
             , "secp256k1_XMD:SHA-256_SVDW_RO_"
             , "secp256k1_XMD:SHA-256_SVDW_NU_"))

bls12381g1 = ("BLS12-381 G1",
              ( "BLS12381G1_XMD:SHA-256_SSWU_RO_"
              , "BLS12381G1_XMD:SHA-256_SSWU_NU_"
              , "BLS12381G1_XMD:SHA-256_SVDW_RO_"
              , "BLS12381G1_XMD:SHA-256_SVDW_NU_"))

bls12381g2 = ("BLS12-381 G2",
              ( "BLS12381G2_XMD:SHA-256_SSWU_RO_"
              , "BLS12381G2_XMD:SHA-256_SSWU_NU_"
              , "BLS12381G2_XMD:SHA-256_SVDW_RO_"
              , "BLS12381G2_XMD:SHA-256_SVDW_NU_"))

# section header
print("""
# Test vectors {#testvectors}

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
