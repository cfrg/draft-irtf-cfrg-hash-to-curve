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
  RFC7748:
  RFC8032:
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

--- abstract

XXX

--- middle

# Introduction

This document specifies a number of different algorithms for deterministically hashing 
into an elliptic curve.

XXX: try and increment
XXX: and a constant time variant

## Terminology

The following terms are used throughout this document.

- TODO: TODO

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

# Supported Curves

p256, ...

# Non-Constant-Time Hashing

The following hash_to_curve_increment(alpha, x) algorithm implements
a generic "try and increment" variant of hash_to_curve(alpha, x)
that works for any elliptic curve. Note that x is optional and, 
if omitted, is set to the identity element of the curve.

The running time of this algorithm depends on alpha. This algorithm 
is expected to find a valid curve point after approximately two 
attempts, i.e., when ctr=1, on average. See also {{Icart09}}.

However, because the running time of algorithm depends on alpha, this
algorithm SHOULD be avoided in applications where it is important
that the VRF input alpha remain secret.

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

# Constant-Time Hashing

The following hash_to_curve_constant(alpha, x) algorithm implements
a constant-time variant of hash_to_curve(alpha, x). This variant MUST be used
if the input -- alpha -- MUST be kept secret. 

((TODO: write me))
