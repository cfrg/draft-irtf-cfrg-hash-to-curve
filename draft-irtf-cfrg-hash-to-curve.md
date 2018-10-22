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
    ins: S. Scott
    name: Sam Scott
    org: Cornell Tech
    street: 2 West Loop Rd
    city: New York, New York 10044
    country: United States of America
    email: sam.scott@cornell.edu
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

normative:
  RFC2119:
  RFC5114:
  RFC5869:
  RFC6234:
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
  DSS:
       title: "Digital Signature Standard, version 4"
       date: 2013
       author:
         org: National Institute of Standards and Technology, U.S. Department of Commerce
       seriesinfo:
         NIST: FIPS PUB 186-4
  Jablon96:
    title: Strong password-only authenticated key exchange
    venue: SIGCOMM Comput. Commun. Rev., 26(5), 5–26, 1996.
    authors:
      -
        ins: David P. Jablon
        org: Integrity Sciences, Inc. Westboro, MA.
  hacspec:
    title: hacspec
    target: https://github.com/HACS-workshop/hacspec
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
  SW06:
    title: Construction of rational points on elliptic curves over finite fields
    venue: ANTS, volume 4076 of Lecture Notes in Computer Science, pages 510–524. Springer, 2006.
    authors:
      -
        ins: Andrew Shallue
      -
        ins: Christiaan van de Woestijne
  SWU07:
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
  BL07:
    title: Faster addition and doubling on elliptic curves
    venue: Proceedings of the Advances in Crypotology 13th international conference on Theory and application of cryptology and information security (ASIACRYPT'07), Kaoru Kurosawa (Ed.). Springer-Verlag, Berlin, Heidelberg, 29-50.
    target: https://eprint.iacr.org/2007/286.pdf
    authors:
      -
        ins: Daniel J. Bernstein
        org: Department of Computer Science, University of Illinois at Chicago, USA
      -
        ins: Tanja Lange
        org: Department of Mathematics and Computer Science, Technische Universiteit Eindhoven, The Netherlands

  BL17:
    title: Montgomery curves and the Montgomery ladder
    target: https://eprint.iacr.org/2017/293.pdf
    authors:
      -
        ins: Daniel J. Bernstein
        org: Department of Computer Science, University of Illinois at Chicago, USA
      -
        ins: Tanja Lange
        org: Department of Mathematics and Computer Science, Technische Universiteit Eindhoven, The Netherlands
  FIPS-186-4:
    title: Digital Signature Standard (DSS), FIPS PUB 186-4, July 2013
    target: https://csrc.nist.gov/publications/detail/fips/186/4/final
    authors:
      -
        ins: National Institute for Standards and Technology
        org:
  NNS10:
    title: New software speed records for cryptographic pairings
    target: https://link.springer.com/chapter/10.1007/978-3-642-14712-8_7
    authors:
      -
        ins: Michael Naehrig
        org: Microsoft Research
      -
        ins: Ruben Niederhagen
        org: Fraunhofer Institute for Secure Information Technology
      -
        ins: Peter Schwabe
        org: Digital Security Group, Radboud University


--- abstract

This document specifies a number of algorithms that may be used to encode or hash an
arbitrary string to a point on an Elliptic Curve.

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
implementation and performance details for each mechanism, along with references
to the security rationale behind each recommendation and guidance for
applications not yet covered.

Each algorithm conforms to a common interface, i.e., it maps a bitstring
{0, 1}^\* to a point on an elliptic curve E. For each variant, we describe the requirements for
E to make it work. Sample code for each variant is presented in the
appendix.  Unless otherwise stated, all elliptic curve points are assumed to be
represented as affine coordinates, i.e., (x, y) points on a curve.

## Requirements

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in {{RFC2119}}.


# Background {#background}

Here we give a brief definition of elliptic curves, with an emphasis
on defining important parameters and their relation to encoding.

Let F be the finite field GF(p^k). We say that F is a field of characteristic
p. For most applications, F is a prime field, in which case k=1 and we will
simply write GF(p).

Elliptic curves can be represented by equations of different standard forms,
including, but not limited to: Weierstrass, Montgomery, and Edwards. Each
of these variants correspond to a different category of curve equation.
For example, the short Weierstrass equation is
`y^2 = x^3 + Ax + B`. Certain encoding functions may have requirements
on the curve form, the characteristic of the field, and the parameters, such as A and B in the previous example.

An elliptic curve E is specified by its equation, and a finite field F.
The curve E forms a group, whose elements correspond to those who satisfy the
curve equation, with values taken from the field F. As a group, E has order
n, which is the number of points on the curve. For security reasons, it is a
strong requirement that all cryptographic operations take place in a prime
order group. However, not all elliptic curves generate groups of prime order.
In those cases, it is allowed to work with elliptic curves of order n = qh,
where q is a large prime, and h is a short number known as the cofactor.
Thus, we may wish an encoding that returns points on the subgroup of order q.
Multiplying a point P on E by the cofactor h guarantees that hP is a point in
the subgroup of order q.

Summary of quantities:

| Symbol | Meaning | Relevance
|:------:|---------|----------
| p | Order of finite field, F = GF(p) | Curve points need to be represented in terms of p. For prime power extension fields, we write F = GF(p^k).
| n | Number of curve points, #E(F) = n |  For map to E, needs to produce n elements.
| q | Order of the largest prime subgroup of E, n = qh | If n is not prime, may need mapping to q.
| h | Cofactor | For mapping to subgroup, need to multiply by cofactor.

## Terminology {#terminology}

In the following, we categorize the terminology for mapping bitstrings to
points on elliptic curves.

### Encoding {#term-encoding}

In practice, the input of a given cryptographic algorithm will be a bitstring of
arbitrary length, denoted {0, 1}^\*. Hence, a concern for virtually all protocols
involving elliptic curves is how to convert this input into a curve point.
The general term "encoding" refers to the process of producing an
elliptic curve point given as input a bitstring. In some protocols, the original
message may also be recovered through a decoding procedure. An encoding may be deterministic
or probabilistic, although the latter is problematic in potentially leaking
plaintext information as a side-channel.

Suppose as the input to the encoding function we wish to use a fixed-length
bitstring of length L. Comparing sizes of the sets, 2^L and n,
an encoding function cannot be both deterministic and bijective.
We can instead use an injective encoding from {0, 1}^L to E, with
`L < log2(n)- 1`,  which is a bijection over a subset of points in E.
This ensures that encoded plaintext messages can be recovered.

### Serialization {#term-serialization}

A related issue is the conversion of an elliptic curve point to a bitstring. We
refer to this process as "serialization", since it is typically used for
compactly storing and transporting points, or for producing canonicalized
outputs. Since a deserialization algorithm can often be used as a type of
encoding algorithm, we also briefly document properties of these functions.

A straightforward serialization algorithm maps a point (x, y) on E to a bitstring of length
2\*log(p), given that x, y are both elements in GF(p). However, since
there are only n points in E (with n approximately equal to p), it is possible
to serialize to a bitstring of length log(n). For example, one common method
is to store the x-coordinate and a single bit to determine whether the point
is (x, y) or (x, -y), thus requiring log(p)+1 bits. This method reduces storage,
but adds computation, since the deserialization process must recover the y
coordinate.

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


The following table lists algorithms recommended by use-case:


| Application       | Requirement   | Additional Details
|-------------------|---------------|---------|
| SPEKE {{Jablon96}}| Naive         | H(x)*G |
| PAKE  {{BMP00}}   | Random Oracle |   -    |
| BLS {{BLS01}}     | Random Oracle            |    -   |
| IBE {{BF01}}      | Random Oracle | Supersingular, pairing-friendly curve |
| PRF | Injective encoding | F(k, m) = k*H(m) |

To find the suitable algorithm, lookup the requirement from above, with
the chosen curve in the below:

| Curve  | Inj. Encoding | Random Oracle |
|--------|---------------|------|
| P-256 | Simple SWU {{simple-swu}} | FFSTV(SWU) 
| P-384 | Icart {{icart}} | FFSTV(Icart) 
| Curve25519 | Elligator2 {{elligator2}} | ... 
| Curve448 | Elligator2 {{elligator2}} | ... 
| BN-curves | FT-hash + Icart | ...

# Utility Functions {#utility}

Algorithms in this document make use of utility functions described below.

- HashToBase(x, i).
  This method is parametrized by p and H, where p is the prime order of
  the base field Fp, and H is a cryptographic hash function which
  outputs at least floor(log2(p)) + 2 bits.
  The function first hashes x, converts the result to an integer,
  and reduces modulo p to give an element of Fp.

  We provide a more detailed algorithm in {{hashtobase}}. The value of i is used
  to separate inputs when used multiple times in one algorithm (see {{ffstv}}
  for example). When i is omitted, we set it to 0.

- CMOV(a, b, c): If c = 1, return a, else return b.

  Common software implementations of constant-time selects assume c = 1 or c = 0. CMOV
  may be implemented by computing the desired selector (0 or 1) by ORing all bits of c
  together. The end result will be either 0 if all bits of c are zero, or 1 if at least
  one bit of c is 1.

- CTEQ(a, b): Returns a == b.
  Inputs a and b must be the same length (as bytestrings) and the comparison
  must be implemented in constant time.

- Legendre(x, p): x^((p-1)/2).
  The Legendre symbol computes whether the value x is a "quadratic
  residue" modulo p, and takes values 1, -1, 0, for when x is a residue,
  non-residue, or zero, respectively. Due to Euler's criterion, this can be
  computed in constant time, with respect to a fixed p, using
  the equation x^((p-1)/2). For clarity, we will generally prefer using the
  formula directly, and annotate the usage with this definition.

# Deterministic Encodings

## Interface

The generic interface for deterministic encoding functions to elliptic curves is as follows:

~~~
map2curve(alpha)
~~~

where alpha is a message to encode on a curve.

## Encoding Variants

### Icart Method {#icart}

The following map2curve_icart(alpha) implements the Icart method from {{Icart09}}.
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
v = ((3A - u^4) / 6u)
x = (v^2 - B - (u^6 / 27))^(1/3) + (u^2 / 3)
y = ux + v
~~~

The following procedure implements this algorithm in a straight-line fashion.
It requires knowledge of A and B, the constants from the curve Weierstrass form.
It outputs a point with affine coordinates.

~~~
map2curve_icart(alpha)

Input:

  alpha - value to be hashed, an octet string

Output:

  (x, y) - a point in E

Steps:

1.   u = HashToBase(alpha)   // {0,1}^* -> Fp
2.  u2 = u^2 (mod p)         // u^2
3.  t2 = u2^2 (mod p)        // u^4
4.  v1 = 3 * A (mod p)       // 3A in Fp
5.  v1 = v1 - t2 (mod p)     // 3A - u^4
6.  t1 = 6 * u (mod p)       // 6u
7.  t3 = t1 ^ (-1) (mod p)   // modular inverse
8.   v = v1 * t3 (mod p)     // (3A - u^4)/(6u)
9.   x = v^2 (mod p)         // v^2
10.  x = x - B (mod p)       // v^2 - B
11. t1 = 27 ^ (-1) (mod p)   // 1/27
12. t1 = t1 * u2 (mod p)     // u^4 / 27
13. t1 = t1 * t2 (mod p)     // u^6 / 27
14.  x = x - t1 (mod p)      // v^2 - B - u^6/27
15. t1 = (2 * p) - 1         // 2p - 1 in ZZ
16. t1 = t1 / 3              // (2p - 1)/3 in ZZ
17.  x = x^t1 (mod p)        // (v^2 - B - u^6/27) ^ (1/3)
18. t2 = u2 / 3 (mod p)      // u^2 / 3
19.  x = x + t2 (mod p)      // (v^2 - B - u^6/27) ^ (1/3) + (u^2 / 3)
20.  y = u * x (mod p)       // ux
21.  y = y + v (mod p)       // ux + v
22. Output (x, y)
~~~

### Shallue-Woestijne-Ulas Method {#swu}

The Shallue-Woestijne-Ulas (SWU) method, originated in part by
Shallue and Woestijne {{SW06}} and later simplified and extended by Ulas {{SWU07}},
deterministically encodes an arbitrary string to a point on a curve.
This algorithm works for any curve over F_{p^n}. Given curve equation
g(x) = x^3 + Ax + B, this algorithm works as follows:

~~~
1.  t = HashToBase(alpha, 0)
2.  u = HashToBase(alpha, 1)
3. X1 = u
4. X2 = (-B / A)(1 + 1 / (t^4 * g(u)^2 + t^2 * g(u)))
5. X3 = t^3 * g(u)^2  * g(X2)
6. If g(X1) is square, output (X1, sqrt(g(X1)))
7. If g(X2) is square, output (X2, sqrt(g(X2)))
8. Output (X3(t, u), sqrt(g(X3)))
~~~

The algorithm relies on the following equality:

~~~
t^3 * g(u)^2  * g(X2(t, u)) = g(X1(t, u)) * g(X2(t, u)) * g(X3(t, u))
~~~

The algorithm computes three candidate points, constructed such that at least one of
them lies on the curve.

The following procedure implements this algorithm. It outputs a point with affine
coordinates. It requires knowledge of A and B, the constants from the curve
Weierstrass form.

~~~
map2curve_swu(alpha)

Input:

  alpha - value to be hashed, an octet string

Output:

  (x, y) - a point in E

Steps:

1.    t = HashToBase(alpha, 0)   // {0,1}^* -> Fp
2.    u = HashToBase(alpha, 1)   // {0,1}^* -> Fp
3.   t2 = t^2
4.   t4 = t2^2
5.   gu = u^3
6.   gu = gu + (A * u)
7.   gu = gu + B      // gu = g(u)
8.   x1 = u           // x1 = X1(t, u) = u
9.   x2 = B * -1
10.  x2 = x2 / A
11.  gx1 = x1^3
12.  gx1 = gx1 + (A * x1)
13.  gx1 = gx1 + B    // gx1 = g(X1(t, u))
14.  d1 = gu^2
15.  d1 = d1 * t4
16.  d2 = t2 * gu
17.  d3 = d1 + d2
18.  d3 = d3^(-1)
19.  n1 = 1 + d3
20.  x2 = x2 * n1     // x2 = X2(t, u)
21. gx2 = x2^3
22. gx2 = gx2 + (A * x2)
23. gx2 = gx2 + B     // gx2 = g(X2(t, u))
24.  x3 = t2 * gu
25.  x3 = x3 * x2     // x3 = X3(t, u)
26. gx3 = x3^3
27. gx3 = gx3 + (A * x3)
28. gx3 = gx3 + B     // gx3 = g(X3(t, u))
29.  l1 = gx1^((p - 1) / 2)
30.  l2 = gx2^((p - 1) / 2)
31.  s1 = gx1^(1/2)
32.  s2 = gx2^(1/2)
33.  s3 = gx3^(1/2)
34. if l1 == 1:
35.   Output (x1, s1)
36. if l2 == 1:
37.   Output (x2, s2)
38. Output (x3, s3)
~~~

### Simplified SWU Method {#simple-swu}

The following map2curve_simple_swu(alpha) implements the simplified
Shallue-Woestijne-Ulas algorithm from {{SimpleSWU}}. This algorithm
works for any curve over F_{p^n}, where p = 3 mod 4, including:

- P256
- ...

Given curve equation g(x) = x^3 + Ax + B, this algorithm works as follows:

~~~
1. t = HashToBase(alpha)
2. alpha = (-B / A) * (1 + (1 / (t^4 + t^2)))
3. beta = −t^2 * alpha
4. If g(alpha) is square, output (alpha, sqrt(g(alpha)))
5. Output (beta, sqrt(g(beta)))
~~~

The following procedure implements this algorithm. It outputs a point with
affine coordinates. It requires knowledge of A and B, the constants from the
curve Weierstrass form.

~~~
map2curve_simple_swu(alpha)

Input:

  alpha - value to be encoded, an octet string

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
19.   y1 = h2 ^ ((p + 1) / 4) (mod p)
20.   y2 = h3 ^ ((p + 1) / 4) (mod p)
21.    e = CTEQ(y1 ^ 2, h2)   // Constant-time equality
22.    x = CMOV(x2, x3, e)    // If e = 1, choose x2, else choose x3
23.    y = CMOV(y1, y2, e)    // If e = 1, choose y1, else choose y2
24. Output (x, y)
~~~

### Elligator2 Method {#elligator2}

The following map2curve_elligator2(alpha) implements the Elligator2
method from {{Elligator2}}. This algorithm works for any curve
with a point of order 2 and j-invariant != 1728. Given curve equation
y^2 = x(x^2 + Ax + B), i.e., a Montgomery form with (0,0), a point of
order 2, this algorithm works as shown below. (Note that any curve
with a point of order 2 is isomorphic to this representation.)

~~~
1. r = HashToBase(alpha)
2. Let u be a non-square value in Fp
3. v = -A/(1+ur^ 2)
4. e = Legendre(v^3+Av^2+Bv)
5.1. If r != 0, then
5.2.    x = ev - (1 - e)A/2
5.3.    y = -e*sqrt(x^3+Ax^2+x)
5.4. Else, x=0 and y=0
6. Output (x,y)
~~~

Here, e is the Legendre symbol defined as in {{utility}}.

The following procedure implements this algorithm.

~~~
map2curve_elligator2(alpha)

Input:

  alpha - value to be encoded, an octet string

  u - fixed non-square value in Fp.

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
11.  e = v3 + v (mod p)
12. v2 = v2 * A (mod p)
13.  e = v2 + e (mod p)
14.  e = e^((p - 1) / 2)  // = Legendre(e)
15. nv = v * -1 (mod p)
16.  v = CMOV(v, nv, e)   // If e = 1, choose v, else choose nv
17. v2 = CMOV(0, A, e)    // If e = 1, choose 0, else choose A
18.  x = v - v2 (mod p)
19.  y = -e*sqrt(x^3+Ax^2+Bx)
19. Output (x, y)
~~~

Elligator2 can be simplified with projective coordinates.

((TODO: write this variant))

## FT-hash {#fthash}

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
where H1 and H2 are independent hash functions into Fp. We give this encoding and hash function construction
in the steps below.

~~~
map2curve_BN(t)

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
5.   s1 = (f(x1) ^ ((p - 1) / 2))  // calculate quadratic residue of f(x1)
6.   s2 = (f(x2) ^ ((p - 1) / 2))  // calculate quadratic residue of f(x2)
7.   s3 = (f(x3) ^ ((p - 1) / 2))  // calculate quadratic residue of f(x3)
8.   x = x3
9.   x = CMOV(x2 ,x, s2)
10.  x = CMOV(x1, x, s1)
11.  y = f(x)^(1/2) (mod p)
12.  y = (t ^ ((p -1) / 2)) * y (mod p)
13.  Output (x,  y)
~~~
Note that s will always be an integer in the field, due our base assumptions about p. If it is necessary to
specifically define a point for F(0), then a suitable suggestion is f(0) = ( (-1 + s)  /  2, (1+b)^(1/2) ).
In steps 5-7 all relevant quadric residues are calculated in order to prevent possible timing attacks where
s2 and s3 are not calculated if s1 = 1.

Whilst this encoding function works for BN curves and is efficient, it only reaches roughly 9/16ths of
the curve. However, this is enough to be a suitable encoding function for Hash = F(H1(m)) +
F(H2(m)) as explained in {{#ffstv}}, which will be indifferentiable from a random oracle.
This is discussed in in the Random Oracles section {#random-oracles}.

# Curve Transformations

((TODO: write this section))

## Cost Comparison

The following table summarizes the cost of each map2curve variant. We express this cost in
terms of additions (A), multiplications (M), squares (SQ), and square roots (SR).

((TODO: finish this section))

| Algorithm | Cost (Operations) |
| map2curve_icart | TODO |
| map2curve_swu | TODO |
| map2curve_simple_swu | TODO |
| map2curve_elligator2 | TODO |

# Random Oracles {#random-oracles}

## Interface

The generic interface for deterministic encoding functions to elliptic curves is as follows:

~~~
hash2curve(alpha)
~~~

where alpha is a message to encode on a curve.

## General Construction (FFSTV13) {#ffstv}

When applications need a Random Oracle (RO), they can be constructed from deterministic encoding
functions. In particular, let F : {0,1}^* -> E be a deterministic encoding function onto
curve E, and let H0 and H1 be two hash functions modeled as random oracles that map input
messages to the base field of E, i.e., Z_q. Farashahi et al. {{FFSTV13}} showed that the
following mapping is indistinguishable from a RO:

~~~
hash2curve(alpha) = F(H0(alpha)) + F(H1(alpha))
~~~

This construction works for the Icart, SWU, and Simplfied SWU encodings.

Here, H0 and H1 are constructed as follows:

~~~
H0(alpha) = HashToBase(alpha, 2)
H1(alpha) = HashToBase(alpha, 3)
~~~

# Curve Transformations

Every elliptic curve can be converted to an equivalent curve in short Weierstrass form
({{BL07}} Theorem 2.1), making SWU a generic algorithm that can be used for all curves.
Curves in either Edwards or Twisted Edwards form can be transformed into equivalent
curves in Montgomery form {{BL17}} for use with Elligator2.
{{RFC7748}} describes how to convert between points on Curve25519 and Ed25519,
and between Curve448 and its Edwards equivalent, Goldilocks.

# Ciphersuites

To provide concrete recommendations for algorithms we define a hash-to-curve
"ciphersuite" as a four-tuple containing:

* Destination Group (e.g. P256 or Curve25519)
* HashToBase algorithm
* HashToCurve algorithm (e.g. SSWU, Icart)
* (Optional) Transformation (e.g. FFSTV, cofactor clearing)

A ciphersuite defines an algorithm that takes an arbitrary octet string and
returns an element of the Destination Group defined in the ciphersuite by applying
HashToCurve and Transformation (if defined).

This document describes the following set of ciphersuites:
* H2C-P256-SHA256-SSWU-
* H2C-P384-SHA512-Icart-
* H2C-Curve25519-SHA512-Elligator2-Clear
* H2C-Curve448-SHA512-Elligator2-Clear
* H2C-Curve25519-SHA512-Elligator2-FFSTV
* H2C-Curve448-SHA512-Elligator2-FFSTV
* H2C-BN256-SHA512-FT-FFSTV

H2C-P256-SHA256-SWU- is defined as follows:

* The destination group is the set of points on the NIST P-256 elliptic curve, with
  curve parameters as specified in {{DSS}} (Section D.1.2.3) and
  {{RFC5114}} (Section 2.6).
* HashToBase is defined as {#hashtobase} with the hash function defined as
  SHA-256 as specified in {{RFC6234}}, and p set to the prime field used in
  P-256 (2^256 - 2^224 + 2^192 + 2^96 - 1).
* HashToCurve is defined to be {#sswu} with A and B taken from the definition of P-256
  (A=-3, B=41058363725152142129326129780047268409114441015993725554835256314039467401291).

H2C-P384-SHA512-Icart- is defined as follows:

* The destination group is the set of points on the NIST P-384 elliptic curve, with
  curve parameters as specified in {{DSS}} (Section D.1.2.4) and
  {{RFC5114}} (Section 2.7).
* HashToBase is defined as {#hashtobase} with the hash function defined as
  SHA-512 as specified in {{RFC6234}}, and p set to the prime field used in
  P-384 (2^384 - 2^128 - 2^96 + 2^32 - 1).
* HashToCurve is defined to be {#icart} with A and B taken from the definition of P-384
  (A=-3, B=27580193559959705877849011840389048093056905856361568521428707301988689241309860865136260764883745107765439761230575).

H2C-Curve25519-SHA512-Elligator2-Clear is defined as follows:

* The destination group is the points on Curve25519, with
  curve parameters as specified in {{RFC7748}} (Section 4.1).
* HashToBase is defined as {#hashtobase} with the hash function defined as
  SHA-512 as specified in {{RFC6234}}, and p set to the prime field used in
  Curve25519 (2^255 - 19).
* HashToCurve is defined to be {#elligator2} with the curve function defined
  to be the Montgomery form of Curve25519 (y^2 = x^3 + 486662x^2 + x) and
  u = 2.
* The final output is multiplied by the cofactor of Curve25519, 8.

H2C-Curve448-SHA512-Elligator2-Clear is defined as follows:

* The destination group is the points on Curve448, with
  curve parameters as specified in {{RFC7748}} (Section 4.1).
* HashToBase is defined as {#hashtobase} with the hash function defined as
  SHA-512 as specified in {{RFC6234}}, and p set to the prime field used in
  Curve448 (2^448 - 2^224 - 1).
* HashToCurve is defined to be {#elligator2} with the curve function defined
  to be the Montgomery form of Curve448 (y^2 = x^3 + 156326x^2 + x) and
  u = -1.
* The final output is multiplied by the cofactor of Curve448, 4.

H2C-Curve25519-SHA512-Elligator2-FFSTV is defined as in H2C-Curve25519-SHA-512-Elligator2-Clear
except HashToCurve is defined to be {#ffstv} where F is {#elligator2}.

H2C-Curve448-SHA512-Elligator2-FFSTV is defined as in H2C-Curve448-SHA-512-Elligator2-Clear
except HashToCurve is defined to be {#ffstv} where F is {#elligator2}.

H2C-BN256-SHA512-FT-FFSTV is defined as follows:

* The destination group is the points on BN256, with
  curve parameters as descibed in {{NNS10}}
* HashToBase is defined as {#hashtobase} with the hash function defined as
  SHA-512 as specified in {{RFC6234}}, and p set to the prime field used in
  BN256.
* HashToCurve is defined to be the combination of {#fthash} and {#icart} as described in {#fthash}

# IANA Considerations

This document has no IANA actions.

# Security Considerations

Each encoding function variant accepts arbitrary input and maps it to a pseudorandom
point on the curve. Points are close to indistinguishable from randomly chosen
elements on the curve. Not all encoding functions are full-domain hashes. Elligator2,
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
* Ela Lee \\
  Royal Holloway, University of London \\
  Ela.Lee.2010@live.rhul.ac.uk

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

A naive solution includes computing H(m)\*G as map2curve(m), where H is a standard hash
function H : {0, 1}^* -> GF(p), and G is a generator of the curve. Although
efficient, this solution is unsuitable for constructing a random oracle onto
E, since the discrete logarithm with respect to G is known. For example,
given y1 = map2curve(m1) and y2 = map2curve(m2) for any m1 and m2, it must
be true that y2 = H(m2) / H(m1) * map2curve(m1). This relationship would not
hold (with overwhelming probability) for truly random values y1 and y2.
This causes catastrophic failure in many cases. However, one exception is found in
SPEKE {{Jablon96}}, which constructs a base for a Diffie-Hellman key exchange by
hashing the password to a curve point. Notably the use of a hash function is
purely for encoding an arbitrary length string to a curve point, and does not
need to be a random oracle.

## Deterministic Encoding

Shallue, Woestijne, and Ulas {{SW06}} first introduced a deterministic
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
first applies solely to Icart's method described above, by computing F(H0(m))
+ F(H1(m)) for two distinct hash functions H0, H1. The second uses a generator
G, and computes F(H0(m)) + H1(m)\*G. Later, Farashahi et al. {{FFSTV13}}
showed the generality of the F(H0(m)) + F(H1(m)) method, as well as the
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
try-and-increment method may be appropriate. As discussion in {{introduction}},
this variant works by hashing input m using a standard hash function ("Hash"), e.g., SHA256, and
then checking to see if the resulting point E(m, f(m)), for curve function f, belongs on E.
This is detailed below.

~~~
1. ctr = 0
2. h = "INVALID"
3. While h is "INVALID" or h is EC point at infinity:
4.1   CTR = I2OSP(ctr, 4)
4.2   ctr = ctr + 1
4.3   attempted_hash = Hash(m || CTR)
4.4   h = RS2ECP(attempted_hash)
4.5   If h is not "INVALID" and cofactor > 1, set h = h * cofactor
5. Output h
~~~

I2OSP is a function that converts a nonnegative integer to octet string as
defined in Section 4.1 of {{RFC8017}}, and RS2ECP(h) = OS2ECP(0x02 || h), where
OS2ECP is specified in Section 2.3.4 of {{SECG1}}, which converts an input
string into an EC point.

# Sample Code {#samplecode}

This section contains reference implementations for each map2curve variant built
using {{hacspec}}.

## Icart Method

The following hacspec program implements map2curve_icart(alpha) for P-384.

~~~
from hacspec.speclib import *

prime = 2**384 - 2**128 - 2**96 + 2**32 - 1

felem_t = refine(nat, lambda x: x < prime)
affine_t = tuple2(felem_t, felem_t)

@typechecked
def to_felem(x: nat_t) -> felem_t:
    return felem_t(nat(x % prime))


@typechecked
def fadd(x: felem_t, y: felem_t) -> felem_t:
    return to_felem(x + y)


@typechecked
def fsub(x: felem_t, y: felem_t) -> felem_t:
    return to_felem(x - y)


@typechecked
def fmul(x: felem_t, y: felem_t) -> felem_t:
    return to_felem(x * y)


@typechecked
def fsqr(x: felem_t) -> felem_t:
    return to_felem(x * x)


@typechecked
def fexp(x: felem_t, n: nat_t) -> felem_t:
    return to_felem(pow(x, n, prime))


@typechecked
def finv(x: felem_t) -> felem_t:
    return to_felem(pow(x, prime-2, prime))

a384 = to_felem(prime - 3)
b384 = to_felem(27580193559959705877849011840389048093056905856361568521428707301988689241309860865136260764883745107765439761230575)

@typechecked
def map2p384(u:felem_t) -> affine_t:
    v = fmul(fsub(fmul(to_felem(3), a384), fexp(u, 4)), finv(fmul(to_felem(6), u)))
    u2 = fmul(fexp(u, 6), finv(to_felem(27)))
    x = fsub(fsqr(v), b384)
    x = fsub(x, u2)
    x = fexp(x, (2 * prime - 1) // 3)
    x = fadd(x, fmul(fsqr(u), finv(to_felem(3))))
    y = fadd(fmul(u, x), v)
    return (x, y)
~~~

## Shallue-Woestijne-Ulas Method

The following hacspec program implements map2curve_swu(alpha) for P-256.

~~~
from p256 import *
from hacspec.speclib import *

a256 = to_felem(prime - 3)
b256 = to_felem(41058363725152142129326129780047268409114441015993725554835256314039467401291)

@typechecked
def f_p256(x:felem_t) -> felem_t:
    return fadd(fexp(x, 3), fadd(fmul(to_felem(a256), x), to_felem(b256)))

@typechecked
def x1(t:felem_t, u:felem_t) -> felem_t:
    return u

@typechecked
def x2(t:felem_t, u:felem_t) -> felem_t:
    coefficient = fmul(to_felem(-b256), finv(to_felem(a256)))
    t2 = fsqr(t)
    t4 = fsqr(t2)
    gu = f_p256(u)
    gu2 = fsqr(gu)
    denom = fadd(fmul(t4, gu2), fmul(t2, gu))
    return fmul(coefficient, fadd(to_felem(1), finv(denom)))

@typechecked
def x3(t:felem_t, u:felem_t) -> felem_t:
    return fmul(fsqr(t), fmul(f_p256(u), x2(t, u)))

@typechecked
def map2p256(t:felem_t) -> felem_t:
    u = fadd(t, to_felem(1))
    x1v = x1(t, u)
    x2v = x2(t, u)
    x3v = x3(t, u)

    exp = to_felem((prime - 1) // 2)
    e1 = fexp(f_p256(x1v), exp)
    e2 = fexp(f_p256(x2v), exp)

    if e1 == 1:
        return x1v
    elif e2 == 1:
        return x2v
    else:
        return x3v
~~~

## Simplified SWU Method {#sswu}

The following hacspec program implements map2curve_simple_swu(alpha) for P-256.

~~~
from p256 import *
from hacspec.speclib import *

a256 = to_felem(prime - 3)
b256 = to_felem(41058363725152142129326129780047268409114441015993725554835256314039467401291)

def f_p256(x:felem_t) -> felem_t:
    return fadd(fexp(x, 3), fadd(fmul(to_felem(a256), x), to_felem(b256)))

def map2p256(t:felem_t) -> affine_t:
    alpha = to_felem(-(fsqr(t)))
    frac = finv((fadd(fsqr(alpha), alpha)))
    coefficient = fmul(to_felem(-b256), finv(to_felem(a256)))
    x2 = fmul(coefficient, fadd(to_felem(1), frac))

    x3 = fmul(alpha, x2)
    h2 = fadd(fexp(x2, 3), fadd(fmul(a256, x2), b256))
    h3 = fadd(fexp(x3, 3), fadd(fmul(a256, x3), b256))

    exp = fmul(fadd(to_felem(prime), to_felem(-1)), finv(to_felem(2)))
    e = fexp(h2, exp)

    exp = to_felem((prime + 1) // 4)
    if e == 1:
      return (x2, fexp(f_p256(x2), exp))
    else:
      return (x3, fexp(f_p256(x3), exp))
~~~

## Elligator2 Method

The following hacspec program implements map2curve_elligator2(alpha) for Curve25519.

~~~
from curve25519 import *
from hacspec.speclib import *

a25519 = to_felem(486662)
b25519 = to_felem(1)
u25519 = to_felem(2)

@typechecked
def f_25519(x:felem_t) -> felem_t:
    return fadd(fmul(x, fsqr(x)), fadd(fmul(a25519, fsqr(x)), x))

@typechecked
def map2curve25519(r:felem_t) -> felem_t:
    d = fsub(to_felem(p25519), fmul(a25519, finv(fadd(to_felem(1), fmul(u25519, fsqr(r))))))
    power = nat((p25519 - 1) // 2)
    e = fexp(f_25519(d), power)
    x = 0
    if e != 1:
        x = fsub(to_felem(-d), to_felem(a25519))
    else:
        x = d

    return x
~~~

## HashToBase {#hashtobase}

The following procedure implements HashToBase.

~~~
HashToBase(x, i)

Parameters:

  H - cryptographic hash function to use
  hbits - number of bits output by H
  p - order of the base field Fp
  label - context label for domain separation

Preconditions:

  floor(log2(p)) + 1 >= hbits

Input:

  x - value to be hashed, an octet string
  i - hash call index, a non-negative integer

Output:

  y - a value in the field Fp

Steps:

  1. t1 = H("h2c" || label || I2OSP(i, 4) || x)
  2. t2 = OS2IP(t1)
  3. y = t2 (mod p)
  4. Output y
~~~

where I2OSP, OS2IP {{RFC8017}} are used to convert an octet string to and from
a non-negative integer, and a || b denotes concatenation of a and b.

### Considerations

Performance: HashToBase requires hashing the entire input x. In some
algorithms/ciphersuite combinations, HashToBase is called multiple times. For
large inputs, implementers can therefore consider hashing x before calling
HashToBase. I.e. HashToBase(H'(x)).

Most algorithms assume that HashToBase maps its input to the base field
uniformly. In practice, there will be inherent biases. For example, taking H
as SHA256, over the finite field used by Curve25519 we have p = 2^255 - 19, and
thus when reducing from 255 bits, the values of 0 .. 19 will be twice as
likely to occur. This is a standard problem in generating uniformly
distributed integers from a bitstring. In this example, the resulting bias is
negligible, but for others this bias can be significant.

To address this, our HashToBase algorithm greedily takes as many bits as
possible before reducing mod p, in order to smooth out this bias. This is
preferable to an iterated procedure, such as rejection sampling, since this
can be hard to reliably implement in constant time.
