# Hash-to-curve poc/reference code

You'll need [Sage](https://sagemath.org) to run this code.
In addition, you'll need a reasonably modern version of make (GNU make works well).

## Getting started

1. `make` --- This preprocesses the sage files. If you don't do this, you'll get
   an error message telling you to do it.

2. `make test` --- runs all tests. This takes several minutes.

3. Alternatively, most files will self-test if executed with sage, e.g.,
   `sage suite_p256.sage`.

4. `make vectors` --- generates all test vectors.

# In more detail

This section gives the correspondence between sections of
[draft-irtf-cfrg-hash-to-curve-05](https://tools.ietf.org/html/draft-irtf-cfrg-hash-to-curve-05)
and the code in this directory.

## Utility Functions (hash-to-curve-05 Section 4)

`common.sage` implements CMOV, sgn0, and sqrt functions described in the document.
It also provides helpers for creating domain separation tags used in the test vectors.

`curves.sage` implements 'native' Montgomery and Edwards curve objects similar to
(but less full-featured than) the Sage EllipticCurve() object (which only supports
curves in Weierstrass form). These are intended only for testing---they're slow!

`hash_to_field.py` implements OS2IP and I2OSP.

## Hashing to a Finite Field (hash-to-curve-05 Section 5)

`hash_to_field.py` implements the hash\_to\_field function. The arguments are as follows:

- `msg` and `count` are the arguments to hash\_to\_field of the same name.
- `dst` is the domain separation tag.
- `modulus` is p, the characteristic of the target field F.
- `degree` is m, the extension degree of the target field F.
- `blen` is L, the length in bytes of the values that are reduced modulo p.
- `expand_fn` is either `expand_message_xof` or `expand_message_xmd`, which are also defined in `hash_to_field.py`.
- `hash_fn` is a hash function or XOF from Python's hashlib, e.g., `hashlib.sha256` or `hashlib.shake_128`.
- `security_param` is k, the target security level in bits (e.g., 128).

## Deterministic Mappings (hash-to-curve-05 Section 6)

The following files implement the deterministic mappings:

- Shallue-van de Woestijne: `svdw_generic.sage`

- Simplified SWU: `sswu_generic.sage`

- Elligator 2: `ell2_generic.sage`

- Elligator 2 for Twisted Edwards curves: `ell2edw_generic.sage`

All of these have the same interface: they define a class (e.g., `GenericSvdW` for
the Shallue-van de Woestijne map) that takes as arguments the field `F` (constructed
using Sage's `GF()` constructor) and the elliptic curve coefficients `A` and `B`
(or `a` and `d`, etc.). The return value is an object with a `map_to_curve` method
that takes `u` in `F` as its sole argument.

## Cofactor Clearing (hash-to-curve-05 Section 7)

Cofactor clearing is implemented via scalar multiplication in the hash-to-curve suite
framework (see immediately below).

## Suites (hash-to-curve-05 Section 8)

`h2c_suite.sage` implements a generic framework for constructing hash-to-curve suites
given the suite parameters. The following files demonstrate how this framework can
be used, and implement all of the suites defined in the draft:

- `suite_p256.sage`, `suite_p384.sage`, and `suite_p521.sage` implement the NIST curves.

- `suite_25519.sage` and `suite_448.sage` implement the suites to the Edwards and Montgomery
  curves from RFC 7748.

- `suite_secp256k1.sage` implements the suites to the secp256k1 curve.

- `suite_bls12381g1.sage` and `suite_bls12381g2.sage` implement the suites to the
  BLS12-381 curves.

## Rational maps (hash-to-curve-05 Appendix B)

`map_check.sage` implements and verifies all rational maps given in this section.

## Isogeny maps (hash-to-curve-05 Appendix C)

`iso_values.sage` constructs the isogenies defined in this section.

## Optimized mappings (hash-to-curve-05 Appendix D)

`sswu_opt.sage`, `ell2_25519_opt.sage`, and `ell2_448_opt.sage` implement the
optimized mappings given in this section.

## Z Selection Pseudocode (hash-to-curve-05 Appendix E)

`z_selection.sage` implements the parameter generation scripts give in this section.
`z_values.sage` prints out the Z values for all curves given in Suites.
