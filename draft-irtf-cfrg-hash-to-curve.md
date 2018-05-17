---
title: Hashing to Elliptic Curves
abbrev: hash-to-curve
docname: draft-irtf-cfrg-hash-to-curve-latest
date:
category: info

ipr: trust200902
keyword: Internet-Draft

stand_alone: yes
pi: [toc, sortrefs, symrefs]

author:
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
    street: One Apple Park Way
    city: Cupertino, California 95014
    country: United States of America
    email: cawood@apple.com
 -
    ins: S. Scott
    name: Sam Scott
    org: Cornell Tech
    street: 2 West Loop Rd
    city: New York, New York 10044
    country: United States of America
    email: sam.scott@cornell.edu
 -
    ins: E. Berners-Lee
    name: Ela Berners-Lee
    org: Royal Holloway, University of London
    street: Egham Hill
    city: Egham
    Country: United Kingdom
    email: ela.berners-lee.2010@live.rhul.ac.uk

normative:
  RFC2119:
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
  BF01:
    title: Identity-based encryption from the Weil pairing
    authors:
      -
        ins: Dan Boneh
        org: Stanford University
      - 
        ins: Matthew Franklin
        org: UC Davis
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
        org: MIT Laboratory for Computer Science
      -
        ins: Philip D. MacKenzie
        org: Bell Laboratories, Lucent Technologies
      -
        ins: Sarvar Patel
        org: Bell Laboratories, Lucent Technologies
  Jablon96:
    title: Strong password-only authenticated key exchange
    venue: SIGCOMM Comput. Commun. Rev., 26(5), 5–26, 1996.
    authors:
      -
        ins: David P. Jablon
        org: Integrity Sciences, Inc. Westboro, MA.
  ElligatorAGL:
    title: Implementing Elligator for Curve25519
    target: https://www.imperialviolet.org/2013/12/25/elligator.html
    authors:
      -
        ins: Adam Langley
  ECOPRF:
    title: EC-OPRF - Oblivious Pseudorandom Functions using Elliptic Curves
    authors:
      -
        ins: Jonathan Burns
        org: Ionic Research
      -
        ins: Daniel Moore
        org: Ionic Research
      -
        ins: Katrina Ray
        org: Ionic Research
      -
        ins: Ryan Speers
        org: Ionic Research
      -
        ins: Brian Vohaska
        org: Ionic Research
  Elligator2:
    title: Elligator -- Elliptic-curve points indistinguishable from uniform random strings
    venue: Proceedings of the 2013 ACM SIGSAC conference on Computer & communications security. ACM, 2013.
    target: https://dl.acm.org/ft_gateway.cfm?id=2516734&type=pdf
    authors:
      -
        ins: Daniel J. Bernstein
        org: Department of Computer Science, University of Illinois at Chicago, USA
      -
        ins: Mike Hamburg
        org: Cryptography Research, a division of Rambus, USA
      -
        ins: Anna Krasnova
        org: Privacy & Identity lab, Institute for Computing and Information Sciences, Radboud University Nijmegen, The Netherlands
      -
        ins: Tanja Lange
        org: Department of Mathematics and Computer Science, Technische Universiteit Eindhoven, The Netherlands
  SWU:
    title: Rational points on certain hyperelliptic curves over finite fields
    target: https://arxiv.org/pdf/0706.1448
    authors:
      -
        ins: Maciej Ulas
        org: 
  SimpleSWU:
    title: Efficient Indifferentiable Hashing into Ordinary Elliptic Curves
    venue: Annual Cryptology Conference (pp. 237-254). Springer, Berlin, Heidelberg.
    authors:
      -
        ins: Eric Brier
        org: Ingenico
      -
        ins: Jean-Sebastien Coron
        org: Universite du Luxembourg
      -
        ins: Thomas Icart
        org: Universite du Luxembourg
      -
        ins: David Madore
        org: TELECOM-ParisTech
      -
        ins: Hugues Randriam
        org: TELECOM-ParisTech
      -
        ins: Mehdi Tibouchi
        org: Universite du Luxembourg, Ecole normale superieure
  FFSTV13:
    title: Indifferentiable deterministic hashing to elliptic and hyperelliptic curves
    authors:
      -
        ins: Reza R. Farashahi
        org: Macquarie Universit
      -
        ins: Pierre-Alain Fouque
        org: Ecole normale superieure
      -
        ins: gor E. Shparlinski
        org: Macquarie Universit
      -
        ins: Mehdi Tibouch
        org: Ecole normale superieure
      -
        ins:  J. Felipe Voloch
        org: University of Texas
  FT12:
    title: Indifferentiable Hashing to Barreto-Naehrig Curves
    venue: LATINCRYPT 2012, pages 1-17.
    target: https://link.springer.com/chapter/10.1007/978-3-642-33481-8_1
    authors:
      -
        ins: Pierre-Alain Fouque
        org: Ecole Normale Superieure and INRIA Rennes
      -
        ins: Mehdi Tibouchi
        org: NTT Secure Platform Laboratories
  BN05:
    title: Pairing-Friendly Elliptic Curves of Prime Order
    target: https://link.springer.com/chapter/10.1007/11693383_22
    authors:
    -
      ins: Paulo S. L. M. Barreto
      org: Escola Politecnica, Universidade de Sao Paulo
    -
      ins: Michael Naehrig
      org: Lehrstuhl fur Theoretische Informationstechnik, Rheinisch-Westfalische Technische Hochschule Aachen
  ISO09EC:
    title: Information Technology - Security Techniques -- Cryptographic techniques based on elliptic curves . Part 5: Elliptic curve generation"
    venue: ISO/IEC 15946-5, 2009
    target: https://www.iso.org/obp/ui/#iso:std:iso-iec:15946:-5:ed-1:v1:en
    authors:
    -
      ins: International Organization for Standardization
      org: ISO/IEC
  BGMO+10
    title: High-Speed Software Implementation of the Optimal Ate Pairing over Barreto-Naehrig Curves
    venue: Proceedings Lecture notes in computer sciences; Pairing-Based Cryptography 2010
    target: https://link.springer.com/chapter/10.1007/978-3-642-17455-1_2
    authors: 
    -
      ins: Jean-Luc Beuchat
      org: Graduate School of Systems and Information Engineering, University of Tsukuba
    -
      ins: Jorge Enrique González-Díaz
      org: Computer Science Department, Centro de Investigacion y de Estudios Avanzados del IPN, Av. Instituto Politecnico Nacional
    -
      ins: Shigeo Mitsunari
      org: Cybozu Labs, Inc.
    -
      ins: Eiji Okamoto
      org: Graduate School of Systems and Information Engineering, University of Tsukuba
    -
      ins: Francisco Rodríguez-Henríquez
      org: Computer Science Department, Centro de Investigacion y de Estudios Avanzados del IPN, Av. Instituto Politecnico Nacional
    -
      ins: Tadanori Teruya
      org: Graduate School of Systems and Information Engineering, University of Tsukuba
  AKLG+11
    title: Faster Explicit Formulas for Computing Pairings over Ordinary Curves
    venue: Proceedings Lecture notes in computer sciences; EUROCRYPT 2011
    target: https://link.springer.com/chapter/10.1007%2F978-3-642-20465-4_5
    authors:
    _
      ins: Diego F. Aranha
      org: University of Campinas
    -
      ins: Koray Karabina
      org: Certicom Research
    -
      ins: Patrick Longa
      org: University of Waterloo
    -
      ins: Catherine H. Gebotys
      org: University of Waterloo
    -
      ins: Julio López
      org: University of Campinas
  Scott13
    title: Unbalancing Pairing-Based Key Exchange Protocols"
    target: http://eprint.iacr.org/2013/688
    authors:
    _
      ins: Michael Scott
      org: Certivox Labs
  BCMN+16
    title: Subgroup security in pairing-based cryptography
    venue: Latincrypt 2016
    target: https://link.springer.com/chapter/10.1007/978-3-319-22174-8_14
    authors:
    -
      ins: Paulo S. L. M. Barreto
      org: Escola Politecnica, University of Sao Paulo
    -
      ins: Craig Costello
      org: Microsoft Research
    -
      ins: Rafael Misoczki
      org: 
    -
      ins: Michael Naehrig
      org: Escola Politecnica, University of Sao Paulo
    -
      ins: Geovandro C. C. F. Pereira
      org: Escola Politecnica, University of Sao Paulo
    -
      ins: Gustavo Zanon
      org: Escola Politecnica, University of Sao Paulo


--- abstract

This document specifies a number of algorithms that may be used to hash arbitrary
strings to Elliptic Curves. 

--- middle

# Introduction {#introduction}

Many cryptographic protocols require a procedure which maps arbitrary input, e.g.,
passwords, to points on an elliptic curve (EC). Prominent examples include
Simple Password Exponential Key Exchange {{Jablon96}}, Password Authenticated 
Key Exchange {{BMP00}}, Identity-Based Encryption {{BF01}} and 
Boneh-Lynn-Shacham signatures {{BLS01}}.

Unfortunately for implementors, the precise mapping which is suitable for a
given scheme is not necessarily included in the description of the protocol.
Compounding this problem is the need to pick a suitable curve for the specific
protocol.

This document aims to address this lapse by providing a thorough set of
recommendations across a range of implementations, and curve types. We provide
implementation and perfomance details for each mechanism, along with references
to the security rationale behind each recommendation and guidance for
applications not yet covered.

Each algorithm conforms to a common interface, i.e., it maps an element from a
base field F to a curve E. For each variant, we describe the requirements for F
and E to make it work. Sample code for each variant is presented in the
appendix.  Unless otherwise stated, all elliptic curve points are assumed to be
represented as affine coordinates, i.e., (x, y) points on a curve.

## Requirements

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in {{RFC2119}}.


# Background {#background}

Let E be an elliptic curve over base field GF(p). Elliptic curves come in
many variants, including: Weierstrass, Montgomery, and Edwards. A point
on these curves is represented by some tuple of variables, with each variable
being a value in GF(p). A curve point is generally represented by a pair
(x, y), known as affine coordinates, but are commonly expressed in other
ways for the sake of efficient group operations. 

In practice, the input of a given cryptographic algorithm will be a bitstring of
arbitrary length, denoted {0, 1}^*. Hence, a concern for virtually all protocols
involving elliptic curves, is how to convert this input into a point of the form
(x, y) with x, y in the finite field GF(p).

Note that the number of points on an elliptic curve E is within 2\*sqrt(p) of p
by Hasse's Theorem. As a rule of thumb, for every x in GF(p), there is
approximately a 1/2 chance that there exist a corresponding y value such that
(x, y) is on the curve E. Since the point (x, -y) is also on the curve, then
this sums to approximately p points.

Therefore, even assuming a method to convert a bitstring into a representation
in GF(p), there is not necessarily a direct means to produce an elliptic curve
point.


## Terminology {#terminology}

In the following, we categorize the terminology for mapping between bitstrings
and elliptic curves.

### Encoding {#term-encoding}

The general term "encoding" is used to refer to the process of producing an
elliptic curve point given as input a bitstring. In some protocols, the original
message may also be recovered through a decoding procedure.

An injective encoding may be used to map some fixed-length bitstring of length
`L < log2(p) - 1` to and elliptic curve point. An encoding may be deterministic
or probabilistic, although the latter is problematic in potentially leaking
plaintext information as a side-channel.

### Serialization {#term-serialization}

A related issue is the conversion of an elliptic curve point to a bitstring. We
refer to this process as "serialization", since it is typically used for
compactly storing and transporting points, or for producing canonicalized
outputs. Since a deserialization algorithm can often be used as a type of
encoding algorithm, we also briefly document properties of these functions.

### Random Oracle {#term-rom}

It is often the case that the output of the encoding function {{term-encoding}}
should be distributed uniformly at random on the elliptic curve. That is, there
is no discernible relation existing between outputs that can be computed based
on the inputs. In practice, this requirement stems from needing a random oracle
which outputs elliptic curve points:  one way to construct this is by first
taking a regular random oracle, operating entirely on bitstrings, and applying a
suitable encoding function to the output.

This motivates the term "hashing to the curve", since cryptographic hash
functions are typically modeled as random oracles. However, this still leaves open
the question of what constitutes a suitable encoding method, which is a primary
concern of this document.

A random oracle onto an elliptic curve can also be instantiated using
direct constructions, however these tend to rely on many group operations
and are less efficient than hash and encode methods.


# Algorithm Recommendations {#recommendations}

The following table lists recommended algorithms to use for specific curves. 

| Curve | Algorithm |
| P-256 | SWU {{simple-swu}} |
| P-384 | Icart {{icart}} |
| Curve25519 | Elligator2 {{elligator2}} |
| Curve448 | Elligator2 {{elligator2}} |
| BN-curves | {{BN05}} |

The SWU variant from Section {{swu}} applies to any curve. As such, this algorithm
SHOULD be used if no other better alternative is known. More efficient variants and
their curve requirements are shown in the table below. These MAY be used if the target
curve meets the listed criteria.

| Algorithm | Requirement |
| Icart {{icart}} | p = 2 mod 3 |
| SWU {{swu}} | None |
| Simplified SWU {{simple-swu}} | p = 3 mod 4 |
| Elligator2 {{elligator2}} | p is large and there is a point of order two and j-invariant != 1728 |
| FT-hash  | p = 7 mod 12, 1 + b b nonzero square in Fp, E: y^2 = x^3 + b |

# Generic Interface

The generic interface for hashing to elliptic curves is as follows:

~~~
hash_to_curve(alpha)
~~~

where alpha is a message to hash onto a curve. 

## Utility Functions

Algorithms in this document make use of utility functions described below.

- HashToBase(x): H(x)[0:log2(p) + 1], i.e., hash-truncate-reduce, where 
H is a cryptographic hash function, such as SHA256, and p is the prime order 
of base field Fp.
- CMOV(a, b, c): If c = 1, return a, else return b.

Note: We assume that HashToBase maps its input to the base field uniformly. 
In practice, there may be inherent biases in p, e.g., p = 2^k - 1 will
have non-negligible bias in higher bits.

((TODO: expand on this problem))

# Hashing Variants

## Icart Method {#icart}

The following hash_to_curve_icart(alpha) implements the Icart method from {{Icart09}}.
This algorithm works for any curve over F_{p^n}, where p^n = 2 mod 3 
(or p = 2 mod 3 and for odd n), including:

- P384
- Curve1174
- Curve448

Unsupported curves include: P224, P256, P521, and Curve25519 since,
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
It outputs a point with affine coordinates.

~~~
hash_to_curve_icart(alpha)

Input:

  alpha - value to be hashed, an octet string

Output:

  (x, y) - a point in E

Steps:

1.   u = HashToBase(alpha)   // {0,1}^* -> Fp
2.  u2 = u^2 (mod p)         // u^2
3.  t2 = u2^2 (mod p)        // u^4
4.  v1 = 3 * A (mod p)       // 3A
5.  v1 = v1 - t2 (mod p)     // 3A - u^4
6.  t1 = 6 * u (mod p)       // 6u
7.  t3 = t1 ^ (-1) (mod p)   // modular inverse
8.   v = v1 * t3 (mod p)     // (3A - u^4)/(6u)
9.   x = v^2 (mod p)         // v^2
10.  x = x - B (mod p)       // v^2 - b
11. t1 = 27 ^ (-1) (mod p)   // 1/27
12. t1 = t1 * u2 (mod p)     // u^4 / 27
13. t1 = t1 * t2 (mod p)     // u^6 / 27
14.  x = x - t1 (mod p)      // v^2 - b - u^6/27
15. t1 = (2 * p) - 1 (mod p) // 2p - 1
16. t1 = t1 / 3 (mod p)      // (2p - 1)/3
17.  x = x^t1 (mod p)        // (v^2 - b - u^6/27) ^ (1/3)
18. t2 = u2 / 3 (mod p)      // u^2 / 3
19.  x = x + t2 (mod p)      // (v^2 - b - u^6/27) ^ (1/3) + (u^2 / 3)
20.  y = u * x (mod p)       // ux
21.  y = y + v (mod p)       // ux + v
22. Output (x, y)

~~~

## Shallue-Woestijne-Ulas Method {#swu}

((TODO: write this section))

## Simplified SWU Method {#simple-swu}

The following hash_to_curve_simple_swu(alpha) implements the simplfied
Shallue-Woestijne-Ulas algorithm from {{SimpleSWU}}. This algorithm
works for any curve over F_{p^n}, where p = 3 mod 4, including:

- P256
- ...

Given curve equation g(x) = x^3 + Ax + B, this algorithm works as follows:

~~~
1. t = HashToBase(alpha)
2. alpha = (-b / a) * (1 + (1 / (t^4 + t^2))) 
3. beta = −t^2 * alpha
4. z = t^3 * g(alpha)
5. Output (−g * alpha) * (g * beta)
~~~

The following procedure implements this algorithm. It outputs a point with
affine coordinates.

~~~
hash_to_curve_simple_swu(alpha)

Input:

  alpha - value to be hashed, an octet string

Output:

  (x, y) - a point in E

Steps:

1.     t = HashToBase(alpha)
2. alpha = t^2 (mod p)
3. alpha = alpha * -1 (mod p)
4. right = alpha^2 + alpha (mod p)
5. right = right^(-1) (mod p)
6. right = right + 1 (mod p)
7.  left = B * -1 (mod p)
8.  left = left / A (mod p) 
9.    x2 = left * right (mod p)
10.   x3 = alpha * x2 (mod p)
11.   h2 = x2 ^ 3 (mod p)
12.   i2 = x2 * A (mod p)
13.   i2 = i2 + B (mod p)
14.   h2 = h2 + i2 (mod p)
15.   h3 = x3 ^ 3 (mod p)
16.   i3 = x3 * A (mod p)
17.   i3 = i3 + B (mod p)
18.   h3 = h3 + i3 (mod p)
19.   y1 = h2 ^ ((p + 1) // 4) (mod p)
20.   y2 = h3 ^ ((p + 1) // 4) (mod p)
21.    e = (y1 ^ 2 == h2)
22.    x = CMOV(x2, x3, e)    // If e = 1, choose x2, else choose x3
23.    y = CMOV(y1, y2, e)    // If e = 1, choose y1, else choose y2
24. Output (x, y)
~~~

## Elligator2 Method {#elligator2}

The following hash_to_curve_elligator2(alpha) implements the Elligator2
method from {{Elligator2}}. This algorithm works for any curve
with a point of order 2 and j-invariant != 1728. Given curve equation 
f(x) = y^2 = x(x^2 + Ax + B), i.e., a Montgomery form with the point of 
order 2 at (0,0), this algorithm works as shown below. (Note that any curve 
with a point of order 2 is isomorphic to this representation.)

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
1 if y is a quadratic residue (square) mod p, and -1 otherwise.
(Note that raising y to ((p -1) / 2) is a common way to compute
the Legendre symbol.)

The following procedure implements this algorithm.

~~~
hash_to_curve_elligator2(alpha)

Input:

  alpha - value to be hashed, an octet string

  u - fixed non-square value in Fp.
  f() - Curve function

Output:

  (x, y) - a point in E

Steps:

1.   r = HashToBase(alpha)
2.   r = r^2 (mod p) 
3.  nu = r * u (mod p)
4.   r = nu
5.   r = r + 1 (mod p) 
6.   r = r^(-1) (mod p) 
7.   v = A * r (mod p) 
8.   v = v * -1 (mod p)   // -A / (1 + ur^2)
9.  v2 = v^2 (mod p)
10. v3 = v * v2 (mod p)
11.  e = v3 * v (mod p)
12. v2 = v2 * A (mod p)
13.  e = v2 * e (mod p)
14.  e = e^((p - 1) / 2)  // Legendre symbol
15. nv = v * -1 (mod p)
16.  v = CMOV(v, nv, e)   // If e = 1, choose v, else choose nv
17. v2 = CMOV(0, A, e)    // If e = 1, choose 0, else choose A
18.  u = v - v2 (mod p)
19. Output (u, f(u))
~~~

Elligator2 can be simplified with projective coordinates. 

((TODO: write this variant))

## FT-hash

{{FT12}} outline a method for hashing onto a set of curves which includes BN curves, which are suitable
for bilinear pairings. A number of cryptographic schemes rely on pairings, including some identity-based
encryption (IBE) and attribute-based encryption (ABE) schemes.  BN curves are not one specific curve but a
class of curves which can be constructed using Barreto and Naehrig's algorithm {{BN05}}. BN curves are a
preferred option for asymmetric pairings as they provide relatively efficient computation for pairings, which are
usually the slowest computation in any cryptosystem using them. There is also work giving parameter selection
for 256-bit BN-curves, resulting in 128 bits of security for hashing onto BN curves. Suggestions for suitable 224,
256, 384, and 512-bit curves which are compliant with the ISO document and are based on M-type twisted curve can
be found in {{ISO09EC}}. Other work on parameter selection for suitable curves can be found in {{BGMO+10}}
{{AKLG+11}} {{Scott13}} {{BCMN+16}}.

This method is suitable for BN-curves, which have the form E: f(x) = y^2 = x^3 + b, where operations
are over a field Fp,  where p = 7 (mod 12) and 1 + b is a nonzero square in Fp. Fouque and Tibouchi give an 
encoding F which makes the hash function Hash(m) = F(H1(m)) + F(H2(m)) indifferentiable from a random oracle,
where  H1 and H2 are independent hash functions into Fp. We give this encoding and hash function construction
in the steps below.  In the following, Xp() is the Legendre symbol (Xp(0) = 0, for a != 0 Xp(a) = 1 if a is a square in
Fp and -1 otherwise), which can be computed by Xp(a) = a ^ ((p -1) / 2).

~~~
FT-encoding(t)

Input:

  t - the input, an element in Fp

  f() - Curve function

Output:

  (x, y) - a point in E

Steps:

1.   s = (-3)^(1/2) (mod p)
2.   x1 = (-1 + s)/2  -  (s t^2) / (1 + b + t^2) (mod p)
3.   x2 = (-1 - s)/2  +  (s t^2) / (1 + b + t^2) (mod p)
4.   x3 = 1 - ((1 + b + t^2)^2)  /  (3 t^2) (mod p)
5.   s1 = Xp(g(x1))  // calculate quadratic residue of g(x1)
6.   s2 = Xp(g(x2))  // calculate quadratic residue of g(x2)
7.   s3 = Xp(g(x3))  // calculate quadratic residue of g(x3)
8.   if s1 = 1: x = x1  // choose the smallest index i such that g(xi) is a square in Fp
9.   else if s2 = 1: x = x2 
10. else: x = x3
11. y = f(x)^(1/2) (mod p)
12. y = Xp(t) * y (mod p)
13. Output ( x,  y )
~~~
Note that s will always be an integer in the field, due our base assumptions about p. If it is necessary to
specifically define a point for F(0), then a suitable suggestion is f(0) = ( (-1 + s)  /  2, (1+b)^(1/2) ).
In steps 5-7 all relevant quadric residues are calculated in order to prevent possible timing attacks where
s2 and s3 are not calculated if s1 = 1.

Whilst this encoding function works for BN curves and is efficient, it only reaches roughly 9/16ths of
the curve. However, this is enough to be a suitable encoding function for Hash = F(H1(m)) +
F(H2(m)) as explained in {{FFSTV13}}, which will be indifferentiable from a random oracle.  We give this function
explicitly in the steps below.

~~~
hash_to_BN_curve(alpha)

Input:

  alpha - value to be hashed, an octet string
  
  HashToBase1(): H1(x)[0:log2(p) + 1] - a cryptographic hash function into the field Fp (where p is the
  prime order of base field Fp), such as SHA256.
  
  HashToBase2(): H2(x)[0:log2(p) + 1] - another cryptographic hash function into the field Fp, independent from
  HashToBase1, such as SHA3.

  f() - Curve function

Output:

  (x, y) - a point in E

Steps:

1.   t1 = HashToBase1(alpha)
2.   (a1, b1) = FT-encoding(t1)
2.   t2 = HashToBase2(alpha)
3.   (a2, b2) = FT-encoding(t2)
4.   (x, y) = (a1, b1) + (a2, b2) // Elliptic curve addition
5.   Output (x,  y)
~~~

# Curve Transformations

((TODO: write this section))

# Cost Comparison

The following table summarizes the cost of each hash_to_curve variant. We express this cost in 
terms of additions (A), multiplications (M), squares (SQ), and square roots (SR). 

((TODO: finish this section))

| Algorithm | Cost (Operations) | 
| hash_to_curve_icart | TODO |
| hash_to_curve_swu | TODO |
| hash_to_curve_simple_swu | TODO |
| hash_to_curve_elligator2 | TODO |

# IANA Considerations

This document has no IANA actions.

# Security Considerations

Each hash function variant accepts arbitrary input and maps it to a pseudorandom
point on the curve. Points are close to indistinguishable from randomly chosen 
elements on the curve. Some variants variants are not full-domain hashes. Elligator2,
for example, only maps strings to "about half of all curve points," whereas Icart's
method only covers about 5/8 of the points.

# Acknowledgements

The authors would like to thank Adam Langley for this detailed writeup up Elligator2 with
Curve25519 {{ElligatorAGL}}. We also thank Sean Devlin and Thomas Icart for feedback on 
earlier versions of this document.

# Contributors

* Sharon Goldberg \\
  Boston University \\
  goldbe@cs.bu.edu

--- back


# Related Work {#related}

In this chapter, we  give a background to some common methods to encode or
hash to the curve, motivated by the similar exposition in {{Icart09}}.
Understanding of this material is not required in order to choose a
suitable encoding function - we defer this to {{recommendations}}
 - the background covered here can work as a template for analyzing encoding
functions not found in this document, and as a guide for further research
into the topics covered.

## Probabilistic Encoding

As mentioned in {{background}}, as a rule of thumb, for every x in GF(p), there
is approximately a 1/2 chance that there exist a corresponding y value such that
(x, y) is on the curve E.

This motivates the construction of the MapToGroup
method described by Boneh et al. {{BLS01}}. For an input message m, a counter i,
and a standard hash function H : {0, 1}^* -> GF(p) x {0, 1}, one computes (x, b)
= H(i || m), where i || m denotes concatenation of the two values. Next, test to
see whether there exists a corresponding y value such that (x, y) is on the
curve, returning (x, y) if successful, where b determines whether to take +/- y.
If there does not exist such a y, then increment i and repeat. A maximum counter
value is set to I, and since each iteration succeeds with probability
approximately 1/2, this process fails with probability 2^-I. (See {{try}} for a
more detailed description of this algorithm.)

Although MapToGroup describes a method to hash to the curve, it can also be
adapted to a simple encoding mechanism. For a bitstring of length strictly
less than log2(p), one can make use of the spare bits in order to encode
the counter value. Allocating more space for the counter increases the expansion,
but reduces the failure probability.

Since the running time of the MapToGroup algorithm depends on m, 
this algorithm is NOT safe for cases sensitive to timing side channel attacks. 
Deterministic algorithms are needed in such cases where failures 
are undesirable.

## Naive Encoding

A naive solution includes computing H(m)\*G, where H is a standard hash
function H : {0, 1}^* -> GF(p), and G is a generator of the curve. Although
efficient, this solution is unsuitable for constructing a random oracle onto
E, since the discrete logarithm with respect to G is known. This causes
catastrophic failure in many cases. However, one exception is found in SPEKE
{{Jablon96}}, which constructs a base for a Diffie-Hellman key exchange by
hashing the password to a curve point. Notably the use of a hash function is
purely for encoding an arbitrary length string to a curve point, and does not
need to be a random oracle.

## Deterministic Encoding

Shallue and Woestijne {{SWU}} first introduced a deterministic 
algorithm that maps elements in F_{q} to a curve in time O(log^4 q), where q = p^n for
some prime p, and time O(log^3 q) when q = 3 mod 4. Icart introduced yet another
deterministic algorithm which maps F_{q} to any EC where q = 2 mod 3 in time O(log^3 q) {{Icart09}}.
Elligator (2) {{Elligator2}} is yet another deterministic algorithm for any odd-characteristic 
EC that has a point of order 2. Elligator2 can be applied to Curve25519 and Curve448, which 
are both CFRG-recommended curves {{RFC7748}}.

However, an important caveat to all of the above deterministic encoding functions,
is that none of them map injectively to the entire curve, but rather
some fraction of the points. This makes them unable to use to directly
construct a random oracle on the curve.

Brier et al. {{SimpleSWU}} proposed a couple of solutions to this problem, The
first applies solely to Icart's method described above, by computing F(H1(m))
+ F(H2(m)) for two distinct hash functions H1, H2. The second uses a generator
G, and computes F(H1(m)) + H2(m)\*G. Later, Farashahi et al. {{FFSTV13}}
showed the generality of the F(H1(m)) + F(H2(m)) method, as well as the
applicability to hyperelliptic curves (not covered here).

## Supersingular Curves

For supersingular curves, for every y in GF(p) (with p>3), there exists a value
x such that (x, y) is on the curve E. Hence we can construct a bijection
F : GF(p) -> E (ignoring the point at infinity). This is the case for
{{BF01}}, but is not common.

## BN Curves (pairing-friendly)

Fouque and Tibouchi {{FT12}} also used the F(H1(m))+F(H2(m)) method to construct a hash
function on to BN-curves, using an encoding function F of their construction. BN curves {{BN05}} are
pairing-friendly and offer 128 bits of security, making them ideal for implementing
cryptographic schemes which rely on pairings. Other encoding functions are not suitable for
BN-curves, as they rely on assumptions about the geometric properties of the curve which
BN-curves do not have. Their method is both efficient and runs in constant time, making it
secure for applications where timing attacks are of concern.

## Twisted Variants

We can also consider curves which have twisted variants, E^d. For such curves,
for any x in GF(p), there exists y in GF(p) such that (x, y) is either a point
on E or E^d. Hence one can construct a bijection F : GF(p) x {0,1} -> E ∪ E^d, 
where the extra bit is needed to choose the sign of the point. This can be
particularly useful for constructions which only need the x-coordinate of the
point. For example, x-only scalar multiplication can be computed on Montgomery
curves. In this case, there is no need for an encoding function, since the output
of F in GF(p) is sufficient to define a point on one of E or E^d.

# Try-and-Increment Method {#try}

In cases where constant time execution is not required, the so-called
try-and-increment method may be appropriate. As discussion in Section {{introduction}},
this variant works by hashing input m using a standard hash function ("Hash"), e.g., SHA256, and 
then checking to see if the resulting point E(m, f(m)), for curve function f, belongs on E.
This is detailed below.

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

I2OSP is a function that converts a nonnegative integer to octet string as 
defined in Section 4.1 of {{RFC8017}}, and RS2ECP is a function that converts of a random 
2n-octet string to an EC point as specified in Section 5.1.3 of {{RFC8032}}.

# Sample Code

## Icart Method

The following Sage program implements hash_to_curve_icart(alpha) for P-384.

~~~
p = 394020061963944792122790401001436138050797392704654466679482934042 \
45721771496870329047266088258938001861606973112319
F = GF(p)
A = p - 3
B = 0xb3312fa7e23ee7e4988e056be3f82d19181d9c6efe8141120314088f5013875a \
c656398d8a2ed19d2a85c8edd3ec2aef
q = 394020061963944792122790401001436138050797392704654466679469052796 \
27659399113263569398956308152294913554433653942643
E = EllipticCurve([F(A), F(B)])
g = E(0xaa87ca22be8b05378eb1c71ef320ad746e1d3b628ba79b9859f741e082542a \
385502f25dbf55296c3a545e3872760ab7, \
    0x3617de4a96262c6f5d9e98bf9292dc29f8f41dbd289a147ce9da3113b5f0b8c0 \
0a60b1ce1d7e819d7a431d7c90ea0e5f)
E.set_order(q)

def icart(u):
  u = F(u)
  v = (3*A - u^4)//(6*u)
  x = (v^2 - B - u^6/27)^((2*p-1)//3) + u^2/3
  y = u*x + v
  return E(x, y) 

def icart_straight(u):
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
    
    t2 = u2 / 3
    x = x + t2
    y = u * x
    y = y + v
    return E(x, y)
~~~

## Shallue-Woestijne-Ulas Method

((TODO: write this section))

## Simplified SWU Method

The following Sage program implements hash_to_curve_swu(alpha) for P-256.

~~~
p = 115792089210356248762697446949407573530086143415290314195533631308 \
867097853951
F = GF(p)
A = F(p - 3)
B = F(ZZ("5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2 \
604b", 16))
E = EllipticCurve([A, B])

def simple_swu(alpha):
    t = F(alpha)
    
    alpha = -(t^2)
    frac = (1 / (alpha^2 + alpha))
    x2 = (-B / A) * (1 + frac)
    
    x3 = alpha * x2
    h2 = x2^3 + A * x2 + B
    h3 = x3^3 + A * x3 + B

    if is_square(h2):
        return E(x2, h2^((p + 1) // 4))
    else:
        return E(x3, h3^((p + 1) // 4))

def simple_swu_straight(alpha):
    t = F(alpha)
    
    alpha = t^2
    alpha = alpha * -1
    
    right = alpha^2 + alpha
    right = right^(-1)
    right = right + 1

    left = B * -1
    left = left / A

    x2 = left * right
    x3 = alpha * x2

    h2 = x2 ^ 3
    i2 = x2 * A
    i2 = i2 + B
    h2 = h2 + i2

    h3 = x3 ^ 3
    i3 = x3 * A
    i3 = i3 + B
    h3 = h3 + i3

    y1 = h2^((p + 1) // 4)
    y2 = h3^((p + 1) // 4)

    # Is it square?
    e = y1^2 == h2

    x = x2
    if e != 1:
        x = x3
    
    y = y1
    if e != 1:
        y = y2

    return E(x, y)
~~~

## Elligator2 Method

The following Sage program implements hash_to_curve_elligator2(alpha) for Curve25519.

~~~
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

def elligator2_straight(alpha):
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

    # Legendre symbol
    e = e^((p - 1) / 2)

    nv = v * -1
    if e != 1:
        v = nv

    v2 = 0
    if e != 1:
        v2 = A
    
    u = v - v2
    
    return (u, curve25519(u))
~~~
