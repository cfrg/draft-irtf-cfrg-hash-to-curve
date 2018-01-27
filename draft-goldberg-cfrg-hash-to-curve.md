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
  ECOPRF:
    title: TODO
    venue: TODO
    authors:
      -
        ins: TODO
        org: 
  Elligator2:
    title: TODO
    venue: TODO
    authors:
      -
        ins: TODO
        org: 
  

--- abstract

XXX

--- middle

# Introduction

Many cryptographic protocols require a procedure which maps arbitrary input, e.g.,
passwords, to points on an elliptic curve (EC). Prominent examples include
Simple Password Exponential Key Exchange {{Jablon96}}, Password Authenticated 
Key exchange {{BMP00}}, and Boneh-Lynn-Shacham signatures {{BLS01}}. 

Let E be an elliptic curve over base field GF(p). In practice, efficient
(polynomial-time) functions that hash arbitrary input to E can be constructed
by composing a cryptographically secure hash function F1 : {0,1}^* ->GF(p)
and an injection F2 : GF(p) -> E, i.e., Hash(m) = F2(F1(m)).
Probabilistic constructions of Hash, e.g., the MapToGroup function described by Boneh et al.
{{BLS01}}. Their algorithm fails with probability 2^I, where I is a tunable parameter
that one can control. Another variant, dubbed the "Try and Increment" approach,
was described by Burns et al. {{ECOPRF}}. This function works by hashing 
input m using a standard hash function, e.g., SHA256, and then checking to see 
if the resulting point E(m, f(m)), for curve function f, belongs on E.
This algorithm is expected to find a valid curve point after approximately two 
attempts, i.e., when ctr=1, on average. See also {{Icart09}}.

~~~
1. ctr = 0
3. h = "INVALID"
4. While h is "INVALID" or h is EC point at infinity:
   A.  CTR = I2OSP(ctr, 4)
   B.  ctr = ctr + 1
   C.  attempted_hash = Hash(m || CTR)
   D.  h = RS2ECP(attempted_hash)
   E.  If h is not "INVALID" and cofactor > 1, set h = h^cofactor
5. Output h
~~~

Since the running time of algorithm depends on m, this algorithm is
not safe for cases sensitive to timing side channel attacks. 
Deterministic algorithms are needed in such cases where failures 
are undesirable. Shallue and Woestijne ((TODO:cite)) first introduced a deterministic 
algorithm that maps elements in F_{q} to an EC in time O(log^4 q), where q = p^n for 
some prime p, and time O(log^3 q) when q = 3 mod 4. Icart introduced yet another
deterministic algorithm which maps F_{q} to any EC where q = 2 mod 3 in time O(log^3 q).
Elligator (2) {{Elligator2}} is yet another deterministic algorithm for any odd-characteristic 
EC that has a point of order 2. Elligator can be applied to Curve25519 and Curve448, which 
CFRG-recommended curves {{RFC7748}}.

This document specifies N algorithms for deterministically hashing into an elliptic curve
with varying properties. Each algorithm conforms to a common interface, i.e., it maps
an element from a base field F to a curve E. For each variant, we describe the requirements
for F and E to make it work. Sample code for each variant is presented in the appendix. 
Unless otherwise stated, all elliptic curve points are assumed to be represented as affine
coordinates, i.e., (x, y) points on a curve.

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

# Interfaces

The generic interface for hashing to elliptic curves is as follows:

~~~
hash_to_curve(alpha)
~~~

where alpha is a message to hash onto a curve. It is often useful to include
an additional point on the curve to bind with this computation. This variant
of "binding" hash has the following interface:

~~~
hash_to_curve_and_bind(alpha, beta)
~~~

where alpha is a message to hash onto a curve and beta is an additional
point on the curve.

# Utility Functions

Algorithms in this document make use of utility functions described below.

((TODO: give sample code for each of these functions in the appendix.)) 

- EC2OSP: is specified in Section 2.3.3 of {{SECG1}} with point
compression on. This implies m = 2n + 1 = 33.
- I2OSP: Coversion of a nonnegative integer to an octet string as
defined in Section 4.1 of {{RFC8017}}.
- OS2IP: Coversion of an octet string to a nonnegative integer as
defined in Section 4.2 of {{RFC8017}}.
- RS2ECP(h): OS2ECP(0x02 || h). The input h is a 32-octet string
and the output is either an EC point or "INVALID".
- HashToBase(x): H(x)[0:log2(p) + 1], where H is a cryptographic 
hash function, such as SHA256, and p is the prime order of the 
implicit base field Fp.

# Hashing Variants

## Icart Method {#icart}

The following hash_to_curve_icart(alpha) algorithm implements
a constant-time variant of hash_to_curve(alpha, x). This algorithm
works for any curve over F_{p^n}, where p = 2 mod 3, including:

- P384
- Curve1174
- Ed448-Goldilocks

Unsupported curves include: P224, P256, P521, and Curve25519 since,
for each, p = 1 mod 3. Mathematically, given input alpha,
and A and B from E, the Icart method works as follows:

~~~
u = HashToBase(alpha)
x = (v^2 - b - (u^6 / 27))^(1/3) + (u^2 / 3)
y = ux + v
~~~

where v = ((3A - u^4) / 6u).

The following procedure implements this algorithm in a straight-line fashion.
It requires knowledge of A and B, the constants from the curve Weierstrass form.

<!-- https://iacr.org/archive/crypto2009/56770300/56770300.pdf -->
<!-- http://www.crypto-uni.lu/jscoron/cours/mics3crypto/shash.pdf -->

~~~
hash_to_curve_icart(alpha)

Input:

  alpha - value to be hashed, an octet string

  A, B - Weierstrass form constants for E

Output:

  (x, y) - a point in E

Steps:

1.  u  = HashToBase(alpha)   // {0,1}^* -> Fp
2.  u2 = u^2 (mod p)         // u^2
3.  t2 = u2^2 (mod p)        // u^4
4.  v1 = 3 * A (mod p)       // 3A
5.  v1 = v1 - t2 (mod p)     // 3A - u^4
6.  t1 = 6 * u (mod p)       // 6u
7.  t3 = t1 ^ (-1) (mod p)   // modular inverse
8.  v  = v1 * t3 (mod p)     // (3A - u^4)/(6u)
9.  x  = v^2 (mod p)         // v^2
10. x  = x - B (mod p)       // v^2 - b
11. t1 = 27 ^ (-1) (mod p)   // 1/27
12. t1 = t1 * u2 (mod p)     // u^4 / 27
13. t1 = t1 * t2 (mod p)     // u^6 / 27
14. x  = x - t1 (mod p)      // v^2 - b - u^6/27
15. t1 = (2 * p) - 1 (mod p) // 2p - 1
16. t1 = t1 / 3 (mod p)      // (2p - 1)/3
17. x  = x^t1 (mod p)        // (v^2 - b - u^6/27) ^ (1/3)
18. t2 = u2 / 3 (mod p)      // u^2 / 3
19. x  = x + t2 (mod p)      // (v^2 - b - u^6/27) ^ (1/3) + (u^2 / 3)
20. y  = u * x (mod p)       // ux
21. y  = y + v (mod p)       // ux + v
22. Output (x, y)

~~~

## Elligator2 Method {#elligator2}

The following hash_to_curve_elligator2(alpha) algorithm implements
another constant-time variant of hash_to_curve(alpha). This algorithm
works for any curve (over large characteristic field). The method is 
simple to implement.

~~~
1. r = HashToBase(alpha)
2. If f(-A/(1+ur^2)) is square, then output f(-A/(1+ur^2))^(1/2)
3. Else, output f(-Aur^2/(1+ur^2))^(1/2)
~~~

The following straight-line procedure implements this algorithm.

~~~
hash_to_curve_elligator2(alpha)

Input:

  alpha - value to be hashed, an octet string

  D - Edward's curve coefficient

Output:

  (x, y) - a point in E

Steps:

1.  r  = HashToBase(alpha)
2.  x  = r^2 (mod p)
3.  L3 = x^2 (mod p)      // x^4
4.  y  = L3 (mod p)       // x^4
5.  L4 = -y (mod p)       // -x^4
6.  L4 = L4 + 1 (mod p)   // y - 1
7.  L2 = L4^2 (mod p)     // (y - 1)^2
8.  L7 = L2 * (D - 1)^2 (mod p) // (y - 1)^2 - (D - 1)^2
9.  L8 = L3 * 4(D + 1)^2 (mod p) // r^4 + 4(D + 1)^2
10. y  = L8 + L7 (mod p)  // 
11. L8 = L2 * 4D(D - 1) (mod p) // 
12. L7 = y - L8 (mod p)   // 
13. L6 = y * (-2 - 2D) (mod p) // 
14. L5 = L7 * L6 (mod p)
15. L8 = L5 * L4 (mod p)
16. L4 = L5 * L6 (mod p)
17. L5 = L7 * L8 (mod p)
18. L8 = L5 * L4 (mod p)
19. L4 = L7 * L8 (mod p)
20. L6 = 1/sqrt(L4) (mod p)
21. L4 = L5 * L6 (mod p)
22. L5 = L6^2 (mod p)
23. L6 = L8 * L5 (mod p)
24. L8 = L7 * L6 (mod p)
25. L6 = x
26. x  = x + 1 (mod p)
27. L5 = L5 + 1 (mod p)
28. x  = L6 - L5 (mod p)
29. L5 = L4 * x (mod p)
30. L4 = L3 + L3 (mod p)
31. L3 = L4 + L2 (mod p)
32. L3 = L3 - 2 (mod p)
33. L2 = L3 * L8 (mod p)
34. L3 = L2 * 2(D + 1)(D - 1)
35. L2 = L3 + y (mod p)
36. y  = L7 * L2 (mod p)
37. y  = y + (-L8) (mod p)
38. Output (x, y)
~~~

## Projective Elligator2 Method

The following hash_to_curve_elligator2(alpha) algorithm implements
the Elligator2 method from Section {{elligator2}}, yet it uses projective
coordinates for all arithmetic. This has the benefit of replacing
division operations with multiplication operations.

The following procedure implements this algorithm in constant time.

~~~
hash_to_curve_elligator2(alpha)

Input:

  alpha - value to be hashed, an octet string

Output:

  (x, y) - a point in E.

Steps:

1. r = HashToBase(alpha)
2. ((TODO: write me))
~~~

# Security Considerations

TODO

# Acknowledgements

TODO

--- back

# Sage Sample Code

((See poc/poc.sage))

