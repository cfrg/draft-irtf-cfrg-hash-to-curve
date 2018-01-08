---
title: Hashing to Elliptic Curves
abbrev: hash-to-curve
docname: draft-goldberg-hash-to-curve-latest
date:
category: info

ipr: trust200902
keyword: Internet-Draft

stand_alone: yes
pi: [toc, sortrefs, symrefs]

author:
 -
    ins: S. Goldberg
    name: Sharon Goldberg
    org: Boston University
    street: 111 Cummington St, MCS135
    city: Boston
    country: United States of America
    email: goldbe@cs.bu.edu
 -
    ins: N. Sullivan
    name: Nick Sullivan
    org: Cloudflare
    street: 101 Townsend St
    city: San Francisco
    country: United States of America
    email: nick@cloudflare.com
 -
    ins: C. A. Wood
    name: Christopher A. Wood
    org: Apple Inc.
    street: 1 Infinite Loop
    city: Cupertino, Califoarnia 95014
    country: United States of America
    email: cawood@apple.com

normative:
  RFC2119:
  RFC6605:
  RFC7748:
  RFC8017:
  RFC8032:
  SECG1:
    title: SEC 1 -- Elliptic Curve Cryptography
    target: http://www.secg.org/sec1-v2.pdf
    authors:
      -
        ins: Standards for Efficient Cryptography Group (SECG)
        org: 
  Icart09:
    title: How to Hash into Elliptic Curves
    target: https://eprint.iacr.org/2009/226.pdf
    authors:
      -
        ins: T. Icart
        org: Sagem Securite and Universite du Luxembourg
  PrivacyPass:
    title: Privacy Pass
    target: https://github.com/privacypass/challenge-bypass-server
  ChaumPedersen:
    title: Wallet Databases with Observers
    target: https://chaum.com/publications/Wallet_Databases.pdf
    authors:
      -
        ins: D. Chaum
        org: CWI, The Netherlands
      -
        ins: T. P. Pedersen
        org: Aarhus University, Denmark
  
  ChaumBlindSignature:
    title: Blind Signatures for Untraceable Payments
    target: http://sceweb.sce.uhcl.edu/yang/teaching/csci5234WebSecurityFall2011/Chaum-blind-signatures.PDF
    authors:
      -
        ins: D. Chaum
        org: University of California, Santa Barabara, USA
  BLS01:
    title: Short signatures from the Weil pairing
    target: https://iacr.org/archive/asiacrypt2001/22480516.pdf
    authors:
      -
        ins: Dan Boneh
        org: Stanford University
      -
        ins: Ben Lynn
        org: Stanford University
      -
        ins: Hovav Shacham
        org: Stanford University
  BMP00:
    title: Provably secure password-authenticated key exchange using diffie-hellman
    venue: EUROCRYPT, pages 156–171, 2000.
    authors: 
      -
        ins: Victor Boyko
        org: 
      -
        ins: Philip D. MacKenzie
        org: 
      -
        ins: Sarvar Patel
        org: 
  Jablon96:
    title: Strong password-only authenticated key exchange
    venue: SIGCOMM Comput. Commun. Rev., 26(5), 5–26, 1996.
    authors:
      -
        ins: David P. Jablon
        org: 
  

--- abstract

XXX

--- middle

# Introduction

Many cryptographic protocols require a procedure which maps arbitrary input, e.g.,
passwords, to points on an elliptic curve (EC). Prominent examples include
Simple Password Exponential Key Exchange {{Jablon96}}, Password Authenticated 
Key exchange {{BMP00}}, and Boneh-Lynn-Shacham signatures {{BLS01}}. 

Probabilistic algorithms for this procedure, e.g., the MapToGroup function described by Boneh et al.
{{BLS01}}. Their algorithm fails with probability 2^I, where I is a tunable parameter
that one can control. Deterministic algorothms are needed in cases where failures 
are undesirable. Shallue and Woestijne {{9}} first introduced a deterministic 
algorithm that maps elements in F_{q} to an EC in time O(log^4 q), where q = p^n for 
some prime p, and time O(log^3 q) when q = 3 mod 4. Icart introduced yet another
deterministic algorithm which maps F_{q} to any EC where q = 2 mod 3 in time O(log^3 q).
Elligator (2) {{XXX}} is yet another deterministic algorithm for any odd-characteristic 
EC that has a point of order 2. Elligator can be applied to Curve25519 and Curve448, which 
CFRG-recommended curves {{RFC7748}}.

This document specifies three algorithms for deterministically hashing into an elliptic curve
with varying properties. Each algorithm conforms to a common interface, i.e., it maps
an element from a base field F to a curve E. For each variant, we describe the requirements
for F and E to make it work. Sample code for each variant is presented in the appendix. 

## Terminology

The following terms are used throughout this document.

- curve
- base field
- point of order
- point compression

## Requirements

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in {{RFC2119}}.

# Interface

The generic interface for hashing to elliptic curves is as follows:

~~~
hash_to_curve(alpha, x)
~~~

where alpha is a message to hash onto a curve and x is an additional 
point to include in this computation.

# Utility Functions

Algorithms in this document make use of utility functions described below.
Appendix XXX gives sample code for each of these variants. 

- EC2OSP: is specified in Section 2.3.3 of [SECG1] with point
compression on.  This implies m = 2n + 1 = 33.
- I2OSP: Coversion of a nonnegative integer to an octet string as
defined in Section 4.1 of {{RFC8017}}.
- OS2IP: Coversion of an octet string to a nonnegative integer as
defined in Section 4.2 of {{RFC8017}}.
- RS2ECP(h): OS2ECP(0x02 || h). The input h is a 32-octet string
and the output is either an EC point or "INVALID".

# Hashing Variants

## Try and Increment Method

The following hash_to_curve_increment(alpha, x) algorithm implements
a generic "try and increment" variant of hash_to_curve(alpha, x)
that works for any elliptic curve. Note that x is optional and, 
if omitted, is set to the identity element of the curve.

The running time of this algorithm depends on alpha. This algorithm 
is expected to find a valid curve point after approximately two 
attempts, i.e., when ctr=1, on average. See also {{Icart09}}.

However, because the running time of algorithm depends on alpha, this
algorithm SHOULD be avoided in applications where it is important
that alpha remain secret. 

This algorithm is suitable for NIST P-256 {{RFC6605}} and Curve25519 {{RFC7748}}.

~~~
hash_to_curve_increment(alpha, x)

Input:

  alpha - value to be hashed, an octet string

  x - public key, an EC point

Output:

    h - hashed value, a finite EC point in G

Steps:

1.  ctr = 0
2.  pk = EC2OSP(x)
3.  h = "INVALID"
4.  While h is "INVALID" or h is EC point at infinity:
    A.  CTR = I2OSP(ctr, 4)
    B.  ctr = ctr + 1
    C.  attempted_hash = Hash(pk || alpha || CTR)
    D.  h = RS2ECP(attempted_hash)
    E.  If h is not "INVALID" and cofactor > 1, set h = h^cofactor
5.  Output h
~~~

## Icart Method

The following hash_to_curve_icart(alpha, x) algorithm implements
a constant-time variant of hash_to_curve(alpha, x). This algorithm
works for any curve over F_{p^n}, where p = 2 mod 3, including:

- P384
- Curve1174
- Ed448-Goldilocks

Unsupported curves include: P224, P256, P521, and Curve25519 since,
for each, p = 1 mod 3.


<!-- https://iacr.org/archive/crypto2009/56770300/56770300.pdf -->
<!-- http://www.crypto-uni.lu/jscoron/cours/mics3crypto/shash.pdf -->

~~~
hash_to_curve_icart(alpha, x)

Input:

  alpha - value to be hashed, an octet string

  x - public key, an EC point

Output:

    h - hashed value, a finite EC point in G

Steps:

1. u = OS2IP(alpha) // map to Fp
2. v = (3a - u^4) / 6u
3. beta = (v^2 - b - (u^6)/27)
4. beta = beta ^ ((2p - 1) / 3)
5. x = beta + ((u^2) / 3)
6. y = ux + v

## Elligator 2 Method

The following hash_to_curve_elligator2(alpha, x) algorithm implements
another constant0time variant of hash_to_curve(alpha, x). This algorithm
works for any curve (over large characteristic field). 

~~~
hash_to_curve_elligator2(alpha, x)

Input:

  alpha - value to be hashed, an octet string

  x - public key, an EC point

Output:

    h - hashed value, a finite EC point in G

Steps:

1. r = H(alpha) // H is a hash to the base field F


* Compute whether f(-A/(1+ur^2)) is square.  If so, compute its square root.
* If not, compute the square root of f(-Aur^2/(1+ur^2)) = ur^2 f(-A/(1+ur^2)).

# Security Considerations

TODO

# Acknowledgements

TODO

--- back

# Sage Sample Code

((See poc/poc.sage))

