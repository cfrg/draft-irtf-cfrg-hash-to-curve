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
attempts, i.e., when ctr=1, on average. 

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
are both CFRG-recommended curves {{RFC7748}}.

This document specifies 2 algorithms for deterministically hashing onto a curve
with varying properties: Icart and Elligator2. Each algorithm conforms to a common 
interface, i.e., it maps an element from a base field F to a curve E. For each variant, we 
describe the requirements for F and E to make it work. Sample code for each variant is 
presented in the appendix.  Unless otherwise stated, all elliptic curve points are assumed to 
be represented as affine coordinates, i.e., (x, y) points on a curve. 

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

- HashToBase(x): H(x)[0:log2(p) + 1], where H is a cryptographic 
hash function, such as SHA256, and p is the prime order of the 
implicit base field Fp.
- CMOV(a, b, c): If c = 1, return a, else return b.

# Hashing Variants

## Icart Method {#icart}

The following hash_to_curve_icart(alpha) algorithm implements
a constant-time variant of hash_to_curve(alpha, x). This algorithm
works for any curve over F_{p^n}, where p = 2 mod 3, including:

- P384
- Curve1174
- Ed448-Goldilocks

Unsupported curves include: P224, P256, P521, Curve25519, and Curve448 since,
for each, p = 1 mod 3. 

Mathematically, given input alpha, and A and B from E, the Icart method works 
as follows:

~~~
u = HashToBase(alpha)
x = (v^2 - b - (u^6 / 27))^(1/3) + (u^2 / 3)
y = ux + v
~~~

where v = ((3A - u^4) / 6u).

The following procedure implements this algorithm in a straight-line fashion.
It requires knowledge of A and B, the constants from the curve Weierstrass form.

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
simple to implement. Below, let f(x) = y^2 = x(x^2 + Ax + B), i.e., a
Weierstrass form with the point of order 2 at (0,0). Any curve with a 
point of order 2 is isomorphic to this representation.

~~~
1. r = HashToBase(alpha)
2. If f(-A/(1+ur^2)) is square, then output f(-A/(1+ur^2))^(1/2)
3. Else, output f(-Aur^2/(1+ur^2))^(1/2)
~~~

Another way to express this algorithm is as follows:
~~~
1. r = HashToBase(alpha)
2. d = -A / (1 + ur^2)
3. e = f(d)^((p-1)/2)
4. u = ed - (1 - e)A/u
~~~
Here, e is the Legendre symbol of y = (d^3 + Ad^2 + d), which will be
1 if y is a quadratic ressidue (square) mod p, and -1 otherwise.
(Note that raising y to ((p -1) / 2) is a common way to compute
the Legendre symbol.)

The following procedure implements this algorithm.

~~~
hash_to_curve_elligator2(alpha)

Input:

  alpha - value to be hashed, an octet string

  u - fixed nonsquare value in Fp.
  f() - Curve function

Output:

  (x, y) - a point in E

Steps:

1.  r  = HashToBase(alpha)

2.  r  = r^2 (mod p) 
3. nu  = r * u (mod p)
4.  r  = nu
5.  r  = r + 1 (mod p) 
6.  r  = r^(-1) (mod p) 
7.  v  = A * r (mod p) 
8.  v  = v * -1 (mod p)   // -A / (1 + ur^2)

9.  v2 = v^2 (mod p)
10.  v3 = v * v2 (mod p)
11.  e = v3 * v (mod p)
12. v2 = v2 * A (mod p)
13.  e = v2 * e (mod p)
14.  e = e^((p - 1) / 2)  // Legendre symbol

15. nv = v * -1
16.  v = CMOV(v, nv, e)   // If e = 1, choose v, else choose nv
17. v2 = CMOV(0, A, e)    // If e = 1, choose 0, else choose A
18.  u = v - v2 (mod p)
19. Output (u, f(u))
~~~

Elligator2 can be simplified with projective coordinates. ((TODO: write that up.))

# Security Considerations

Each hash function variant accepts arbitrary input and maps it to a pseudorandom
point on the curve. Points will be indistinguishable from randomly chosen elements on
the curve. (?)

# Acknowledgements

The authors would like to thank Adam Langley for this detailed writeup up Elligator2 with
Curve25519 ((TODO:CITE)).

--- back

# Sage Sample Code

## Icart Method

~~~
# P384
p = 39402006196394479212279040100143613805079739270465446667948293404245721771496870329047266088258938001861606973112319
F = GF(p)
A = p - 3
B = 0xb3312fa7e23ee7e4988e056be3f82d19181d9c6efe8141120314088f5013875ac656398d8a2ed19d2a85c8edd3ec2aef
q = 39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942643
E = EllipticCurve([F(A), F(B)])
g = E(0xaa87ca22be8b05378eb1c71ef320ad746e1d3b628ba79b9859f741e082542a385502f25dbf55296c3a545e3872760ab7, 0x3617de4a96262c6f5d9e98bf9292dc29f8f41dbd289a147ce9da3113b5f0b8c00a60b1ce1d7e819d7a431d7c90ea0e5f)
E.set_order(q)

def icart(u):
  u = F(u)
  v = (3*A - u^4)//(6*u)
  x = (v^2 - B - u^6/27)^((2*p-1)//3) + u^2/3
  y = u*x + v
  return E(x, y) # raises expection if not on curve

def icart_slp(u):
    u = F(u)
    u2 = u ^ 2
    t2 = u2 ^ 2
    assert t2 == u^4

    v1 = 3 * A
    v1 = v1 - t2
    t1 = 6 * u
    t3 = t1 ^ (-1)
    v = v1 * t3
    assert v == (3 * A - u^4) // (6 * u)

    x = v ^ 2
    x = x - B
    assert x == (v^2 - B)

    t1 = F(27) ^ (-1)
    t1 = t1 * u2
    t1 = t1 * t2
    assert t1 == ((u^6) / 27)
    
    x = x - t1
    t1 = (2 * p) - 1
    t1 = t1 / 3
    assert t1 == ((2*p) - 1) / 3

    x = x ^ t1
    assert x == ((v^2 - B - u^6/27)^((2*p-1)//3))
    
    t2 = u2 / 3
    x = x + t2
    y = u * x
    y = y + v
    return E(x, y)
~~~

## Elligator2 Methods


# Curve25519
p = 2**255 - 19
F = GF(p)
A = 486662
B = 1
E = EllipticCurve(F, [0, A, 0, 1, 0])

def curve25519(x):
    return x^3 + (A * x^2) + x

def elligator2(alpha):

    r = F(alpha)

    # u is a fixed nonsquare value, eg -1 if p==3 mod 4.
    u = F(2) # F(2)
    assert(not u.is_square())
    
    # If f(-A/(1+ur^2)) is square, return its square root.
    # Else, return the square root of f(-Aur^2/(1+ur^2)).
    x = -A / (1 + (u * r^2))
    y = curve25519(x)
    if y.is_square(): # is this point square?
        y = y.square_root()
    else:
        x = (-A * u * r^2) / (1 + (u * r^2))
        y = curve25519(x).square_root()
    
    return (x, curve25519(x))

def elligator2_legendre_ct(alpha):
    r = F(alpha)

    r = r^2
    r = r * 2
    r = r + 1
    r = r^(-1)
    v = A * r
    v = v * -1 # d

    v2 = v^2
    v3 = v * v2
    e = v3 + v
    v2 = v2 * A
    e = v2 + e

    # Legendre symbol -- is it a point on the curve?
    e = e^((p - 1) / 2)

    # TODO: make these conditional moves
    nv = v * -1
    if e != 1:
        v = nv
    v2 = 0
    if e != 1:
        v2 = A
    
    u = v - v2
    
    return (u, curve25519(u))