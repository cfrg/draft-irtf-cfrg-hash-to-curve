---
title: Hashing to Elliptic Curves
abbrev: hash-to-curve
docname: draft-irtf-cfrg-hash-to-curve-latest
date:
category: info
workgroup: CFRG

ipr: trust200902
keyword: Internet-Draft

stand_alone: yes
pi: [toc, sortrefs, symrefs]

author:
 -
    ins: A. Faz-Hernandez
    name: Armando Faz-Hernandez
    org: Cloudflare
    street: 101 Townsend St
    city: San Francisco
    country: United States of America
    email: armfazh@cloudflare.com
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
    ins: R. S. Wahby
    name: Riad S. Wahby
    org: Stanford University
    email: rsw@cs.stanford.edu
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
  RFC8017:
  RFC7748:
informative:
  BLS12-381:
    target: https://electriccoin.co/blog/new-snark-curve/
    title: "BLS12-381: New zk-SNARK Elliptic Curve Construction"
    date: Mar, 2017
    author:
      -
        ins: S. Bowe
        name: Sean Bowe
        org: Electric Coin Company
  SEC1:
    title: "SEC 1: Elliptic Curve Cryptography"
    target: http://www.secg.org/sec1-v2.pdf
    date: May, 2009
    author:
      -
        org: Standards for Efficient Cryptography Group (SECG)
  SEC2:
    title: "SEC 2: Recommended Elliptic Curve Domain Parameters"
    target: http://www.secg.org/sec2-v2.pdf
    date: Jan, 2010
    author:
      -
        org: Standards for Efficient Cryptography Group (SECG)
  FIPS180-4:
    title: "Secure Hash Standard (SHS)"
    target: https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf
    date: Aug, 2015
    author:
      -
        org: National Institute of Standards and Technology (NIST)
  FIPS186-4:
    title: "FIPS Publication 186-4: Digital Signature Standard"
    target: https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.186-4.pdf
    date: Jul, 2013
    author:
      -
        org: National Institute of Standards and Technology (NIST)
  FIPS202:
    title: "SHA-3 Standard: Permutation-Based Hash and Extendable-Output Functions"
    target: https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
    date: Aug, 2015
    author:
      -
        org: National Institute of Standards and Technology (NIST)
  BDPV08:
    title: On the Indifferentiability of the Sponge Construction
    seriesinfo:
        "In": Advances in Cryptology - EUROCRYPT 2008
        "pages": 181-197
        DOI: 10.1007/978-3-540-78967-3_11
    target: https://doi.org/10.1007/978-3-540-78967-3_11
    date: 2008
    author:
      -
        ins: G. Bertoni,
        name: Guido Bertoni
        org: STMicroelectronics
      -
        ins: J. Daemen
        name: Joan Daemen
        org: STMicroelectronics
      -
        ins: M. Peeters
        name: Michael Peeters
        org: NXP Semiconductors
      -
        ins: G. Van Assche
        name: Gilles Van Assche
        org: STMicroelectronics
  CDMP05:
    title: "Merkle-Damgaard Revisited: How to Construct a Hash Function"
    seriesinfo:
        "In": Advances in Cryptology - CRYPTO 2005
        "pages": 430-448
        DOI: 10.1007/11535218_26
    target: https://doi.org/10.1007/11535218_26
    date: 2005
    author:
      -
        ins: J-S. Coron
        name: Jean-Sebastien Coron
        org: University of Luxembourg
      -
        ins: Y. Dodis
        name: Yevgeniy Dodis
        org: New York University
      -
        ins: C. Malinaud
        name: Cecile Malinaud
        org: University of Luxembourg
      -
        ins: P. Puniya
        name: Prashant Puniya
        org: New York University
  BLAKE2X:
    title: BLAKE2X
    target: https://blake2.net/blake2x.pdf
    date: Dec, 2016
    author:
      -
        ins: J-P. Aumasson
        name: Jean-Philippe Aumasson
      -
        ins: S. Neves
        name: Samuel Neves
      -
        ins: Z. Wilcox-O'Hearn
        name: Zooko Wilcox-O'Hearn
      -
        ins: C. Winnerlein
        name: Christian Winnerlein
  Icart09:
    title: How to Hash into Elliptic Curves
    seriesinfo:
        "In": Advances in Cryptology - CRYPTO 2009
        "pages": 303-316
        DOI: 10.1007/978-3-642-03356-8_18
    target: https://doi.org/10.1007/978-3-642-03356-8_18
    date: 2009
    author:
      -
        ins: T. Icart
        name: Thomas Icart
        org: Sagem Securite and Universite du Luxembourg
  BBJLP08:
    title: Twisted Edwards curves
    seriesinfo:
        "In": AFRICACRYPT 2008
        "pages": 389-405
        DOI: 10.1007/978-3-540-68164-9_26
    target: https://doi.org/10.1007/978-3-540-68164-9_26
    date: 2008
    author:
      -
        ins: D. J. Bernstein
        name: Daniel J. Bernstein
        org: Department of Computer Science, University of Illinois at Chicago, USA
      -
        ins: P. Birkner
        name: Peter Birkner
        org: Department of Mathematics and Computer Science, Technische Universiteit Eindhoven, The Netherlands
      -
        ins: M. Joye
        name: Marc Joye
        org: Thomson R&D France
      -
        ins: T. Lange
        name: Tanja Lange
        org: Department of Mathematics and Computer Science, Technische Universiteit Eindhoven, The Netherlands
      -
        ins: C. Peters
        name: Christiane Peters
        org: Department of Mathematics and Computer Science, Technische Universiteit Eindhoven, The Netherlands
  CK11:
    title: The geometry of flex tangents to a cubic curve and its parameterizations
    seriesinfo:
        "In": Journal of Symbolic Computation, vol 47 issue 3
        "pages": 266-281
        DOI: 10.1016/j.jsc.2011.11.003
    target: https://doi.org/10.1016/j.jsc.2011.11.003
    date: 2012
    author:
      -
        ins: J. Couveignes
        name: Jean-Marc Couveignes
        org: Universite Bordeaux
      -
        ins: J. Kammerer
        name: Jean-Gabriel Kammerer
        org: Universite de Rennes
  F11:
    title: Hashing into Hessian curves
    seriesinfo:
        "In": AFRICACRYPT 2011
        "pages": 278-289
        DOI: 10.1007/978-3-642-21969-6_17
    target: https://doi.org/10.1007/978-3-642-21969-6_17
    date: 2011
    author:
      -
        ins: R. R. Farashahi
        name: Reza R. Farashahi
        org: Macquarie Universit
  FSV09:
    title: On hashing into elliptic curves
    seriesinfo:
        "In": Journal of Mathematical Cryptology, vol 3 no 4
        "pages": 353-360
        DOI: 10.1515/JMC.2009.022
    target: https://doi.org/10.1515/JMC.2009.022
    date: 2009
    author:
      -
        ins: R. R. Farashahi
        name: Reza R. Farashahi
        org: Macquarie Universit
      -
        ins: I. E. Shparlinski
        name: Igor E. Shparlinski
        org: Macquarie Universit
      -
        ins: J. F. Voloch
        name: J. Felipe Voloch
        org: University of Texas
  FT10:
    title: Estimating the size of the image of deterministic hash functions to elliptic curves.
    seriesinfo:
        "In": Progress in Cryptology - LATINCRYPT 2010
        "pages": 81-91
        DOI: 10.1007/978-3-642-14712-8_5
    target: https://doi.org/10.1007/978-3-642-14712-8_5
    date: 2010
    author:
      -
        ins: P-A. Fouque
        name: Pierre-Alain Fouque
        org: Ecole Normale Superieure and INRIA Rennes
      -
        ins: M. Tibouchi
        name: Mehdi Tibouchi
        org: NTT Secure Platform Laboratories
  FT12:
    title: Indifferentiable Hashing to Barreto-Naehrig Curves
    seriesinfo:
        "In": Progress in Cryptology - LATINCRYPT 2012
        "pages": 1-7
        DOI: 10.1007/978-3-642-33481-8_1
    target: https://doi.org/10.1007/978-3-642-33481-8_1
    date: 2012
    author:
      -
        ins: P-A. Fouque
        name: Pierre-Alain Fouque
        org: Ecole Normale Superieure and INRIA Rennes
      -
        ins: M. Tibouchi
        name: Mehdi Tibouchi
        org: NTT Secure Platform Laboratories
  FJT13:
    title: Injective encodings to elliptic curves
    seriesinfo:
        "In": ACISP 2013
        "pages": 203-218
        DOI: 10.1007/978-3-642-39059-3_14
    target: https://doi.org/10.1007/978-3-642-39059-3_14
    date: 2013
    author:
      -
        ins: P-A. Fouque
        name: Pierre-Alain Fouque
        org: Ecole Normale Superieure and INRIA Rennes
      -
        ins: A. Joux
        name: Antoine Joux
        org: Sorbonne Universite
      -
        ins: M. Tibouchi
        name: Mehdi Tibouchi
        org: NTT Secure Platform Laboratories
  KLR10:
    title: Encoding points on hyperelliptic curves over finite fields in deterministic polynomial time
    seriesinfo:
        "In": PAIRING 2010
        "pages": 278-297
        DOI: 10.1007/978-3-642-17455-1_18
    target: https://doi.org/10.1007/978-3-642-17455-1_18
    date: 2010
    author:
      -
        ins: J. Kammerer
        name: Jean-Gabriel Kammerer
        org: Universite de Rennes
      -
        ins: R. Lercier
        name: Reynald Lercier
        org: Universite de Rennes
      -
        ins: G. Renault
        name: Guenael Renault
        org: Universite Pierre et Marie Curie
  AR13:
    title: Square Root Computation over Even Extension Fields
    seriesinfo:
        "In": IEEE Transactions on Computers. vol 63 issue 11
        "pages": 2829-2841
        DOI: 10.1109/TC.2013.145
    target: https://doi.org/10.1109/TC.2013.145
    date: Nov, 2014
    author:
     -
        ins: G. Adj
        name: Gora Adj
        org: ISFA, Universite Claude Bernard Lyon 1, Villeurbanne, France
     -
        ins: F. Rodriguez-Henriquez
        name: Francisco Rodriguez-Henriquez
        org: CINVESTAV-IPN, San Pedro Zacatenco, Mexico City, Mexico.
  BN05:
    title: Pairing-Friendly Elliptic Curves of Prime Order
    seriesinfo:
        "In": Selected Areas in Cryptography 2005
        "pages": 319-331
        DOI: 10.1007/11693383_22
    target: https://doi.org/10.1007/11693383_22
    date: 2006
    author:
      -
        ins: P. Barreto
        name: Paulo S. L. M. Barreto
        org: Escola Politecnica, Universidade de Sao Paulo, Sao Paulo, Brazil
      -
        ins: M. Naehrig
        name: Michael Naehrig
        org: Lehrstuhl fur Theoretische Informationstechnik, Rheinisch-Westfalische Technische Hochschule Aachen, Aachen, Germany
  AFQTZ14:
    title: Binary Elligator squared
    seriesinfo:
        "In": Selected Areas in Cryptography - SAC 2014
        "pages": 20-37
        DOI: 10.1007/978-3-319-13051-4_2
    target: https://doi.org/10.1007/978-3-319-13051-4_2
    date: 2014
    author:
      -
        ins: D. F. Aranha
        name: Diego F. Aranha
        org: Institute of Computing, University of Campinas
      -
        ins: P. A. Fouque
        name: Pierre-Alain Fouque
        org: Universite de Rennes 1 and Institut Universitaire de France
      -
        ins: C. Qian
        name: Chen Qian
        org: ENS Rennes
      -
        ins: M. Tibouchi
        name: Mehdi Tibouchi
        org: NTT Secure Platform Laboratories
      -
        ins: J. C. Zapalowicz
        name: Jean-Christophe Zapalowicz
        org: INRIA
  T14:
    title: "Elligator squared: Uniform points on elliptic curves of prime order as uniform random strings"
    seriesinfo:
        "In": Financial Cryptography and Data Security - FC 2014
        "pages": 139-156
        DOI: 10.1007/978-3-662-45472-5_10
    target: https://doi.org/10.1007/978-3-662-45472-5_10
    date: 2014
    author:
      -
        ins: M. Tibouchi
        name: Mehdi Tibouchi
        org: NTT Secure Platform Laboratories
  TK17:
    title: Improved elliptic curve hashing and point representation
    seriesinfo:
        "In": Designs, Codes, and Cryptography, vol 82
        "pages": 161-177
        DOI: 10.1007/s10623-016-0288-2
    target: https://doi.org/10.1007/s10623-016-0288-2
    date: 2017
    author:
      -
        ins: M. Tibouchi
        name: Mehdi Tibouchi
        org: NTT Secure Platform Laboratories
      -
        ins: T. Kim
        name: Taechan Kim
        org: NTT Secure Platform Laboratories
  BF01:
    title: Identity-based encryption from the Weil pairing
    seriesinfo:
        "In": Advances in Cryptology - CRYPTO 2001
        "pages": 213-229
        DOI: 10.1007/3-540-44647-8_13
    target: https://doi.org/10.1007/3-540-44647-8_13
    date: Aug, 2001
    author:
      -
        ins: D. Boneh
        name: Dan Boneh
        org: Stanford University
      -
        ins: M. Franklin
        name: Matthew Franklin
        org: UC Davis
  BLS01:
    title: Short signatures from the Weil pairing
    seriesinfo:
        "In": Journal of Cryptology, vol 17
        "pages": 297-319
        DOI: 10.1007/s00145-004-0314-9
    target: https://doi.org/10.1007/s00145-004-0314-9
    date: Jul, 2004
    author:
      -
        ins: D. Boneh
        name: Dan Boneh
        org: Stanford University
      -
        ins: B. Lynn
        name: Ben Lynn
        org: Stanford University
      -
        ins: H. Shacham
        name: Hovav Shacham
        org: Stanford University
  BLS03:
    title: Constructing Elliptic Curves with Prescribed Embedding Degrees
    seriesinfo:
        "In": Security in Communication Networks
        "pages": 257-267
        DOI: 10.1007/3-540-36413-7_19
    target: https://doi.org/10.1007/3-540-36413-7_19
    date: 2003
    author:
      -
        ins: P. Barreto
        name: Paulo S. L. M. Barreto
        org: Universidade de Sao Paulo, Brazil
      -
        ins: B. Lynn
        name: Ben Lynn
        org: Stanford University
      -
        ins: M. Scott
        name: Michael Scott
        org: Dublin City University, Ireland
  BMP00:
    title: Provably secure password-authenticated key exchange using Diffie-Hellman
    seriesinfo:
        "In": Advances in Cryptology - EUROCRYPT 2000
        "pages": 156-171
        DOI: 10.1007/3-540-45539-6_12
    target: https://doi.org/10.1007/3-540-45539-6_12
    date: May, 2000
    author:
      -
        ins: V. Boyko
        name: Victor Boyko
        org: MIT Laboratory for Computer Science
      -
        ins: P. D. MacKenzie
        name: Philip D. MacKenzie
        org: Bell Laboratories, Lucent Technologies
      -
        ins: S. Patel
        name: Sarvar Patel
        org: Bell Laboratories, Lucent Technologies
  J96:
    title: Strong password-only authenticated key exchange
    seriesinfo:
        "In": SIGCOMM Computer Communication Review, vol 26 issue 5
        "pages": 5-26
        DOI: 10.1145/242896.242897
    target: https://doi.org/10.1145/242896.242897
    date: 1996
    author:
      -
        ins: D. P. Jablon
        name: David P. Jablon
        org: Integrity Sciences, Inc. Westboro, MA.
  hash2curve-repo:
    title: Hashing to Elliptic Curves - GitHub repository
    target: https://github.com/cfrg/draft-irtf-cfrg-hash-to-curve
    date: 2019
  jubjub-fq:
    title: zkcrypto/jubjub - fq.rs
    target: https://github.com/zkcrypto/jubjub/blob/master/src/fq.rs
    date: 2019
  L13:
    title: Implementing Elligator for Curve25519
    target: https://www.imperialviolet.org/2013/12/25/elligator.html
    date: 2013
    author:
      -
        ins: A. Langley
        name: Adam Langley
  SBCDK09:
    title: Fast Hashing to G2 on Pairing-Friendly Curves
    seriesinfo:
        "In": Pairing-Based Cryptography - Pairing 2009
        "pages": 102-113
        DOI: 10.1007/978-3-642-03298-1_8
    target: https://doi.org/10.1007/978-3-642-03298-1_8
    date: 2009
    author:
      -
        ins: M. Scott
        name: Michael Scott
        org: School of Computing Dublin City University, Ballymun. Dublin, Ireland.
      -
        ins: N. Benger
        name: Naomi Benger
        org: School of Computing Dublin City University, Ballymun. Dublin, Ireland.
      -
        ins: M. Charlemagne
        name: Manuel Charlemagne
        org: School of Computing Dublin City University, Ballymun. Dublin, Ireland.
      -
        ins: L. J. Dominguez Perez
        name: Luis J. Dominguez Perez
        org: School of Computing Dublin City University, Ballymun. Dublin, Ireland.
      -
        ins: E. J. Kachisa
        name: Ezekiel J. Kachisa
        org: School of Computing Dublin City University, Ballymun. Dublin, Ireland.
  FKR11:
    title: Fast Hashing to G2 on Pairing-Friendly Curves
    seriesinfo:
        "In": Selected Areas in Cryptography
        "pages": 412-430
        DOI: 10.1007/978-3-642-28496-0_25
    target: https://doi.org/10.1007/978-3-642-28496-0_25
    date: 2011
    author:
      -
       ins: L. Fuentes-Castaneda
       name: Laura Fuentes-Castaneda
       org: Computer Science Department, CINVESTAV-IPN. Mexico
      -
        ins: E. Knapp
        name: Edward Knapp
        org: Dept. Combinatorics & Optimization, University of Waterloo, Canada
      -
       ins: F. Rodriguez-Henriquez
       org: Computer Science Department, CINVESTAV-IPN. Mexico
       name: Francisco Rodriguez-Henriquez
  BP17:
    title: Efficient hash maps to G2 on BLS curves
    seriesinfo:
        "ePrint": 2017/419
    target: https://eprint.iacr.org/2017/419
    date: May, 2017
    author:
      -
       ins: A. Budroni
       name: Alessandro Budroni
       org: University of Bergen, Norway and MIRACL Labs, London, England
      -
        ins: F. Pintore
        name: Federico Pintore
        org: University of Trento, Italy
  BHKL13:
    title: "Elligator: elliptic-curve points indistinguishable from uniform random strings"
    seriesinfo:
        "In": Proceedings of the 2013 ACM SIGSAC conference on computer and communications security.
        "pages": 967-980
        DOI: 10.1145/2508859.2516734
    target: https://doi.org/10.1145/2508859.2516734
    date: Nov, 2013
    author:
      -
        ins: D. J. Bernstein
        name: Daniel J. Bernstein
        org: Department of Computer Science, University of Illinois at Chicago, USA
      -
        ins: M. Hamburg
        name: Mike Hamburg
        org: Cryptography Research, a division of Rambus, USA
      -
        ins: A. Krasnova
        name: Anna Krasnova
        org: Privacy & Identity lab, Institute for Computing and Information Sciences, Radboud University Nijmegen, The Netherlands
      -
        ins: T. Lange
        name: Tanja Lange
        org: Department of Mathematics and Computer Science, Technische Universiteit Eindhoven, The Netherlands
  BLMP19:
    title: "Quantum circuits for the CSIDH: optimizing quantum evaluation of isogenies"
    seriesinfo:
        "In": Advances in Cryptology - EUROCRYPT 2019
        DOI: 10.1007/978-3-030-17656-3
    target: https://doi.org/10.1007/978-3-030-17656-3
    date: 2019
    author:
      -
        ins: D. J. Bernstein
        name: Daniel J. Bernstein
        org: Department of Computer Science, University of Illinois at Chicago, USA
      -
        ins: T. Lange
        name: Tanja Lange
        org: Department of Mathematics and Computer Science, Technische Universiteit Eindhoven, The Netherlands
      -
        ins: C. Martindale
        name: Chloe Martindale
        org: Department of Mathematics and Computer Science, Technische Universiteit Eindhoven, The Netherlands
      -
        ins: L. Panny
        name: Lorenz Panny
        org: Department of Mathematics and Computer Science, Technische Universiteit Eindhoven, The Netherlands
  SS04:
    title: On equations y^2 = x^n + k in a finite field.
    seriesinfo:
        "In": Bulletin Polish Acad. Sci. Math. vol 52, no 3
        "pages": 223-226
        DOI: 10.4064/ba52-3-1
    target: https://doi.org/10.4064/ba52-3-1
    date: 2004
    author:
      -
        ins: A. Schinzel
        name: Andrzej Schinzel
        org: Department of Mathemetics, University of Warsaw
      -
        ins: M. Skalba
        name: Mariusz Skalba
        org: Department of Mathematics, University of Warsaw
  S05:
    title: Points on elliptic curves over finite fields
    seriesinfo:
        "In": Acta Arithmetica, vol 117 no 3
        "pages": 293-301
        DOI: 10.4064/aa117-3-7
    target: https://doi.org/10.4064/aa117-3-7
    date: 2005
    author:
      -
        ins: M. Skalba
        name: Mariusz Skalba
        org: Department of Mathematics, University of Warsaw
  SW06:
    title: Construction of rational points on elliptic curves over finite fields
    seriesinfo:
        "In": Algorithmic Number Theory. ANTS 2006.
        "pages": 510-524
        DOI: 10.1007/11792086_36
    target: https://doi.org/10.1007/11792086_36
    date: 2006
    author:
      -
        ins: A. Shallue
        name: Andrew Shallue
        org: Mathematics Department, University of Wisconsin-Madison. Madison, USA.
      -
        ins: C. van de Woestijne
        name: Christiaan van de Woestijne
        org: Mathematisch Instituut, Universiteit Leiden. Leiden, The Netherlands.
  U07:
    title: Rational points on certain hyperelliptic curves over finite fields
    seriesinfo:
        "In": Bulletin Polish Acad. Sci. Math. vol 55, no 2
        "pages": 97-104
        DOI: 10.4064/ba55-2-1
    target: https://doi.org/10.4064/ba55-2-1
    date: 2007
    author:
      -
        ins: M. Ulas
        name: Maciej Ulas
        org: Institute of Mathematics, Jagiellonian University. Poland
  BCIMRT10:
    title: Efficient Indifferentiable Hashing into Ordinary Elliptic Curves
    seriesinfo:
        "In": Advances in Cryptology - CRYPTO 2010
        "pages": 237-254
        DOI: 10.1007/978-3-642-14623-7_13
    target: https://doi.org/10.1007/978-3-642-14623-7_13
    date: 2010
    author:
      -
        ins: E. Brier
        name: Eric Brier
        org: Ingenico
      -
        ins: J-S. Coron
        name: Jean-Sebastien Coron
        org: Universite du Luxembourg
      -
        ins: T. Icart
        name: Thomas Icart
        org: Universite du Luxembourg
      -
        ins: D. Madore
        name: David Madore
        org: TELECOM-ParisTech
      -
        ins: H. Randriam
        name: Hugues Randriam
        org: TELECOM-ParisTech
      -
        ins: M. Tibouchi
        name: Mehdi Tibouchi
        org: Universite du Luxembourg, Ecole normale superieure
  W08:
    title: "Elliptic curves: Number theory and cryptography"
    seriesinfo:
        edition: 2nd
        publisher: Chapman and Hall / CRC
        ISBN: 9781420071467
    target: https://www.crcpress.com/9781420071467
    date: 2008
    author:
      -
        ins: L. C. Washington
        name: Lawrence C. Washington
  C93:
    title: "A Course in Computational Algebraic Number Theory"
    seriesinfo:
        publisher: Springer-Verlag
        ISBN: 9783642081422
    target: https://doi.org/10.1007/978-3-662-02945-9
    date: 1993
    author:
      -
        ins: H. Cohen
        name: Henri Cohen
  CFADLNV05:
    title: Handbook of Elliptic and Hyperelliptic Curve Cryptography
    seriesinfo:
        publisher: Chapman and Hall / CRC
        ISBN: 9781584885184
    target: https://www.crcpress.com/9781584885184
    date: 2005
    author:
      -
        ins: H. Cohen
        name: Henri Cohen
      -
        ins: G. Frey
        name: Gerhard Frey
      -
        ins: R. Avanzi
        name: Roberto Avanzi
      -
        ins: C. Doche
        name: Christophe Doche
      -
        ins: T. Lange
        name: Tanja Lange
      -
        ins: K. Nguyen
        name: Kim Nguyen
      -
        ins: F. Vercauteren
        name: Frederik Vercauteren
  WB19:
    title: Fast and simple constant-time hashing to the BLS12-381 elliptic curve
    seriesinfo:
        "In": IACR Trans. CHES
        "volume": 2019
        "issue": 4
        DOI: 10.13154/tches.v2019.i4.154-179
        "ePrint": 2019/403
    target: https://eprint.iacr.org/2019/403
    date: Aug, 2019
    author:
      -
        ins: R. S. Wahby
        name: Riad S. Wahby
        org: Stanford University
      -
        ins: D. Boneh
        name: Dan Boneh
        org: Stanford University
  FFSTV13:
    title: Indifferentiable deterministic hashing to elliptic and hyperelliptic curves
    seriesinfo:
        "In": Math. Comp. vol 82
        "pages": 491-512
        DOI: 10.1090/S0025-5718-2012-02606-8
    target: https://doi.org/10.1090/S0025-5718-2012-02606-8
    date: 2013
    author:
      -
        ins: R. R. Farashahi
        name: Reza R. Farashahi
        org: Macquarie Universit
      -
        ins: P. A. Fouque
        name: Pierre-Alain Fouque
        org: Ecole normale superieure
      -
        ins: I. E. Shparlinski
        name: Igor E. Shparlinski
        org: Macquarie Universit
      -
        ins: M. Tibouch
        name: Mehdi Tibouch
        org: Ecole normale superieure
      -
        ins: J. F. Voloch
        name: J. Felipe Voloch
        org: University of Texas
  MRH04:
    title: "Indifferentiability, impossibility results on reductions, and applications to the random oracle methodology"
    seriesinfo:
      "In": "TCC 2004: Theory of Cryptography"
      "pages": 21-39
      DOI: 10.1007/978-3-540-24638-1_2
    target: https://doi.org/10.1007/978-3-540-24638-1_2
    date: Feb, 2004
    author:
      -
        ins: U. Maurer
        name: Ueli Maurer
        org: ETH Zurich
      -
        ins: R. Renner
        name: Renato Renner
        org: ETH Zurich
      -
        ins: C. Holenstein
        name: Clemens Holenstein
        org: ETH Zurich
  S85:
    title: Elliptic Curves Over Finite Fields and the Computation of Square Roots mod p
    seriesinfo:
        "In": Mathematics of Computation vol 44 issue 170
        "pages": 483-494
        DOI: 10.1090/S0025-5718-1985-0777280-6
    target: https://doi.org/10.1090/S0025-5718-1985-0777280-6
    date: Apr, 1985
    author:
      -
        ins: R. Schoof
        name: Rene Schoof
  SAGE:
    title: SageMath, the Sage Mathematics Software System
    author:
      -
        org: The Sage Developers
    target: https://www.sagemath.org
    date: 2019
  LBB19:
    title: A Mechanised Proof of the WireGuard Virtual Private Network Protocol
    seriesinfo:
        "In": INRIA Research Report No. 9269
    target: https://hal.inria.fr/hal-02100345/
    date: Apr, 2019
    author:
      -
        ins: B. Lipp
        name: Benjamin Lipp
        org: INRIA Paris
      -
        ins: B. Blanchet
        name: Bruno Blanchet
        org: INRIA Paris
      -
        ins: K. Bhargavan
        name: Karthikeyan Bhargavan
        org: INRIA Paris
  RSS11:
    title: "Careful with Composition: Limitations of the Indifferentiability Framework"
    seriesinfo:
      "In": Advances in Cryptology - EUROCRYPT 2011
      "pages": 487-506
      DOI: 10.1007/978-3-642-20465-4_27
    target: https://doi.org/10.1007/978-3-642-20465-4_27
    date: May, 2011
    author:
      -
        ins: T. Ristenpart
        name: Thomas Ristenpart
        org: University of Wisconsin-Madison
      -
        ins: H. Shacham
        name: Hovav Shacham
        org: UC San Diego
      -
        ins: T. Shrimpton
        name: Thomas Shrimpton
        org: Portland State University
  W19:
    title: An explicit, generic parameterization for the Shallue--van de Woestijne map
    target: https://github.com/cfrg/draft-irtf-cfrg-hash-to-curve/raw/master/doc/svdw_params.pdf
    date: 2019
    author:
      -
        ins: R. S. Wahby
        name: Riad S. Wahby
        org: Stanford University
  p1363a:
    title: "IEEE Standard Specifications for Public-Key Cryptography---Amendment 1: Additional Techniques"
    target: https://standards.ieee.org/standard/1363a-2004.html
    date: March, 2004
    author:
      -
        org: IEEE Computer Society
  x9.62:
    title: "Public Key Cryptography for the Financial Services Industry: the Elliptic Curve Digital Signature Algorithm (ECDSA)"
    date: Sep, 1998
    seriesinfo:
      "ANSI": X9.62-1998
    author:
      -
        org: ANSI

--- abstract

This document specifies a number of algorithms that may be used to encode or hash an
arbitrary string to a point on an elliptic curve.

--- middle

# Introduction {#introduction}

Many cryptographic protocols require a procedure that encodes an arbitrary input,
e.g., a password, to a point on an elliptic curve. This procedure is known
as hashing to an elliptic curve. Prominent examples of cryptosystems that
hash to elliptic curves include Simple Password Exponential Key Exchange
{{J96}}, Password Authenticated Key Exchange {{BMP00}}, Identity-Based
Encryption {{BF01}} and Boneh-Lynn-Shacham signatures {{BLS01}}.

Unfortunately for implementors, the precise hash function that is suitable for a
given scheme is not necessarily included in the description of the protocol.
Compounding this problem is the need to pick a suitable curve for the specific
protocol.

This document aims to bridge this gap by providing a comprehensive set of
recommended algorithms for a range of curve types.
Each algorithm conforms to a common interface: it takes as input an arbitrary-length
byte string and produces as output a point on an elliptic curve.
We provide implementation details for each algorithm, describe
the security rationale behind each recommendation, and give guidance for
elliptic curves that are not explicitly covered.

Readers wishing to quickly specify or implement a conforming hash function
should consult {{suites}}, which lists recommended hash-to-curve suites
and describes both how to implement an existing suite and how to specify
a new one.

This document does not cover rejection sampling methods, sometimes known
as "try-and-increment" or "hunt-and-peck," because the goal is to describe
algorithms that can plausibly be made constant time. Use of these rejection
methods is NOT RECOMMENDED, because they have been a perennial cause of
side-channel vulnerabilities.

## Requirements

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in {{RFC2119}}.

# Background {#background}

## Elliptic curves {#bg-curves}

The following is a brief definition of elliptic curves, with an emphasis on
important parameters and their relation to hashing to curves.
For further reference on elliptic curves, consult {{CFADLNV05}} or {{W08}}.

Let F be the finite field GF(q) of prime characteristic p > 3.
(This document does not consider elliptic curves over fields of characteristic 2 or 3.)
In most cases F is a prime field, so q = p.
Otherwise, F is an extension field, so q = p^m for an integer m > 1.
This document writes elements of extension fields
in a primitive element or polynomial basis, i.e., as a vector
of m elements of GF(p) written in ascending order by degree.
The entries of this vector are indexed in ascending order starting from 1,
i.e., x = (x\_1, x\_2, ..., x\_m).
For example, if q = p^2 and the primitive element basis is (1, I),
then x = (a, b) corresponds to the element a + b * I, where
x\_1 = a and x\_2 = b.

An elliptic curve E is specified by an equation in two variables and a
finite field F. An elliptic curve equation takes one of several standard forms,
including (but not limited to) Weierstrass, Montgomery, and Edwards.

The curve E induces an algebraic group whose elements are those points
with coordinates (x, y) satisfying the curve equation, and where x and y
are elements of F.
This group has order n, meaning that there are n distinct points.
This document uses additive notation for the elliptic curve group operation.

For security reasons, groups of prime order MUST be used. Elliptic curves
induce subgroups of prime order. Let G be a subgroup of the curve of prime
order r, where n = h * r.
In this equation, h is an integer called the cofactor.
An algorithm that takes as input an arbitrary point on the curve E and
produces as output a point in the subgroup G of E is said to "clear
the cofactor."
Such algorithms are discussed in {{cofactor-clearing}}.

Certain hash-to-curve algorithms restrict the form of the curve equation, the
characteristic of the field, and/or the parameters of the curve. For each
algorithm presented, this document lists the relevant restrictions.

Summary of quantities:

| Symbol | Meaning | Relevance |
|:------:|---------|-----------|
| F,q,p | Finite field F of characteristic p and #F = q = p^m. | For prime fields, q = p; otherwise, q = p^m and m>1. |
| E | Elliptic curve. | E is specified by an equation and a field F. |
| n | Number of points on the elliptic curve E. | n = h * r, for h and r defined below. |
| G | A subgroup of the elliptic curve. | Destination group to which byte strings are encoded. |
| r | Order of G. | This number MUST be prime. |
| h | Cofactor, h >= 1. | An integer satisfying n = h * r. |

## Terminology

In this section, we define important terms used in the rest of this document.

### Mappings {#term-mapping}

A mapping is a deterministic function from an element of the field F to a point
on an elliptic curve E defined over F.

In general, the set of all points that a mapping can produce over all
possible inputs may be only a subset of the points on an elliptic curve
(i.e., the mapping may not be surjective).
In addition, a mapping may output the same point for two or more distinct inputs
(i.e., the mapping may not be injective).
For example, consider a mapping from F to an elliptic curve having n points:
if the number of elements of F is not equal to n,
then this mapping cannot be bijective (i.e., both injective and surjective)
since it is defined to be deterministic.

Mappings may also be invertible, meaning that there is an efficient algorithm
that, for any point P output by the mapping, outputs an x in F such that
applying the mapping to x outputs P.
Some of the mappings given in {{mappings}} are invertible, but this
document does not discuss inversion algorithms.

### Encodings {#term-encoding}

Encodings are closely related to mappings.
Like a mapping, an encoding is a function that outputs a point on an elliptic curve.
In contrast to a mapping, however, the input to an encoding is an arbitrary string.
Encodings can be deterministic or probabilistic.
Deterministic encodings are preferred for security, because probabilistic
ones are more likely to leak information through side channels.

This document constructs deterministic encodings by composing a hash function H
with a deterministic mapping.
In particular, H takes as input an arbitrary string and outputs an element of F.
The deterministic mapping takes that element as input and outputs a point on an
elliptic curve E defined over F.
Since the hash function H takes arbitrary strings as inputs, it cannot be
injective: the set of inputs is larger than the set of outputs, so there must
be distinct inputs that give the same output (i.e., there must be collisions).
Thus, any encoding built from H is also not injective.

Like mappings, encodings may be invertible, meaning that there is an efficient
algorithm that, for any point P output by the encoding, outputs a string s
such that applying the encoding to s outputs P.
The hash function used by all encodings specified in this document ({{hashtofield}})
is not invertible; thus, the encodings are also not invertible.

### Random oracle encodings {#term-rom}

Two different types of encodings are possible: nonuniform encodings,
whose output distribution is not uniformly random, and random oracle encodings,
whose output distribution is indistinguishable from uniformly random.
Some protocols require a random oracle for security, while others can
be securely instantiated with a nonuniform encoding.
When the required encoding is not clear, applications SHOULD use a random oracle.

Care is required when constructing a random oracle from a mapping function.
A simple but insecure approach is to use the output of a cryptographically
secure hash function H as the input to the mapping.
Because in general the mapping is not surjective, the output of this
construction is distinguishable from uniformly random, i.e., it does
not behave like a random oracle.

Brier et al. {{BCIMRT10}} describe two generic methods for constructing
random oracle encodings.
Farashahi et al. {{FFSTV13}} and Tibouchi and Kim {{TK17}} refine the analysis
of one of these constructions.
That construction is described in {{roadmap}}.

(In more detail: both constructions are
indifferentiable from a random oracle {{MRH04}} when instantiated
with appropriate hash functions modeled as random oracles.
See {{security-considerations}} for further discussion.)

### Serialization {#term-serialization}

A procedure related to encoding is the conversion of an elliptic curve point to a bit string.
This is called serialization, and is typically used for compactly storing or transmitting points.
The reverse operation, deserialization, converts a bit string to an elliptic curve point.
For example, {{SEC1}} and {{p1363a}} give standard methods for serialization and deserialization.

Deserialization is different from encoding in that only certain strings
(namely, those output by the serialization procedure) can be deserialized.
In contrast, this document is concerned with encodings from arbitrary strings
to elliptic curve points.
This document does not cover serialization or deserialization.

### Domain separation {#term-domain-separation}

Cryptographic protocols that use random oracles are often analyzed
under the assumption that random oracles answer only queries generated
by that protocol.
In practice, this assumption does not hold if two protocols query the
same random oracle.
Concretely, consider protocols P1 and P2 that query random oracle RO:
if P1 and P2 both query RO on the same value x, the security analysis of
one or both protocols may be invalidated.

A common approach to addressing this issue is called domain separation,
which allows a single random oracle to simulate multiple, independent oracles.
This is effected by ensuring that each simulated oracle sees queries that are
distinct from those seen by all other simulated oracles.
For example, to simulate two oracles RO1 and RO2 given a single oracle RO,
one might define

    RO1(x) := RO("RO1" || x)
    RO2(x) := RO("RO2" || x)

In this example, "RO1" and "RO2" are called domain separation tags;
they ensure that queries to RO1 and RO2 cannot result in identical
queries to RO.
Thus, it is safe to treat RO1 and RO2 as independent oracles.

# Encoding byte strings to elliptic curves {#roadmap}

This section presents a general framework for encoding byte strings to points
on an elliptic curve. To construct these encodings, we rely on three basic
functions:

-   The function hash\_to\_field, {0, 1}^\* x {1, 2, ...} -> (F, F, ...), hashes arbitrary-length byte strings
    to a list of one or more elements of a finite field; its implementation is defined in
    {{hashtofield}}.

-   The function map\_to\_curve, F -> E, calculates a point on the elliptic curve E
    from an element of the finite field F over which E is defined.
    {{mappings}} describes mappings for a range of curve families.

-   The function clear\_cofactor, E -> G, sends any point on the curve E to
    the subgroup G of E. {{cofactor-clearing}} describes methods to perform
    this operation.

We describe two high-level encoding functions ({{term-encoding}}).
Although these functions have the same interface, the
distributions of their outputs are different.

-   Nonuniform encoding (encode\_to\_curve). This function encodes byte strings to points in G.
    The distribution of the output is not uniformly random in G.

~~~
encode_to_curve(msg)

Input: msg, an arbitrary-length byte string.
Output: P, a point in G.

Steps:
1. u = hash_to_field(msg, 1)
2. Q = map_to_curve(u[0])
3. P = clear_cofactor(Q)
4. return P
~~~

-   Random oracle encoding (hash\_to\_curve). This function encodes byte strings to points in G.
    This function is suitable for applications requiring a random oracle returning points in G,
    provided that map\_to\_curve is "well distributed" ({{FFSTV13}}, Def. 1).
    All of the map\_to\_curve functions defined in {{mappings}} meet this requirement.

~~~
hash_to_curve(msg)

Input: msg, an arbitrary-length byte string.
Output: P, a point in G.

Steps:
1. u = hash_to_field(msg, 2)
2. Q0 = map_to_curve(u[0])
3. Q1 = map_to_curve(u[1])
4. R = Q0 + Q1              # Point addition
5. P = clear_cofactor(R)
6. return P
~~~

Instances of these functions are given in {{suites}}, which defines a list of
suites that specify a full set of parameters matching elliptic curves and
algorithms.

## Domain separation requirements {#domain-separation}

All uses of the encoding functions defined in this document MUST include
domain separation ({{term-domain-separation}}) to avoid interfering with
other uses of similar functionality.

Protocols that instantiate multiple, independent hash functions based on
either hash\_to\_curve or encode\_to\_curve MUST enforce domain separation
between those hash functions.
This requirement applies both in the case of multiple hashes to the same
curve and in the case of multiple hashes to different curves.
(This is because the hash\_to\_field primitive ({{hashtofield}}) requires
domain separation to guarantee independent outputs.)

Domain separation is enforced with a domain separation tag (DST),
which is a byte string.
Care is required when selecting and using a domain separation tag.
The following requirements apply:

1. Tags MUST be supplied as the DST parameter to hash\_to\_field, as
   described in {{hashtofield}}.

2. Tags MUST begin with a fixed protocol identification string.
   This identification string should be unique to the protocol.

3. Tags SHOULD include a protocol version number.

4. For protocols that define multiple ciphersuites, each ciphersuite's
   tag MUST be different. For this purpose, it is RECOMMENDED to
   include a ciphersuite identifier in each tag.

5. For protocols that use multiple encodings, either to the same curve
   or to different curves, each encoding MUST use a different tag.
   For this purpose, it is RECOMMENDED to include the encoding's
   Suite ID ({{suites}}) in the domain separation tag.
   For independent encodings based on the same suite, each tag should
   also include a distinct identifier, e.g., "ENC1" and "ENC2".

As an example, consider a fictional protocol named Quux
that defines several different ciphersuites.
A reasonable choice of tag is "QUUX-V\<xx\>-CS\<yy\>", where \<xx\> and \<yy\>
are two-digit numbers indicating the version and ciphersuite, respectively.

As another example, consider a fictional protocol named Baz that requires
two independent random oracles, where one oracle outputs points on the curve
E1 and the other outputs points on the curve E2.
Reasonable choices of tags for the E1 and E2 oracles are
"BAZ-V\<xx\>-CS\<yy\>-E1" and "BAZ-V\<xx\>-CS\<yy\>-E2", respectively,
where \<xx\> and \<yy\> are as described above.

# Utility Functions {#utility}

Algorithms in this document make use of utility functions described below.

For security reasons, all field operations, comparisons, and assignments
MUST be implemented in constant time (i.e., execution time MUST NOT depend
on the values of the inputs), and without branching.
Guidance on implementing these low-level operations in constant time is
beyond the scope of this document.

-   CMOV(a, b, c): If c is False, CMOV returns a, otherwise it returns b.
    To prevent against timing attacks, this operation must run in constant
    time, without revealing the value of c.
    Commonly, implementations assume that the selector c is 1 for True or
    0 for False. In this case, given a bit string C, the desired selector c can
    be computed by OR-ing all bits of C together. The resulting selector will be
    either 0 if all bits of C are zero, or 1 if at least one bit of C is 1.

-   is\_square(x): This function returns True whenever the value x is a
    square in the field F. By Euler's criterion, this function can be
    calculated in constant time as

~~~
is_square(x) := { True,  if x^((q - 1) / 2) is 0 or 1 in F;
                { False, otherwise.
~~~

    In certain extension fields, is\_square can be computed in constant
    time more quickly than by the above exponentiation.
    {{AR13}} and {{S85}} describe optimized methods for extension fields.
    {{appx-sqrt-issq}} gives an optimized straight-line method for GF(p^2).

-   sqrt(x): The sqrt operation is a multi-valued function, i.e. there exist
    two roots of x in the field F whenever x is square.
    To maintain compatibility across implementations while allowing implementors
    leeway for optimizations, this document does not require sqrt() to return a
    particular value. Instead, as explained in {{point-sign}}, any higher-level
    function that computes square roots also specifies how to determine the sign
    of the result.

    The preferred way of computing square roots is to fix a deterministic
    algorithm particular to F. We give several algorithms in {{appx-sqrt}}.
    Regardless of the method chosen, the sqrt function should be implemented
    in a way that resists timing side channels, i.e., in constant time.

-   sgn0(x): This function returns either 0 or 1 indicating the "sign" of x,
    where sgn0(x) == 1 just when x is "negative".
    (In other words, this function always considers 0 to be positive.)
    {{sgn0-function}} defines this function and discusses its implementation.

-   inv0(x): This function returns the multiplicative inverse of x in F,
    extended to all of F by fixing inv0(0) == 0.
    To implement inv0 in constant time, compute inv0(x) := x^(q - 2).
    Notice on input 0, the output is 0 as required.

-   I2OSP and OS2IP: These functions are used to convert a byte string to
    and from a non-negative integer as described in {{RFC8017}}.

-   a \|\| b: denotes the concatenation of strings a and b.

-   substr(str, sstart, slen): for a byte string str, this function returns
    the slen-byte substring starting at position sstart; positions are zero
    indexed.
    For example, substr("ABCDEFG", 2, 3) == "CDE".

-   len(str): for a byte string str, this function returns the length of str
    in bytes.
    For example, len("ABC") == 3.

-   strxor(str1, str2): for byte strings str1 and str2, strxor(str1, str2)
    returns the bitwise XOR of the two strings.
    For example, strxor("abc", "XYZ") == "9;9" (the strings in this example
    are ASCII literals, but strxor is defined for arbitrary byte strings).
    In this document, strxor is only applied to inputs of equal length.

## The sgn0 function {#sgn0-function}

This section defines a generic sgn0 implementation that applies to any field F = GF(p^m).
It also gives simplified implementations for the cases F = GF(p) and F = GF(p^2).

See {{bg-curves}} for a discussion of representing elements of extension fields as vectors.

~~~
sgn0(x)

Parameters:
- F, a finite field of characteristic p and order q = p^m.
- p, the characteristic of F (see immediately above).
- m, the extension degree of F, m >= 1 (see immediately above).

Input: x, an element of F.
Output: 0 or 1.

Notation:
- x_i is the i'th element of the vector representation of x.
- OR and AND are logical operators. Short-circuit operators
  MUST be avoided in constant-time implementations.

Steps:
1. sign = 0
2. zero = 1
3. for i in (1, 2, ..., m):
4.   sign_i = x_i mod 2
5.   zero_i = x_i == 0
6.   sign = sign OR (zero AND sign_i)
7.   zero = zero AND zero_i
6. return sign
~~~

Note that any valid sgn0 function for extension fields must iterate over
the entire vector representation of the input element.
To see why, imagine a function sgn0\* that ignores the final entry in its
input vector, and consider a field element x = (0, x\_2).
Since sgn0\* ignores x\_2, sgn0\*(x) == sgn0\*(-x), which is incorrect
when x\_2 != 0.
A similar argument applies to any entry of the vector representation of x.

When m == 1, sgn0 can be significantly simplified:

~~~
sgn0_m_eq_1(x)

Input: x, an element of GF(p).
Output: 0 or 1.

Steps:
1. return x mod 2
~~~

The case m == 2 is only slightly more complicated:

~~~
sgn0_m_eq_2(x)

Input: x an element of GF(p^2).
Output: 0 or 1.

Notation:
- OR and AND are logical operators. Short-circuit operators
  MUST be avoided in constant-time implementations.

Steps:
1. sign_0 = x_0 mod 2
2. zero_0 = x_0 == 0
3. sign_1 = x_1 mod 2
4. return sign_0 OR (zero_0 AND sign_1)
~~~

# Hashing to a Finite Field {#hashtofield}

The hash\_to\_field function hashes a byte string msg of any length into
one or more elements of a field F.
This function works in two steps: it first hashes the input byte string
to produce a pseudorandom byte string, and then interprets this pseudorandom
byte string as one or more elements of F.

For the first step, hash\_to\_field calls an auxiliary function
expand\_message.
This document defines two variants of expand\_message, one appropriate
for hash functions like SHA-2 {{FIPS180-4}} or SHA-3 {{FIPS202}}, and one
appropriate for extensible-output functions like SHAKE-128 {{FIPS202}}.
Security considerations for each expand\_message variant are discussed
below ({{hashtofield-expand-xmd}}, {{hashtofield-expand-xof}}).

Implementors MUST NOT use rejection sampling to generate a uniformly
random element of F.
The reason is that rejection sampling procedures are difficult to implement
in constant time, and later well-meaning "optimizations" may silently render
an implementation non-constant-time.

## Security considerations {#hashtofield-sec}

The hash\_to\_field function is designed to be indifferentiable from a
random oracle {{MRH04}} when expand\_message ({{hashtofield-expand}})
is modeled as a random oracle (see {{security-considerations-hash-to-field}}).
Ensuring indifferentiability requires care; to see why, consider a prime
p that is close to 3/4 * 2^256.
Reducing a random 256-bit integer modulo this p yields a value that is in
the range \[0, p / 3\] with probability roughly 1/2, meaning that this value
is statistically far from uniform in \[0, p - 1\].

To control bias, hash\_to\_field instead uses pseudorandom integers whose
length is at least ceil(log2(p)) + k bits, where k is the target security level
for the suite in bits. (Note that k is an upper bound on the security level for
the corresponding curve. See {{security-considerations-targets}} for more details.)
Reducing such integers mod p gives bias at most 2^-k for any p; this bias
is appropriate when targeting k-bit security.
To obtain such integers, hash\_to\_field uses expand\_message to obtain
L pseudorandom bytes, where L = ceil((ceil(log2(p)) + k) / 8); this
byte string is then interpreted as an integer via OS2IP {{RFC8017}}.
For example, for a 255-bit prime p, and k = 128-bit security,
L = ceil((255 + 128) / 8) = 48 bytes.

## hash\_to\_field implementation {#hashtofield-impl}

The following procedure implements hash\_to\_field.

The expand\_message parameter to this function MUST conform to the requirements
given below ({{hashtofield-expand}}).

{{domain-separation}} discusses requirements for domain separation and
recommendations for choosing DST, the domain separation tag.
This is the REQUIRED method for applying domain separation.

~~~
hash_to_field(msg, count)

Parameters:
- DST, a domain separation tag (see discussion above).
- F, a finite field of characteristic p and order q = p^m.
- p, the characteristic of F (see immediately above).
- m, the extension degree of F, m >= 1 (see immediately above).
- L = ceil((ceil(log2(p)) + k) / 8), where k is the security
  parameter of the suite (e.g., k = 128).
- expand_message, a function that expands a byte string and
  domain separation tag into a pseudorandom byte string
  (see discussion above).

Inputs:
- msg is a byte string containing the message to hash.
- count is the number of elements of F to output.

Outputs:
- (u_0, ..., u_(count - 1)), a list of field elements.

Steps:
1. len_in_bytes = count * m * L
2. pseudo_random_bytes = expand_message(msg, DST, len_in_bytes)
3. for i in (0, ..., count - 1):
4.   for j in (0, ..., m - 1):
5.     elm_offset = L * (j + i * m)
6.     tv = substr(pseudo_random_bytes, elm_offset, L)
7.     e_j = OS2IP(tv) mod p
8.   u_i = (e_0, ..., e_(m - 1))
9. return (u_0, ..., u_(count - 1))
~~~

## expand\_message {#hashtofield-expand}

expand\_message is a function that generates a pseudorandom byte string.
It takes three arguments:

- msg, a byte string containing the message to hash,
- DST, a byte string that acts as a domain separation tag, and
- len\_in\_bytes, the number of bytes to be generated.

This document defines two variants of expand\_message:

- expand\_message\_xmd ({{hashtofield-expand-xmd}}) is appropriate for use
with a wide range of hash functions, including SHA-2 {{FIPS180-4}}, SHA-3
{{FIPS202}}, BLAKE2 {{?RFC7693}}, and others.

- expand\_message\_xof ({{hashtofield-expand-xof}}) is appropriate for use
with extensible-output functions (XOFs) including functions in the SHAKE
{{FIPS202}} or BLAKE2X {{BLAKE2X}} families.

These variants should suffice for the vast majority of use cases, but other
variants are possible; {{hashtofield-expand-other}} discusses requirements.

### expand\_message\_xmd {#hashtofield-expand-xmd}

The expand\_message\_xmd function produces a pseudorandom byte string using
a cryptographic hash function H that outputs b bits.
For security, H must meet the following requirements:

- The number of bits output by H MUST be b >= 2 * k, for k the target
security level in bits. This ensures k-bit collision resistance.

- H MAY be a Merkle-Damgaard hash function like SHA-2.
In this case, security holds when the underlying compression function is
modeled as a random oracle {{CDMP05}}.
(See {{security-considerations-expand-xmd}} for discussion.)

- H MAY be a sponge-based hash function like SHA-3 or BLAKE2.
In this case, security holds when the inner function is modeled as a
random transformation or as a random permutation {{BDPV08}}.

- Otherwise, H MUST be a hash function that has been proved indifferentiable
from a random oracle {{MRH04}} under a widely accepted cryptographic assumption.

SHA-2 {{FIPS180-4}} and SHA-3 {{FIPS202}} are typical and RECOMMENDED choices.
As an example, for the 128-bit security level, b >= 256 bits and either SHA-256 or
SHA3-256 would be an appropriate choice.

The following procedure implements expand\_message\_xmd.

~~~
expand_message_xmd(msg, DST, len_in_bytes)

Parameters:
- H, a hash function (see requirements above).
- b_in_bytes, ceil(b / 8) for b the output size of H in bits.
  For example, for b = 256, b_in_bytes = 32.
- r_in_bytes, the input block size of H, measured in bytes.
  For example, for SHA-256, r_in_bytes = 64.

Input:
- msg, a byte string.
- DST, a byte string of at most 255 bytes.
  See below for information on using longer DSTs.
- len_in_bytes, the length of the requested output in bytes.

Output:
- pseudo_random_bytes, a byte string

Steps:
1.  ell = ceil(len_in_bytes / b_in_bytes)
2.  ABORT if ell > 255
3.  DST_prime = DST || I2OSP(len(DST), 1)
4.  Z_pad = I2OSP(0, r_in_bytes)
5.  l_i_b_str = I2OSP(len_in_bytes, 2)
6.  b_0 = H(Z_pad || msg || l_i_b_str || I2OSP(0, 1) || DST_prime)
7.  b_1 = H(b_0 || I2OSP(1, 1) || DST_prime)
8.  for i in (2, ..., ell):
9.    b_i = H(strxor(b_0, b_(i - 1)) || I2OSP(i, 1) || DST_prime)
10. pseudo_random_bytes = b_1 || ... || b_ell
11. return substr(pseudo_random_bytes, 0, len_in_bytes)
~~~

Note that the string Z\_pad is prepended to msg when computing b\_0 (step 6).
This is necessary for security when H is a Merkle-Damgaard hash, e.g., SHA-2
(see {{security-considerations-expand-xmd}}).
Hashing this additional data means that the cost of computing b\_0 is higher
than the cost of simply computing H(msg).
In most settings this overhead is negligible, because the cost of evaluating
H is much less than the other costs involved in hashing to a curve.

It is possible, however, to entirely avoid this overhead by taking advantage
of the fact that Z\_pad depends only on H, and not on the arguments to
expand\_message\_xmd.
To do so, first precompute and save the internal state of H after ingesting
Z\_pad; and then, when computing b\_0, initialize H using the saved state.
Further details are beyond the scope of this document.

### expand\_message\_xof {#hashtofield-expand-xof}

The expand\_message\_xof function produces a pseudorandom byte string
using an extensible-output function (XOF) H.
For security, H must meet the following criteria:

- The collision resistance of H MUST be at least k bits.

- H MUST be an XOF that has been proved indifferentiable from a random oracle
under a reasonable cryptographic assumption.

The SHAKE {{FIPS202}} XOF family is a typical and RECOMMENDED choice.
As an example, for 128-bit security, SHAKE-128 would be an appropriate choice.

The following procedure implements expand\_message\_xof.

~~~
expand_message_xof(msg, DST, len_in_bytes)

Parameters:
- H, an extensible-output function.
  H(m, d) hashes message m and returns d bytes.

Input:
- msg, a byte string.
- DST, a byte string of at most 255 bytes.
  See below for information on using longer DSTs.
- len_in_bytes, the length of the requested output in bytes.

Output:
- pseudo_random_bytes, a byte string

Steps:
1. DST_prime = DST || I2OSP(len(DST), 1)
2. msg_prime = msg || I2OSP(len_in_bytes, 2) || DST_prime
3. pseudo_random_bytes = H(msg_prime, len_in_bytes)
4. return pseudo_random_bytes
~~~

### Using DSTs longer than 255 bytes {#hashtofield-expand-dst}

The expand\_message variants defined in this section accept domain separation
tags of at most 255 bytes.
If a domain separation tag longer than 255 bytes must be used (e.g., because
of requirements imposed by an invoking protocol), implementors MUST compute
a short domain separation tag by hashing, as follows:

- For expand\_message\_xmd using hash function H, DST is computed as

~~~
DST = H("H2C-OVERSIZE-DST-" || a_very_long_DST)
~~~

- For expand\_message\_xof using extensible-output function H, DST is computed as

~~~
DST = H("H2C-OVERSIZE-DST-" || a_very_long_DST, ceil(2 * k / 8))
~~~

Here, a\_very\_long\_DST is the DST whose length is greater than 255 bytes,
"H2C-OVERSIZE-DST-" is a 17-byte ASCII string literal, and
k is the target security level in bits.

### Defining other expand\_message variants {#hashtofield-expand-other}

When defining a new expand\_message variant, the most important consideration
is that hash\_to\_field models expand\_message as a random oracle.
Thus, implementors SHOULD prove indifferentiability from a random oracle
under an appropriate assumption about the underlying cryptographic primitives.

In addition, expand\_message variants:

- MUST give collision resistance commensurate with the security level of
the target elliptic curve.

- MUST be built on primitives designed for use in applications requiring
cryptographic randomness. As examples, a secure stream cipher is an appropriate
primitive, whereas a Mersenne twister pseudorandom number generator is not.

- MUST NOT use any form of rejection sampling.

- MUST give independent values for distinct (msg, DST, length) inputs.
Meeting this requirement is slightly subtle.
As a simplified example, hashing the concatenation msg || DST does not work,
because in this case distinct (msg, DST) pairs whose concatenations are equal
will return the same output (e.g., ("AB", "CDEF") and ("ABC", "DEF")).
The variants defined in this document use a suffix-free encoding of DST
to avoid this issue.

- MUST use the domain separation tag DST to ensure that invocations of
cryptographic primitives inside of expand\_message are domain separated
from invocations outside of expand\_message.
For example, if the expand\_message variant uses a hash function H, an encoding
of DST MUST be either prepended or appended to the input to each invocation
of H (appending is the RECOMMENDED approach).

- SHOULD read msg exactly once, for efficiency when msg is long.

In addition, an expand\_message variant MUST specify a unique EXP\_TAG
that identifies that variant in a Suite ID.
See {{suiteIDformat}} for more information.

# Deterministic Mappings {#mappings}

The mappings in this section are suitable for constructing either nonuniform
or random oracle encodings using the constructions of {{roadmap}}.
Certain mappings restrict the form of the curve or its parameters.
For each mapping presented, this document lists the relevant restrictions.

Note that mappings in this section are not interchangeable: different mappings
will almost certainly output different points when evaluated on the same input.


## Choosing a mapping function {#choosing-mapping}

This section gives brief guidelines on choosing a mapping function
for a given elliptic curve.
Note that the suites given in {{suites}} are recommended mappings
for the respective curves.

If the target elliptic curve is a Montgomery curve ({{montgomery}}),
the Elligator 2 method ({{elligator2}}) is recommended.
Similarly, if the target elliptic curve is a twisted Edwards curve ({{twisted-edwards}}),
the twisted Edwards Elligator 2 method ({{ell2edwards}}) is recommended.

The remaining cases are Weierstrass curves.
For curves supported by the Simplified SWU method ({{simple-swu}}),
that mapping is the recommended one.
Otherwise, the Simplified SWU method for AB == 0 ({{simple-swu-AB0}})
is recommended if the goal is best performance, while
the Shallue-van de Woestijne method ({{svdw}}) is recommended
if the goal is simplicity of implementation.
(The reason for this distinction is that the Simplified SWU method for AB == 0
requires implementing an isogeny map in addition to the mapping function, while
the Shallue-van de Woestijne method does not.)

The Shallue-van de Woestijne method ({{svdw}}) works with any curve,
and may be used in cases where a generic mapping is required.
Note, however, that this mapping is almost always more computationally
expensive than the curve-specific recommendations above.


## Interface

The generic interface shared by all mappings in this section is as follows:

~~~
    (x, y) = map_to_curve(u)
~~~

The input u and outputs x and y are elements of the field F.
The coordinates (x, y) specify a point on an elliptic curve defined over F.
Note that the point (x, y) is not a uniformly random point. If uniformity
is required for security, the random oracle construction of {{roadmap}} MUST be
used instead.

## Notation

As a rough guide, the following conventions are used in pseudocode:

- All arithmetic operations are performed over a field F, unless
  explicitly stated otherwise.

- u: the input to the mapping function.
  This is an element of F produced by the hash\_to\_field function.

- (x, y), (s, t), (v, w): the affine coordinates of the point output by the mapping.
  Indexed variables (e.g., x1, y2, ...) are used for candidate values.

- tv1, tv2, ...: reusable temporary variables.

- c1, c2, ...: constant values, which can be computed in advance.


## Sign of the resulting point {#point-sign}

In general, elliptic curves have equations of the form y^2 = g(x).
Most of the mappings in this section first identify an x such that
g(x) is square, then take a square root to find y. Since there
are two square roots when g(x) != 0, this results in an ambiguity
regarding the sign of y.

To resolve this ambiguity, the mappings in this section specify
the sign of the y-coordinate in terms of the input to the mapping function.
Two main reasons support this approach. First, this covers elliptic curves over
any field in a uniform way, and second, it gives implementors leeway to optimize
their square-root implementations.

## Exceptional cases {#map-exceptions}

Mappings may have have exceptional cases, i.e., inputs u
on which the mapping is undefined. These cases must be handled
carefully, especially for constant-time implementations.

For each mapping in this section, we discuss the exceptional cases and show
how to handle them in constant time. Note that all implementations SHOULD use
inv0 ({{utility}}) to compute multiplicative inverses, to avoid exceptional
cases that result from attempting to compute the inverse of 0.

## Mappings for Weierstrass curves {#weierstrass}

The mappings in this section apply to a target curve E defined by the equation

~~~
    y^2 = g(x) = x^3 + A * x + B
~~~

where 4 * A^3 + 27 * B^2 != 0.

### Shallue-van de Woestijne Method {#svdw}

Shallue and van de Woestijne {{SW06}} describe a mapping that applies to
essentially any elliptic curve.
(Note, however, that this mapping is more expensive to evaluate than
the other mappings in this document.)

The parameterization given below is for Weierstrass curves;
its derivation is detailed in {{W19}}.
This parameterization also works for Montgomery ({{montgomery}}) and
twisted Edwards ({{twisted-edwards}}) curves via the rational maps
given in {{appx-rational-map}}:
first evaluate the Shallue-van de Woestijne mapping to an equivalent Weierstrass
curve, then map that point to the target Montgomery or twisted Edwards curve
using the corresponding rational map.

Preconditions: A Weierstrass curve y^2 = x^3 + A * x + B.

Constants:

- A and B, the parameter of the Weierstrass curve.

- Z, a non-zero element of F meeting the below criteria.
  {{svdw-z-code}} gives a Sage {{SAGE}} script that outputs the RECOMMENDED Z.
  1. g(Z) != 0 in F.
  2. -(3 * Z^2 + 4 * A) / (4 * g(Z)) != 0 in F.
  3. -(3 * Z^2 + 4 * A) / (4 * g(Z)) is square in F.
  4. At least one of g(Z) and g(-Z / 2) is square in F.

Sign of y: Inputs u and -u give the same x-coordinate for many values of u.
Thus, we set sgn0(y) == sgn0(u).

Exceptions: The exceptional cases for u occur when
(1 + u^2 * g(Z)) * (1 - u^2 * g(Z)) == 0.
The restrictions on Z given above ensure that implementations that use inv0
to invert this product are exception free.

Operations:

~~~
1. tv1 = u^2 * g(Z)
2. tv2 = 1 + tv1
3. tv1 = 1 - tv1
4. tv3 = inv0(tv1 * tv2)
5. tv4 = sqrt(-g(Z) * (3 * Z^2 + 4 * A))
6. If sgn0(tv4) == 1, set tv4 = -tv4        # sgn0(tv4) MUST equal 0
7. tv5 = u * tv1 * tv3 * tv4
8.  x1 = -Z / 2 - tv5
9.  x2 = -Z / 2 + tv5
10. x3 = Z - 4 * g(Z) * (tv2^2 * tv3)^2 / (3 * Z^2 + 4 * A)
11. If is_square(g(x1)), set x = x1 and y = sqrt(g(x1))
12. Else If is_square(g(x2)), set x = x2 and y = sqrt(g(x2))
13. Else set x = x3 and y = sqrt(g(x3))
14. If sgn0(u) != sgn0(y), set y = -y
15. return (x, y)
~~~

#### Implementation

The following procedure implements the Shallue and van de Woestijne method in a
straight-line fashion.

~~~
map_to_curve_svdw(u)
Input: u, an element of F.
Output: (x, y), a point on E.

Constants:
1. c1 = g(Z)
2. c2 = -Z / 2
3. c3 = sqrt(-g(Z) * (3 * Z^2 + 4 * A))     # sgn0(c3) MUST equal 0
4. c4 = -4 * g(Z) / (3 * Z^2 + 4 * A)

Steps:
1.  tv1 = u^2
2.  tv1 = tv1 * c1
3.  tv2 = 1 + tv1
4.  tv1 = 1 - tv1
5.  tv3 = tv1 * tv2
6.  tv3 = inv0(tv3)
7.  tv4 = u * tv1
8.  tv4 = tv4 * tv3
9.  tv4 = tv4 * c3
10.  x1 = c2 - tv4
11. gx1 = x1^2
12. gx1 = gx1 + A
13. gx1 = gx1 * x1
14. gx1 = gx1 + B
15.  e1 = is_square(gx1)
16.  x2 = c2 + tv4
17. gx2 = x2^2
18. gx2 = gx2 + A
19. gx2 = gx2 * x2
20. gx2 = gx2 + B
21.  e2 = is_square(gx2) AND NOT e1     # Avoid short-circuit logic ops
22.  x3 = tv2^2
23.  x3 = x3 * tv3
24.  x3 = x3^2
25.  x3 = x3 * c4
26.  x3 = x3 + Z
27.   x = CMOV(x3, x1, e1)      # x = x1 if gx1 is square, else x = x3
28.   x = CMOV(x, x2, e2)       # x = x2 if gx2 is square and gx1 is not
29.  gx = x^2
30.  gx = gx + A
31.  gx = gx * x
32.  gx = gx + B
33.   y = sqrt(gx)
34.  e3 = sgn0(u) == sgn0(y)
35.   y = CMOV(-y, y, e3)       # Select correct sign of y
36. return (x, y)
~~~

### Simplified Shallue-van de Woestijne-Ulas Method {#simple-swu}

The function map\_to\_curve\_simple\_swu(u) implements a simplification
of the Shallue-van de Woestijne-Ulas mapping {{U07}} described by Brier et
al. {{BCIMRT10}}, which they call the "simplified SWU" map. Wahby and Boneh
{{WB19}} generalize and optimize this mapping.

Preconditions: A Weierstrass curve y^2 = x^3 + A * x + B where A != 0 and B != 0.

Constants:

- A and B, the parameters of the Weierstrass curve.

- Z, an element of F meeting the below criteria.
  {{sswu-z-code}} gives a Sage {{SAGE}} script that outputs the RECOMMENDED Z.
  The criteria are:
  1. Z is non-square in F,
  2. Z != -1 in F,
  3. the polynomial g(x) - Z is irreducible over F, and
  4. g(B / (Z * A)) is square in F.

Sign of y: Inputs u and -u give the same x-coordinate.
Thus, we set sgn0(y) == sgn0(u).

Exceptions: The exceptional cases are values of u such that
Z^2 * u^4 + Z * u^2 == 0. This includes u == 0, and may include
other values depending on Z. Implementations must detect
this case and set x1 = B / (Z * A), which guarantees that g(x1)
is square by the condition on Z given above.

Operations:

~~~
1. tv1 = inv0(Z^2 * u^4 + Z * u^2)
2.  x1 = (-B / A) * (1 + tv1)
3.  If tv1 == 0, set x1 = B / (Z * A)
4. gx1 = x1^3 + A * x1 + B
5.  x2 = Z * u^2 * x1
6. gx2 = x2^3 + A * x2 + B
7.  If is_square(gx1), set x = x1 and y = sqrt(gx1)
8.  Else set x = x2 and y = sqrt(gx2)
9.  If sgn0(u) != sgn0(y), set y = -y
10. return (x, y)
~~~

#### Implementation

The following procedure implements the simplified SWU mapping in a straight-line fashion.
{{samplecode}} gives an optimized straight-line procedure for P-256 {{FIPS186-4}}.
For more information on optimizing this mapping, see
{{WB19}} Section 4 or the example code found at {{hash2curve-repo}}.

~~~
map_to_curve_simple_swu(u)
Input: u, an element of F.
Output: (x, y), a point on E.

Constants:
1.  c1 = -B / A
2.  c2 = -1 / Z

Steps:
1.  tv1 = Z * u^2
2.  tv2 = tv1^2
3.   x1 = tv1 + tv2
4.   x1 = inv0(x1)
5.   e1 = x1 == 0
6.   x1 = x1 + 1
7.   x1 = CMOV(x1, c2, e1)    # If (tv1 + tv2) == 0, set x1 = -1 / Z
8.   x1 = x1 * c1      # x1 = (-B / A) * (1 + (1 / (Z^2 * u^4 + Z * u^2)))
9.  gx1 = x1^2
10. gx1 = gx1 + A
11. gx1 = gx1 * x1
12. gx1 = gx1 + B             # gx1 = g(x1) = x1^3 + A * x1 + B
13.  x2 = tv1 * x1            # x2 = Z * u^2 * x1
14. tv2 = tv1 * tv2
15. gx2 = gx1 * tv2           # gx2 = (Z * u^2)^3 * gx1
16.  e2 = is_square(gx1)
17.   x = CMOV(x2, x1, e2)    # If is_square(gx1), x = x1, else x = x2
18.  y2 = CMOV(gx2, gx1, e2)  # If is_square(gx1), y2 = gx1, else y2 = gx2
19.   y = sqrt(y2)
20.  e3 = sgn0(u) == sgn0(y)  # Fix sign of y
21.   y = CMOV(-y, y, e3)
22. return (x, y)
~~~

### Simplified SWU for AB == 0 {#simple-swu-AB0}

Wahby and Boneh {{WB19}} show how to adapt the simplified SWU mapping to
Weierstrass curves having A == 0 or B == 0, which the mapping of
{{simple-swu}} does not support.
(The case A == B == 0 is excluded because y^2 = x^3 is not an elliptic curve.)

This method applies to curves like secp256k1 {{SEC2}} and to pairing-friendly
curves in the Barreto-Lynn-Scott {{BLS03}}, Barreto-Naehrig {{BN05}}, and other families.

This method requires finding another elliptic curve E' given by the equation

~~~
    y'^2 = g'(x') = x'^3 + A' * x' + B'
~~~

that is isogenous to E and has A' != 0 and B' != 0.
(One might do this, for example, using {{SAGE}}; for details, see {{WB19}}, Appendix A.)
This isogeny defines a map iso\_map(x', y') that takes as input a point
on E' and produces as output a point on E.

Once E' and iso\_map are identified, this mapping works as follows: on input
u, first apply the simplified SWU mapping to get a point on E', then apply
the isogeny map to that point to get a point on E.

Note that iso\_map is a group homomorphism, meaning that point addition
commutes with iso\_map.
Thus, when using this mapping in the hash\_to\_curve construction of {{roadmap}},
one can effect a small optimization by first mapping u0 and u1 to E', adding
the resulting points on E', and then applying iso\_map to the sum.
This gives the same result while requiring only one evaluation of iso\_map.

Preconditions: An elliptic curve E' with A' != 0 and B' != 0 that is
isogenous to the target curve E with isogeny map iso\_map from
E' to E.

Helper functions:

- map\_to\_curve\_simple\_swu is the mapping of {{simple-swu}} to E'
- iso\_map is the isogeny map from E' to E

Sign of y: for this map, the sign is determined by map\_to\_curve\_simple\_swu.
No further sign adjustments are necessary.

Exceptions: map\_to\_curve\_simple\_swu handles its exceptional cases.
Exceptional cases of iso\_map MUST return the identity point on E.

Operations:

~~~
1. (x', y') = map_to_curve_simple_swu(u)    # (x', y') is on E'
2.   (x, y) = iso_map(x', y')               # (x, y) is on E
3. return (x, y)
~~~

See {{hash2curve-repo}} or {{WB19}}, Section 4.3 for details on implementing the isogeny map.

## Mappings for Montgomery curves {#montgomery}

The mapping defined in this section applies to a target curve M defined by the equation

~~~
    K * t^2 = s^3 + J * s^2 + s
~~~

### Elligator 2 Method {#elligator2}

Preconditions: A Montgomery curve K * t^2 = s^3 + J * s^2 + s where
J != 0, K != 0, and (J^2 - 4) / K^2 is non-zero and non-square in F.

Constants:

- J and K, the parameters of the elliptic curve.

- Z, a non-square element of F.
  {{elligator-z-code}} gives a Sage {{SAGE}} script that outputs the RECOMMENDED Z.

Sign of t: Inputs u and -u give the same s-coordinate.
Thus, we set sgn0(t) == sgn0(u).

Exceptions: The exceptional case is Z * u^2 == -1, i.e., 1 + Z * u^2 == 0.
Implementations must detect this case and set x1 = -(J / K).
Note that this can only happen when q = 3 (mod 4).

Operations:

~~~
1.  x1 = -(J / K) * inv0(1 + Z * u^2)
2.  If x1 == 0, set x1 = -(J / K)
3. gx1 = x1^3 + (J / K) * x1^2 + x1 / K^2
4.  x2 = -x1 - (J / K)
5. gx2 = x2^3 + (J / K) * x2^2 + x2 / K^2
6.  If is_square(gx1), set x = x1 and y = sqrt(gx1)
7.  Else set x = x2 and y = sqrt(gx2)
8.   s = x * K
9.   t = y * K
10. If sgn0(u) != sgn0(t), set t = -t
11. return (s, t)
~~~

#### Implementation

The following procedure implements Elligator 2 in a straight-line fashion.
{{samplecode}} gives optimized straight-line procedures for curve25519 and
curve448 {{RFC7748}}.

~~~
map_to_curve_elligator2(u)
Input: u, an element of F.
Output: (s, t), a point on M.

Constants:
1.   c1 = J / K
2.   c2 = 1 / K^2

Steps:
1.  tv1 = u^2
2.  tv1 = Z * tv1             # Z * u^2
3.   e1 = tv1 == -1           # exceptional case: Z * u^2 == -1
4.  tv1 = CMOV(tv1, 0, e1)    # if tv1 == -1, set tv1 = 0
5.   x1 = tv1 + 1
6.   x1 = inv0(x1)
7.   x1 = -c1 * x1             # x1 = -(J / K) / (1 + Z * u^2)
8.  gx1 = x1 + c1
9.  gx1 = gx1 * x1
10. gx1 = gx1 + c2
11. gx1 = gx1 * x1            # gx1 = x1^3 + (J / K) * x1^2 + x1 / K^2
12.  x2 = -x1 - c1
13. gx2 = tv1 * gx1
14.  e2 = is_square(gx1)
15.   x = CMOV(x2, x1, e2)    # If is_square(gx1), x = x1, else x = x2
16.  y2 = CMOV(gx2, gx1, e2)  # If is_square(gx1), y2 = gx1, else y2 = gx2
17.   y = sqrt(y2)
18.   s = x * K
19.   t = y * K
20.  e3 = sgn0(u) == sgn0(t)  # Fix sign of t
21.   t = CMOV(-t, t, e3)
22. return (s, t)
~~~

## Mappings for Twisted Edwards curves {#twisted-edwards}

Twisted Edwards curves (a class of curves that includes Edwards curves)
are given by the equation

~~~
    a * v^2 + w^2 = 1 + d * v^2 * w^2
~~~

with a != 0, d != 0, and a != d {{BBJLP08}}.

These curves are closely related to Montgomery
curves ({{montgomery}}): every twisted Edwards curve is birationally equivalent
to a Montgomery curve ({{BBJLP08}}, Theorem 3.2).
This equivalence yields an efficient way of hashing to a twisted Edwards curve:
first, hash to an equivalent Montgomery curve, then transform the
result into a point on the twisted Edwards curve via a rational map.
This method of hashing to a twisted Edwards curve thus requires identifying a
corresponding Montgomery curve and rational map.
We describe how to identify such a curve and map immediately below.

### Rational maps from Montgomery to twisted Edwards curves {#rational-map}

There are two ways to identify the correct Montgomery curve and
rational map for use when hashing to a given twisted Edwards curve.

When hashing to a standardized twisted Edwards curve for which a corresponding
Montgomery form and rational map are also standardized, the standard
Montgomery form and rational map MUST be used to ensure compatibility
with existing software.
Two such standardized curves are the edwards25519 and edwards448 curves,
which correspond to the Montgomery curves curve25519 and curve448, respectively.
For both of these curves, {{RFC7748}} lists both the Montgomery and twisted Edwards
forms and gives the corresponding rational maps.

The rational map for edwards25519 ({{RFC7748}}, Section 4.1)
uses the constant sqrt\_neg\_486664 = sqrt(-486664) (mod 2^255 - 19).
To ensure compatibility, this constant MUST be chosen such that
sgn0(sqrt\_neg\_486664) == 0.
Analogous ambiguities in other standardized rational maps MUST be
resolved in the same way: for any constant c whose sign is ambiguous,
c MUST be chosen such that sgn0(c) == 0.

The 4-isogeny map from curve448 to edwards448 ({{RFC7748}}, Section 4.2)
is unambiguous with respect to sign.

When defining new twisted Edwards curves, a Montgomery equivalent and rational
map SHOULD be specified, and the sign of the rational map SHOULD be stated
unambiguously.

When hashing to a twisted Edwards curve that does not have a standardized
Montgomery form or rational map, the following procedure MUST be
used to derive them.
For a twisted Edwards curve given by

~~~
    a * v^2 + w^2 = 1 + d * v^2 * w^2
~~~

first compute J and K, the parameters of the equivalent Montgomery
curve given by

~~~
    K * t^2 = s^3 + J * s^2 + s
~~~

as follows:

- J = 2 * (a + d) / (a - d)
- K = 4 / (a - d)

Note that this curve has the form required by the Elligator 2
mapping of {{elligator2}}.
The rational map from the point (s, t) on this Montgomery curve
to the point (v, w) on the twisted Edwards curve is given by

- v = s / t
- w = (s - 1) / (s + 1)

(For completeness, we give the inverse map in {{appx-rational-map-edw}}.
Note that the inverse map is not used when hashing to a twisted Edwards curve.)

Rational maps may be undefined on certain inputs, e.g., when the
denominator of one of the rational functions is zero.
In the map described above, the exceptional cases are t == 0 or s == -1.
Implementations MUST detect exceptional cases and return the value
(v, w) = (0, 1), which is the identity point
on all twisted Edwards curves.

The following straight-line implementation of the above rational map
handles the exceptional cases.
Implementations of other rational maps (e.g., the ones give in {{RFC7748}})
are analogous.

~~~
rational_map(s, t)
Input: (s, t), a point on the curve K * t^2 = s^3 + J * s^2 + s.
Output: (v, w), a point on an equivalent twisted Edwards curve.

1. tv1 = s + 1
2. tv2 = tv1 * t        # (s + 1) * t
3. tv2 = inv0(tv2)      # 1 / ((s + 1) * t)
4.   v = tv2 * tv1      # 1 / t
5.   v = v * s          # s / t
6.   w = tv2 * t        # 1 / (s + 1)
7. tv1 = s - 1
8.   w = w * tv1        # (s - 1) / (s + 1)
9.   e = tv2 == 0
10.  w = CMOV(w, 1, e)  # handle exceptional case
11. return (v, w)
~~~

### Elligator 2 Method {#ell2edwards}

Preconditions: A twisted Edwards curve E and an equivalent Montgomery
curve M meeting the requirements in {{rational-map}}.

Helper functions:

- map\_to\_curve\_elligator2 is the mapping of {{elligator2}} to the curve M.
- rational\_map is a function that takes a point (s, t) on M and
  returns a point (v, w) on E, as defined in {{rational-map}}.

Sign of t (and v): for this map, the sign is determined by map\_to\_curve\_elligator2.
No further sign adjustments are required.

Exceptions: The exceptions for the Elligator 2 mapping are as given in
{{elligator2}}.
The exceptions for the rational map are as given in {{rational-map}}.
No other exceptions are possible.

The following procedure implements the Elligator 2 mapping for a twisted
Edwards curve.
(Note that the output point is denoted (v, w) because it is a point on
the target twisted Edwards curve.)

~~~
map_to_curve_elligator2_edwards(u)
Input: u, an element of F.
Output: (v, w), a point on E.

1. (s, t) = map_to_curve_elligator2(u)      # (s, t) is on M
2. (v, w) = rational_map(s, t)              # (v, w) is on E
3. return (v, w)
~~~

# Clearing the cofactor {#cofactor-clearing}

The mappings of {{mappings}} always output a point on the elliptic curve,
i.e., a point in a group of order h * r ({{bg-curves}}). Obtaining a point in G
may require a final operation commonly called "clearing the cofactor," which
takes as input any point on the curve.

The cofactor can always be cleared via scalar multiplication by h.
For elliptic curves where h = 1, i.e., the curves with a prime number of points,
no operation is required. This applies, for example, to the NIST curves P-256,
P-384, and P-521 {{FIPS186-4}}.

In some cases, it is possible to clear the cofactor via a faster method than
scalar multiplication by h.
These methods are equivalent to (but usually faster than) multiplication by
some scalar h\_eff whose value is determined by the method and the curve.
Examples of fast cofactor clearing methods include the following:

- For certain pairing-friendly curves having subgroup G2 over an extension
  field, Scott et al. {{SBCDK09}} describe a method for fast cofactor clearing
  that exploits an efficiently-computable endomorphism. Fuentes-Castaneda
  et al. {{FKR11}} propose an alternative method that is sometimes more efficient.
  Budroni and Pintore {{BP17}} give concrete instantiations of these methods
  for Barreto-Lynn-Scott pairing-friendly curves {{BLS03}}.
  This method is described for the specific case of BLS12-381 in
  {{clear-cofactor-bls12381-g2}}.

- Wahby and Boneh ({{WB19}}, Section 5) describe a trick due to Scott for
  fast cofactor clearing on any elliptic curve for which the prime
  factorization of h and the structure of the elliptic curve group meet
  certain conditions.

The clear\_cofactor function is parameterized by a scalar h\_eff.
Specifically,

~~~
    clear_cofactor(P) := h_eff * P
~~~

where \* represents scalar multiplication.
When a curve does not support a fast cofactor clearing method, h\_eff = h
and the cofactor MUST be cleared via scalar multiplication.

When a curve admits a fast cofactor clearing method, clear\_cofactor
MAY be evaluated either via that method or via scalar multiplication
by the equivalent h\_eff; these two methods give the same result.
Note that in this case scalar multiplication by the cofactor h does not
generally give the same result as the fast method, and SHOULD NOT be used.

# Suites for Hashing {#suites}

This section lists recommended suites for hashing to standard elliptic curves.

A hash-to-curve suite fully specifies the procedure for hashing byte strings
to points on a specific elliptic curve group.
{{suites-howto}} describes how to implement a suite.
Designers specifying a protocol that requires hashing to an elliptic curve
should either choose an existing suite or specify a new one as described
in {{new-suite}}.

All protocols and applications using a hash-to-curve suite MUST choose a domain
separation tag (DST) in accordance with the guidelines in {{domain-separation}}.
In addition, protocols and applications whose security requires a random oracle
that returns points on the target curve MUST use a suite whose encoding type
is hash\_to\_curve; see {{roadmap}} and immediately below for more information.

A hash-to-curve suite comprises the following parameters:

- Suite ID, a short name used to refer to a given suite.
  {{suiteIDformat}} discusses the naming conventions for suite IDs.
- encoding type, either random oracle (hash\_to\_curve) or nonuniform (encode\_to\_curve).
  See {{roadmap}} for definitions of these encoding types.
- E, the target elliptic curve over a field F.
- p, the characteristic of the field F.
- m, the extension degree of the field F.
- k, the target security level of the suite in bits.
  (See {{security-considerations-targets}} for discussion.)
- L, the length parameter for hash\_to\_field ({{hashtofield-sec}}).
- expand\_message, one of the variants specified in {{hashtofield-expand}}
  plus any parameters required for the specified variant (for example, H,
  the underlying hash function).
- f, a mapping function from {{mappings}}.
- h\_eff, the scalar parameter for clear\_cofactor ({{cofactor-clearing}}).

In addition to the above parameters, the mapping f may require
additional parameters Z, M, rational\_map, E', and/or iso\_map.
These MUST be specified when applicable.

The below table lists the curves for which suites are defined and
the subsection that gives the corresponding parameters.

| E                         | Section              |
|---------------------------|----------------------|
| NIST P-256                | {{suites-p256}}      |
| NIST P-384                | {{suites-p384}}      |
| NIST P-521                | {{suites-p521}}      |
| curve25519 / edwards25519 | {{suites-25519}}     |
| curve448 / edwards448     | {{suites-448}}       |
| secp256k1                 | {{suites-secp256k1}} |
| BLS12-381                 | {{suites-bls12381}}  |

## Implementing a hash-to-curve suite {#suites-howto}

A hash-to-curve suite requires the following functions.
Note that some of these require utility functions from {{utility}}.

1. Base field arithmetic operations for the target elliptic curve, e.g.,
   addition, multiplication, and square root.

2. Elliptic curve point operations for the target curve, e.g.,
   point addition and scalar multiplication.

3. The hash-to-field function; see {{hashtofield}}. This includes the expand\_message
   variant ({{hashtofield-expand}}) and any constituent hash function or XOF.

4. The suite-specified mapping function; see the corresponding subsection of {{mappings}}.

5. A cofactor clearing function; see {{cofactor-clearing}}. This may be implemented as
   scalar multiplication by h\_eff or as a faster equivalent method.

6. The desired encoding function; see {{roadmap}}. This is either hash\_to\_curve or
   encode\_to\_curve.

## Suites for NIST P-256 {#suites-p256}

This section defines ciphersuites for the NIST P-256 elliptic curve {{FIPS186-4}}.

P256\_XMD:SHA-256\_SSWU\_RO\_ is defined as follows:

- encoding type: hash\_to\_curve ({{roadmap}})
- E: y^2 = x^3 + A * x + B, where
   - A = -3
   - B = 0x5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b
- p: 2^256 - 2^224 + 2^192 + 2^96 - 1
- m: 1
- k: 128
- expand\_message: expand\_message\_xmd ({{hashtofield-expand-xmd}})
- H: SHA-256
- L: 48
- f: Simplified SWU method, {{simple-swu}}
- Z: -10
- h\_eff: 1

P256\_XMD:SHA-256\_SVDW\_RO\_ is identical to P256\_XMD:SHA-256\_SSWU\_RO\_,
except for the following parameters:

- f: Shallue-van de Woestijne method, {{svdw}}
- Z: -3

P256\_XMD:SHA-256\_SSWU\_NU\_ is identical to P256\_XMD:SHA-256\_SSWU\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

P256\_XMD:SHA-256\_SVDW\_NU\_ is identical to P256\_XMD:SHA-256\_SVDW\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

An optimized example implementation of the Simplified SWU mapping
to P-256 is given in {{sswu-map-to-3mod4}}.

## Suites for NIST P-384 {#suites-p384}

This section defines ciphersuites for the NIST P-384 elliptic curve {{FIPS186-4}}.

P384\_XMD:SHA-512\_SSWU\_RO\_ is defined as follows:

- encoding type: hash\_to\_curve ({{roadmap}})
- E: y^2 = x^3 + A * x + B, where
  - A = -3
  - B = 0xb3312fa7e23ee7e4988e056be3f82d19181d9c6efe8141120314088f5013875ac656398d8a2ed19d2a85c8edd3ec2aef
- p: 2^384 - 2^128 - 2^96 + 2^32 - 1
- m: 1
- k: 192
- expand\_message: expand\_message\_xmd ({{hashtofield-expand-xmd}})
- H: SHA-512
- L: 72
- f: Simplified SWU method, {{simple-swu}}
- Z: -12
- h\_eff: 1

P384\_XMD:SHA-512\_SVDW\_RO\_ is identical to P384\_XMD:SHA-512\_SSWU\_RO\_,
except for the following parameters:

- f: Shallue-van de Woestijne method, {{svdw}}
- Z: -1

P384\_XMD:SHA-512\_SSWU\_NU\_ is identical to P384\_XMD:SHA-512\_SSWU\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

P384\_XMD:SHA-512\_SVDW\_NU\_ is identical to P384\_XMD:SHA-512\_SVDW\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

An optimized example implementation of the Simplified SWU mapping
to P-384 is given in {{sswu-map-to-3mod4}}.

## Suites for NIST P-521 {#suites-p521}

This section defines ciphersuites for the NIST P-521 elliptic curve {{FIPS186-4}}.

P521\_XMD:SHA-512\_SSWU\_RO\_ is defined as follows:

- encoding type: hash\_to\_curve ({{roadmap}})
- E: y^2 = x^3 + A * x + B, where
  - A = -3
  - B = 0x51953eb9618e1c9a1f929a21a0b68540eea2da725b99b315f3b8b489918ef109e156193951ec7e937b1652c0bd3bb1bf073573df883d2c34f1ef451fd46b503f00
- p: 2^521 - 1
- m: 1
- k: 256
- expand\_message: expand\_message\_xmd ({{hashtofield-expand-xmd}})
- H: SHA-512
- L: 98
- f: Simplified SWU method, {{simple-swu}}
- Z: -4
- h\_eff: 1

P521\_XMD:SHA-512\_SVDW\_RO\_ is identical to P521\_XMD:SHA-512\_SSWU\_RO\_,
except for the following parameters:

- f: Shallue-van de Woestijne method, {{svdw}}
- Z: 1

P521\_XMD:SHA-512\_SSWU\_NU\_ is identical to P512\_XMD:SHA-512\_SSWU\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

P521\_XMD:SHA-512\_SVDW\_NU\_ is identical to P512\_XMD:SHA-512\_SVDW\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

An optimized example implementation of the Simplified SWU mapping
to P-521 is given in {{sswu-map-to-3mod4}}.

## Suites for curve25519 and edwards25519 {#suites-25519}

This section defines ciphersuites for curve25519 and edwards25519 {{RFC7748}}.

curve25519\_XMD:SHA-256\_ELL2\_RO\_ is defined as follows:

- encoding type: hash\_to\_curve ({{roadmap}})
- E: K * t^2 = s^3 + J * s^2 + s, where
  - J = 486662
  - K = 1
- p: 2^255 - 19
- m: 1
- k: 128
- expand\_message: expand\_message\_xmd ({{hashtofield-expand-xmd}})
- H: SHA-256
- L: 48
- f: Elligator 2 method, {{elligator2}}
- Z: 2
- h\_eff: 8

edwards25519\_XMD:SHA-256\_ELL2\_RO\_ is identical to curve25519\_XMD:SHA-256\_ELL2\_RO\_,
except for the following parameters:

- E: a * v^2 + w^2 = 1 + d * v^2 * w^2, where
  - a = -1
  - d = 0x52036cee2b6ffe738cc740797779e89800700a4d4141d8ab75eb4dca135978a3
- f: Twisted Edwards Elligator 2 method, {{ell2edwards}}
- M: curve25519 defined in {{RFC7748}}, Section 4.1
- rational\_map: the birational map defined in {{RFC7748}}, Section 4.1

curve25519\_XMD:SHA-256\_ELL2\_NU\_ is identical to curve25519\_XMD:SHA-256\_ELL2\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

edwards25519\_XMD:SHA-256\_ELL2\_NU\_ is identical to edwards25519\_XMD:SHA-256\_ELL2\_RO\_,
except that ene encoding type is encode\_to\_curve ({{roadmap}}).

curve25519\_XMD:SHA-512\_ELL2\_RO\_ is identical to curve25519\_XMD:SHA-256\_ELL2\_RO\_,
except that H is SHA-512.

curve25519\_XMD:SHA-512\_ELL2\_NU\_ is identical to curve25519\_XMD:SHA-256\_ELL2\_NU\_,
except that H is SHA-512.

edwards25519\_XMD:SHA-512\_ELL2\_RO\_ is identical to edwards25519\_XMD:SHA-256\_ELL2\_RO\_,
except that H is SHA-512.

edwards25519\_XMD:SHA-512\_ELL2\_NU\_ is identical to edwards25519\_XMD:SHA-256\_ELL2\_NU\_,
except that H is SHA-512.

Optimized example implementations of the above mappings are given in
{{map-to-curve25519}} and {{map-to-edwards25519}}.

## Suites for curve448 and edwards448 {#suites-448}

This section defines ciphersuites for curve448 and edwards448 {{RFC7748}}.

curve448\_XMD:SHA-512\_ELL2\_RO\_ is defined as follows:

- encoding type: hash\_to\_curve ({{roadmap}})
- E: K * t^2 = s^3 + J * s^2 + s, where
  - J = 156326
  - K = 1
- p: 2^448 - 2^224 - 1
- m: 1
- k: 224
- expand\_message: expand\_message\_xmd ({{hashtofield-expand-xmd}})
- H: SHA-512
- L: 84
- f: Elligator 2 method, {{elligator2}}
- Z: -1
- h\_eff: 4

edwards448\_XMD:SHA-512\_ELL2\_RO\_ is identical to curve448\_XMD:SHA-512\_ELL2\_RO\_,
except for the following parameters:

- E: a * v^2 + w^2 = 1 + d * v^2 * w^2, where
  - a = 1
  - d = -39081
- f: Twisted Edwards Elligator 2 method, {{ell2edwards}}
- M: curve448, defined in {{RFC7748}}, Section 4.2
- rational\_map: the 4-isogeny map defined in {{RFC7748}}, Section 4.2

curve448\_XMD:SHA-512\_ELL2\_NU\_ is identical to curve448\_XMD:SHA-512\_ELL2\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

edwards448\_XMD:SHA-512\_ELL2\_NU\_ is identical to edwards448\_XMD:SHA-512\_ELL2\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

Optimized example implementations of the above mappings are given in
{{map-to-curve448}} and {{map-to-edwards448}}.

## Suites for secp256k1 {#suites-secp256k1}

This section defines ciphersuites for the secp256k1 elliptic curve {{SEC2}}.

secp256k1\_XMD:SHA-256\_SSWU\_RO\_ is defined as follows:

- encoding type: hash\_to\_curve ({{roadmap}})
- E: y^2 = x^3 + 7
- p: 2^256 - 2^32 - 2^9 - 2^8 - 2^7 - 2^6 - 2^4 - 1
- m: 1
- k: 128
- expand\_message: expand\_message\_xmd ({{hashtofield-expand-xmd}})
- H: SHA-256
- L: 48
- f: Simplified SWU for AB == 0, {{simple-swu-AB0}}
- Z: -11
- E': y'^2 = x'^3 + A' * x' + B', where
  - A': 0x3f8731abdd661adca08a5558f0f5d272e953d363cb6f0e5d405447c01a444533
  - B': 1771
- iso\_map: the 3-isogeny map from E' to E given in {{appx-iso-secp256k1}}
- h\_eff: 1

secp256k1\_XMD:SHA-256\_SVDW\_RO\_ is identical to secp256k1\_XMD:SHA-256\_SSWU\_RO\_,
except for the following parameters:

- f: Shallue-van de Woestijne method, {{svdw}}
- Z: 1
- E' is not required for this suite
- iso\_map is not required for this suite

secp256k1\_XMD:SHA-256\_SSWU\_NU\_ is identical to secp256k1\_XMD:SHA-256\_SSWU\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

secp256k1\_XMD:SHA-256\_SVDW\_NU\_ is identical to secp256k1\_XMD:SHA-256\_SVDW\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

An optimized example implementation of the Simplified SWU mapping
to the curve E' isogenous to secp256k1 is given in {{sswu-map-to-3mod4}}.

## Suites for BLS12-381 {#suites-bls12381}

This section defines ciphersuites for groups G1 and G2 of
the BLS12-381 elliptic curve {{BLS12-381}}.

### BLS12-381 G1 {#suites-bls12381-g1}

BLS12381G1\_XMD:SHA-256\_SSWU\_RO\_ is defined as follows:

- encoding type: hash\_to\_curve ({{roadmap}})
- E: y^2 = x^3 + 4
- p: 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab
- m: 1
- k: 128
- expand\_message: expand\_message\_xmd ({{hashtofield-expand-xmd}})
- H: SHA-256
- L: 64
- f: Simplified SWU for AB == 0, {{simple-swu-AB0}}
- Z: 11
- E': y'^2 = x'^3 + A' * x' + B', where
  - A' = 0x144698a3b8e9433d693a02c96d4982b0ea985383ee66a8d8e8981aefd881ac98936f8da0e0f97f5cf428082d584c1d
  - B' = 0x12e2908d11688030018b12e8753eee3b2016c1f0f24f4070a0b9c14fcef35ef55a23215a316ceaa5d1cc48e98e172be0
- iso\_map: the 11-isogeny map from E' to E given in {{appx-iso-bls12381-g1}}
- h\_eff: 0xd201000000010001

BLS12381G1\_XMD:SHA-256\_SVDW\_RO\_ is identical to BLS12381G1\_XMD:SHA-256\_SSWU\_RO\_,
except for the following parameters:

- f: Shallue-van de Woestijne method, {{svdw}}
- Z: -3
- E' is not required for this suite
- iso\_map is not required for this suite

BLS12381G1\_XMD:SHA-256\_SSWU\_NU\_ is identical to BLS12381G1\_XMD:SHA-256\_SSWU\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

BLS12381G1\_XMD:SHA-256\_SVDW\_NU\_ is identical to BLS12381G1\_XMD:SHA-256\_SVDW\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

Note that the h\_eff values for these suites are chosen for compatibility
with the fast cofactor clearing method described by Scott ({{WB19}} Section 5).

An optimized example implementation of the Simplified SWU mapping
to the curve E' isogenous to BLS12-381 G1 is given in {{sswu-map-to-3mod4}}.

### BLS12-381 G2 {#suites-bls12381-g2}

BLS12381G2\_XMD:SHA-256\_SSWU\_RO\_ is defined as follows:

- encoding type: hash\_to\_curve ({{roadmap}})
- E: y^2 = x^3 + 4 * (1 + I)
- base field F is GF(p^m), where
  - p: 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab
  - m: 2
  - (1, I) is the basis for F, where I^2 + 1 == 0 in F
- k: 128
- expand\_message: expand\_message\_xmd ({{hashtofield-expand-xmd}})
- H: SHA-256
- L: 64
- f: Simplified SWU for AB == 0, {{simple-swu-AB0}}
- Z: -(2 + I)
- E': y'^2 = x'^3 + A' * x' + B', where
  - A' = 240 * I
  - B' = 1012 * (1 + I)
- iso\_map: the isogeny map from E' to E given in {{appx-iso-bls12381-g2}}
- h\_eff: 0xbc69f08f2ee75b3584c6a0ea91b352888e2a8e9145ad7689986ff031508ffe1329c2f178731db956d82bf015d1212b02ec0ec69d7477c1ae954cbc06689f6a359894c0adebbf6b4e8020005aaa95551

BLS12381G2\_XMD:SHA-256\_SVDW\_RO\_ is identical to BLS12381G2\_XMD:SHA-256\_SSWU\_RO\_,
except for the following parameters:

- f: Shallue-van de Woestijne method, {{svdw}}
- Z: I
- E' is not required for this suite
- iso\_map is not required for this suite

BLS12381G2\_XMD:SHA-256\_SSWU\_NU\_ is identical to BLS12381G2\_XMD:SHA-256\_SSWU\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

BLS12381G2\_XMD:SHA-256\_SVDW\_NU\_ is identical to BLS12381G2\_XMD:SHA-256\_SVDW\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

Note that the h\_eff values for these suites are chosen for compatibility
with the fast cofactor clearing method described by
Budroni and Pintore ({{BP17}}, Section 4.1), and summarized in {{clear-cofactor-bls12381-g2}}.

## Defining a new hash-to-curve suite {#new-suite}

The RECOMMENDED way to define a new hash-to-curve suite is:

1. E, F, p, and m are determined by the elliptic curve and its base field.

2. k is an upper bound on the target security level of the suite
   ({{security-considerations-targets}}).
   A reasonable choice of k is ceil(log2(r) / 2), where r is
   the order of the subgroup G of the curve E ({{bg-curves}}).

3. Choose encoding type, either hash\_to\_curve or encode\_to\_curve ({{roadmap}}).

4. Compute L as described in {{hashtofield-sec}}.

5. Choose an expand\_message variant from {{hashtofield-expand}} plus any
   underlying cryptographic primitives (e.g., a hash function H).

6. Choose a mapping following the guidelines in {{choosing-mapping}},
   and select any required parameters for that mapping.

7. Choose h\_eff to be either the cofactor of E or, if a fast cofactor
   clearing method is to be used, a value appropriate to that method
   as discussed in {{cofactor-clearing}}.

8. Construct a Suite ID following the guidelines in {{suiteIDformat}}.

When hashing to an elliptic curve not listed in this section, corresponding
hash-to-curve suites SHOULD be fully specified as described above.

## Suite ID naming conventions {#suiteIDformat}

Suite IDs MUST be constructed as follows:

    CURVE_ID || "_" || HASH_ID || "_" || MAP_ID || "_" || ENC_VAR || "_"

The fields CURVE\_ID, HASH\_ID, MAP\_ID, and ENC\_VAR are
ASCII-encoded strings of at most 64 characters each.
Fields MUST contain only ASCII characters between 0x21 and 0x7E (inclusive)
other underscore (i.e., 0x5f).

As indicated above, each field (including the last) is followed by an underscore
("\_", ASCII 0x5f).
This helps to ensure that Suite IDs are prefix free.
Suite IDs MUST include the final underscore and MUST NOT include any characters
after the final underscore.

Suite ID fields MUST be chosen as follows:

- CURVE\_ID: a human-readable representation of the target elliptic curve.

- HASH\_ID: a human-readable representation of the expand\_message function
  and any underlying hash primitives used in hash\_to\_field ({{hashtofield}}).
  This field MUST be constructed as follows:

        EXP_TAG || ":" || HASH_NAME

  EXP\_TAG indicates the expand\_message variant:

    - "XMD" for expand\_message\_xmd ({{hashtofield-expand-xmd}}).
    - "XOF" for expand\_message\_xof ({{hashtofield-expand-xof}}).

  HASH\_NAME is a human-readable name for the underlying hash primitive.
  As examples:

    1. For expand\_message\_xof ({{hashtofield-expand-xof}}) with SHAKE-128,
       HASH\_ID is "XOF:SHAKE-128".

    2. For expand\_message\_xmd ({{hashtofield-expand-xmd}}) with SHA3-256,
       HASH\_ID is "XMD:SHA3-256".

- MAP\_ID: a human-readable representation of the map\_to\_curve function
  as defined in {{mappings}}. These are defined as follows:

    - "SVDW" for or Shallue and van de Woestijne ({{svdw}}).
    - "SSWU" for Simplified SWU ({{simple-swu}}, {{simple-swu-AB0}}).
    - "ELL2" for Elligator 2 ({{elligator2}}, {{ell2edwards}}).

- ENC\_VAR: a string indicating the encoding type and other information.
  The first two characters of this string indicate whether the suite
  represents a hash\_to\_curve or an encode\_to\_curve operation
  ({{roadmap}}), as follows:

    - If ENC\_VAR begins with "RO", the suite uses hash\_to\_curve.
    - If ENC\_VAR begins with "NU", the suite uses encode\_to\_curve.
    - ENC\_VAR MUST NOT begin with any other string.

    ENC\_VAR MAY also be used to encode other information used to identify
    variants, for example, a version number.
    The RECOMMENDED way to do so is to add one or more subfields separated
    by colons.
    For example, "RO:V02" is an appropriate ENC\_VAR value for the second
    version of a random-oracle suite, while "RO:V02:FOO01:BAR17" might be
    used to indicate a variant of that suite.

# IANA Considerations

This document has no IANA actions.

# Security Considerations {#security-considerations}

When constant-time implementations are required, all basic operations and
utility functions must be implemented in constant time, as discussed in
{{utility}}.
In some applications (e.g., embedded systems), leakage through other side
channels (e.g., power or electromagnetic side channels) may be pertinent.
Defending against such leakage is outside the scope of this document, because
the nature of the leakage and the appropriate defense depends on the protocol
from which a hash-to-curve function is invoked.

{{domain-separation}} describes considerations related to domain separation.

{{hashtofield}} describes considerations for uniformly hashing to field elements;
see {{security-considerations-hash-to-field}} and {{security-considerations-expand-xmd}}
for further discussion.

Each encoding type ({{roadmap}}) accepts an arbitrary byte string and maps
it to a pseudorandom point on the curve.
Note, however, that directly evaluating the mappings of {{mappings}} produces
an output that is distinguishable from random.

When the hash\_to\_curve function ({{roadmap}}) is instantiated with a
hash\_to\_field function that is indifferentiable from a random oracle
({{hashtofield}}), the resulting function is indifferentiable from a random
oracle ({{FFSTV13}}, {{LBB19}}, {{MRH04}}).
In most cases such a function can be safely used in protocols whose security
analysis assumes a random oracle that outputs points on an elliptic curve.
As Ristenpart et al. discuss in {{RSS11}}, however, not all security proofs
that rely on random oracles continue to hold when those oracles are replaced
by indifferentiable functionalities.
This limitation should be considered when analyzing the security of protocols
relying on the hash\_to\_curve function.

When hashing passwords using any function described in this document, an adversary
who learns the output of the hash function (or potentially any intermediate value,
e.g., the output of hash\_to\_field) may be able to carry out a dictionary attack.
To mitigate such attacks, it is recommended to first execute a more costly key
derivation function (e.g., PBKDF2 {{!RFC2898}} or scrypt {{!RFC7914}}) on the password,
then hash the output of that function to the target elliptic curve.
For collision resistance, the hash underlying the key derivation function
should be chosen according to the guidelines listed in {{hashtofield-expand}}.

## hash\_to\_field security {#security-considerations-hash-to-field}

The hash\_to\_field function defined in {{hashtofield}} is indifferentiable
from a random oracle {{MRH04}} when expand\_message ({{hashtofield-expand}})
is modeled as a random oracle.
By composability of indifferentiability proofs, this also holds when
expand\_message is proved indifferentiable from a random oracle relative
to an underlying primitive that is modeled as a random oracle.
When following the guidelines in {{hashtofield-expand}}, both variants
of expand\_message defined in that section meet this requirement
(see also {{security-considerations-expand-xmd}}).

We very briefly sketch the indifferentiability argument for hash\_to\_field.
Notice that each integer mod p that hash\_to\_field returns (i.e., each element
of the vector representation of F) is a member of an equivalence class of roughly
2^k integers of length log2(p) + k bits, all of which are equal modulo p.
For each integer mod p that hash\_to\_field returns, the simulator samples
one member of this equivalence class at random and outputs the byte string
returned by I2OSP.
(Notice that this is essentially the inverse of the hash\_to\_field procedure.)

Finally, the expand\_message variants in this document ({{hashtofield-expand}})
always append the domain separation tag DST to the strings hashed by H, the
underlying hash or extensible output function.
This means that invocations of H outside of hash\_to\_field can be separated
from those inside of hash\_to\_field by appending a tag distinct from DST to
their inputs.
Other expand\_message variants that follow the guidelines in
{{hashtofield-expand-other}} are expected to have similar properties,
but these should be analyzed on a case-by-case basis.

## expand\_message\_xmd security {#security-considerations-expand-xmd}

The expand\_message\_xmd function defined in {{hashtofield-expand-xmd}} is
indifferentiable from a random oracle {{MRH04}} when one of the following holds:

1. H is indifferentiable from a random oracle,
2. H is a sponge-based hash function whose inner function
   is modeled as a random transformation or random permutation {{BDPV08}}, or
3. H is a Merkle-Damgaard hash function whose compression function is
   modeled as a random oracle {{CDMP05}}.

For cases (1) and (2), the indifferentiability of expand\_message\_xmd follows
directly from the indifferentiability of H.

For case (3), i.e., for H a Merkle-Damgaard hash function, indifferentiability
follows from {{CDMP05}}, Theorem 3.5.
In particular, expand\_message\_xmd computes b\_0 by prepending one block of
0-bytes to the message and auxiliary information (length, counter, and DST).
Then, each of the output blocks b\_i, i >= 1 in expand\_message\_xmd is the
result of invoking H on a unique, prefix-free encoding of b\_0.
This is true, first, because the length of the input to all such invocations
is equal and fixed by the choice of H and DST, and
second, because each such input has a unique suffix (because of the inclusion
of the counter byte I2OSP(i, 1)).

The essential difference between the construction of {{CDMP05}} and
expand\_message\_xmd is that the latter hashes a counter appended to
strxor(b\_0, b\_(i - 1)) (step 9) rather than to b\_0.
This approach increases the Hamming distance between inputs to different
invocations of H, which reduces the likelihood that nonidealities in H
affect the distribution of the b\_i values.

## Target Security Levels {#security-considerations-targets}

Each ciphersuite specifies a target security level (in bits) for the underlying
curve. This parameter ensures the corresponding hash\_to\_field instantiation is
conservative and correct. We stress that this parameter is only an upper bound on
the security level of the curve. It is neither a guarantee nor endorsement of its
longevity. Mathematical and cryptographic advancements may lower the security level
for any curve. In such cases, applications SHOULD choose curves and, consequently,
ciphersuites with higher security levels.

# Acknowledgements

The authors would like to thank Adam Langley for his detailed writeup of Elligator 2 with
Curve25519 {{L13}};
Dan Boneh, Christopher Patton, and Benjamin Lipp for educational discussions; and
David Benjamin, Frank Denis, Sean Devlin, Justin Drake, Dan Harkins, Thomas Icart,
Andy Polyakov, Leonid Reyzin, Michael Scott, and Mathy Vanhoef for helpful feedback.

# Contributors

*   Sharon Goldberg \\
    Boston University \\
    goldbe@cs.bu.edu
*   Ela Lee \\
    Royal Holloway, University of London \\
    Ela.Lee.2010@live.rhul.ac.uk
*   Michele Orru \\
    michele.orru@ens.fr

--- back


# Related Work {#related}

The problem of mapping arbitrary bit strings to elliptic curve points
has been the subject of both practical and theoretical research.
This section briefly describes the background and research results
that underly the recommendations in this document.
This section is provided for informational purposes only.

A naive but generally insecure method of mapping a string msg to
a point on an elliptic curve E having n points is to first fix a point P that
generates the elliptic curve group, and a hash function Hn from bit strings
to integers less than n; then compute Hn(msg) * P, where the * operator
represents scalar multiplication. The reason this approach is insecure is
that the resulting point has a known discrete log relationship to P.
Thus, except in cases where this method is specified by the protocol,
it must not be used; doing so risks catastrophic security failures.

Boneh et al. {{BLS01}} describe an encoding method they call MapToGroup,
which works roughly as follows: first, use the input string to initialize a
pseudorandom number generator, then use the generator to produce a pseudorandom
value x in F.
If x is the x-coordinate of a point on the elliptic curve, output that
point. Otherwise, generate a new pseudorandom value x in F and try again.
Since a random value x in F has probability about 1/2 of corresponding to
a point on the curve, the expected number of tries is just two.
However, the running time of this method depends on the input string,
which means that it is not safe to use in protocols sensitive to timing
side channels.

Schinzel and Skalba {{SS04}} introduce a method of constructing
elliptic curve points deterministically, for a restricted class of curves
and a very small number of points.
Skalba {{S05}} generalizes this construction to more curves and more points
on those curves.
Shallue and van de Woestijne {{SW06}} further generalize and simplify
Skalba's construction, yielding concretely efficient maps to a constant
fraction of the points on almost any curve.
Fouque and Tibouchi {{FT12}} give a parameterization of this mapping
for Barreto-Naehrig pairing-friendly curves {{BN05}}.

Ulas {{U07}} describes a simpler version of the Shallue-van de Woestijne map,
and Brier et al. {{BCIMRT10}} give a further simplification, which the authors
call the "simplified SWU" map.
That simplified map applies only to fields of characteristic p = 3 (mod 4);
Wahby and Boneh {{WB19}} generalize to fields of any characteristic, and
give further optimizations.

Boneh and Franklin give a deterministic algorithm mapping to certain
supersingular curves over fields of characteristic p = 2 (mod 3) {{BF01}}.
Icart gives another deterministic algorithm which maps to any curve
over a field of characteristic p = 2 (mod 3) {{Icart09}}.
Several extensions and generalizations follow this work, including
{{FSV09}}, {{FT10}}, {{KLR10}}, {{F11}}, and {{CK11}}.

Following the work of Farashahi {{F11}}, Fouque et al. {{FJT13}} describe a
mapping to curves over fields of characteristic p = 3 (mod 4) having a number of points
divisible by 4.  Bernstein et al. {{BHKL13}} optimize this mapping and
describe a related mapping that they call "Elligator 2," which applies to
any curve over a field of odd characteristic having a point of order 2.
This includes Curve25519 and Curve448, both of which are CFRG-recommended
curves {{RFC7748}}. Bernstein et al. {{BLMP19}} extend the Elligator 2 map
to a class of supersingular curves over fields of characteristic p = 3 (mod 4).

An important caveat regarding all of the above deterministic mapping
functions is that none of them map to the entire curve, but rather to some
fraction of the points. This means that they cannot be used directly to
construct a random oracle that outputs points on the curve.

Brier et al. {{BCIMRT10}} give two solutions to this problem.
The first, which Brier et al. prove applies to Icart's method,
computes f(H0(msg)) + f(H1(msg)) for two distinct hash functions
H0 and H1 from bit strings to F and a mapping f from F to the elliptic curve E.
The second, which applies to essentially all deterministic mappings but
is more costly, computes f(H0(msg)) + H2(msg) * P, for P a generator of the
elliptic curve group and H2 a hash from bit strings to integers modulo r,
the order of the elliptic curve group.
Farashahi et al. {{FFSTV13}} improve the analysis of the first method,
showing that it applies to essentially all deterministic mappings.
Tibouchi and Kim {{TK17}} further refine the analysis and describe additional
optimizations.

Complementary to the problem of mapping from bit strings to elliptic curve
points, Bernstein et al. {{BHKL13}} study the problem of mapping from elliptic
curve points to uniformly random bit strings, giving solutions for a class of
curves including Montgomery and twisted Edwards curves.
Tibouchi {{T14}} and Aranha et al. {{AFQTZ14}} generalize these results.
This document does not deal with this complementary problem.

# Rational maps {#appx-rational-map}

This section gives several useful rational maps.

## Twisted Edwards to Montgomery curves {#appx-rational-map-edw}

This section gives a generic birational map between twisted Edwards
and Montgomery curves.
This birational map comprises the rational map specified in
{{rational-map}} and its inverse.

The twisted Edwards curve

~~~
    a * v^2 + w^2 = 1 + d * v^2 * w^2
~~~

is birationally equivalent to the Montgomery curve

~~~
    K * t^2 = s^3 + J * s^2 + s
~~~

by the following mappings ({{BBJLP08}}, Theorem 3.2).
To convert from twisted Edwards to Montgomery form, the mapping is

- J = 2 * (a + d) / (a - d)
- K = 4 / (a - d)
- s = (1 + w) / (1 - w)
- t = (1 + w) / (v * (1 - w))

This mapping is defined when a != d, which is guaranteed by the definition
of twisted Edwards curves.
The mapping is undefined when v == 0 or w == 1.
If (v, w) == (0, -1), return the point (s, t) = (0, 0).
For all other undefined inputs, return the identity point on the Montgomery curve.
(This follows from [BBJLP08], Section 3.)

To convert from Montgomery to twisted Edwards form, the mapping is

- a = (J + 2) / K
- d = (J - 2) / K
- v = s / t
- w = (s - 1) / (s + 1)

This mapping is defined when J != 2, J != -2, and K != 0; all Montgomery
curves meet these criteria.
The mapping is undefined when t == 0 or s == -1.
If (s, t) == (0, 0), return the point (v, w) = (0, -1).
For all other undefined inputs, return the identity point on the twisted
Edwards curve, namely, (v, w) = (0, 1).
(This follows from [BBJLP08], Section 3.)

(Note that {{rational-map}} gives a simpler rule for handling undefined
inputs to this rational map: always return the identity point.
The simpler rule gives the same result when used as part of an encoding
function ({{roadmap}}), because the cofactor clearing step will always
map the point (v, w) = (0, -1) to the identity point.)

Composing the mapping of this section with the mapping from
Montgomery to Weierstrass curves in {{appx-rational-map-mont}}
yields a mapping from twisted Edwards curves to Weierstrass curves,
which is the form required by the mappings in {{weierstrass}}.
This composition of mappings can be used to apply the Shallue-van
de Woestijne ({{svdw}}) or Simplified SWU ({{simple-swu}}) method
to twisted Edwards curves.

## Montgomery to Weierstrass curves {#appx-rational-map-mont}

The rational map from the point (s, t) on the Montgomery curve

~~~
    K * t^2 = s^3 + J * s^2 + s
~~~

to the point (x, y) on the equivalent Weierstrass curve

~~~
    y^2 = x^3 + A * x + B
~~~

is given by:

- A = (3 - J^2) / (3 * K^2)
- B = (2 * J^3 - 9 * J) / (27 * K^3)
- x = (3 * s + J) / (3 * K)
- y = t / K

The inverse map, from the point (x, y) to the point (s, t), is given by

- s = (3 * K * x - J) / 3
- t = y * K

This mapping can be used to apply the Shallue-van de Woestijne
({{svdw}}) or Simplified SWU ({{simple-swu}}) method to
Montgomery curves.

# Isogeny maps for Suites {#appx-iso}

This section specifies the isogeny maps for the secp256k1 and BLS12-381
suites listed in {{suites}}.

These maps are given in terms of affine coordinates.
Wahby and Boneh ({{WB19}}, Section 4.3) show how to evaluate these maps
in a projective coordinate system ({{projective-coords}}), which avoids
modular inversions.

Refer to the draft repository {{hash2curve-repo}} for a Sage {{SAGE}} script
that constructs these isogenies.

## 3-isogeny map for secp256k1 {#appx-iso-secp256k1}

This section specifies the isogeny map for the secp256k1 suite listed in {{suites-secp256k1}}.

The 3-isogeny map from (x', y') on E' to (x, y) on E is given by the following rational functions:

- x = x\_num / x\_den, where
  - x\_num = k\_(1,3) * x'^3 + k\_(1,2) * x'^2 + k\_(1,1) * x' + k\_(1,0)
  - x\_den = x'^2 + k\_(2,1) * x' + k\_(2,0)

- y = y' * y\_num / y\_den, where
  - y\_num = k\_(3,3) * x'^3 + k\_(3,2) * x'^2 + k\_(3,1) * x' + k\_(3,0)
  - y\_den = x'^3 + k\_(4,2) * x'^2 + k\_(4,1) * x' + k\_(4,0)

The constants used to compute x\_num are as follows:

- k\_(1,0) = 0x8e38e38e38e38e38e38e38e38e38e38e38e38e38e38e38e38e38e38daaaaa8c7
- k\_(1,1) = 0x7d3d4c80bc321d5b9f315cea7fd44c5d595d2fc0bf63b92dfff1044f17c6581
- k\_(1,2) = 0x534c328d23f234e6e2a413deca25caece4506144037c40314ecbd0b53d9dd262
- k\_(1,3) = 0x8e38e38e38e38e38e38e38e38e38e38e38e38e38e38e38e38e38e38daaaaa88c

The constants used to compute x\_den are as follows:

- k\_(2,0) = 0xd35771193d94918a9ca34ccbb7b640dd86cd409542f8487d9fe6b745781eb49b
- k\_(2,1) = 0xedadc6f64383dc1df7c4b2d51b54225406d36b641f5e41bbc52a56612a8c6d14

The constants used to compute y\_num are as follows:

- k\_(3,0) = 0x4bda12f684bda12f684bda12f684bda12f684bda12f684bda12f684b8e38e23c
- k\_(3,1) = 0xc75e0c32d5cb7c0fa9d0a54b12a0a6d5647ab046d686da6fdffc90fc201d71a3
- k\_(3,2) = 0x29a6194691f91a73715209ef6512e576722830a201be2018a765e85a9ecee931
- k\_(3,3) = 0x2f684bda12f684bda12f684bda12f684bda12f684bda12f684bda12f38e38d84

The constants used to compute y\_den are as follows:

- k\_(4,0) = 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffefffff93b
- k\_(4,1) = 0x7a06534bb8bdb49fd5e9e6632722c2989467c1bfc8e8d978dfb425d2685c2573
- k\_(4,2) = 0x6484aa716545ca2cf3a70c3fa8fe337e0a3d21162f0d6299a7bf8192bfd2a76f

## 11-isogeny map for BLS12-381 G1 {#appx-iso-bls12381-g1}

The 11-isogeny map from (x', y') on E' to (x, y) on E is given by the following rational functions:

- x = x\_num / x\_den, where
  - x\_num = k\_(1,11) * x'^11 + k\_(1,10) * x'^10 + k\_(1,9) * x'^9 + ... + k\_(1,0)
  - x\_den = x'^10 + k\_(2,9) * x'^9 + k\_(2,8) * x'^8 + ... + k\_(2,0)

- y = y' * y\_num / y\_den, where
  - y\_num = k\_(3,15) * x'^15 + k\_(3,14) * x'^14 + k\_(3,13) * x'^13 + ... + k\_(3,0)
  - y\_den = x'^15 + k\_(4,14) * x'^14 + k\_(4,13) * x'^13 + ... + k\_(4,0)

The constants used to compute x\_num are as follows:

- k\_(1,0) = 0x11a05f2b1e833340b809101dd99815856b303e88a2d7005ff2627b56cdb4e2c85610c2d5f2e62d6eaeac1662734649b7
- k\_(1,1) = 0x17294ed3e943ab2f0588bab22147a81c7c17e75b2f6a8417f565e33c70d1e86b4838f2a6f318c356e834eef1b3cb83bb
- k\_(1,2) = 0xd54005db97678ec1d1048c5d10a9a1bce032473295983e56878e501ec68e25c958c3e3d2a09729fe0179f9dac9edcb0
- k\_(1,3) = 0x1778e7166fcc6db74e0609d307e55412d7f5e4656a8dbf25f1b33289f1b330835336e25ce3107193c5b388641d9b6861
- k\_(1,4) = 0xe99726a3199f4436642b4b3e4118e5499db995a1257fb3f086eeb65982fac18985a286f301e77c451154ce9ac8895d9
- k\_(1,5) = 0x1630c3250d7313ff01d1201bf7a74ab5db3cb17dd952799b9ed3ab9097e68f90a0870d2dcae73d19cd13c1c66f652983
- k\_(1,6) = 0xd6ed6553fe44d296a3726c38ae652bfb11586264f0f8ce19008e218f9c86b2a8da25128c1052ecaddd7f225a139ed84
- k\_(1,7) = 0x17b81e7701abdbe2e8743884d1117e53356de5ab275b4db1a682c62ef0f2753339b7c8f8c8f475af9ccb5618e3f0c88e
- k\_(1,8) = 0x80d3cf1f9a78fc47b90b33563be990dc43b756ce79f5574a2c596c928c5d1de4fa295f296b74e956d71986a8497e317
- k\_(1,9) = 0x169b1f8e1bcfa7c42e0c37515d138f22dd2ecb803a0c5c99676314baf4bb1b7fa3190b2edc0327797f241067be390c9e
- k\_(1,10) = 0x10321da079ce07e272d8ec09d2565b0dfa7dccdde6787f96d50af36003b14866f69b771f8c285decca67df3f1605fb7b
- k\_(1,11) = 0x6e08c248e260e70bd1e962381edee3d31d79d7e22c837bc23c0bf1bc24c6b68c24b1b80b64d391fa9c8ba2e8ba2d229

The constants used to compute x\_den are as follows:

- k\_(2,0) = 0x8ca8d548cff19ae18b2e62f4bd3fa6f01d5ef4ba35b48ba9c9588617fc8ac62b558d681be343df8993cf9fa40d21b1c
- k\_(2,1) = 0x12561a5deb559c4348b4711298e536367041e8ca0cf0800c0126c2588c48bf5713daa8846cb026e9e5c8276ec82b3bff
- k\_(2,2) = 0xb2962fe57a3225e8137e629bff2991f6f89416f5a718cd1fca64e00b11aceacd6a3d0967c94fedcfcc239ba5cb83e19
- k\_(2,3) = 0x3425581a58ae2fec83aafef7c40eb545b08243f16b1655154cca8abc28d6fd04976d5243eecf5c4130de8938dc62cd8
- k\_(2,4) = 0x13a8e162022914a80a6f1d5f43e7a07dffdfc759a12062bb8d6b44e833b306da9bd29ba81f35781d539d395b3532a21e
- k\_(2,5) = 0xe7355f8e4e667b955390f7f0506c6e9395735e9ce9cad4d0a43bcef24b8982f7400d24bc4228f11c02df9a29f6304a5
- k\_(2,6) = 0x772caacf16936190f3e0c63e0596721570f5799af53a1894e2e073062aede9cea73b3538f0de06cec2574496ee84a3a
- k\_(2,7) = 0x14a7ac2a9d64a8b230b3f5b074cf01996e7f63c21bca68a81996e1cdf9822c580fa5b9489d11e2d311f7d99bbdcc5a5e
- k\_(2,8) = 0xa10ecf6ada54f825e920b3dafc7a3cce07f8d1d7161366b74100da67f39883503826692abba43704776ec3a79a1d641
- k\_(2,9) = 0x95fc13ab9e92ad4476d6e3eb3a56680f682b4ee96f7d03776df533978f31c1593174e4b4b7865002d6384d168ecdd0a

The constants used to compute y\_num are as follows:

- k\_(3,0) = 0x90d97c81ba24ee0259d1f094980dcfa11ad138e48a869522b52af6c956543d3cd0c7aee9b3ba3c2be9845719707bb33
- k\_(3,1) = 0x134996a104ee5811d51036d776fb46831223e96c254f383d0f906343eb67ad34d6c56711962fa8bfe097e75a2e41c696
- k\_(3,2) = 0xcc786baa966e66f4a384c86a3b49942552e2d658a31ce2c344be4b91400da7d26d521628b00523b8dfe240c72de1f6
- k\_(3,3) = 0x1f86376e8981c217898751ad8746757d42aa7b90eeb791c09e4a3ec03251cf9de405aba9ec61deca6355c77b0e5f4cb
- k\_(3,4) = 0x8cc03fdefe0ff135caf4fe2a21529c4195536fbe3ce50b879833fd221351adc2ee7f8dc099040a841b6daecf2e8fedb
- k\_(3,5) = 0x16603fca40634b6a2211e11db8f0a6a074a7d0d4afadb7bd76505c3d3ad5544e203f6326c95a807299b23ab13633a5f0
- k\_(3,6) = 0x4ab0b9bcfac1bbcb2c977d027796b3ce75bb8ca2be184cb5231413c4d634f3747a87ac2460f415ec961f8855fe9d6f2
- k\_(3,7) = 0x987c8d5333ab86fde9926bd2ca6c674170a05bfe3bdd81ffd038da6c26c842642f64550fedfe935a15e4ca31870fb29
- k\_(3,8) = 0x9fc4018bd96684be88c9e221e4da1bb8f3abd16679dc26c1e8b6e6a1f20cabe69d65201c78607a360370e577bdba587
- k\_(3,9) = 0xe1bba7a1186bdb5223abde7ada14a23c42a0ca7915af6fe06985e7ed1e4d43b9b3f7055dd4eba6f2bafaaebca731c30
- k\_(3,10) = 0x19713e47937cd1be0dfd0b8f1d43fb93cd2fcbcb6caf493fd1183e416389e61031bf3a5cce3fbafce813711ad011c132
- k\_(3,11) = 0x18b46a908f36f6deb918c143fed2edcc523559b8aaf0c2462e6bfe7f911f643249d9cdf41b44d606ce07c8a4d0074d8e
- k\_(3,12) = 0xb182cac101b9399d155096004f53f447aa7b12a3426b08ec02710e807b4633f06c851c1919211f20d4c04f00b971ef8
- k\_(3,13) = 0x245a394ad1eca9b72fc00ae7be315dc757b3b080d4c158013e6632d3c40659cc6cf90ad1c232a6442d9d3f5db980133
- k\_(3,14) = 0x5c129645e44cf1102a159f748c4a3fc5e673d81d7e86568d9ab0f5d396a7ce46ba1049b6579afb7866b1e715475224b
- k\_(3,15) = 0x15e6be4e990f03ce4ea50b3b42df2eb5cb181d8f84965a3957add4fa95af01b2b665027efec01c7704b456be69c8b604

The constants used to compute y\_den are as follows:

- k\_(4,0) = 0x16112c4c3a9c98b252181140fad0eae9601a6de578980be6eec3232b5be72e7a07f3688ef60c206d01479253b03663c1
- k\_(4,1) = 0x1962d75c2381201e1a0cbd6c43c348b885c84ff731c4d59ca4a10356f453e01f78a4260763529e3532f6102c2e49a03d
- k\_(4,2) = 0x58df3306640da276faaae7d6e8eb15778c4855551ae7f310c35a5dd279cd2eca6757cd636f96f891e2538b53dbf67f2
- k\_(4,3) = 0x16b7d288798e5395f20d23bf89edb4d1d115c5dbddbcd30e123da489e726af41727364f2c28297ada8d26d98445f5416
- k\_(4,4) = 0xbe0e079545f43e4b00cc912f8228ddcc6d19c9f0f69bbb0542eda0fc9dec916a20b15dc0fd2ededda39142311a5001d
- k\_(4,5) = 0x8d9e5297186db2d9fb266eaac783182b70152c65550d881c5ecd87b6f0f5a6449f38db9dfa9cce202c6477faaf9b7ac
- k\_(4,6) = 0x166007c08a99db2fc3ba8734ace9824b5eecfdfa8d0cf8ef5dd365bc400a0051d5fa9c01a58b1fb93d1a1399126a775c
- k\_(4,7) = 0x16a3ef08be3ea7ea03bcddfabba6ff6ee5a4375efa1f4fd7feb34fd206357132b920f5b00801dee460ee415a15812ed9
- k\_(4,8) = 0x1866c8ed336c61231a1be54fd1d74cc4f9fb0ce4c6af5920abc5750c4bf39b4852cfe2f7bb9248836b233d9d55535d4a
- k\_(4,9) = 0x167a55cda70a6e1cea820597d94a84903216f763e13d87bb5308592e7ea7d4fbc7385ea3d529b35e346ef48bb8913f55
- k\_(4,10) = 0x4d2f259eea405bd48f010a01ad2911d9c6dd039bb61a6290e591b36e636a5c871a5c29f4f83060400f8b49cba8f6aa8
- k\_(4,11) = 0xaccbb67481d033ff5852c1e48c50c477f94ff8aefce42d28c0f9a88cea7913516f968986f7ebbea9684b529e2561092
- k\_(4,12) = 0xad6b9514c767fe3c3613144b45f1496543346d98adf02267d5ceef9a00d9b8693000763e3b90ac11e99b138573345cc
- k\_(4,13) = 0x2660400eb2e4f3b628bdd0d53cd76f2bf565b94e72927c1cb748df27942480e420517bd8714cc80d1fadc1326ed06f7
- k\_(4,14) = 0xe0fa1d816ddc03e6b24255e0d7819c171c40f65e273b853324efcd6356caa205ca2f570f13497804415473a1d634b8f

## 3-isogeny map for BLS12-381 G2 {#appx-iso-bls12381-g2}

The 3-isogeny map from (x', y') on E' to (x, y) on E is given by the following rational functions:

- x = x\_num / x\_den, where
  - x\_num = k\_(1,3) * x'^3 + k\_(1,2) * x'^2 + k\_(1,1) * x' + k\_(1,0)
  - x\_den = x'^2 + k\_(2,1) * x' + k\_(2,0)

- y = y' * y\_num / y\_den, where
  - y\_num = k\_(3,3) * x'^3 + k\_(3,2) * x'^2 + k\_(3,1) * x' + k\_(3,0)
  - y\_den = x'^3 + k\_(4,2) * x'^2 + k\_(4,1) * x' + k\_(4,0)

The constants used to compute x\_num are as follows:

- k\_(1,0) = 0x5c759507e8e333ebb5b7a9a47d7ed8532c52d39fd3a042a88b58423c50ae15d5c2638e343d9c71c6238aaaaaaaa97d6 + 0x5c759507e8e333ebb5b7a9a47d7ed8532c52d39fd3a042a88b58423c50ae15d5c2638e343d9c71c6238aaaaaaaa97d6 * I
- k\_(1,1) = 0x11560bf17baa99bc32126fced787c88f984f87adf7ae0c7f9a208c6b4f20a4181472aaa9cb8d555526a9ffffffffc71a * I
- k\_(1,2) = 0x11560bf17baa99bc32126fced787c88f984f87adf7ae0c7f9a208c6b4f20a4181472aaa9cb8d555526a9ffffffffc71e + 0x8ab05f8bdd54cde190937e76bc3e447cc27c3d6fbd7063fcd104635a790520c0a395554e5c6aaaa9354ffffffffe38d * I
- k\_(1,3) = 0x171d6541fa38ccfaed6dea691f5fb614cb14b4e7f4e810aa22d6108f142b85757098e38d0f671c7188e2aaaaaaaa5ed1

The constants used to compute x\_den are as follows:

- k\_(2,0) = 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaa63 * I
- k\_(2,1) = 0xc + 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaa9f * I

The constants used to compute y\_num are as follows:

- k\_(3,0) = 0x1530477c7ab4113b59a4c18b076d11930f7da5d4a07f649bf54439d87d27e500fc8c25ebf8c92f6812cfc71c71c6d706 + 0x1530477c7ab4113b59a4c18b076d11930f7da5d4a07f649bf54439d87d27e500fc8c25ebf8c92f6812cfc71c71c6d706 * I
- k\_(3,1) = 0x5c759507e8e333ebb5b7a9a47d7ed8532c52d39fd3a042a88b58423c50ae15d5c2638e343d9c71c6238aaaaaaaa97be * I
- k\_(3,2) = 0x11560bf17baa99bc32126fced787c88f984f87adf7ae0c7f9a208c6b4f20a4181472aaa9cb8d555526a9ffffffffc71c + 0x8ab05f8bdd54cde190937e76bc3e447cc27c3d6fbd7063fcd104635a790520c0a395554e5c6aaaa9354ffffffffe38f * I
- k\_(3,3) = 0x124c9ad43b6cf79bfbf7043de3811ad0761b0f37a1e26286b0e977c69aa274524e79097a56dc4bd9e1b371c71c718b10

The constants used to compute y\_den are as follows:

- k\_(4,0) = 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffa8fb + 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffa8fb * I
- k\_(4,1) = 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffa9d3 * I
- k\_(4,2) = 0x12 + 0x1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaa99 * I


# Cofactor Clearing for BLS12-381 G2 {#clear-cofactor-bls12381-g2}

For the pairing-friendly curve BLS12-381, whose parameters are defined in {{suites-bls12381-g2}},
there is an efficiently-computable endomorphism `psi` that allows for fast cofactor clearing:

~~~sage
# Constants:
# - c1 = Zp(1) / (1+I)^((p-1)/3)
# - c2 = Zp(1) / (1+I)^((p-1)/2)
# - c3 = Zp(2) / Zp(2)^((p-1)/3)

def frobenius(x):
	return x^p

def psi(P):
    P_x, P_y, P_z = P
	x = c1 * frobenius(P_x)
	y = c2 * frobenius(P_y)
	z = frobenius(P_z)
    return E2(x, y, z)

def psi2(P):
    # return psi(psi(P))
    P_x, P_y, P_z = P
    x = c3 * P_x
    y = -P_y
    z = P_z
    return E2(x, y, z)
~~~

In affine coordinates, one can just ignore the computations on `P_z`.
The cofactor clearing function, mapping points to G2, is:

~~~
def clear_cofactor_bls12381_g2(P):
    # h_eff = 3 * (x^2 - 1) * (E2.order() // r)
    # return h_eff * P
    t1 = x * P
    t2 = psi(P)
    return (psi2(2 * P)    # psi(psi(2*P))
            + x*(t1 + t2)  # psi(psi(2*P)) + x psi(P) + x^2 P
            - t1           # psi(psi(2*P)) + x psi(P) + (x^2-x) P +
            - t2           # psi(psi(2*P)) + (x-1) psi(P) + (x^2-x) P
            - P)           # psi(psi(2*P)) + (x-1) psi(P) + (x^2-x-1) P
~~~


# Sample Code {#samplecode}

This section gives sample implementations optimized for some of the
elliptic curves listed in {{suites}}.
Sample Sage {{SAGE}} code for each algorithm can also be found in the
draft repository {{hash2curve-repo}}.

## Interface and projective coordinate systems {#projective-coords}

The sample code in this section uses a different interface than
the mappings of {{mappings}}.
Specifically, each mapping function in this section has the following
signature:

~~~
    (xn, xd, yn, yd) = map_to_curve(u)
~~~

The resulting point (x, y) is given by (xn / xd, yn / yd).

The reason for this modified interface is that it enables further
optimizations when working with points in a projective coordinate
system.
This is desirable, for example, when the resulting point will be
immediately multiplied by a scalar, since most scalar multiplication
algorithms operate on projective points.

The following are two commonly used projective coordinate systems
and the corresponding conversions:

- A point (X, Y, Z) in homogeneous projective coordinates corresponds
  to the affine point (x, y) = (X / Z, Y / Z);
  the inverse conversion is given by (X, Y, Z) = (x, y, 1).
  To convert (xn, xd, yn, yd) to homogeneous projective coordinates,
  compute (X, Y, Z) = (xn * yd, yn * xd, xd * yd).

- A point (X', Y', Z') in Jacobian projective coordinates corresponds
  to the affine point (x, y) = (X' / Z'^2, Y' / Z'^3);
  the inverse conversion is given by (X', Y', Z') = (x, y, 1).
  To convert (xn, xd, yn, yd) to Jacobian projective coordinates,
  compute (X', Y', Z') = (xn * xd * yd^2, yn * yd^2 * xd^3, xd * yd).

## Simplified SWU for p = 3 (mod 4) {#sswu-map-to-3mod4}

The following is a straight-line implementation of the Simplified SWU
mapping that applies to any curve over GF(p) for p = 3 (mod 4).
This includes the ciphersuites for NIST curves P-256, P-384, and P-521 {{FIPS186-4}} given in {{suites}}.
It also includes the curves isogenous to secp256k1 ({{suites-secp256k1}}) and BLS12-381 G1 ({{suites-bls12381-g1}}).

The implementations for these curves differ only in the constants
and the base field.
The constant definitions below are given in terms of the parameters for the
Simplified SWU mapping; for parameter values for the curves listed above, see
{{suites-p256}} (P-256),
{{suites-p384}} (P-384),
{{suites-p521}} (P-521),
{{suites-secp256k1}} (E' isogenous to secp256k1), and
{{suites-bls12381-g1}} (E' isogenous to BLS12-381 G1).

~~~
map_to_curve_simple_swu_3mod4(u)

Input: u, an element of F.
Output: (xn, xd, yn, yd) such that (xn / xd, yn / yd) is a
        point on the target curve.

Constants: defined per curve; see above.
1.  c1 = (p - 3) / 4           # Integer arithmetic
2.  c2 = sqrt(-Z^3)

Steps:
1.  tv1 = u^2
2.  tv3 = Z * tv1
3.  tv2 = tv3^2
4.   xd = tv2 + tv3
5.  x1n = xd + 1
6.  x1n = x1n * B
7.   xd = -A * xd
8.   e1 = xd == 0
9.   xd = CMOV(xd, Z * A, e1)  # If xd == 0, set xd = Z * A
10. tv2 = xd^2
11. gxd = tv2 * xd             # gxd == xd^3
12. tv2 = A * tv2
13. gx1 = x1n^2
14. gx1 = gx1 + tv2            # x1n^2 + A * xd^2
15. gx1 = gx1 * x1n            # x1n^3 + A * x1n * xd^2
16. tv2 = B * gxd
17. gx1 = gx1 + tv2            # x1n^3 + A * x1n * xd^2 + B * xd^3
18. tv4 = gxd^2
19. tv2 = gx1 * gxd
20. tv4 = tv4 * tv2            # gx1 * gxd^3
21.  y1 = tv4^c1               # (gx1 * gxd^3)^((p - 3) / 4)
22.  y1 = y1 * tv2             # gx1 * gxd * (gx1 * gxd^3)^((p - 3) / 4)
23. x2n = tv3 * x1n            # x2 = x2n / xd = Z * u^2 * x1n / xd
24.  y2 = y1 * c2              # y2 = y1 * sqrt(-Z^3)
25.  y2 = y2 * tv1
26.  y2 = y2 * u
27. tv2 = y1^2
28. tv2 = tv2 * gxd
29.  e2 = tv2 == gx1
30.  xn = CMOV(x2n, x1n, e2)   # If e2, x = x1, else x = x2
31.   y = CMOV(y2, y1, e2)     # If e2, y = y1, else y = y2
32.  e3 = sgn0(u) == sgn0(y)   # Fix sign of y
33.   y = CMOV(-y, y, e3)
34. return (xn, xd, y, 1)
~~~

## curve25519 (Elligator 2) {#map-to-curve25519}

The following is a straight-line implementation of Elligator 2
for curve25519 {{RFC7748}} as specified in {{suites-25519}}.

~~~
map_to_curve_elligator2_curve25519(u)

Input: u, an element of F.
Output: (xn, xd, yn, yd) such that (xn / xd, yn / yd) is a
        point on curve25519.

Constants:
1. c1 = (p + 3) / 8           # Integer arithmetic
2. c2 = 2^c1
3. c3 = sqrt(-1)
4. c4 = (p - 5) / 8           # Integer arithmetic

Steps:
1.  tv1 = u^2
2.  tv1 = 2 * tv1
3.   xd = tv1 + 1             # Nonzero: -1 is square (mod p), tv1 is not
4.  x1n = -486662             # x1 = x1n / xd = -486662 / (1 + 2 * u^2)
5.  tv2 = xd^2
6.  gxd = tv2 * xd            # gxd = xd^3
7.  gx1 = 486662 * xd         # 486662 * xd
8.  gx1 = gx1 + x1n           # x1n + 486662 * xd
9.  gx1 = gx1 * x1n           # x1n^2 + 486662 * x1n * xd
10. gx1 = gx1 + tv2           # x1n^2 + 486662 * x1n * xd + xd^2
11. gx1 = gx1 * x1n           # x1n^3 + 486662 * x1n^2 * xd + x1n * xd^2
12. tv3 = gxd^2
13. tv2 = tv3^2               # gxd^4
14. tv3 = tv3 * gxd           # gxd^3
15. tv3 = tv3 * gx1           # gx1 * gxd^3
16. tv2 = tv2 * tv3           # gx1 * gxd^7
17. y11 = tv2^c4              # (gx1 * gxd^7)^((p - 5) / 8)
18. y11 = y11 * tv3           # gx1 * gxd^3 * (gx1 * gxd^7)^((p - 5) / 8)
19. y12 = y11 * c3
20. tv2 = y11^2
21. tv2 = tv2 * gxd
22.  e1 = tv2 == gx1
23.  y1 = CMOV(y12, y11, e1)  # If g(x1) is square, this is its sqrt
24. x2n = x1n * tv1           # x2 = x2n / xd = 2 * u^2 * x1n / xd
25. y21 = y11 * u
26. y21 = y21 * c2
27. y22 = y21 * c3
28. gx2 = gx1 * tv1           # g(x2) = gx2 / gxd = 2 * u^2 * g(x1)
29. tv2 = y21^2
30. tv2 = tv2 * gxd
31.  e2 = tv2 == gx2
32.  y2 = CMOV(y22, y21, e2)  # If g(x2) is square, this is its sqrt
33. tv2 = y1^2
34. tv2 = tv2 * gxd
35.  e3 = tv2 == gx1
36.  xn = CMOV(x2n, x1n, e3)  # If e3, x = x1, else x = x2
37.   y = CMOV(y2, y1, e3)    # If e3, y = y1, else y = y2
38.  e4 = sgn0(u) == sgn0(y)  # Fix sign of y
39.   y = CMOV(-y, y, e4)
40. return (xn, xd, y, 1)
~~~

## edwards25519 (Elligator 2) {#map-to-edwards25519}

The following is a straight-line implementation of Elligator 2
for edwards25519 {{RFC7748}} as specified in {{suites-25519}}.
The subroutine map\_to\_curve\_elligator2\_curve25519
is defined in {{map-to-curve25519}}.

~~~
map_to_curve_elligator2_edwards25519(u)

Input: u, an element of F.
Output: (xn, xd, yn, yd) such that (xn / xd, yn / yd) is a
        point on edwards25519.

Constants:
1. c1 = sqrt(-486664)    # sgn0(c1) MUST equal 0

Steps:
1.  (xMn, xMd, yMn, yMd) = map_to_curve_elligator2_curve25519(u)
2.  xn = xMn * yMd
3.  xn = xn * c1
4.  xd = xMd * yMn       # xn / xd = c1 * xM / yM
5.  yn = xMn - xMd
6.  yd = xMn + xMd       # (n / d - 1) / (n / d + 1) = (n - d) / (n + d)
7. tv1 = xd * yd
8.   e = tv1 == 0
9.  xn = CMOV(xn, 0, e)
10. xd = CMOV(xd, 1, e)
11. yn = CMOV(yn, 1, e)
12. yd = CMOV(yd, 1, e)
13. return (xn, xd, yn, yd)
~~~

## curve448 (Elligator 2) {#map-to-curve448}

The following is a straight-line implementation of Elligator 2
for curve448 {{RFC7748}} as specified in {{suites-448}}.

~~~
map_to_curve_elligator2_curve448(u)

Input: u, an element of F.
Output: (xn, xd, yn, yd) such that (xn / xd, yn / yd) is a
        point on curve448.

Constants:
1. c1 = (p - 3) / 4           # Integer arithmetic

Steps:
1.  tv1 = u^2
2.   e1 = tv1 == 1
3.  tv1 = CMOV(tv1, 0, e1)    # If Z * u^2 == -1, set tv1 = 0
4.   xd = 1 - tv1
5.  x1n = -156326
6.  tv2 = xd^2
7.  gxd = tv2 * xd            # gxd = xd^3
8.  gx1 = 156326 * xd         # 156326 * xd
9.  gx1 = gx1 + x1n           # x1n + 156326 * xd
10. gx1 = gx1 * x1n           # x1n^2 + 156326 * x1n * xd
11. gx1 = gx1 + tv2           # x1n^2 + 156326 * x1n * xd + xd^2
12. gx1 = gx1 * x1n           # x1n^3 + 156326 * x1n^2 * xd + x1n * xd^2
13. tv3 = gxd^2
14. tv2 = gx1 * gxd           # gx1 * gxd
15. tv3 = tv3 * tv2           # gx1 * gxd^3
16.  y1 = tv3^c1              # (gx1 * gxd^3)^((p - 3) / 4)
17.  y1 = y1 * tv2            # gx1 * gxd * (gx1 * gxd^3)^((p - 3) / 4)
18. x2n = -tv1 * x1n          # x2 = x2n / xd = -1 * u^2 * x1n / xd
19.  y2 = y1 * u
20.  y2 = CMOV(y2, 0, e1)
21. tv2 = y1^2
22. tv2 = tv2 * gxd
23.  e2 = tv2 == gx1
24.  xn = CMOV(x2n, x1n, e2)  # If e2, x = x1, else x = x2
25.   y = CMOV(y2, y1, e2)    # If e2, y = y1, else y = y2
26.  e3 = sgn0(u) == sgn0(y)  # Fix sign of y
27.   y = CMOV(-y, y, e3)
28. return (xn, xd, y, 1)
~~~

## edwards448 (Elligator 2) {#map-to-edwards448}

The following is a straight-line implementation of Elligator 2
for edwards448 {{RFC7748}} as specified in {{suites-448}}.
The subroutine map\_to\_curve\_elligator2\_curve448
is defined in {{map-to-curve448}}.

~~~
map_to_curve_elligator2_edwards448(u)

Input: u, an element of F.
Output: (xn, xd, yn, yd) such that (xn / xd, yn / yd) is a
        point on edwards448.

Steps:
1. (xn, xd, yn, yd) = map_to_curve_elligator2_curve448(u)
2.  xn2 = xn^2
3.  xd2 = xd^2
4.  xd4 = xd2^2
5.  yn2 = yn^2
6.  yd2 = yd^2
7.  xEn = xn2 - xd2
8.  tv2 = xEn - xd2
9.  xEn = xEn * xd2
10. xEn = xEn * yd
11. xEn = xEn * yn
12. xEn = xEn * 4
13. tv2 = tv2 * xn2
14. tv2 = tv2 * yd2
15. tv3 = 4 * yn2
16. tv1 = tv3 + yd2
17. tv1 = tv1 * xd4
18. xEd = tv1 + tv2
19. tv2 = tv2 * xn
20. tv4 = xn * xd4
21. yEn = tv3 - yd2
22. yEn = yEn * tv4
23. yEn = yEn - tv2
24. tv1 = xn2 + xd2
25. tv1 = tv1 * xd2
26. tv1 = tv1 * xd
27. tv1 = tv1 * yn2
28. tv1 = -2 * tv1
29. yEd = tv2 + tv1
30. tv4 = tv4 * yd2
31. yEd = yEd + tv4
32. tv1 = xEd * yEd
33.   e = tv1 == 0
34. xEn = CMOV(xEn, 0, e)
35. xEd = CMOV(xEd, 1, e)
36. yEn = CMOV(yEn, 1, e)
37. yEd = CMOV(yEd, 1, e)
38. return (xEn, xEd, yEn, yEd)
~~~

# Scripts for parameter generation {#paramgen}

This section gives Sage {{SAGE}} scripts used to generate parameters for the mappings of {{mappings}}.

## Finding Z for the Shallue and van de Woestijne map {#svdw-z-code}

The below function outputs an appropriate Z for the Shallue and van de Woestijne map ({{svdw}}).

~~~sage
# Arguments:
# - F, a field object, e.g., F = GF(2^521 - 1)
# - A and B, the coefficients of the curve equation y^2 = x^3 + A * x + B
def find_z_svdw(F, A, B):
    g = lambda x: F(x)^3 + F(A) * F(x) + F(B)
    h = lambda Z: -(F(3) * Z^2 + F(4) * A) / (F(4) * g(Z))
    ctr = F.gen()
    while True:
        for Z_cand in (F(ctr), F(-ctr)):
            if g(Z_cand) == F(0):
                # Criterion 1: g(Z) != 0 in F.
                continue
            if h(Z_cand) == F(0):
                # Criterion 2: -(3 * Z^2 + 4 * A) / (4 * g(Z)) != 0 in F.
                continue
            if not h(Z_cand).is_square():
                # Criterion 3: -(3 * Z^2 + 4 * A) / (4 * g(Z)) is square in F.
                continue
            if g(Z_cand).is_square() or g(-Z_cand / F(2)).is_square():
                # Criterion 4: At least one of g(Z) and g(-Z / 2) is square in F.
                return Z_cand
        ctr += 1
~~~

## Finding Z for Simplified SWU {#sswu-z-code}

The below function outputs an appropriate Z for the Simplified SWU map ({{simple-swu}}).

~~~sage
# Arguments:
# - F, a field object, e.g., F = GF(2^521 - 1)
# - A and B, the coefficients of the curve equation y^2 = x^3 + A * x + B
def find_z_sswu(F, A, B):
    R.<xx> = F[]                        # Polynomial ring over F
    g = xx^3 + F(A) * xx + F(B)         # y^2 = g(x) = x^3 + A * x + B
    ctr = F.gen()
    while True:
        for Z_cand in (F(ctr), F(-ctr)):
            if Z_cand.is_square():
                # Criterion 1: Z is non-square in F.
                continue
            if Z_cand == F(-1):
                # Criterion 2: Z != -1 in F.
                continue
            if not (g - Z_cand).is_irreducible():
                # Criterion 3: g(x) - Z is irreducible over F.
                continue
            if g(B / (Z_cand * A)).is_square():
                # Criterion 4: g(B / (Z * A)) is square in F.
                return Z_cand
        ctr += 1
~~~

## Finding Z for Elligator 2 {#elligator-z-code}

The below function outputs an appropriate Z for the Elligator 2 map ({{elligator2}}).

~~~sage
# Argument:
# - F, a field object, e.g., F = GF(2^255 - 19)
def find_z_ell2(F):
    ctr = F.gen()
    while True:
        for Z_cand in (F(ctr), F(-ctr)):
            if Z_cand.is_square():
                # Z must be a non-square in F.
                continue
            return Z_cand
        ctr += 1
~~~

# sqrt and is\_square functions {#appx-sqrt}

This section defines special-purpose sqrt functions for the three most common cases,
q = 3 (mod 4), q = 5 (mod 8), and q = 9 (mod 16),
plus a generic constant-time algorithm that works for any prime modulus.

In addition, it gives an optimized is\_square method for GF(p^2).

## q = 3 (mod 4) {#sqrt-3mod4}

~~~
sqrt_3mod4(x)

Parameters:
- F, a finite field of characteristic p and order q = p^m.

Input: x, an element of F.
Output: z, an element of F such that (z^2) == x, if x is square in F.

Constants:
1. c1 = (q + 1) / 4     # Integer arithmetic

Procedure:
1. return x^c1
~~~

## q = 5 (mod 8) {#sqrt-5mod8}

~~~
sqrt_5mod8(x)

Parameters:
- F, a finite field of characteristic p and order q = p^m.

Input: x, an element of F.
Output: z, an element of F such that (z^2) == x, if x is square in F.

Constants:
1. c1 = sqrt(-1) in F, i.e., (c1^2) == -1 in F
2. c2 = (q + 3) / 8     # Integer arithmetic

Procedure:
1. tv1 = x^c2
2. tv2 = tv1 * c1
3.   e = (tv1^2) == x
4.   z = CMOV(tv2, tv1, e)
5. return z
~~~

## q = 9 (mod 16) {#sqrt-9mod16}

~~~
sqrt_9mod16(x)

Parameters:
- F, a finite field of characteristic p and order q = p^m.

Input: x, an element of F.
Output: z, an element of F such that (z^2) == x, if x is square in F.

Constants:
1. c1 = sqrt(-1) in F, i.e., (c1^2) == -1 in F
2. c2 = sqrt(c1) in F, i.e., (c2^2) == c1 in F
3. c3 = sqrt(-c1) in F, i.e., (c3^2) == -c1 in F
4. c4 = (q + 7) / 16         # Integer arithmetic

Procedure:
1. tv1 = x^c4
2. tv2 = c1 * tv1
3. tv3 = c2 * tv1
4. tv4 = c3 * tv1
5.  e1 = (tv2^2) == x
6.  e2 = (tv3^2) == x
7. tv1 = CMOV(tv1, tv2, e1)  # Select tv2 if (tv2^2) == x
8. tv2 = CMOV(tv4, tv3, e2)  # Select tv3 if (tv3^2) == x
9.  e3 = (tv2^2) == x
10.  z = CMOV(tv1, tv2, e3)  # Select the sqrt from tv1 and tv2
11. return z
~~~

## Constant-time Tonelli-Shanks algorithm {#sqrt-ts}

This algorithm is a constant-time version of the classic Tonelli-Shanks algorithm
({{C93}}, Algorithm 1.5.1) due to Sean Bowe, Jack Grigg, and Eirik Ogilvie-Wigley {{jubjub-fq}},
adapted and optimized by Michael Scott.

This algorithm applies to GF(p) for any p.
Note, however, that the special-purpose algorithms given in the prior sections are
faster, when they apply.

~~~
sqrt_ts_ct(x)

Parameters:
- F, a finite field of characteristic p and order q = p^m.

Input x, an element of F.
Output: z, an element of F such that z^2 == x, if x is square in F.

Constants:
1. c1, the largest integer such that 2^c1 divides q - 1.
2. c2 = (q - 1) / (2^c1)        # Integer arithmetic
3. c3 = (c2 - 1) / 2            # Integer arithmetic
4. c4, a non-square value in F
5. c5 = c4^c2 in F

Procedure:
1.  z = x^c3
2.  t = z * z * x
3.  z = z * x
4.  b = t
5.  c = c5
6.  for i in (c1, c1 - 1, ..., 2):
7.      for j in (1, 2, ..., i - 2):
8.           b = b * b
9.      z = CMOV(z, z * c, b != 1)
10.     c = c * c
11.     t = CMOV(t, t * c, b != 1)
12.     b = t
13. return z
~~~

## is\_square for F = GF(p^2) {#appx-sqrt-issq}

The following is\_square method applies to any field F = GF(p^2)
with basis (1, I) represented as described in {{bg-curves}}, i.e.,
an element x = (x\_1, x\_2) = x\_1 + x\_2 * I.

Other optimizations of this type are possible in other even-order
extension fields; see {{AR13}}.

~~~
is_square(x)

Parameters:
- F, an extension field of characteristic p and order q = p^2
  with basis (1, I).

Input: x, an element of F.
Output: True if x is square in F, and False otherwise.

Constants:
1. c1 = (p - 1) / 2         # Integer arithmetic

Procedure:
1. tv1 = x_1^2
2. tv2 = I * x_2
3. tv2 = tv2^2
4. tv1 = tv1 - tv2
5. tv1 = tv1^c1
6.  e1 = tv1 != -1          # Note: -1 in F
7. return e1
~~~

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

## NIST P-256

### P256\_XMD:SHA-256\_SSWU\_RO\_

~~~
suite   = P256_XMD:SHA-256_SSWU_RO_
dst     = P256_XMD:SHA-256_SSWU_RO_TESTGEN

msg     =
P.x     = 8575f9b7010b101a3114486e51fc5b708f48ef7fa10aa00d834b15
          7574e11074
P.y     = e985633ce74378627e9a4295d2997c8ed959b67b6762fdea72aca9
          9343f3a949
u[0]    = 64d747d0cbe9e2c9ef0ff12bbeeac4744f37d76a9146ee2219d3df
          820e8452f8
u[1]    = d27ee4c85602a83dc321b36a183872dc484256a53ae2df3cf5e356
          1820a8685f
Q0.x    = 2ff87ed27a17062ad0721f97cadd2d0e54901745ca9101e324f746
          0d05f0571b
Q0.y    = 8185395060bf793fad9fbd39c264da5da111a86ec3cf3a116833c4
          9719039022
Q1.x    = 3c0ecdd0372e8e702bca9ec05282a8a016c41e4b1ac65ff76b4a61
          66b5ebd514
Q1.y    = 4f6af85bc6701e3a6b8c13bec0ce517478eae5abf5370ac81cec95
          d21dd588b3

msg     = abc
P.x     = 68d876b1f5f6419f73b94502a28c7aef3f2e8619f4dcdfd7a91b34
          f6e3fd8fc8
P.y     = 79a4f8914923b6e202b07b96b53b5bff92477cc5217dddd86226b7
          0610275059
u[0]    = 9807c1a5f0d51793429275edb22cd301b360f9ae11c3374f0e6146
          6165bf0b37
u[1]    = d7c39c44030d3f3fe2aa49f76a5d5c9bc91b078589d43e2cea8928
          de7652cd7a
Q0.x    = 3f0d3a7eb427097aebfc52ef7fa4250b6a6bfc581bedf7775f6880
          e66587cc26
Q0.y    = 47235d010aeea2c3e3d131577a3f3b3513e738790d03330dc88502
          c506e2d3ed
Q1.x    = fcded73f3d1f12feda61a1e64e6c79e00c0da1f1f164e290e34dc2
          60e09d028a
Q1.y    = d7d517e5e1eb3f813e0584d2d1d74f13ad44cf92f692b7021b1e0c
          ee9387b882

msg     = abcdef0123456789
P.x     = 710ecff129f51971437622b6c72a30d74d15894df3641c46bf0b0e
          d70bca7b6c
P.y     = b3b1632ef6b34114ad4d8f5bb3f7f7e3513a0c4514f7177632f097
          89db080b41
u[0]    = f2c09ac7340a2bb6b89a2be5868bc8ff8cd30375461426d46ff9d6
          bdb6245f99
u[1]    = c255967a8bb4d17edeba2affbce618b50cc8d77908657106c898f0
          dce498cfc7
Q0.x    = 2c295d2ae5520ccb41b441d5ddf3d8c39ced0140061e9c7d3058be
          2b91a30e2f
Q0.y    = 38b2974d4b008b586aeb030013281a36c4cd2c50f31ecd48b2b251
          be954b35bd
Q1.x    = 648dca4a2cdf36e139023937f826cfed14b5589f7176f0c19c6366
          d265aaa7fc
Q1.y    = acbf1559c9d8077b76f04a346cb512dace28ac1e890913ea0f8395
          c3b3aaf4a3

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = a5db1f4140a102d702214d59e05619dddeec05db546d35b35d03a2
          f0d47a1898
P.y     = 27c7d0fa5edae824efb39039205ace6fa6fdc4bf3633155bf6db01
          eca243c4ca
u[0]    = 62e9dd8c58bac00646d654c96a8083c9062d0b6c8a02059bd0384a
          f0e52a855f
u[1]    = b651df8d40fbb5d2ef0c5887dd5c82a5cc04ce07579907c66afb1c
          de2993da00
Q0.x    = 654b7b18a3ef2637585259d07c94391cc06048011ee07c8e0225b8
          19216701ed
Q0.y    = 0658146b06a4bdfa543ee347bc51980e12bee80a40ea22eaf0cba1
          34565f2f5b
Q1.x    = 2d148869fb30215e36d61d9abaac07e493eea6f1dfeffb89e326ac
          686de77efb
Q1.y    = c590a7d337c2cdd5cae6329f5eea563ebac10ea5da7fcc7bea9ef6
          1fc8dd749c
~~~

### P256\_XMD:SHA-256\_SSWU\_NU\_

~~~
suite   = P256_XMD:SHA-256_SSWU_NU_
dst     = P256_XMD:SHA-256_SSWU_NU_TESTGEN

msg     =
P.x     = 2063ed79bfbd8dcb7ee0ea2f3a0859490e314bc44c52818810e705
          0fc2fef9d2
P.y     = b1b8d127e418d55f3e24aff4dd3b93f87b0f9010b57750ae536436
          9a282b0c01
u[0]    = 8edbab803386a426e41ed452e269ecaf7963fcf2428572122fd806
          f8124a74c1
Q.x     = 2063ed79bfbd8dcb7ee0ea2f3a0859490e314bc44c52818810e705
          0fc2fef9d2
Q.y     = b1b8d127e418d55f3e24aff4dd3b93f87b0f9010b57750ae536436
          9a282b0c01

msg     = abc
P.x     = fa966fde8359c530de36964554878add0d66ab91a4941c778a6ca2
          ef940f51da
P.y     = a443c5d7acb4584c5482744d7c277c402f974ecb3c5a9e6cc32891
          a7d4395cc1
u[0]    = 5e62db94e1b65baef703b29e9ec76229d425ec11f68fd282665089
          2e94f41617
Q.x     = fa966fde8359c530de36964554878add0d66ab91a4941c778a6ca2
          ef940f51da
Q.y     = a443c5d7acb4584c5482744d7c277c402f974ecb3c5a9e6cc32891
          a7d4395cc1

msg     = abcdef0123456789
P.x     = 1f629999e7ae72560ef6753c174e59e8cbb8012dd19ab422e07c43
          8dcf50496c
P.y     = 307d198488b34f1c901b83e80eac513a91b2deb18723bb971adb7d
          ca8e3d406a
u[0]    = 2b65b29127cfcc0d932b0353989def6f9eff7d8fc439b24ba96a33
          16d5b9c51e
Q.x     = 1f629999e7ae72560ef6753c174e59e8cbb8012dd19ab422e07c43
          8dcf50496c
Q.y     = 307d198488b34f1c901b83e80eac513a91b2deb18723bb971adb7d
          ca8e3d406a

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 191231cd9517dfa132816a24860f55db605e4f5a190ffebf0b9bbb
          232fd5ae88
P.y     = f4aa03d54f7c2da1da7d597678825bc929d339d1c9bf43edfe1461
          b7c4862ce2
u[0]    = 0fb249d711473b504acf7a1e6a87e31d26f4a7aec11ff673e7ae3b
          80f421b958
Q.x     = 191231cd9517dfa132816a24860f55db605e4f5a190ffebf0b9bbb
          232fd5ae88
Q.y     = f4aa03d54f7c2da1da7d597678825bc929d339d1c9bf43edfe1461
          b7c4862ce2
~~~

### P256\_XMD:SHA-256\_SVDW\_RO\_

~~~
suite   = P256_XMD:SHA-256_SVDW_RO_
dst     = P256_XMD:SHA-256_SVDW_RO_TESTGEN

msg     =
P.x     = e588f8f8b27bc31add08582a9e582a78155799a16ee380ce1f13e8
          5e4bb149cc
P.y     = a3b1d90e477f50ce7b8e4a84eee48d133a0ffa52030fb9d3f57e5f
          1fe89fc42f
u[0]    = ec15c0491824d9846a638fb827a63ee921f9bc93c1ba53491354ca
          e7909625ad
u[1]    = c6a6e566680f9d346249644bb7d7c80043647c0c2c8c6ef04424e8
          fd0289578a
Q0.x    = b016e67640b890e19ed1961fc383924744c7a2a75cd7e2bb81009d
          b0fd19db2a
Q0.y    = 38acfcc7b59b060cbdabda5fd0de9e260f06d3fd77c34ee3bf2704
          9318db616d
Q1.x    = 3a74ee59421938c749dbd373c3b75e8bcc6e9514ecfb1cc31abfb7
          3cdfa00d5c
Q1.y    = fd16449915c9cdf34b42ce44b32167e3da957bf52ff34a0366f3d0
          729f447908

msg     = abc
P.x     = 05b9426f33b06d10dc91063f4ccdb46d72ea75d617907b476dde40
          25494acf20
P.y     = 535125b006b3c5dd38727cd9740dad2300fe5f0b1f951cee602ca2
          688c3d4a84
u[0]    = ea1cd7d1f59817c4714f3edca0c846f3f6c8efd72e5d3d29131145
          3af0a83a1a
u[1]    = 9a09c108e76a40352a56d49af20d8960f222c5933ef509b7fcc785
          df4644159d
Q0.x    = a2ea1a07417e4bdefaa437cf8f3de156a365afe9a810773b2de41e
          450ba335fb
Q0.y    = fae37243d761ce9f04210debb40753de7409f41e4522ba13df8cae
          4ebd738b12
Q1.x    = de2cc68b0637bbc4c2c2462b2a878636ae43c62a8867be7694f4d7
          22fda24fe8
Q1.y    = dfcefbf3127df772ee0bee040cea304da5a0eb9f9d1c1665e1f9bf
          560b60c797

msg     = abcdef0123456789
P.x     = 929e0db7c57e1a635bc6d72b4a073ed6a1472d0f9a00ebdc1e53ce
          ca97bfb965
P.y     = 16a0556054c6b1f2a947c13494cbfed68370864e05b53dcdc6cc70
          8798c4dea7
u[0]    = d9c9ece6f9561b3aca9348b378f420a893d0ffaf4ac691750d1a67
          581c396166
u[1]    = fc1152c1b6a74dcf471514e77a684bb864b03a5e1733f77f981daa
          e35c841ca3
Q0.x    = 60f1be2d2d881ed95b271719fca4699e4f78160c68939e2e225e58
          e4c0eadecd
Q0.y    = bde74f03c94f63723a96b41e77af588f9d9a7b8ab15b5524fd10d7
          eec7c2a62a
Q1.x    = 73abafebf24c5ac74dd5986fad52192b5286dab229a5e564c85d6e
          822482a84c
Q1.y    = 2041a8773b2fd0977d2be6b7d4b6ab8246edd20e0f701c4f0b0b7f
          6b0981b55d

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 59a2024d97262ea520a004f765e456340f2dfe1998b92eccc4c7a8
          a53e3e52da
P.y     = c1c81b00fb2495f9ab309cd7195bfdc3920fcef7b88fe6378e507a
          cf74b0f2df
u[0]    = 7b78a2106038ed4a4f753e654653902dd742f20b9d0a8d8fe135d7
          a913088555
u[1]    = 8f4a4ac7f5bd125988fd06b009ea6ccb604d113ec90e4e036bd75d
          75112a30e0
Q0.x    = a2d85aafeae2e7d3020c500792a367d7ea3c4aa545e41b8d3e564c
          dd6f65d263
Q0.y    = 83c1afe4d75821f2bf11ec4de4b4d4521c23063fa5e844f5d4bc35
          75a2000afb
Q1.x    = 0f6f15762d9fe5ae1e3f4a947b8472081a63a14d2c1c61b89e6ee7
          d0d3eb91e3
Q1.y    = 351d7c3f77ff7b54a31695b9f9eddd3e6704ef0f46541afd2ecc22
          2bfd117df0
~~~

### P256\_XMD:SHA-256\_SVDW\_NU\_

~~~
suite   = P256_XMD:SHA-256_SVDW_NU_
dst     = P256_XMD:SHA-256_SVDW_NU_TESTGEN

msg     =
P.x     = b9423285524c58ba246ee15051b0f733c0b6fcdfc1c35d3c8ed91f
          88aaf25295
P.y     = baa9f3cb38c5f5753147d1b5f69134db082f6f956c1fb4f6351bca
          df37dbf010
u[0]    = 692c69b60b94d805abbe8d842bbb11aa2ee8837eda4e55c308c542
          f05b32c7d8
Q.x     = b9423285524c58ba246ee15051b0f733c0b6fcdfc1c35d3c8ed91f
          88aaf25295
Q.y     = baa9f3cb38c5f5753147d1b5f69134db082f6f956c1fb4f6351bca
          df37dbf010

msg     = abc
P.x     = 0544b1108806636509e87247b8d2e310c80f707abeb8cada37a6b1
          316a744438
P.y     = d901c5f3dcb39028bbe16f047bf4ed1ca9fc487ea7f5df3534473b
          eb479de176
u[0]    = d65d2b55cb3f98ee6a0c76fc71295683f1e2059e30177f35872107
          9a3525f7c2
Q.x     = 0544b1108806636509e87247b8d2e310c80f707abeb8cada37a6b1
          316a744438
Q.y     = d901c5f3dcb39028bbe16f047bf4ed1ca9fc487ea7f5df3534473b
          eb479de176

msg     = abcdef0123456789
P.x     = 7dcb64eca5e99c0e37c8c3bc45e474024ac01b5a1813e4e2bc5ff3
          23cc1790a8
P.y     = 4b7bace437e9d02449219ab0b9d72b33cee06d6d4acefd6a371868
          3ceee0f654
u[0]    = 13094242936f400da03b5e0feadc87746880c8edeb3a2512a4d81d
          b0a0812c9c
Q.x     = 7dcb64eca5e99c0e37c8c3bc45e474024ac01b5a1813e4e2bc5ff3
          23cc1790a8
Q.y     = 4b7bace437e9d02449219ab0b9d72b33cee06d6d4acefd6a371868
          3ceee0f654

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 000455b8eec7b0c90718089b54d314e5db5376e266ed1b44a540b7
          33b2418f71
P.y     = 46780be39a0fe9abd61d20cfaf62fc14170a65df2004384f1895b1
          ca877e75f8
u[0]    = 0309c00ab87668277f40715c5b2ec71c411f42e51a94147b3816fa
          4b4a921182
Q.x     = 000455b8eec7b0c90718089b54d314e5db5376e266ed1b44a540b7
          33b2418f71
Q.y     = 46780be39a0fe9abd61d20cfaf62fc14170a65df2004384f1895b1
          ca877e75f8
~~~

## NIST P-384

### P384\_XMD:SHA-512\_SSWU\_RO\_

~~~
suite   = P384_XMD:SHA-512_SSWU_RO_
dst     = P384_XMD:SHA-512_SSWU_RO_TESTGEN

msg     =
P.x     = 2fc0b9efdd63a8e43b4db88dc12f03c798f6fd91bccac0c9096185
          4386e58fdc54fc2a01f0f358759054ce1f9b762025
P.y     = 949b936fabb72cdb02cd7980b86cb6a3adf286658e81301648851d
          b8a49d9bec00ccb57698d559fc5960fa5030a8e54b
u[0]    = ab14bc1f0c4b0cc898c34b728e751864c63fb5b6e5adb2f799ff17
          d97cf5a7d45fdb1346f1524990bebaf1674d747e52
u[1]    = 3ac15e88659dedbb85dad929a507aaf02772d1f34033d019db223f
          80a4e8e6c5904df4e7cfe849daee65525f981ab3ff
Q0.x    = bc9c19747b1b74aa23c6d39e6c07e5ae27c78be891817126ffe4f5
          c36d84cda2c48df2e5b02df15dee9771886023caca
Q0.y    = 7f42e75258a8e27d88dd6909bca0c4540df45dcfc818dcc9e9153f
          afba675a66ff152bcae4cf3731a318d22bceafbe7c
Q1.x    = 8c0b4ca5527116cd5b20c70f101be4b697a208c70c820e711de270
          6bd9f71d0abbc257d3aa8754a82e1c3b4dcd362b90
Q1.y    = c4d505548cabb89ceb75f357673e0a5f6f4b6a23bab2599638eede
          f5e482bd7572f68bda347675288e15011caab567af

msg     = abc
P.x     = 4f3338035391e8ce8ce40c974136f0edc97f392ffd44a643338741
          8ed1b8c2603487e1688ec151f048fbc6b2c138c92f
P.y     = 152b90aef6558be328a3168855fb1906452e7167b0f7c8a56ff9d4
          fa87d6fb522cdf8e409db54418b2c764fd26260757
u[0]    = 41f0534d80c825b0183b695adcad5b0c1384b13524fb2bea5b035f
          39ebc0fe06d789c1df0f01c73b51c8d97552eb11f6
u[1]    = e0163aa0e843052f7745ed697e13bb84cd9cbe1238ab1190439558
          abfc5453fcf8122e26bef442c76536eb98eb156bd8
Q0.x    = 6abb8382e51eb51dc2ea244c99e74c7feebf92543a0931d24dcba3
          af8ac464d9eef2c457c4de129dc8996f8dca20fa4a
Q0.y    = 2d846ed06515798e7c0c1bc004634faa2a67d66cfce8cf270933ef
          3277b2126b4743aa27c277547b41ae806b7bc969a0
Q1.x    = ec39d09f9da811a91359568ebaac56d7fa2c350ca71f0eb779ca82
          4972ebf87fd57c97fcf5ac2ddd43abcfd6447af7c3
Q1.y    = 89c7f276887a0aac50dbd5ae92378f232af0e3345b9d8bc15d8e54
          4be31982b7c4f87c06330913ba5201ea9d44d3022c

msg     = abcdef0123456789
P.x     = e9e5d7ac397e123d060ad44301cbc8eb972f6e64ebcff29dcc9b9a
          10357902aace2240c580fec85e5b427d98b4e80703
P.y     = 916cb8963521ad75105be43cc4148e5a5bbb4fcf107f1577e4f7fa
          3ca58cd786aa76890c8e687d2353393bc16c78ec4d
u[0]    = 265f32a0d11fdb82e900a6422109f8972cbf50cb39d179f63046ac
          98f6764d2b3cf9855410d03af9c613258dbb41287f
u[1]    = e6b037dc208159955014122754cf1fd9fab4a17ff1f6c10eb6ac13
          170a172c6a1142f19e00d248d9c9c419a37fc0418a
Q0.x    = f44d78de978e450d111612c589fce6a27a0036ffa6d21f46f287ba
          197572b3c12254df2baca2549e0f39a77528a838d4
Q0.y    = cc95a7be082257eb373903050fbe2cb0c78722388e0a3529416b58
          52ae7753865569977e9809cd7cf33cd2fb33baeb05
Q1.x    = 9e1a76bf4a72907173edc711c4f40ea7f8560bb646d3689ad00e56
          f08937a26e97b03fd2ae1724a5adef8f5390a0d998
Q1.y    = 7e4d9c09383276eeb2e1e109741722809c0906f9d33d9d6de5e729
          4146a7dd68f1f6bbae1efadfa208c5f16df0beeab4

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 41941db59a7b8b633bd5bfa462f1e29a9f18e5a341445d90fc6eb9
          37f2913224287b9dfb64742851f760eb14ca115ff9
P.y     = 1510e764f1be968d661b7aaecb26a6d38c98e5205ca150f0ae426d
          2c3983c68e3a9ffb283c6ae4891d891b5705500475
u[0]    = d734f57a2dd312a14fbc3b24e212cd2ea5fea1d112b33a6971f7a9
          a7f155733cd4d772a0b9da0eb55285474be2673457
u[1]    = b0acaaa63b9595ff20df1f998fd8a7fadb99848ed216e425cf6b30
          04f83e5526a8fb353e36e3e85501944aa6d971a384
Q0.x    = 66a61cb562094dd9b95b36f6d815edfc016505f8aacc9ec2e720a4
          3798337c04bba091f8c655d0b7566d44d2e13921ef
Q0.y    = 9c261e6b3033f8db5bc59e80e03c131c48486d4f20c14b45424213
          9829077749b2f1c402cc70a92f0d4ac0e20d3d88bf
Q1.x    = 4f6f2ee8f69a424ea27e60e01f080433794039ab1bfb1d0855c421
          507d5da32da993214b5859922e4f9d8c4bc9660296
Q1.y    = 3d64f2bb5f58267726f8800336f30f7158a35c4d9de9f007eb4c3e
          17fc2498cd3d1e1c591c366df7215ab12a63f8a4be
~~~

### P384\_XMD:SHA-512\_SSWU\_NU\_

~~~
suite   = P384_XMD:SHA-512_SSWU_NU_
dst     = P384_XMD:SHA-512_SSWU_NU_TESTGEN

msg     =
P.x     = 282c229de87de2ede60fadd3098b64e85d9b0c341a8e9222dd7af1
          f357b1df7197998dd4eb3a547248c97c714c1a0880
P.y     = 462ae18c61d23a72547879953ac451510328045322335d526107c7
          315d31ed3fbc5c896b15ec6dd7bc1e7f4a9ea4dd14
u[0]    = 10ed901f7dbe77bd3d90cec721c7c62c59060fae20b8307b78a51e
          0244c29c419b2ef552ae8dff9f5b118a0ed9f81fd4
Q.x     = 282c229de87de2ede60fadd3098b64e85d9b0c341a8e9222dd7af1
          f357b1df7197998dd4eb3a547248c97c714c1a0880
Q.y     = 462ae18c61d23a72547879953ac451510328045322335d526107c7
          315d31ed3fbc5c896b15ec6dd7bc1e7f4a9ea4dd14

msg     = abc
P.x     = 4f6228f8b3ff0e86957d74d6a2df00e24653148f6ac0360b28b796
          9702384868eaa308883806c150af66daa610e7d71b
P.y     = 5a0d9456eed2738378a98385af9b6a648d7a4b3ceba45420c729c3
          6800394b7f0efb6b02a76aba95ced61cf01314baa6
u[0]    = 0e510df813d72e87df593ef79d3757cf4880d850b974778d8a5493
          30af7ef94222da533dc6be80bb867f14d4e391cd2c
Q.x     = 4f6228f8b3ff0e86957d74d6a2df00e24653148f6ac0360b28b796
          9702384868eaa308883806c150af66daa610e7d71b
Q.y     = 5a0d9456eed2738378a98385af9b6a648d7a4b3ceba45420c729c3
          6800394b7f0efb6b02a76aba95ced61cf01314baa6

msg     = abcdef0123456789
P.x     = 5c9a982801f4d866d5c6d2843075685f18caf87a2907eca449dfaf
          ac57efbd54e6ff5a2864159f8e682eab389efcb135
P.y     = 2008b066577dab2fb24e4f5f979841f0d5088176300c7512098c8f
          dbe23aebc74d450582dd2945c6486697c5a46d2c77
u[0]    = ceaf515369a05d358855001d658fe13e3bdb237e1f6462c2220919
          ed061cdf20741d5b4f398600f237c1639a834469bb
Q.x     = 5c9a982801f4d866d5c6d2843075685f18caf87a2907eca449dfaf
          ac57efbd54e6ff5a2864159f8e682eab389efcb135
Q.y     = 2008b066577dab2fb24e4f5f979841f0d5088176300c7512098c8f
          dbe23aebc74d450582dd2945c6486697c5a46d2c77

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = c4a8232a094625182f606e885f289f5a30e7c59f2af317485517e6
          ca62369fc329d208efddb90e0c3c63c6eb9794afc3
P.y     = 9f99857a0027fd41b5d1a53c767eba450c95c9a8b2008a88f01d3e
          84b5cb6c9139596ca0a058a92c3edccb7a354d0c04
u[0]    = 1952efaf08b01749619b66d186453313a8c9802eca5f82428e0326
          359ceb09277bb300a9e3eef96a245441689eb9b7ae
Q.x     = c4a8232a094625182f606e885f289f5a30e7c59f2af317485517e6
          ca62369fc329d208efddb90e0c3c63c6eb9794afc3
Q.y     = 9f99857a0027fd41b5d1a53c767eba450c95c9a8b2008a88f01d3e
          84b5cb6c9139596ca0a058a92c3edccb7a354d0c04
~~~

### P384\_XMD:SHA-512\_SVDW\_RO\_

~~~
suite   = P384_XMD:SHA-512_SVDW_RO_
dst     = P384_XMD:SHA-512_SVDW_RO_TESTGEN

msg     =
P.x     = 3fd8cf53fd14ba7e185a3a1160789f4d38d32f1fe85cf5e0a03c72
          cd2380939202b3718628d85a8ccaa93a41aa636743
P.y     = 949c71aa985807aff4303459ae18b2c2714b04b48344d5ec6aefc7
          f4fc73a1f7be83f82b5b38ddb37b63a10836ed11ee
u[0]    = f226bf73a909851c20996f2561c3c5434a727bbcdc8d11d6601618
          24d636b34e2cab0a9edd470d1ebf512c3fd589e77a
u[1]    = 10f336e01b162e0f6c17fec01dfa409b3090fc5e96bf31fdcddacc
          b2a1a3a33c0e84c71f341d5ff7aa3945a934f5aeae
Q0.x    = 9f00baa27bbcec863af811a9d3eb074b981395cc012f219f17c152
          1d3db5b657500665df96977e676223ac1d27e861bd
Q0.y    = ce0f52132e3bb8ddbf895ff03bf3360abbfad127f4ae3641cac8c3
          ba2996413b86b36537902f5e3230e60e2cf26fc086
Q1.x    = 98d32c373d697b3ab9a426eb73822281e35ce995697b19a39310cf
          fc99c56382413176c9d5244ec8f6c33ad9ca539b21
Q1.y    = d42d7ce5eaf369b7583a8fa5bd492cffa6a1d7839caf526bd333ef
          f8b179462de3024c5ec00d87aaa3d7ddba7dff75f6

msg     = abc
P.x     = d0cbd41df03276c3676366fa53617c3a31909d427d56d0ff0eba83
          489c227895bd00c01d0132301ba9c47f264f33c7fa
P.y     = dc16ed4189e00ff325abd77ca388a41a9c35c7c5de536e0021b481
          59e4c54fe90665af0cd8c9768f7d485ade3ed16fcd
u[0]    = 73102b858bb7c267aacd0991d6d974fcef5b0a34a555986356a811
          9a8589e223246dffd1cf0e134a501a1f16e04ed5a2
u[1]    = f3f98bf0deaad74f8f34499c51164c78417128a5afe7360a8b7d86
          edeaa4f66cea62d6c5cc409fc609fafa2fd0a96bee
Q0.x    = 12cceb16291b89dc384ac78126dc0cdca0e14b5f197e5cdf4a7346
          3b56e94e92a7b7d85302844009ba3d1f1225624664
Q0.y    = 6e3d631e73c22b2e2cc3ae026754fb38d80076a92e20a7c4ad90a1
          10eb715abd07ea59ce27bf09b4a2aea487dfefa3c0
Q1.x    = b94c1c7bd6ade5cb3a8e816168285c556f85f58f59bbc9117ea6f5
          1ad713e82a54902ddeeb7e0aec1592ac6ba8366c44
Q1.y    = 03e6cef88080412b68e670448f4e23066d95a28438269dabb0f250
          8f715653aa626e77265f87a2ba130c3622f9ee91bc

msg     = abcdef0123456789
P.x     = 32f09527ae2ebe6d0b037d1169c75827e71a69b10b89a605b4ebb5
          aaf408d1d83151f4de783d5e7e3856a4f9085146bc
P.y     = 0278c6e9c9a76525b54792009da65c30ebf36251e40638f31be4ce
          5e0eeac22758a249de14e08f3199a231f5659f1e36
u[0]    = af10f3f11f7ff09e02834c9050eecb33ed1357bdfb7fed9ccca5f3
          705ce26a001af9b53e99a9afa495668eb07a8d4e5f
u[1]    = 4e8de300fb3cf4e2d50e07b81cdcf5115cad83a5345f2ed42236c3
          7b44fe5af86ed68976cf6a6e118634ac9020ec2ec9
Q0.x    = a0238661a4a72fcedd68d85848583f6f58197aca8b3f6ae6d4f96a
          6af917a4f5d31d8ecda8e5815c6165a86678492d12
Q0.y    = 4ae6669a00bcc9bdd393403d1d3931b3c0c32d52df0e446f43ac10
          b4e423df601cba755302f0210314ec1fc19c8a9aad
Q1.x    = 63d27039e6d9437ee12d330e157614422520169b64eddcde0e7700
          2a162125154328327057a916120d320cba6a13b561
Q1.y    = 2b82829a8bd6b9090695cd1d737e2ce731eef89f7d22d8905f26a6
          4f67a27f2df8e307eeb58ed0f77cfec265435a1409

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 46694a9417bd7d83b173e1b2e31c5888c4d4c31d4c4cec1cd97b99
          7223e56045437a734902ebf531f94f55ec6573f3e7
P.y     = a17f4ddabad1031c2097915b3355430ce6ecd7c29fa1de61428cb2
          cc95c9a27975ea3b80e4b19a47e0b109d4a07d7c06
u[0]    = 393a5f78effa24fbda9791791ae9aad75c4e9bddc07768fefe04df
          6947f3f5201f2dc695d01e204ca643104e2ce83ab6
u[1]    = 315a3ebdc59e7cca40de6c6e94f76bbd9bc96462481f5796b8ae4c
          a315d61ab3e9e5ed3bc0d115c17b488e4308b0f6b1
Q0.x    = d52401936488b9639ddc8f8e7100dd1f471b0364f8816b8d60952b
          e83686ff892fa4fc4cb6f79f184b5e48e84ce8947e
Q0.y    = 6238d99fb40417e0fdc0b21682d708eefa5323a358b4c1526e0d7f
          b01550a2c45666ec68777e834f06d84b5a42d0d48c
Q1.x    = 99ab0b8adb888b0df731bcb1c7873925e0e4ac52ffd5165ad91c54
          8d7bfa210b2a2acea9a80b51aa3b509c907ae5c2b3
Q1.y    = 781facfb166e147783f0d38372ae9250a88b73cd64f43a42a268e0
          9574721b337a6551c9f8a49fd16ccdbeaf80cf0ac1
~~~

### P384\_XMD:SHA-512\_SVDW\_NU\_

~~~
suite   = P384_XMD:SHA-512_SVDW_NU_
dst     = P384_XMD:SHA-512_SVDW_NU_TESTGEN

msg     =
P.x     = 5299e9a85487e4dec585e65e599404930a5da9bb066aa2dd113e85
          a1ad997c5c08fc608541061f625ced15c3bd1b664d
P.y     = bfaf66411a2c174ffec3fea29e5400746b02752825cb3f7e6d53fe
          785b163f97bd6fdf4651bd36dd495e8be1981e3a39
u[0]    = c71421fa6c7bb09dc9daaf386739c943b1fca1b9078aa45e9fb29b
          1abcff470e42eea415296ad5fedf2733a798aa5461
Q.x     = 5299e9a85487e4dec585e65e599404930a5da9bb066aa2dd113e85
          a1ad997c5c08fc608541061f625ced15c3bd1b664d
Q.y     = bfaf66411a2c174ffec3fea29e5400746b02752825cb3f7e6d53fe
          785b163f97bd6fdf4651bd36dd495e8be1981e3a39

msg     = abc
P.x     = d5202a7dee020f95018f1b9fe432eae0a78fbe790a06213062ba2d
          733d233687403ca1ae03e49921877bd87706aff4d9
P.y     = 20006950646d8eefaf1bf6c78d2d9a30a48a8a1f8def944146544d
          3aef6f1465b4bdc6d4a8c036990f72b8ec2f159023
u[0]    = 3ec8c4727f848b22e90089c39e2ec409299ec989c174432be7a9e3
          e9682298467d6e50fc4d5f08d9532d312305a2aabb
Q.x     = d5202a7dee020f95018f1b9fe432eae0a78fbe790a06213062ba2d
          733d233687403ca1ae03e49921877bd87706aff4d9
Q.y     = 20006950646d8eefaf1bf6c78d2d9a30a48a8a1f8def944146544d
          3aef6f1465b4bdc6d4a8c036990f72b8ec2f159023

msg     = abcdef0123456789
P.x     = 40dbd6b7a8e65b6765964fc16fa20b5354e940863a3e3c60b26e8e
          6a96357d4238ceab51997faf35d84a526e924b2c5b
P.y     = 544ed4cb206929743969f2b4f69d915584e242086d3a2bd764119c
          21c14725b3e5ee2a0f1f90ee82dd6bbe2d45b98a9f
u[0]    = 2417f204dcb6e4bf0cca697e68e871d6582344eec6c4ecce4f69f8
          3c54659572219d3a4d5a75829b4645fe8d0bacc85d
Q.x     = 40dbd6b7a8e65b6765964fc16fa20b5354e940863a3e3c60b26e8e
          6a96357d4238ceab51997faf35d84a526e924b2c5b
Q.y     = 544ed4cb206929743969f2b4f69d915584e242086d3a2bd764119c
          21c14725b3e5ee2a0f1f90ee82dd6bbe2d45b98a9f

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 005584e50067c6993ebea12981462c8831a763b7fec6b23b52baff
          61ced7ce27105ab8713dddbe4b00b49e23cf4c3920
P.y     = 5522630c99b8e7bf21144cb3e733ab6df1c992af8c3ffb7dfbc659
          32969b9190b2b95086083ac20912557f8f04e028e5
u[0]    = 325f4ed2b0ec0748bf6bd02d214bd208f261ebf3eb9c4a7cc11469
          a514b53c159601eb5251fffbe0382055b415456fdb
Q.x     = 005584e50067c6993ebea12981462c8831a763b7fec6b23b52baff
          61ced7ce27105ab8713dddbe4b00b49e23cf4c3920
Q.y     = 5522630c99b8e7bf21144cb3e733ab6df1c992af8c3ffb7dfbc659
          32969b9190b2b95086083ac20912557f8f04e028e5
~~~

## NIST P-521

### P521\_XMD:SHA-512\_SSWU\_RO\_

~~~
suite   = P521_XMD:SHA-512_SSWU_RO_
dst     = P521_XMD:SHA-512_SSWU_RO_TESTGEN

msg     =
P.x     = 0166100dc2ad2cec97ead596df90abaa15ba8a5c9c03d2012bb041
          ed132c48f64c515ff13ed9d14b683d974f709362eae6b92e721854
          8dbfb09aff52270fcecb5bf0
P.y     = 016493756e8a23aa3407a0a9a770b35d2d683561242a6d5c63c3c1
          69b1e818065847bfb2a505b2a539b02860c167a4b28784104c291d
          5eb1f3fc8d4853f8e8acd3e3
u[0]    = 010e5ea14104e9c8131132cee0f72c8d4d0bc31dd8a99e3e5645ba
          3472534e2f08386312a2392843a5b884a4b85aecdc54def9058c96
          9e235cc2967f3d336d80ca76
u[1]    = 01713a5efd96ea7f80b57d1fef8a69eb4507eb9f2cb395c62603bd
          77ba920a5dcf41d85b996ce29251d81d43d5cb5b284600af9eb821
          3ac51ca85c1924826658cf45
Q0.x    = 00b5115da091422f4a7a8c8d54843a77d2780605c7a26d9a066229
          8a00c0a4866e6d85f240630a4edd683e7e8900103911bad401c620
          ed30caf3bef813a7807fc6f1
Q0.y    = 005b9bb84ab6355bf85d697b383bb4fd2b7d909a1caa2fc738e71d
          14f8cb5f32eef9175aaa1141f6341021500db88c7ba8b6cae43a4f
          7dd8b6e99acae1129afbeac2
Q1.x    = 00717f86e20a1a98fffbf07ade7dc8700b41ce14c99aa5522d7741
          fa787173f883bdd102830e4fa49d61c720a2d3f040db582a66d81e
          596b40c2337cd4ad0a44a571
Q1.y    = 00762f528b67ce465c5d859bbb937a079fed0a2aceefb50e12adb3
          8936f0990b2af5e401c576dfd0ac4d8ffea03e7d2001292cafc7e2
          d70d6328fb878eb23fd5b70d

msg     = abc
P.x     = 006b5ec5d1f0c288820e445db334b69e981eec24afa7c7766fc6c7
          ad0a542f9636a4a71193dd6933ff2d8855758d9d10fcf741bdc90c
          7c0dd5a79da1e9da3fdbcad6
P.y     = 01b6f2c5966f062c56e0c37d3aaa376382126e88824a51d7630cc1
          a20f05249154780712bb02b41cd65e6a025dc80b1733844a27435f
          1c411ef54348377728fd0894
u[0]    = 0090741de9fadae835269c94fea621135c52326c345de28a949436
          6287edea90c7413314868fc54ea8d768d41692bd43c0f93b68c348
          06e8f96cd83099e233f239b9
u[1]    = 001920f4589764ac37fbba8edfe78274e4c8e2131ecf6fd8ddcb45
          e60467bd5edc3057eb77d47fd0f5bdb8add161781c8f60903bfad0
          e6656f1cb8af93930f68e0e5
Q0.x    = 019391de3ecf6fa9d5209586a14046507e0dfc312792d3c3aacba1
          af68b72acffa02314171b8c16017c2a1d47ab71a34b933d42c84cb
          ed89d4b8e045734bb7940b62
Q0.y    = 01ce51d5baf369ec174bd7e2f85b86d0a71753031ff9f9d5cab60a
          e95eb971c9b51d155ac3a59710a360efa5ba9be6ff524e973e086b
          020c09f4773727a5655f855f
Q1.x    = 01ce2f3d98fa797efe58e532107fffee30dd625decb6c5d29d815b
          2904b063bd995eadd40e4b15f8a3d539e75b1dde395ed66f77eee1
          0b1772f36349eb9e7fe621a7
Q1.y    = 01d384b830286c8381dda7a96f9d283a3d120d954dba779879fbb1
          cbc803ff4a68df317bb21253a8ed38f8d11cee5b8927eb6d23716e
          6a9f8834649ed86964dcdbd5

msg     = abcdef0123456789
P.x     = 0134366f8427cbf666a9b5fba8f7a21f051a7a6db3a6a10df6c0a6
          98c88fb046a1fb6ff7da518c6bb0efb03807b05ac101f924ebb6b4
          9d23e79ee558f8f19a6cfb77
P.y     = 005a5bd658093a3d191522e2e8038af55b06b227c52db010b00ccc
          13b44c037a5bc28c9797b02c564abec0e24935877da38c5ec9e1f8
          6315b6c05ca01a106d236d4d
u[0]    = 00fd9508c3296aeb92cf1157ef9702ab04e510d8096bb635e64f7c
          ec5aa9a3d82ea26fc2c2ec7642d483abdd1f4c728fe7c9ff82bcee
          c26d2ee97758919bccde18d8
u[1]    = 006a8c5339232bc71a8bd26b9e76fcffce954bad5ac9aab5e6f645
          bd06339fa99eaffd29e5057c92231d6ad319de1057500d6a2d0967
          f607fca3fd82229e28762070
Q0.x    = 00fdd7ae4e327f7a5a848550ee0537627df17e40950be429375ff6
          3c6a24e0563d20d4f71d3191b6d1b9e2c7c32685311a722b8be614
          46488e72d198a64e3650da9f
Q0.y    = 01cbad24b0776c42f4f77335802dd9e6a6f7193d478479775e0e03
          cb5ebac88d0d757ab21689ec21d6e7b537da8e9347d404de86dd58
          0e8d2576b2bd2845134b2b7e
Q1.x    = 014554894976d7f287f89e24a7b1e825f510f00c6b72ef44a78bf6
          86034029752a30bc5c0346053b2038e2cf758ba882e01e81b25315
          27bc63ccca0b31149227316f
Q1.y    = 017c426709039af9e746d8495e5eb60a0da18a759f707827f9e63f
          a301af072abc7d42ce1a288a3b54b8762f80dda65a5820d1feeaa7
          9e5108fedebdd05ae63653a6

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 010b3e43adfcc4fcacc7d156ec13f17c245ef3f529fdf546d59208
          715b93f54ef9e6bb6861c333aa5b942010be9116e2fae46f8d4cfc
          2915e64ef601652f547957d7
P.y     = 01f2d170357e6ed27bd98737d55c0e4e6f683cf07d455b755d5390
          91ca8f7b62a980288076c885561614bc24212e9b3d2159c0a53840
          d56662dd899e7d63b2a0a38c
u[0]    = 0095feddbee4fed67006e3e1f54fc52c8d52475452ec3d99620720
          9a666705b61596f8e9cfcfad5e8aad230b58d167241b6637a9e2f5
          f9f56d177627226b3ac92d7c
u[1]    = 01defe27307147462df62f89c7eda3d9a10f02c7df349291428d13
          decac80085ecd9b0ae5d831f9703d338ce3bc013f502f2baa0e407
          76f376c4e7ce91ced69d5df6
Q0.x    = 009bf512a76069d55bff75ac89d5cf5ea860d6f56aa7b0f6b3c53a
          e0195a8c7d044bfb3abb55d7cf6c8bdf62d4e7576db347ec9acca8
          075de98a0c8ef5c367f5dd34
Q0.y    = 0178a1a7ee092199563b8c1b43438a9bd699c18d60ee51d0ac25b3
          22c8184d9a3d98856507d8f7ae67fd8c06c509a406a7f04406e826
          57570904339f8a8cc5eb5340
Q1.x    = 0099da46971d84a3cc455aa21af209438fe8822517dc1edd2c61e9
          8b1511020943a393a8f519c85e13f430d4d6ab7f4e8e2ddb2a7eb1
          d500518ea9c7ac1d8ab149f3
Q1.y    = 01b751e0ad5f5290df8ab1d7a9449cfa8b9506701805302f9b6e23
          3f88c2a1bd36bcd488445e57f51f533f9ebbf9515844f103d0c23e
          a8846909ebd579c58a5e5456
~~~

### P521\_XMD:SHA-512\_SSWU\_NU\_

~~~
suite   = P521_XMD:SHA-512_SSWU_NU_
dst     = P521_XMD:SHA-512_SSWU_NU_TESTGEN

msg     =
P.x     = 005020b4c6fe78753a99a853267303a7e42b1fde326f4c856ce116
          1cf26ee9fc9bb2475515e9699f16c8bdbe121c75020f4fb42905b6
          4d9251f5dd5df052220d31bb
P.y     = 008a209c602896b2dfe110faae2c8ac602510846ef550ac2151a73
          47ee2101549010e1b42c0ab25a59e0bcec505c146e60c35090cdb3
          9860a2fc281d32116523e4e0
u[0]    = 006268910c2fc4d0ac8f684e7c144b4be932cb37574aac4e18d43d
          a99b7c700ba51832fe63f482b7a5277f67dc2b246dc132701bc533
          86b7a2d602c0fd5b5f1970ac
Q.x     = 005020b4c6fe78753a99a853267303a7e42b1fde326f4c856ce116
          1cf26ee9fc9bb2475515e9699f16c8bdbe121c75020f4fb42905b6
          4d9251f5dd5df052220d31bb
Q.y     = 008a209c602896b2dfe110faae2c8ac602510846ef550ac2151a73
          47ee2101549010e1b42c0ab25a59e0bcec505c146e60c35090cdb3
          9860a2fc281d32116523e4e0

msg     = abc
P.x     = 00bf1236559c8187d4b09d61a9262386f0ff767b232ca688ac26ae
          35151ea1b4ad692cef512169187b32a902e33ff5afc5696f10dd51
          e27830a2d71d1d282df1cd48
P.y     = 01817df06a92dc15dd5b31182a53993cdbe177453da9ae53f5ba97
          db0f2311e2b3784dd4b56216d86558ff19aa45dccd04f85e089159
          e0bee0ff17d29a344cc56e5d
u[0]    = 01a97d3de4a4a0df813d6bce7b02adadb824d11a49b8622ec8cd13
          d7c0c77bbbb590308abc2fe6a803b7f2be1508f017e61322785cb2
          939cd5d6db54c12644431b25
Q.x     = 00bf1236559c8187d4b09d61a9262386f0ff767b232ca688ac26ae
          35151ea1b4ad692cef512169187b32a902e33ff5afc5696f10dd51
          e27830a2d71d1d282df1cd48
Q.y     = 01817df06a92dc15dd5b31182a53993cdbe177453da9ae53f5ba97
          db0f2311e2b3784dd4b56216d86558ff19aa45dccd04f85e089159
          e0bee0ff17d29a344cc56e5d

msg     = abcdef0123456789
P.x     = 0097d312bfb4363155e4547400195e0f53c2e2257529c250698026
          e07957e33d50d23dcf16229ff840d19bc048382aa6b9c2e164eb65
          15d780a13241dd5022eefbcc
P.y     = 01354f9874d25347f1d4c1afc094feb4d1bacce49943a45f1e97ee
          24482cf70a405bc4c20624da0a81f1079dbef75afb3ab9187b7def
          9bd15ed9f093e6e3e5a1861e
u[0]    = 01178ad77cace46d9e30ff3642d178d32be517d6cf2ccd0ad78d7f
          172c4c133bb900eec72c3ffc58baea56e13d10b97177d20f30528d
          7509803f084adddb2713ed62
Q.x     = 0097d312bfb4363155e4547400195e0f53c2e2257529c250698026
          e07957e33d50d23dcf16229ff840d19bc048382aa6b9c2e164eb65
          15d780a13241dd5022eefbcc
Q.y     = 01354f9874d25347f1d4c1afc094feb4d1bacce49943a45f1e97ee
          24482cf70a405bc4c20624da0a81f1079dbef75afb3ab9187b7def
          9bd15ed9f093e6e3e5a1861e

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 00c7604e04b98993845e36a3793eb6c16068bb5e2e465f5cda4d9d
          3f61499ee549c82c3e73f44fdd8715a0c53f027bba6755e48577a7
          5b7b4f5b5ca38d7cde14ce8a
P.y     = 00015254aa92f6134f17309e628a73b96befa04e2410fe7a951fe2
          6ecfa81281a0e12cc92b170f61d893f8ac1c70b3af10320db3ab05
          3d9272df25455768a8648739
u[0]    = 002e6c37d500a673a816f0bf08e5f448132fcc3aaf1ba11e2ddc51
          0663f5b85b08b82254766edfe15ffb0a1ddb725237811555f5b253
          877d048d087189ff9ed45399
Q.x     = 00c7604e04b98993845e36a3793eb6c16068bb5e2e465f5cda4d9d
          3f61499ee549c82c3e73f44fdd8715a0c53f027bba6755e48577a7
          5b7b4f5b5ca38d7cde14ce8a
Q.y     = 00015254aa92f6134f17309e628a73b96befa04e2410fe7a951fe2
          6ecfa81281a0e12cc92b170f61d893f8ac1c70b3af10320db3ab05
          3d9272df25455768a8648739
~~~

### P521\_XMD:SHA-512\_SVDW\_RO\_

~~~
suite   = P521_XMD:SHA-512_SVDW_RO_
dst     = P521_XMD:SHA-512_SVDW_RO_TESTGEN

msg     =
P.x     = 001b358dd6be71bbc5a5640ddf744fec2136f8d97f61318ebb0310
          9bb48dd25d06767d325b89d1f35d2b8c8ec82f7ff9b456c4db4391
          f7c84e02a0839fb36019b2eb
P.y     = 015ba4aaa8a161f706daefe9f7e8ed6873c43010d6e9282345a26b
          8e59da88c39bb68bfc45eb6f5df22bd45a6d79b14d759762243e20
          a55d23b2e31d58ddd366ca04
u[0]    = 00976e43b87046a6226bf27f9484b05379fce54f244e3f09270387
          9849e83da3eb14b065face4ff96f9111ad99834c1fe679affccbf7
          43c9355fbf3bf4da4a9d39d3
u[1]    = 00002cbb5fa77d2a9bd7bdf0c18625f0785c870429ee5595b6b92d
          d14653a90b127d325abd28e8a519b9045abab5d9dd9b3ac65978a1
          928a43427b15bb7dc41dca3a
Q0.x    = 01690f1819dce521688f0e06c8ee1af9fd75084245f6dc677e50ed
          b337f39d8b0122bb263dbd6061191f72291fb9bef897b3428f0cfa
          956037af885bb589a79005d0
Q0.y    = 00fe665f9e745ae89fd6193d8d8b8c98afeb33c59951d0b59db074
          c2d27dd127aea2e51bb02e0a9def961e9c7de8394aec3a5e09c0ad
          d0ad37dcb23c81323181f837
Q1.x    = 0005a11909eedba17d2af5187c07ddc3845c5b0e669f1552bc2b35
          e6bb8250de7a3db60c5e09bafd08c03a3089b392f4eef3b2b6fb39
          54714556a5d376000b24671d
Q1.y    = 0103620e73bdad41912775c72f2e4635b3a3167e6f60c517b118ad
          67d9543a73377fbc0c59b31e8e7e41840480b3b0efc704315f518b
          2edb6a9ee9a083ccb8044284

msg     = abc
P.x     = 010f318ade420723b9f06181146163fef880c9091b8c26e9c19309
          a956b1f389403f04500d9384a74939daa28fe61c377acf87c2a3cb
          2f25a696721beecb68c4b1ba
P.y     = 009895b5fef08da287f7b5e32fe28f76a2a33300380c842f716c2e
          119be91dacfd9dc135172a3ecee631891253e5be7c182c4edef017
          c768455f001e8aec2ed59fb7
u[0]    = 00e9b8c49c91527a634f89148fad0f10ef11885f770c239051b4c4
          e66ae1e799bbab1a92311a0756fc3152af9cedebda7e638262edb1
          7379338f90777ab5a274defd
u[1]    = 00753fbc9bb128c2a3641ead57fc9a55f639f879b787097d1b87de
          954d942a3532d7d0b073734e4ccfb77d4068a598889d53781a68f3
          deecd98113cb10241540adfa
Q0.x    = 0158c0d51ec72be7619a4bf144fde6b0449f33c824be437b56de2f
          e259d6a2dfba93a66398c8c5cf3d0129813107ec7f52661dba9d9f
          f2d6364e72dac5760d509659
Q0.y    = 00cbfacf0e949cbb5c433cfe21959e4a23c33c03acec3e500df8f6
          9ba8baa5e868a4355e053d34c3ebe99c96c4f127efa4b7a7cbc0f9
          a143a0cac99e6799c4e1dcc1
Q1.x    = 01dd1a8502d05dd0368265ca3a9ff4cd400e447825aae741f4de70
          a1ac470cee35b9e359e713320ca11d542dbe8561b100bef038c23c
          4a57f6f4c1e7d42c3f0276d8
Q1.y    = 010284bc1b4def1ffa34e5e430c59eb6aada3c48e1d37d7c2f48af
          159b4a55c2b484fb2bedcba7629340ff756aee16c8e6ee5b165b51
          bbc9c3aca95e06008312345c

msg     = abcdef0123456789
P.x     = 01773d17192bbe06796b9484447a5b324bb12075cab82319ee18ab
          16fedf170ca5dfb464b42b30d7dd2642a75abad7ce8991675896c7
          31ffede8a6849f737d68a3b1
P.y     = 012ed184f2435c9dd460c9baac96634289ead0115be259f0fbb00a
          18ea89a0986b02d596a1a43c51aa7c725cda2d2d7dcd54128db2a2
          2abf9818c5f28b8ec1057e9f
u[0]    = 00e62051dce9c57c9a975601565c2ec77e1af782ef222174c38ada
          56dc243b6ac1c92380531191098c2575d4d9695a2e04b22abda84b
          e6b6555dce4f49ad68ef6afc
u[1]    = 003d49673bf7cd315eed6f7d94a528fac54b859907814fb3cb8cec
          7002e6ab13b78757d726df4468bec668821ad3c03b63a7868159e3
          df4664e98e3612fe063c9109
Q0.x    = 00aab70c85c9028c4feac24296f0db84765e2b107750e2af4585a5
          6964a30f38c9caf94afabb13ebfa5dc6a494944ceda8338496cb3f
          32ad760e3403766b658c30a5
Q0.y    = 000054e3565665d526e118ea49e9af161814bd4763cb2667b1fb95
          c1de9833c9d2e807d10a88376253fc66da662f519fb769a8d17eaf
          8ad7c849ac244efa09fa5694
Q1.x    = 01cdeac9d978a98b7c909d8e3c254fcbd698baf778c3c3ef2706bf
          e3ea5b5d1df830ad97ba131048c76b0846f0122ae30b1ecc57031f
          8b2242b608139b744c71b248
Q1.y    = 01e08609e6994892ac6631358e39c997198f7cb3441368607c6e8e
          055de4ca4f151bd796808c8e6b3ea2ab1fd8a9e56fb3fbf14598a0
          09cfbe8851904c9dd194114b

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 0009b40a64948c9fddaedf1cde72ca2f86f7cf747c9ff2a77650bb
          9064371731acf7fb037c97411664be8c96299159e41d144b5f7a67
          cf39dbc7a7cfedb4f709ede2
P.y     = 00fb1506656904dbed1063e820b2ac98e99f59466a3ff8321026cd
          b4421cec0dc54b91038da291e59e67ae9563cd1d3ec83ebeca6bd4
          232b41c3d6485f92a45b1b1e
u[0]    = 01fb0e852af9b8c96e2dc4ad8063f2644ff88706ea35df2bc3b93e
          341c3be8fa688f9b80191642a1a5f945623252b6c3707715fa43b8
          a84c231a9b3435552ccd1b1e
u[1]    = 013647b9b1630cc0f4a54c8970fda6409de54c5607d7a5abee5c1e
          fffa4959ef626d750ce60f5f0e9bfa20b25942b152d916fc4306f9
          cffed3cd6f4ea54889fd0425
Q0.x    = 0050f6c282bd6d648eda9056be0182ac00b31144f00276224e67e0
          f529291f9ed1ba5294cf91bd57cad6c1843bf5d77383ed583900f7
          6e42cc2b7ecb022630f85310
Q0.y    = 0073e27ea277c01305df719afa20ad031b001515a19458cba172d6
          86a6c435dc831f3c3bcaad042f5e64bf0b9ef54e48d20891188fbc
          30a6da7d7e80fe2f023f51d4
Q1.x    = 0003eac94fefa720fa3155ad3471d7dfac5693924307c3e766babf
          6752f4bf6c6d4acc8e46bdcceb017e2148d72709dc1cd008acbeca
          603e9378bd91f52e1650a38f
Q1.y    = 01fd0f8b8b2f061a86fd3f6470e974b832d0a7077fa2e3389877f5
          2a15c1ebe45e8f11a1e74c2341ee7bddef2880b29f5a560ebf3841
          4ffe26dc9d13bf9f3cc05bff
~~~

### P521\_XMD:SHA-512\_SVDW\_NU\_

~~~
suite   = P521_XMD:SHA-512_SVDW_NU_
dst     = P521_XMD:SHA-512_SVDW_NU_TESTGEN

msg     =
P.x     = 015020ea6e23e8425a7373be44c7a1c4b6424a13460424182af9be
          89a900a2e8a1c6e3ebb848db5d75b811d786d1ff685addbdbfe36e
          871b71d5f85b907a8b6d31af
P.y     = 006d8dc6f7ea8e505a79e93fd13cd09adbf9fb67ea01e510e88928
          28a0a6f1b8e5ed0091a21030f6e038103083ad56272b58dad7ddb2
          bbf08b4baf105ecd260d25b9
u[0]    = 0117da677908fe4dc21de34eec4ff5da38aa8e8c0e38e1b7191bba
          ef491917a643d80e73ebd63941c5fdff56c1790e9241e711db3e72
          eb6bc24326780d384c8dc3ef
Q.x     = 015020ea6e23e8425a7373be44c7a1c4b6424a13460424182af9be
          89a900a2e8a1c6e3ebb848db5d75b811d786d1ff685addbdbfe36e
          871b71d5f85b907a8b6d31af
Q.y     = 006d8dc6f7ea8e505a79e93fd13cd09adbf9fb67ea01e510e88928
          28a0a6f1b8e5ed0091a21030f6e038103083ad56272b58dad7ddb2
          bbf08b4baf105ecd260d25b9

msg     = abc
P.x     = 00f32104739ca325f28d5976407c24eee98aa2a53d0c02fc180db8
          43064c262d034b9001670492a58e2c707b94db43e366b97bb516c7
          d448fbb9027f1cf3aaefc6ef
P.y     = 0174ed6990e6c968bbcd28bf7437fb0dc529f2f34b1293b6b26ac8
          3e1bed7bddd968098e5ad469027131933e190cd4e0c88eac820f1b
          d776c71a7343b1073da04217
u[0]    = 01b81e9fcaa8a24957c63df909062338b63360e5b3b655631f00bf
          7c1809d6e1536389807d06e78ee7cf8ab6713860a6884310e4baee
          ce4d76e50deac92c3f86f65b
Q.x     = 00f32104739ca325f28d5976407c24eee98aa2a53d0c02fc180db8
          43064c262d034b9001670492a58e2c707b94db43e366b97bb516c7
          d448fbb9027f1cf3aaefc6ef
Q.y     = 0174ed6990e6c968bbcd28bf7437fb0dc529f2f34b1293b6b26ac8
          3e1bed7bddd968098e5ad469027131933e190cd4e0c88eac820f1b
          d776c71a7343b1073da04217

msg     = abcdef0123456789
P.x     = 015717eaf459548242d80685d356a35e0943f9d6a2aa6670ef797f
          8da91803ba1689c5e9954ec564c6102cfacc1bf1ad3d8f0718675c
          f2a8b7742612ee1f42de6cba
P.y     = 017353e0376234a4820a69bd236d764b3a693e0c1a66495cafa188
          cc5cd3fca2d47b0c6467198a8fafa78e6d182f5f4ae423068bb799
          ed7b221f053e8c9dbc114636
u[0]    = 01edf847e7cd8da37c0fa71995c9f619906fbd794f3c650e456cfe
          4ec43408541dc094d009d9126218430a2252ef5fdbfc5697e5501e
          43ffd08fee3335011e1e815a
Q.x     = 015717eaf459548242d80685d356a35e0943f9d6a2aa6670ef797f
          8da91803ba1689c5e9954ec564c6102cfacc1bf1ad3d8f0718675c
          f2a8b7742612ee1f42de6cba
Q.y     = 017353e0376234a4820a69bd236d764b3a693e0c1a66495cafa188
          cc5cd3fca2d47b0c6467198a8fafa78e6d182f5f4ae423068bb799
          ed7b221f053e8c9dbc114636

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 0086df207676e070a3e1ecd2b4bd8954ade990cbf594bfc1374c4f
          2b85c6a2e921be320e7b6fbbf0704031f6d8e2d46c885afb4eb7ca
          ad7d4b2d739601161b492de0
P.y     = 00e25c136b77fd7466d9fe7cc70cb318da1bdd3f42bd81e5c04be8
          14d5c9a897342fb79ecd804aedc2f7c56eb0ff38c1305ab77049aa
          369f32c98e65b2ad34c116b1
u[0]    = 00b40ca653c0d8b459194943ab194139f0692a8f2fa24dfb44a983
          b8a4e239a4a969486b50288d378b938bf9a5097ba5f0e71caaeefe
          1413ca3d6c4e5bae1167bdaf
Q.x     = 0086df207676e070a3e1ecd2b4bd8954ade990cbf594bfc1374c4f
          2b85c6a2e921be320e7b6fbbf0704031f6d8e2d46c885afb4eb7ca
          ad7d4b2d739601161b492de0
Q.y     = 00e25c136b77fd7466d9fe7cc70cb318da1bdd3f42bd81e5c04be8
          14d5c9a897342fb79ecd804aedc2f7c56eb0ff38c1305ab77049aa
          369f32c98e65b2ad34c116b1
~~~

## curve25519

### curve25519\_XMD:SHA-256\_ELL2\_RO\_

~~~
suite   = curve25519_XMD:SHA-256_ELL2_RO_
dst     = curve25519_XMD:SHA-256_ELL2_RO_TESTGEN

msg     =
P.x     = 4a074f6e70afb2c4cb7c07ba0385a5d172d6b0e7ab688ff59bded8
          de6ee89963
P.y     = 4efb136c7423758e900c1b89a551309efdf571e4c75c9402a2be44
          17778b8966
u[0]    = 3b461907f03cc2319c90867cf7390902e421eed49f90777d1ef1e4
          19bda710ae
u[1]    = 6f49a763dc4bbd992878b0f6a288fc7b5432f97ec5e31fe66a9434
          78a08be6c1
Q0.x    = 5616ba301f8124ffe817630070c9e55c62a6fef2467df069140bb5
          72f05f729a
Q0.y    = 62db67cacd613609f79f55f2f553742b190edd11f99c105df833c4
          a96bb2e098
Q1.x    = 710543e579e03f25b11b152a549d01ecda96074113e7fd1ffaa8e1
          dfd30b34d1
Q1.y    = 1766caea6a7e704f2a0f840d9a3032490778fa27d6b9c84d0408b4
          8368bb86e1

msg     = abc
P.x     = 3897021b66acdb5bdbc7726005da08cf8848ad348b64368ee17d08
          1e472129a5
P.y     = 7e17556bc25b7338564762b71555a9f7e03b30d0c08f81935336f5
          7198831fb6
u[0]    = 0ad2ea46975b313e3d5b608e1a28a8be91b1f996599c1675d2dd32
          9b1186f73f
u[1]    = 75dea12a4b4b8c5cedb8f4b274939f2a94db1b8bb6452ec136b408
          df7f95d435
Q0.x    = 17f698f195896c22b77ec52c537e81ba8b052ff351d1769514bff4
          9d341854bd
Q0.y    = 2db8da80e08489363a08b77d2781b3d239c03773187bb149ac06dd
          b7a99a4b4b
Q1.x    = 5bb68a41da036bdd91a7d09105d707def25899fa8af43dc2530874
          113f34908e
Q1.y    = 1ca06bf6286f6c75d3d05bf5d2db7361865c34d1af0b585a42793e
          f015cc5d89

msg     = abcdef0123456789
P.x     = 56064637a63906a9789ee31d5d8b6ee8bf16309a9e7f2ff353f59f
          6b0120a4ac
P.y     = 00e62a8b4b5af73b67e198ae3b52b868a55b5e8a6c7cf868aaf645
          39d3aada53
u[0]    = 2f4d7cbdc3378b961142a47bef46d45c1dec61e174a47eb6237adb
          a675c33b87
u[1]    = 57f74cb2e24e5e1f115990be58ea5684096e7f2544be15e9059be1
          75a84f7906
Q0.x    = 4c1e59fea107fa8ef1e5da4f0b0204a2f323002ba2b1dadf935311
          4ab8734a8d
Q0.y    = 2c765bd0c3b84fc2e8760e3a22933720f2f131b64dc01caf9f0f7f
          9eb38126bd
Q1.x    = 655e68bb43f77e9be1ab9dfd6822b6963f3d03e32f3874c46f719d
          4d65378443
Q1.y    = 5618064e4670e1d8e775225e2e86543df9963ffd7aa8cc6db574f6
          ec1d85f358

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 390534777c4be0feec6a698a9eb54e3d0001773cbd70a6b12420a8
          15c662aa4b
P.y     = 5177e6ca5e906454c2bf3d09fe5df74d6e6aba3f4643ef903c8579
          3258bec2e3
u[0]    = 45d8bb3daefe5f48b0b8ef2d723a76ca4e48607f82059ffaa3a2d5
          8ce5ba266d
u[1]    = 3a0711e9c1a7359f51ac23efc76c9d41380aa88f46602ece1e359f
          627f07ddad
Q0.x    = 37cd4c3f48597438002fcb39e79a8b6d9cf4df50cfa3bcba968637
          cf15b7f0f7
Q0.y    = 19d8cea6b9b6d8c81d56c082714ed738f178eb00ec97416ee1352c
          66fe5e7271
Q1.x    = 7db4c318a88c987d1bcde8438ed0380aac7d2de3f70596a0fdddd5
          7abaa00455
Q1.y    = 529bbf6c88d4a375d5d23f6757e80e802852a9b937e34f6800c8f6
          f0a8435f0d
~~~

### curve25519\_XMD:SHA-256\_ELL2\_NU\_

~~~
suite   = curve25519_XMD:SHA-256_ELL2_NU_
dst     = curve25519_XMD:SHA-256_ELL2_NU_TESTGEN

msg     =
P.x     = 148142df0dbe2dcecda7260e34316a9f860a50dac69efef9d8b805
          b78d5cc416
P.y     = 54290bd159bade540d4da4062dd1ea08ca650a7be31fb18b5ff2ac
          0660602734
u[0]    = 1c4c6508a80db18ba615dca54655c20c4b6bc3816e7d90c5dd4666
          80817df5c8
Q.x     = 46c4bca377e4fac6085539a9f62b94626fe94cdb7d98cc12b3ad49
          176ecbb0cb
Q.y     = 3afd6c29ea5cf0be10b2e86836ee758049656c94c4ba0bd6b797e7
          212959865c

msg     = abc
P.x     = 45f5734efd91cfe67fee41b39920e1ce1fb3efe72548a1869dffb3
          83f1e422a7
P.y     = 7325c536453ec9bbc65c084dcf806f186b6a2f27f4695019918320
          36ab90a0fc
u[0]    = 3c0ab054a5c6dd09e8f8832e9f3a234e624ac8267acbaa38187f90
          46095e1d40
Q.x     = 4f2d7e82d7d1928576dba4c5b56d841f2b086361a4b22fa1a34781
          a02347b6ef
Q.y     = 66a88b7221a94fa651b04b62568ee457b4615d44bdef2f6b1ba3ac
          1cf7c70d42

msg     = abcdef0123456789
P.x     = 1a02e25cd0a6c691045777f61d6b3732177ccd1340694db0785021
          f5dd76ac45
P.y     = 4c9ff3e3b57856fd84a7a617be3036c4f6021dfee3bc0b87d2edc2
          590709acf3
u[0]    = 15fb514d8a3a81a93c85bdee6f2c3bfef00a86d3cf888ea7fff9bf
          ce2fbfaec2
Q.x     = 7ec6574c35ed8ce2fc8053d69270bb81bd1fc731ff779c7daef9e6
          d5f4755ed6
Q.y     = 728f927efffaa21a6859ff40f48831689cc934a5647d65f057919d
          d6e81b6dba

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 3f83bf211fbb42127e9eea01797a212d13eb812be8c199a01002e6
          61e2996be9
P.y     = 2cdf0fc2152a02e8b675d7e1e0a69f495a3c41bc00e55c7c7c07bb
          e5242f6484
u[0]    = 6fa3542acdbaf7e8e6fcadb25f263c2109f13140552f02f020a877
          30069280bf
Q.x     = 52661f6c4181d23a19ed6c34576eb00bc0d7d389f47b76bac55281
          2ad5d11f2b
Q.y     = 5b5d4998eeec642542586143f57a8e7000202425acd7f0a96b1dd8
          d2eda084c1
~~~

### curve25519\_XMD:SHA-512\_ELL2\_RO\_

~~~
suite   = curve25519_XMD:SHA-512_ELL2_RO_
dst     = curve25519_XMD:SHA-512_ELL2_RO_TESTGEN

msg     =
P.x     = 3a172899f1c4e6a2297889b4cbe9312c20dd52c1c01adbad61372b
          41d7dbb92c
P.y     = 0b9be02661fdead69d214f396e5bdfc5af30aa5339ce779c7d1a7a
          6223fc82a5
u[0]    = 0ee65264ee7fd5f177f17f00d9f669169cc3071e4edd56a27f5654
          911b30fb45
u[1]    = 65fabaa0d2ddbb06318adc118325ffb69c2cf04ffb2b3c22404150
          67659530e4
Q0.x    = 71ce39805cdf4a5877f05ecbc1e0bab4d5c427ef27432a1724ce22
          512d707ace
Q0.y    = 7ab039c50934d19ee4577d370129ef1ab8762c565928a8a22c673e
          5715ab13d5
Q1.x    = 0f6ec145dd4faf417e82a555e767d3f8d799fb1d183405148ae988
          a08bf59eb4
Q1.y    = 0fded9373c220670cbf30878a6c3950c9281ae6514e2f0d28efd1e
          63affc1222

msg     = abc
P.x     = 28bd6dbc9855b9982077919a22569b952577d3efbf7c6e7ae79ccc
          9637ed954a
P.y     = 5ccc5e42af4a56b8524a4567432b106743c209639b00fbb9fb88d8
          5f26d07b51
u[0]    = 3f64d0a84c276012b40d1bb660988d7f3529a17eea28d286f870db
          c4d33a7207
u[1]    = 005d866877b6cf987e63978171392872237e6c801f2180290a7b6f
          fd75803186
Q0.x    = 1e470043ba9e1409ee7075e7f489b5ad10ada9390338e336c9cd19
          0179476574
Q0.y    = 65c11c156aed5086ce805d474db75448e2b8216f99f22607e20e5d
          f3fd3b585d
Q1.x    = 41fffa025bdfa4e1e3fa22c3baebb351f8a724d4b5256bc9d91dd8
          c002e82a71
Q1.y    = 76eebb6d4d6ed742078d8500e73ef81b69719fda322a95d9276637
          571290006c

msg     = abcdef0123456789
P.x     = 68171404201003f3e41c463d48293d332a174b1286cd306987e124
          a43b5af34f
P.y     = 36bbe86d271e86d33963be75a3f46d810e91c94fd31851cd3b54a3
          bde73c0328
u[0]    = 00c34061c3588f2b55b5e2f037f19bd86ccda574d7ef87931cde60
          cf490fdffd
u[1]    = 56f69388986103a60d1a54a7d5042e2d537d929db2227beb8fd700
          58afe5fb1a
Q0.x    = 0193047494b5b93497d8a0c3ab515fee3b41748f0f6e38016637cb
          aee08edcdc
Q0.y    = 2d8186b3502558cf54ac8cd2de5d847c69c78cfed43897e6718821
          75abe1f84f
Q1.x    = 37c9cb0bb46711237ae393f43bb46f31d160189cdea780439e76ae
          36ceb175a9
Q1.y    = 0526ebf1b7f5f1e5df4d365ebe8fabcb6a3855954a96450fb9f969
          cf9b5fc2a2

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 63d086337efa346d964f801fb8ec02de22fe066bef916e6214dffd
          732fd44ca7
P.y     = 3bf10eb0ffde27ef3f5beb1161d5af8038addf2ec6891e249437dc
          730c5d9c87
u[0]    = 6683b676aa69e76833b50afe48cb70675608fdd3f5e4d417f651d1
          0d3e995bb5
u[1]    = 384201985801db4c1342b595ea12b358a40e5e6224288edb3e803d
          aa3b64306a
Q0.x    = 0ddf9ee23c4b5f876676d25a7639fa52bae7d9c48b0fc44c30d0c7
          723640e9d8
Q0.y    = 2199515c277ea11355bdd36a0d287491fc0d7b4531f1b183b048ec
          9de67608d9
Q1.x    = 5db604d99506067b8b4b8b514b172dd50d70f93490369fcb0df061
          c6bfd8a02d
Q1.y    = 17c00883f916abeff2dd53c96863a322a6e4728427c780b7bee118
          702a329958
~~~

### curve25519\_XMD:SHA-512\_ELL2\_NU\_

~~~
suite   = curve25519_XMD:SHA-512_ELL2_NU_
dst     = curve25519_XMD:SHA-512_ELL2_NU_TESTGEN

msg     =
P.x     = 1d8d887b93171f13d0c80c3cdf5ca8d1f2aa068b6c4124367f5d49
          a72cd1c51c
P.y     = 13d9f9934f7f01936e26b67eafeffe06bc0638143d81280bd1d5f4
          d302ad1929
u[0]    = 573b55aefc52e0cb47dfe59b7352d0f775b79e8dfcf37f1b3e104a
          6993553f0f
Q.x     = 0decd247491ce194e8e887289bd8d769de7b502d59efb753005044
          58651984be
Q.y     = 32bbea1cb16d05159962bdb7185d63888ccf14d3b2cb7dc2922b13
          af0423d6d9

msg     = abc
P.x     = 594d2eeafd81b0976b8d1af9ac14fbc26d0efd37620adfc9d635e5
          d80e4b0a41
P.y     = 13c66a12e6bbb114d1a570b1a0b6172a6a8ba8815e73daed7bd9cb
          f5147fd860
u[0]    = 70eb21469f3e2fe6c03b6adc1b826278d0732813e7f4d5c44adf46
          a5389ae258
Q.x     = 7776f671b2f3e9ec358f7f634d1694ba4036d2ee7178b691e44f1b
          36d129a812
Q.y     = 05e1f67045bda56aff62fdd82d7b9bb8409598ca44e0a914e84a4e
          7800987cc2

msg     = abcdef0123456789
P.x     = 07e9fa7855955b452073cf33a01feb24d7ae9a86f5ec139ee30157
          7e3c7ddca8
P.y     = 51608786ad1fdbe6766a8defab5498fc6ccc907a0e08689eadca8b
          a895e855ea
u[0]    = 08a0f35daa8999ee5263641be2f44d1628044f939c34e98471d381
          0301767c65
Q.x     = 36260a425965973ecce5a673b31c3d71f80c184bad5937005a9013
          98e1d0cb0b
Q.y     = 400ad6fa8975f91efbc8285fa7dad788bfad26afc14916b462c241
          91356e822f

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 0b2093b5aca9dcba4d2525d2a6ee6571db74f3d02594efff94dc8e
          c86e99742d
P.y     = 70c7c09544c600c972b1e4c9b2f19f4d2b36aeb6a569447d5b1eb7
          50dc522ffa
u[0]    = 68b81faf749ff4301fd5a056bddfd2f2c0d8a109c5c4fbf0869003
          42b7d4c88c
Q.x     = 74ca2fd0d812035ec8f3a99a458819955724e63599feb5b1816d7d
          bb7857deec
Q.y     = 6fe67ccfca95ada1249801e9396788da13d41752f29ae215b26393
          3d03da791c
~~~

## edwards25519

### edwards25519\_XMD:SHA-256\_ELL2\_RO\_

~~~
suite   = edwards25519_XMD:SHA-256_ELL2_RO_
dst     = edwards25519_XMD:SHA-256_ELL2_RO_TESTGEN

msg     =
P.x     = 0f8722c58d5dd9fb49af66acd5c9e4ec92a0a1ba58e1d34df48602
          182d1f30a4
P.y     = 40fbb3b412c5757f5b848e7cfd80b20337cd85c1b83248360bec0c
          42dece0e8b
u[0]    = 126cce2c2bfe36dd1e2af9cf37b33e1129266b62878b74363c0aec
          1322d32c0f
u[1]    = 390c5cbac4dd460d767fb2aa8be9026dcf5dbea509d522b52676c9
          4590ff1ed0
Q0.x    = 17b654835ca629780e84d754c4178ed5844373919db388bdf6c4a5
          751f7ea871
Q0.y    = 4981a0ae26b113128044c040280eeb588ec2715a96c69f592710a8
          51abe6fef7
Q1.x    = 35205fee8d3e360ede66d009d6309dabd4f491f7710d47276479f5
          dad4d9228c
Q1.y    = 3835cb6f183a5eb497b9a14e7b89df6b28a531b94d48003647ae41
          2f2fb16714

msg     = abc
P.x     = 3af830c8125a051566c2081a5ec586a6a900967a47a48919625920
          cc35ec5628
P.y     = 6f34b1f623f59fb105fc1fc883abe3fb92d1f005008d41f6689918
          a9a9d06f40
u[0]    = 5dcc66b4a0ec9007547f795be1e019c0e6baaa88b7952f0b734a36
          a62ac4dd9b
u[1]    = 7a37cacfead893c02a83ce63eff2601caabe2746458bfe81cd48cc
          46b1af1be1
Q0.x    = 3f53ed25c90a9b8412004df5ee70a36c64facec99dc39142bb1d66
          1a6ea98b4d
Q0.y    = 2fbbceac2131380c0517b146391a4fdb7e277fa424d66cd9ae3c1a
          d0c942c3fd
Q1.x    = 6e746dec39889516d1f60e6ddaa022bafc9f14b5f808e7b8c70446
          8fb8f7ae5c
Q1.y    = 76a3cbcecab1ae5a219c179da5282d9dc72e5023fd325ceea2f69f
          e111598dae

msg     = abcdef0123456789
P.x     = 79d929c77e5116cfda42d54657b243b834c80a51a4537f6f389181
          8da38e5779
P.y     = 3c5d2742f5629ce0c728416536e445edfb60b069549c3dfe3a398b
          1157964ce7
u[0]    = 63ca167d0f8ab1d3a66a71706be62a5be04e7808fda55ef55a0292
          40f2b116ec
u[1]    = 0eb4dc9eaca0c016365c50786394bf96b1e9807f9db73f21f8e3e3
          9dec5c97a8
Q0.x    = 7a089b9dce60d4bb4844567f66b2b777a0b8866fa90e55d79918fc
          3b908af3d5
Q0.y    = 4f674adb4fabe7d9f0e66a38e9434b3cda0666ab00ef683eac5779
          c6555919ad
Q1.x    = 35bf327e81a3558ea42d2eacec2fc806a2e50dd1ab7de8ba8fccf0
          19010950cd
Q1.y    = 0007e543a54cfc1542c14b3b124eaf5f19b1174a60e1aaa580c501
          74046a4ef1

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 597274648cc1dd7435ab65f06e88c77e27942a807f6ee4cb1a3f92
          9fc8d2ea7e
P.y     = 78cf940c076993184b03cfb03dd243ca94adc0c59219cbe8f047bd
          a705c9e687
u[0]    = 4df3a16d2e550cea9525a12fd49008479d01dd39e9021c0cd90a74
          611791e13a
u[1]    = 18ade67094010490c196c5f807fb93db836b702c2b97fdb5bddebf
          37167a8046
Q0.x    = 3fbd6b1ab5cd72ef83f1c002ae91492cad8e0b1252613337ee883a
          be39b630ae
Q0.y    = 4f82b72fac3ecd699467a1b991b0cab19a54ca66fcfc2476bd16ab
          aa1b196a31
Q1.x    = 626cba7ddf1a6c5fbec563b5a05e28e3bbe526170ce449f2114658
          92b38fc13a
Q1.y    = 5ec4e0b5635cc7d5b2e12d5332cf11301478707cbd2caa4a9ac3bc
          41d51ea5f4
~~~

### edwards25519\_XMD:SHA-256\_ELL2\_NU\_

~~~
suite   = edwards25519_XMD:SHA-256_ELL2_NU_
dst     = edwards25519_XMD:SHA-256_ELL2_NU_TESTGEN

msg     =
P.x     = 380216454ceba984cb8ed41f90f67e6bbe6d9af872339dd18d2f55
          dfed2bd0bb
P.y     = 23a3506d12ea03a09142346546cc531904938c624522a5594a6e92
          c319ce9c1a
u[0]    = 01a7d61d2a7aa8abcb1328da9a23d05daf4a41630897ee78907b7d
          85396764a7
Q.x     = 0a2344be8c518d8728040934150289737edab1f2610fd1dcca3a1b
          2988bf0da1
Q.y     = 2e38cbf9b3cf07483d02ff251741cee7e38998cf449d23efb46463
          431582da5f

msg     = abc
P.x     = 20167fd29377cf10821c720ec8923cd2580a1d6b11cf3465629a96
          76610b10d2
P.y     = 7f384523b09b60d354e9eb022e4d62f218ea49a5614d06b3050e0c
          17e7df98bf
u[0]    = 2f089cf1c21df2f6680936b3d019f4b8c848f613f1e568d240ed51
          43c7d56c49
Q.x     = 679cc8a05ac6c18809842745d3fefb947b9961e1145026cf1d5880
          9a83adce8c
Q.y     = 221b84f538ed26c03e547db4b92a9d2dfc36d923cfd04efd1fdc85
          2d8bc853d1

msg     = abcdef0123456789
P.x     = 43059ebcb19661e9fa879165a0317f1743cdcf3d05d842cb2affc9
          5741b2f423
P.y     = 1b53ee2a808775e1cafd4cb632f5b30923771ba96b654797ba9cb0
          2e35a63cf5
u[0]    = 076bd263c0fa6097d2db8c330cc6ea3177b4a8a8396887b6a730d7
          eb7eafe1bf
Q.x     = 69df4212c878adb5ccb3bec61025056be1df0c1b7e1c306adfca9f
          11eea37f2a
Q.y     = 7cc99f71b024c533bb1a234f51c2fa692ecbe4e668f66bc6b4360c
          c775e022f3

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 2b5e101dc84cc39697a5b49e085e2bd0f8916baaf045fd3dd353c9
          4fc38feb79
P.y     = 5df51d03cd43cd6aa44f40ef7bb179df8825e938885bf24e560450
          8c9bcb2a39
u[0]    = 34871edb9274ef81666d9427aa516278180e8f523dca620b91a299
          0fe469d157
Q.x     = 0243db509c6c1d5d75a8526d96aa63403a4db5bebecf1054403c10
          199cb7de04
Q.y     = 02b0664c9202c0bd8a577fe90cf2cb31f923137b5547c7ea64cbc1
          81ce5dfaac
~~~

### edwards25519\_XMD:SHA-512\_ELL2\_RO\_

~~~
suite   = edwards25519_XMD:SHA-512_ELL2_RO_
dst     = edwards25519_XMD:SHA-512_ELL2_RO_TESTGEN

msg     =
P.x     = 733061c3944db1b40854922ec686e9d46d596993fc8f9379c7a620
          8f04e090a4
P.y     = 5c307efcdf7f0822428f932e66b46b3d88f59880772a1ab07fac52
          31609c5f76
u[0]    = 34fcca2bbd52f190db11c3bf0c5433bc263af2515c379288d99abf
          c56258b4f7
u[1]    = 60c15d061d49044f1a870b022820f8ff9740aa8cc8019ff798ba00
          b1f47b1f08
Q0.x    = 53d2dad3e30c5108e4e2415723cf6802aecdb558755f0615633d9b
          8d206302e4
Q0.y    = 619b1ca282f4e61603cf302ec763828345b840d35aef0579595d95
          d1dbe62ed0
Q1.x    = 30f1ef22590a2f8d8679e9eb69ef7d96ec6544333301cdddb1f5b8
          39290835c4
Q1.y    = 69a00936ac492b4dd8b8c5425ca085c5346b5c86abc7ab5abbc022
          ac1e888a68

msg     = abc
P.x     = 253da0916bb9ff544d9a4cd1252e96a3aceb0c1849e0096026f442
          80c26c06fb
P.y     = 3f4887aeee9213d976e125bfd0e4e2201d7ddea8abfa28e47bec8d
          f008821b1c
u[0]    = 3c89e0e95dec55e651e9024834a0f481bc095dc125e45fd7ff36f6
          f7efdbaeb4
u[1]    = 72a4c5c44c1ecb08422f00aa3b910494fd4afeb5c00c15070c77bb
          3873d4fdd4
Q0.x    = 170251e3d6dd3481d1c48872ebdf8fc9b1c40a7a1db216b147eabb
          6e43826a7a
Q0.y    = 33d236786b788d25051b23cc2506a34c4fe1448233c5ccb60abac3
          1b9630dcdf
Q1.x    = 0f7bdaa0585ecd3fd774c2a22db4578b1af50a9020d752fb639075
          bbfcbf9aa6
Q1.y    = 7747a6883d07cf5a64c45938770d38cfb98a072229348423b1dc04
          69b98a0567

msg     = abcdef0123456789
P.x     = 0b0cea8ca1e594f64731d2f3571616928deba7789e5da03c28e6ca
          44b818ae95
P.y     = 3c67b98967527a551ea54e4de791689834552009a7a40393fd4a23
          d1f04061ef
u[0]    = 12538499c173d7612e359e692f220187524a0222cd68c8ba1881f7
          8eca9a6723
u[1]    = 790e3178bbfc5ff946216a1977c3e4eaef177a0eb1312d2c871272
          0d0838194d
Q0.x    = 20af4c8bc339ae680459bd3411f15f0621a0cd2c5a017fb85f0054
          202b1ff3d5
Q0.y    = 7e6a0baec1ee6888025a93f30fa69faa7df8d456bd5eb2576d9b0f
          616c75d8db
Q1.x    = 492418dc2a91a5afdcded30d648e492b2b12509f6a0d5567e33b9e
          e4940dde9d
Q1.y    = 36e2f37bde5d8d850f01480004d111319dff7e26842053127c6f7a
          72de2ab912

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 2ba229a8a9c6eab346b31b8b8de0629314809edf066b773a102309
          6e0979c60c
P.y     = 4ce238dc1cac3b392767bda2c81e3374e61efa4c2f93c5c400f0d8
          48b9b2e339
u[0]    = 09c5b7523f793057da91d04c936a68e788bf040f6b75f6d5e717fb
          c80f07967f
u[1]    = 559c4452f898a1d7e3201fe8e7242aba83d6755dc37ae1fa827d63
          35344d818d
Q0.x    = 2c26532dee97024c529cf2b0a75b165b6986438acf10607d6ebf68
          e725676050
Q0.y    = 17930e4357444121131bc5689ae1db6aecd89bb0370485b2809b5a
          60930bda42
Q1.x    = 059ef158d57879963f8b0ad3c3db756768530fc396f37140d72e24
          634d678515
Q1.y    = 37fa3b34506b14d322724d54af5625195dfd737def787230690ed9
          d6286638e4
~~~

### edwards25519\_XMD:SHA-512\_ELL2\_NU\_

~~~
suite   = edwards25519_XMD:SHA-512_ELL2_NU_
dst     = edwards25519_XMD:SHA-512_ELL2_NU_TESTGEN

msg     =
P.x     = 1dadc9fffc2bc7ee9ef2c60980f5b863b3ad0743aea183196f84a7
          6b15fbf7b8
P.y     = 4af6284e3cc7116df104f6708e0c44d79b0e294ccd89b87c4c3c89
          2ebd2f03b1
u[0]    = 155c21d4cd09704fb445dbd195567689dfee8746f6a41a8e2dd344
          f370635fdc
Q.x     = 2720eda378f35270b6ca39f3da49bbf406244e393eb1423b1bf693
          6061cca504
Q.y     = 2e93babc6eeb31123cf939fba6578dc2e2924a2fcf9c6900d28c52
          c287cb1c22

msg     = abc
P.x     = 5cdeb5456820bd6f73e4d077b4bfba83a7dc50e875144467b7dd20
          41e5e2bcc3
P.y     = 23e704500ac22fd7106ceedd86bfcc8d50351a6303be22b2724fcc
          1280d00544
u[0]    = 44affc91a5e431c6bba08db58d4155bc73ab1369871efe48457fb8
          79873edebe
Q.x     = 6c5031267c9ff552b87482c7e65908d5241dfc8248cd8e3711c476
          07db064841
Q.y     = 27bc42ea0f0b92e62b368e8ab2e2e6bfe204bae24dce773282e0e2
          fa9230893e

msg     = abcdef0123456789
P.x     = 472370c66329c64bbb40b2a5a7f7b78b0b51b2c6c55f8260258c07
          9a19c94527
P.y     = 34b8a16b923101f2d4caa48d9bb86fef4f92be0ce0f55c8ba9db55
          da23ad623e
u[0]    = 397af6c051fae69ac233a8f147d73d5ad5524164f8ab02081c0563
          b035e23fe3
Q.x     = 31631c01d4162e4d3545d731f827313356012c53b4324e55a884eb
          a10b872572
Q.y     = 2a8b6a47187ac2483fd8d1b10908da0e156386cdfc50fa2c511dc3
          60105970be

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 110d8143f8ed73bbb2f9a85de1abd2718cb4bb7db006296883ed6c
          8524518a67
P.y     = 31e648bbade3b272b7676f82da905d27de37f41581b1d170250dd9
          d56f95413c
u[0]    = 1468be7f7907b634683fd7f5d7dbc71603eca5cc4643a6e760902c
          0bffb994c0
Q.x     = 62fe7545d28a771a2f16d1d78175cd18ee0f74cd5e8e60ed4c6af6
          b93a898a6a
Q.y     = 5d76557b33de752c6b997402b77d4f7d7369181a9fae8d573b1959
          9b89bf305c
~~~

## curve448

### curve448\_XMD:SHA-512\_ELL2\_RO\_

~~~
suite   = curve448_XMD:SHA-512_ELL2_RO_
dst     = curve448_XMD:SHA-512_ELL2_RO_TESTGEN

msg     =
P.x     = 65e43932a618a90573f3c9e8e8b51228bea147d59c288e7bd52194
          749234835fca5b84ce6ba586230fcc7f9b0388fc644035793b4146
          6daa
P.y     = 51e4c1f40af9546f420220e1a3533f96c25f7d1376f683f1bb2d0d
          fdd397642b20c4cc5a82f493bfb8f88db0a48e50bf428ba6f862be
          b877
u[0]    = e4a1289f30d675e88aa7eb7a8a85066afce10c63ab6277b0c6b8c3
          d86b4f01a42a179be4739d9b6b17e418ec4a7a02a8a350678d6930
          bc22
u[1]    = 5884bc9facb3616fb7757a72b0fc44c3d4cf819c102b36075ae3b3
          dfa7768f54cba34ce8a5a11d95506e35b00960c18b0ee3e7d58193
          3a0c
Q0.x    = 99d098cf682e7f4013a12c8a51d4c6a479a5b62d3b45cf00522f2b
          7347afef14fe34fe9bbc3cc610fb2090dc67adc86bc016dcaeddfe
          90e2
Q0.y    = e920d887a4fee856582db3a6d635cc33064306f841ab30def293c9
          89c836d93c0482caab3415c49e401bd18184d8fc5493b097d4af0e
          930e
Q1.x    = b0170e6a3ef7a531b59728cf3ee1347fbc0c876efab05c6c59a146
          e762a15543d420f6addb2644421a9f33b372f9739a743e8937ba7e
          a611
Q1.y    = 9c41444e6d7737ffe5ed9ad212855c03fa75e2de2c2d3be92eebfd
          77e8905de35d4946661cce5758d6c24840a5f9082326f0857a1d95
          1f6c

msg     = abc
P.x     = 4e3f1ceb5126ea6cc8d2740853e8433f67462912a3c06e574fa570
          bdd58f3dfdb34dd5223b2c71465825ee3c30e093b1027339c48683
          ce28
P.y     = 53ba442ccb6a789618f0e3e27166beef61f619241b8e072b5faabc
          0259ca78ef0a7431e6678f93c73ca92cb12fa219660c31a0e1d349
          0fff
u[0]    = aeb625d04b4c37adeb081e38b6254920060e10b85de4577e595423
          6e389e6f71b2936357be1b378e97928298677f74109e9e6580880c
          bc38
u[1]    = 0d660426bb3db9addf0556aa2a00dcac4d6f24ad95f0fef861b4c4
          196a7942c32c8103dfc9c69062512197ecade45bb72dba0de71ac3
          24d7
Q0.x    = 7161e026d1ad3fa89b4923c85d5fa5718c37648399782ab16f3ba7
          748734f958214a69a372e2baed7864f09660a64a4feb4373128d86
          5e9e
Q0.y    = 2a63d883a0c0e1211e03bec06ba12749aa989e3bdea4fcbecb3cf1
          deefd42275922b9aa715b48e9a7cd2e3ba14c5c1f3175432bfea3c
          7278
Q1.x    = d31dc8dbf25562309a2edf6da59e8498bcffa3cb01a94cab727bd5
          044eb7d25d27353a4f35fbeb6d5159b3039df97fe5762eb79ee40b
          4714
Q1.y    = 5d11e2164eea1960dd74fa46c5178ee3479b83bf381f871bd70c34
          a63882f8e8da32ecf8c3ac612d75d20174c3b0468b46b1968c5a2e
          e49b

msg     = abcdef0123456789
P.x     = b26f9b85e898fc32ff30972511b6f703ffdc80134354c938b5903c
          793c1dc6e57d0f2cd5b8592bf5098a93e20e5819c81740c9035259
          60d4
P.y     = bb6bb7fa8c4aa864ddbf465fa88b2e4742d81a20e60fdb31e6516c
          f35ef1c5e1289576eee4f53130ebd7ee9a615612f99cbc8bf55cae
          29c9
u[0]    = 713f3d4bc5ee9a7648f418b5befdfdf706e0b199a15f9bcb9509d9
          ce5955b3f784553eb221ac309508aae078b7c4b4b67061a6e0936f
          b119
u[1]    = 1b1469fa9e93397e82c7702ae814598f1e5f6c720918b07276efc2
          92fd8e02732c9b2d3c75ba302a4a0338ad5dde6ee87b0b9714d0b5
          b4e8
Q0.x    = b6f95c15ade4f01ce6df438bded3d55574a6a24f8eef6d93b7b834
          58bce54c83332c5183252d6941240f6ec5495eef67da15f7f4a981
          14ce
Q0.y    = eb7d87c8f3404918a2da248ecbb24cfa1e7771f42997c643cb8950
          2acfcaee758154d969fd859fb44e78435070f4baa1b5be5f1abae5
          327b
Q1.x    = be9a72d4c32d61894cda8f467bc9c19b35606f42e6a24e7564ddba
          2e0c10d03584d8e01c7b1eb9bc1e5096fd6b09a86e68b6e9480203
          f761
Q1.y    = 736cd1eb7e986060bfd8c6687b5d2e1dce684c0d69830d00936c04
          3e0242eedb02948d593cea212253a067f8a1591d8f69f0104a2c72
          c99c

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 57ba5446a3277751991d51895357752adf7ddef43426d6c76d8a38
          c1f797362849089058261a2b97092ac0b47b619255eede13ca8acf
          52c8
P.y     = 0a1ee932b0d8be1b7e755650881ea2d24e8e3ebfc46d2ff26d51e6
          48091fb1ba3e1450f899e699510e9d10c1da69ba247b488ead83ca
          8c52
u[0]    = f600b019a044aab639657f73b2cbf59b1d72d951fa68dc01b88aec
          dec9ab500c87b3a5aba56bb0a7a477afeca573b99ab6e6de7448f3
          4220
u[1]    = 7483651b800439fcb5ba24c825992eadeae1d41927e57e9128c276
          f3b103c12664e827e9d30a2a08f307623a99068e6ed93dbe78fffa
          bd58
Q0.x    = 7797913d84240e3dd1155dd75175a2bc8a917356daa823e22bfce1
          f863ede21abda536e6156c50742436f736455761ba20fa03c3fb1c
          2179
Q0.y    = e44f7a25ec9b650664c9ea26684443b9e06b6ab3edd6cfc89cdc05
          d583cfb540bfc806ec50690c82f835cfc03bd9425d3beee6cf377e
          288e
Q1.x    = 5b9402d193d37d259e35d209b2f50b4096c88cda7545d4acbddc3a
          f61c0c94aa515439565240c2debee781061febcf13d6f344a0a88b
          488c
Q1.y    = d58cf00902535df0fb388715c800f85b140795f589760f0fd60b08
          bfc44e4432e1f85c0111dd243d37ab135651c52aa4f6c068a0ca16
          171c
~~~

### curve448\_XMD:SHA-512\_ELL2\_NU\_

~~~
suite   = curve448_XMD:SHA-512_ELL2_NU_
dst     = curve448_XMD:SHA-512_ELL2_NU_TESTGEN

msg     =
P.x     = db2d394c230f07806f64d141abec430960b6a6762a752b70731c58
          cd4d96c93b176321a4311061a2f64d3bcb1d46786be7594f4db484
          7203
P.y     = 7b6035b65af2f2ea404fa080c7a21c6045721057fded7d573ed5bf
          8cdf96db62b747025e87f4661b24142ebba91db0ac66d0902c85eb
          6829
u[0]    = 249a72a3caf64d055e2bb83a896bfac4d1af8d41e3935883c66df6
          da15ae86dde897e49e95a609c7e00f286aeac14e0b13a2aea86f14
          f7fb
Q.x     = cd4e361fec6c6f098d482165ed47b5c29499ca91ce3fe5b35d1e78
          04d4240967647a5651cd30a6dce95a4d5422ae6b294d050d83e3a1
          256d
Q.y     = cdd47f57178d9b2499de620cd5bd8f9c8576dd1cd37b30c467048d
          a75a3da103a23b00d45eaf5544885d59f171ff3aa6d05adf267d56
          61ad

msg     = abc
P.x     = 5c4b864bf52c3b6664afb5545896885e8773c319e7167acc75bc1f
          06a2066bd20d3622ae7fed254dd03e6df18ab5cab5b4765679e84d
          76e0
P.y     = fb5017fc0b00952caf2190bec44ef4dd1146a09dedb217b95d8695
          3a68bfcbaae5aab2eca5a7b36570a6eb422696c2c0a02bea9b9ce1
          bc0c
u[0]    = 150f5b0072c993b4bdff3500c641d26f8104c4bb744db090c1bd7b
          045bed0c2959781417599d45943c88deb74b2fef1372fff6fb7c67
          4546
Q.x     = 6cf23d124f6a896754dbadd6971c31549db637a27f3d9f3c078399
          d8a1db927b8768d617393a2be1c9d94e6a8c36b49a0f0a41a621cf
          3c96
Q.y     = 98c5f6fd0204b83a3f9d50b1589e8e8e4dbd409c2f0ec250c449a7
          1eb297d8e4231990f46b5f0b9a78ea8464c50fbfecf92740b4629a
          9318

msg     = abcdef0123456789
P.x     = 2fd6673e216745750ec195cd488d3783e9fbd69f95993cbc5248a7
          62c446ea2ae10b30c5b66828dd05633a5dc0a43f6e61fb3f572fe2
          da85
P.y     = 0af04df18f3a963141db30c24e450d3034710a7b67a08d8180d909
          6bf23040c0dc387575f6c939f3b4e5dd75cb89d839b653af838df1
          6a66
u[0]    = 18559fde14e46513c0836ff6bcf226d3e34fc3c468e5cb374134b4
          db45bbe0dfa7cb3499a2699d256969de85b104144dd1593e817bbd
          50d1
Q.x     = 37451f90ecba47edd05d473b99fea080e0d8cdee09f967287456c0
          e29ee3da5b449ddb4cf89f78ee6e8bb8f4fd235df47c2302daf454
          c74b
Q.y     = c57d15c240d9c5f4ac6f61dc154920a491d70c8f52c2935175507d
          a487ca588395421959e4595cc6f5cb048617949ed04988fbf166d4
          c31b

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = d8637bf465e6a254a6277684307b085a9e3fe38fe97487deacd8a8
          5949926eaedb4b0ee3a0ab9c358e285ff661aac247fdb48bf23cff
          48df
P.y     = a0042edd6ca06d529b6641bd95e59dc7441fef7b2f961b41b5a86a
          df1f66b702ae82e683d7c53abab7b340b86c284f36d9991508e3f7
          3a63
u[0]    = d7fdcd9dd2d0e2f516486b9c5fb549865ca39280e41743cfc6e012
          e99f9108e55b81436c050c77361fa1d9650851de7e7a6e5d0a5af3
          98df
Q.x     = c9440b72326b251887cc71fc39a1e1b3c96a9f908ffaa6869d28d8
          54684459c35a54d5859bbef1e4594bbca35ef3555bca4ceeb60c2a
          27de
Q.y     = 49911fd9cf581ef8a288a644b16f80c1b4caafdf127187492e5bba
          afd57765326a618a1acd057abf0a57c224b50a788131160fde64bd
          6903
~~~

## edwards448

### edwards448\_XMD:SHA-512\_ELL2\_RO\_

~~~
suite   = edwards448_XMD:SHA-512_ELL2_RO_
dst     = edwards448_XMD:SHA-512_ELL2_RO_TESTGEN

msg     =
P.x     = 0fe44e2eb2e4c64e774df311ee290305806eca8410b62fe020e481
          cae0747c8bd6fe703ebc620008b06a85258040fb241e1df952e94f
          efec
P.y     = 04dae4a58bc21d48384a85ac56a58f4e71d19e233d9316ee3d6b95
          6d35172a886702fcfd0134c3ce22f02adab417dc0facab508f37aa
          3332
u[0]    = 09a40ce753f16726fd0187c16f1fc1a6d88d2afc61d7d868b9825d
          466f1b0f8237115397b6d9e739311d8615cb442fb93a73d5ad8f8a
          f50f
u[1]    = d6012e7b406163f8a44c36df9bb2e4aadb21a60ae4a4c03578eab2
          81942a44721f65b51e147df7a15f365b9b38bd9976271d428f0aa3
          27fd
Q0.x    = fcc2f08ce72bf0bf56355c64334733a1e5a733a8c42184aff651cd
          f43f43a0cd28e9c2bcbaea8e4ae27262ea10467dd24071bcf69d82
          f2ed
Q0.y    = 091d729ebb25478ee9172d98654138ad175988e897c953fd10e005
          b0abeccd3072d4f3adc4fad437a1e3bd75ec023a746f68de61eb2e
          0718
Q1.x    = 2617d1c71cb7b6b6aafa07f2c95bfefe2d45e93160e8dfa184f3af
          3d10bf45d4f6d8b81026e41813875448aed2d5c23a295bcddb8889
          1022
Q1.y    = 2ca2d7b20ded65529b196e33871f86c0c46266d40c3716151494ee
          26b16603953be1881235a4828346acbd42a05226eba7d75c7a5fba
          4ab2

msg     = abc
P.x     = 60cfe5b1c6b4984747f2a7fa0666df7298c094903ba2d450b54cbe
          01d915ab782dda4a7c056cfa4e2bf759aded44045e4b85fd54a821
          ff52
P.y     = b06e9b3e83ea57f3ebd95cbb62423eb69897c484c16536a2be7966
          4c6b2a1130b662384dc0a3defb05cf1dc061f84f4cfbc235ff55f2
          9265
u[0]    = 95e100f36217f828b70c0ac86025b7481d8853c4df613683fef88b
          dbbdb4722b5b31b8bc5019f0fe742acba2c2be57fff46edc920d65
          9cd6
u[1]    = 0b31c01bdfe0d0ddb6c9e243b6f8e894a929b0927601455e791c4f
          9884672931fda1f5e63ab4d7bff7e4dc1f0d9d6fb958452c88051e
          7853
Q0.x    = ceaff22a7be3d5991579f797dfa9a905f536145a5775ed725f4bb9
          27e537afc4155bc1385dadc53cbbe2844c474beb19df5b59b93321
          5663
Q0.y    = 9f7fb2ef13960ec355e5628772baa30d83a7f09e7f69f4a1fc3b69
          90bc8cfd4fb2d9580cb99bbc353cc25954370d17963e5c3bd7fb13
          45f5
Q1.x    = 8d3b293b3571ae024ecb0a04baa1e98d3150925bf3a550f1ca53c4
          91fc99c0a54e71fa24368e24f0d0717a861cc5036dbde57ddaaeee
          0d0c
Q1.y    = ba6535665b5316abf66b6d710e365e8906cabdbc985b9d0afcde0f
          7f3d14f03eeb03de6058816d679d3ea8364ddef6712788bfda3538
          92c3

msg     = abcdef0123456789
P.x     = dacba56925b132de6be7435c736bd354a67fb38aefb9c467ee93a5
          577a6ce8e00dc08ead6c7222c478ec6283e35ff15e1b13fbe55b97
          824c
P.y     = d7775f69bb4add0ca8b4224d744bf72254e8190f5779e034879d66
          86808b9c0453b95dd69dc01d3f402f51aeed83c2a8569b96c8f8ef
          d431
u[0]    = d1096353c1437b932f50fcbd9c3a3e37fb319c0dc0061f5b8ba6ab
          8bff3e62d7fb41757848349f8750d3533856183a9a9304efa445b8
          a592
u[1]    = e59ee6dd4a8ade4f06e3e191328ef0d5cfe5a7fc8e7c825bb4e3d7
          b26ce00b6d69f3b7d31ab6d345c9ca58685ef48bdbb6ccbc2bcfe2
          7517
Q0.x    = b3211e212cf85b56e0b50d6e08c9fa39119df86513e62bbfbfc5d6
          34ed7cf3e94f770a91ae45077cade4b602a0dc3e8b4765008dc277
          8cc9
Q0.y    = 6d4b8842b050c3efe71abb0b6ba95255bc1126bba796c4a285c32f
          132a712db3eab73fb82d44652a04f0161c1cde2d3bd56f65969478
          a79f
Q1.x    = ca41bb012db93c83e8ad54a131200404db25f503f90f5969e1ea0f
          548360066c6c435010d6bda5d105227c6be01c1c48b323b693ec6f
          363c
Q1.y    = a17d4811bb3989913cc392e1622a74703dc35ff86e6dcfb2bfc3be
          6e00253e52a7a7d79214fec2490cfc2e94e963443355f667c5349e
          0f85

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = cdf91984bd11747c5042f491db0abcb3f07621fead5fa4014af13c
          6be39168ee013530e5a2908a82cf1ce35093f333d00fac7e1d2b5e
          2726
P.y     = 7e7ec0f7356517eb2ad8fc4e17df2efd08af7241a8c71b31da74e2
          05b86b7586caee8c13afce581e77a922bd0d8d8b73576b6c1fe902
          5223
u[0]    = c4f139f7d07ead57cf441d2d2e54a9333564040e8c39428c67cfc8
          43e9da8c5ba4c449a9cc6588a489b35c9c5ba7219b01bd9ce0428f
          c2cd
u[1]    = 945687af139af91229f8576f0645aa3ec670e057b9efe80fb06e40
          fb104f9d39c8e955e622996b30b0a683502ecee61c1b8de32f26ae
          1710
Q0.x    = 99bfa32a5c384d71ebcf6dc449e486d686e157c7056525149f5b73
          365df0663dd55e9e0b6d693293534e680ee029013591a79b6cbefc
          4dfd
Q0.y    = cd5221f208798d9b71f4e477d63022611d08907fd2175b599e345c
          cd8ab76b91cec3158b504d592a0fac2da90c577a1e496c23f5a975
          a21f
Q1.x    = 0cdc11176ad5451104a58145b789c4e8617fb8ce0b1ed425ec0e31
          0e5739230e8461a59d4d18df39f833451ecfcdf0549c902781687a
          6c42
Q1.y    = 2728be41751826371eed2f5473c0804186f3995cc1215b9b28d6cb
          e76c34f886e3f5c03491010a10f175a9bf7c0f96901bde8a065638
          e0e0
~~~

### edwards448\_XMD:SHA-512\_ELL2\_NU\_

~~~
suite   = edwards448_XMD:SHA-512_ELL2_NU_
dst     = edwards448_XMD:SHA-512_ELL2_NU_TESTGEN

msg     =
P.x     = ec720213880616b46471080642d498f74725c3395d67c578128bf6
          d160889e81a09d9050fc46bf4caab70c12633449a44ddb36e50f7e
          909d
P.y     = 7d6df123229ef80780d297c894cf346cc42f4c4d83a645bb090a07
          5770cee7cd0c1313b14fa201ecc4472bc0b151fdd7341a0ffefd30
          4e09
u[0]    = eb88ec9567385d57e000804d77992f293ce5ab1e1a99a037bf3fde
          849b8334d2078775ae33423f993ff2d0964684fa6952fc4934125c
          3a38
Q.x     = 6187184b3e5313da9eb4aa069056a6efc4ff2df22647bbbea1c63f
          c946b9a13a3455a0f26da1a86b5cdee458d69f1883895146ba1368
          f048
Q.y     = 9b213ba43cd7777c0b31b7db4bfd36e428f47da49ecb4cbf37ab19
          ef7d8102ac386ae58e23c4f7bcae3b3713081ef08bbd0e88253179
          c837

msg     = abc
P.x     = ca85c23ea74f767a77a307649699d4f4af493485238c7a4efc15b2
          b6dc4a41c4292c29696be16bba6173ab5d6a50ef299f72456fbac7
          9476
P.y     = 0b0f6af1be348d8739921ea395c6b00135be7ecabe04358436275d
          ef73f2340cdfec5fa1cf5c6d0b288bf834862c5b233b38197a448c
          1f7f
u[0]    = 1302f34b450c31e5e6e92ed65442889791128216371a041d710b84
          f26671595ff6cdfbaba6ecba28fa6173cdf51d2230f0029ea641c4
          d1ba
Q.x     = e988b5bcaa6c301fba452303eaaf7728f9d7fbed1e31264f01cb47
          c4007558ad265f15d53d83f6a3a5f85fa18ee5eb494305fa1b464d
          ebff
Q.y     = 0828aa97bcfc5409ef185f1fa4a3d8f7d3e4f5e7afd27478c00050
          3065f1b7b832aec3e2359a6d3dd19a2c583747a0a31ed296d671ac
          da63

msg     = abcdef0123456789
P.x     = 8ffe9d81f3e887e3b21daae442c68046a06f2c4e8a9574649807ec
          aaa305c260d2856b2118c49ff06d2d8498cb9bd47cb33c1a301bc1
          99a6
P.y     = 6987b177d6669ccc7c1bacf0014031802973d4108dcd2df554e3e5
          e5bcc8338a9ec90d546b964b83c75419bc980a271cb1600ba460f9
          79ea
u[0]    = 78e00e654feecc2727b138297738596151d20c4451e3e4c379ff87
          76e2f723dbdf49b329519db45bb40ebc9bff4acc994c22f2c8ff16
          de67
Q.x     = fdfa3a3c48e13d740428f569ea36c4ce4dfa7eb8ab051bd514c764
          9d715a6a8a35798d249abd92e3701940585be47c573f3066d2fd20
          376d
Q.y     = 6d6838be2ef1bf371dac733e11f725fa16b25308d24f9be4367550
          583a018782ce24425866526a0a54208e5abce538a07e930ce51be6
          3631

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 7a772da3bdcc88bd578da6c26b79981e31823a1a77c4fecebc7306
          01ddf21ee27c7d7653fae841ae2d7601d4565f842ecd19301cffe8
          804c
P.y     = 3685441a7605249cf4610f2f11ca36e33dad431dfd58e095bfc755
          fd4fa0f276e7e8886beccf8054b2d820c099f6220210b7dba3792b
          bec9
u[0]    = 6b105a376ed144a9a63d9ae5cb24d7ee862830a55dc8232dedc03b
          102a09abbd93ec6fffd511d82748c9978330c636e6215cf46759c9
          fbf9
Q.x     = 301085d533dc7ee831b43cd69482b04261b86208e01c659bad7794
          087dc12f26c6f1dfd79ccc482eced67f3429f6601d0c29208c87a5
          bbc0
Q.y     = b5afea2010593ed862bf534f0bdb9a6e72c8afd2f89c2a5f1c167d
          20dbb0889af7af4bc1262ce81096d80d3443dd88d8a363259ddf1f
          d2a1
~~~

## secp256k1

### secp256k1\_XMD:SHA-256\_SSWU\_RO\_

~~~
suite   = secp256k1_XMD:SHA-256_SSWU_RO_
dst     = secp256k1_XMD:SHA-256_SSWU_RO_TESTGEN

msg     =
P.x     = 1d82f6ad812df79aa9f4b4f29d4bf927880fdd105225f81268b93c
          7bb5db2e0e
P.y     = 3738448fc3577c80a2cc89dbee5addcefe6fea0bd0e1ee7609c74f
          6ff4361e80
u[0]    = 5205d8a13923161b75886c98cb47e35979b93fad5e3ff7ebb78006
          be83d12ec8
u[1]    = 8d3c1212eba5401919ed6c5d10e400473e66c9bb362992533c4235
          0311a4f056
Q0.x    = 001c200a38e4927f3e8b3c8bc1823ee44efda4741240e792059568
          974f5c7479
Q0.y    = 84a6768d19a72037c5c0bfbb869e967e977dfd3ea1bfcbcef46ea4
          f42afcb60a
Q1.x    = df97201dc37b8576576376c8c86462db7d74680aee74aabfc8a55b
          9fd610b559
Q1.y    = d9376618dadf3383caddd0495a0db68d83a6f08b3fd358a6073112
          b58e2cdfe2

msg     = abc
P.x     = 984cda5f46618b7aad814e4f9c416bc5c1486693bfec8a3469b86c
          76d0fd0938
P.y     = a20735e9cf884fb174609a45e28d4a04cb875dffd7112dcbcdb4e0
          9bbbdee9af
u[0]    = 683478aa778668a5c8dc0185495daae2e0cc04d136a50d03861aa1
          63d1308fb2
u[1]    = a1375d34ab04455dd7a31a577c185a9a5b9e2229a247ea7cd2fd1f
          c8b8370910
Q0.x    = c31dedbd183d66d3b9055e5da5428f47db4fab20b25ca4e836c0a0
          93954f1511
Q0.y    = 1aa5707a3fac674b963203157786542b4c7050e57ae5376ce742c0
          83471da4ef
Q1.x    = f199185977b0a7fa23ce1f800de850d891890634a1b98c287df9f2
          03562496d3
Q1.y    = 270e9fe63b94d13773e54896f05591a770b9fdc289e89dd2a0b228
          fb357d10ac

msg     = abcdef0123456789
P.x     = 6622721b3819e9ffb76940f36182a881e00b6e766ef1593dd8ebb6
          c624f1819f
P.y     = c85f4ab902141db1a847c54915393ee94f09c00e9499d588ad7786
          aab0b69ad2
u[0]    = 563a740c88ac3659ed787df6c00586b8b24f68af030d92ee980d4b
          73f1201af9
u[1]    = 5c6785fc70cfa6c85fdddece594c265224220a6a7348fe8b3d4f37
          b938fd141e
Q0.x    = bd998b715af420c54863ad3f9ae98dc9f87da1295c4342e371163a
          800c9581b6
Q0.y    = a7133182b1459d9dfaedf30687cb0047b9f0f11b276a87d23c9f6e
          9823b73968
Q1.x    = 4fffd4531bd1b2dff9aa298806aae5e654f9cd9609a2d203ce4ac5
          4dc715e311
Q1.y    = e2eabc2548e052d3ae661eddbb31e0c7ed7eff1028c0c9f2b02f34
          ffb4aa7097

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 5a80cb95c496cb6dc3fea4e266abf152ed2d6f3f4233b77a073b04
          3158caf76e
P.y     = fd6ce760bd4aab2426489a013fa0d7d54b4b3597121e891071f822
          a0afdb2712
u[0]    = 57dc9b407b52330dfaee092c650ef2386d825572ee21b2a3cf8496
          2fa2fba298
u[1]    = a1582601cfdf027b691d010b8c07b368a92971db96cd8b10248ec8
          2dec204b21
Q0.x    = 5c86ae91ecffa9ec210e22a93f13d4a8b5dc3534683f68ef1cc15d
          9cb9624d62
Q0.y    = 19aec9559bd8f13387e4b38466a148d269896b56f730232d074bee
          60c4b7a5f8
Q1.x    = aba8c056657b994610840973824e036904bf8d49a0285df3b3db09
          56573c9800
Q1.y    = 2585e9882514cc95fbc9c3f56389cb31f60f398db9813de5c0c512
          2462e2e04e
~~~

### secp256k1\_XMD:SHA-256\_SSWU\_NU\_

~~~
suite   = secp256k1_XMD:SHA-256_SSWU_NU_
dst     = secp256k1_XMD:SHA-256_SSWU_NU_TESTGEN

msg     =
P.x     = 38feae3ac66f46c364f6192dc6f5f57d28511013f80d5d9c0bb8bd
          963b7fe852
P.y     = c9e7a35cd549ee7fade583ddf86d79be420f280d8ef890c13975bf
          7770e1d942
u[0]    = 6cebbe5716c8500196db6b4257655ef993187f0ec76fd2a09941b5
          892e444b06
Q.x     = 38feae3ac66f46c364f6192dc6f5f57d28511013f80d5d9c0bb8bd
          963b7fe852
Q.y     = c9e7a35cd549ee7fade583ddf86d79be420f280d8ef890c13975bf
          7770e1d942

msg     = abc
P.x     = c644a2c06c75b9ea4cef629ac4d727df7bb32381164363edb72b30
          c797a03bad
P.y     = bdbc67f2a52ff90d66c16fd420c2619c0f54c21fc6855e4b7d3157
          960c822f1c
u[0]    = c22fbd207aaa62ce32a5394324831a4a51a1d22a385b961852047f
          54ff176c29
Q.x     = c644a2c06c75b9ea4cef629ac4d727df7bb32381164363edb72b30
          c797a03bad
Q.y     = bdbc67f2a52ff90d66c16fd420c2619c0f54c21fc6855e4b7d3157
          960c822f1c

msg     = abcdef0123456789
P.x     = 31c2ed196c1b9bcd739bae9323462975d25b1158973d5642cb0b44
          01320dea88
P.y     = 294e9f87de469e2701f4b199da877caedc4e28f8b6d3f0f56dfc9d
          63e9e0762b
u[0]    = 0bdc51780dabee9caab31f7ab5a08fede392eba9c06f9841662a85
          4fec959736
Q.x     = 31c2ed196c1b9bcd739bae9323462975d25b1158973d5642cb0b44
          01320dea88
Q.y     = 294e9f87de469e2701f4b199da877caedc4e28f8b6d3f0f56dfc9d
          63e9e0762b

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 59be3628963caf3b318f9a39058e4e4db1e66dc77e40931ee99e1b
          b7a74adf51
P.y     = ea52bd0c23190815647e5865173a286b9e8d0245c033417b37bf84
          9f6b47b567
u[0]    = 11c005ee574e3743eaba52be1a34051d4505627447f68094e128d8
          ebcd67d1a2
Q.x     = 59be3628963caf3b318f9a39058e4e4db1e66dc77e40931ee99e1b
          b7a74adf51
Q.y     = ea52bd0c23190815647e5865173a286b9e8d0245c033417b37bf84
          9f6b47b567
~~~

### secp256k1\_XMD:SHA-256\_SVDW\_RO\_

~~~
suite   = secp256k1_XMD:SHA-256_SVDW_RO_
dst     = secp256k1_XMD:SHA-256_SVDW_RO_TESTGEN

msg     =
P.x     = 5dc8cbf15b61f94aaee85ddbace7946c57a547c83f7b4f16cb9026
          f1a663255d
P.y     = fae3c08a29f174f0ab907e479d9e36c07616654586430c1a028e30
          1cc301d8fe
u[0]    = 379b3dff6018c91255c8888b1f467f8c25ffa40dac60e4755109db
          7e49929e4c
u[1]    = 0951956bc2c00e6e9831efe81e533efad7c39447ecaf2be766f42b
          f6378cb866
Q0.x    = 1a769cff827687e9c5fcc700e1bf642e512825e123b814ab1cf539
          e867499280
Q0.y    = ddfa091b23fdd3e6e788b235f8f1374440a3215fb92f2808a83357
          a3159ad42c
Q1.x    = 24153d1e5bf1c6c8a3fa633e567914da91bb7be6f2d394dcbda30a
          362460c1dd
Q1.y    = 84c533e4ff6262b5c265b7c6b98d6fb3e0e1ee541dd69e1a5fdadc
          d53a90e354

msg     = abc
P.x     = 48151b7dd917612e859fc08c30d5ff3a8ec7a8f49b26d7e14407d1
          9f8b121918
P.y     = f241bf78ac5dc591e9e132ed9ae0d32ba3e49382ad42a17eeebe4f
          5454a10960
u[0]    = f97a75ba6f754a3882d3ec6a7355b45902cbc6a01263c435e15142
          5587c1b594
u[1]    = acb7b6b80dff405932784cf8bf7bfc823fe0b3e68f867b742c58a5
          498a18393a
Q0.x    = 44b426c9f471bc3443634a4077f558dd88e5c06e16d4b4eb2eb4ce
          374377ec31
Q0.y    = 48971fdfc2822b7657c68399aa4f1821b7769a6080627a5346ff58
          ef9e9ddb92
Q1.x    = 01a75028918d13c5c2ad346dd4cbb58bff4133fdc3428a5d1f860d
          d28e0088e7
Q1.y    = 93da916f22cd9b13917794aeaef2b90a29ea2de1f77868da2c1d3e
          02abe9891a

msg     = abcdef0123456789
P.x     = 270a85c60a344528b43b220f2954ef315e68db8c9020d13ffafb4f
          fd1a35f90b
P.y     = a8be495041e3723c8c24f14953a19b1be6912edb54bb479e7f13d7
          f42b621bef
u[0]    = 02199c04fe37aba8a1bccc138199c107f4121ebc9135c7a15fcaf6
          9b8b634a35
u[1]    = fd4111f827a78278806a1c88e5e2b4ecc1404f1c86b41d0ecc54f6
          a0c2d862d4
Q0.x    = 1b21c3e7446936cc000d27a2e7602c24eb54ac235af04f2cb084f7
          02b94af253
Q0.y    = 117d2056b490f0879eb72e606c160dc9312960b5d756a32c571fa6
          f12d6174ab
Q1.x    = 0c996f939ba6f9de3f18415b98c54f228da2a7271c1b486074d632
          90d27bcb3d
Q1.y    = 32ff2739de71175591b063d4e5b6cf804f9a0d9a2b1da537264ff1
          aa27e97be8

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = baaa6f8a8969a2e7544f93c6a8de7d4d041b6f2a80b07f2e815fc6
          96aa698934
P.y     = ddc7c31da16dcd2f9f1c1ed03c38954f9df073007e4d7c5b9a2c9c
          762f0a305f
u[0]    = 284b7ed376a950e27375c94bffa6f8ed6a182ea5e51605d0b43685
          d93e20bc64
u[1]    = 36e99c23a48e90d0ad0df5aa4f2aa3c0a00877bb4b2d1b11a81d91
          3230e3dc05
Q0.x    = 7bb7f4b2a9b9c1bb5a2d22cda128a786185636cf32cdca6fce7731
          cc3fa2565d
Q0.y    = eee67657bd5365190f7302823d09b20aaf270030dae976243b0c18
          2b977ae6f4
Q1.x    = c2e7e37fdf5488de3841ac4eefc21de207e187efccefea8bd62228
          57ca7a4410
Q1.y    = c6048ea525e7479c80694062512376d94bd2c00065d2b4215acf60
          2ce2bbd589
~~~

### secp256k1\_XMD:SHA-256\_SVDW\_NU\_

~~~
suite   = secp256k1_XMD:SHA-256_SVDW_NU_
dst     = secp256k1_XMD:SHA-256_SVDW_NU_TESTGEN

msg     =
P.x     = d5f2ac04a388212927ed7b8448db55ef22dcbd90d9e5debf206dd4
          5bc1250b87
P.y     = c04cb9752fdc475967a294da8f90817208e1489ae4d0dab2b0617f
          c9635379bd
u[0]    = 642587ff30ef636b582e8342c6a3f81ab349ea8a7d76cbd80c412c
          25eb924f0b
Q.x     = d5f2ac04a388212927ed7b8448db55ef22dcbd90d9e5debf206dd4
          5bc1250b87
Q.y     = c04cb9752fdc475967a294da8f90817208e1489ae4d0dab2b0617f
          c9635379bd

msg     = abc
P.x     = c2e2b95f97de0360ba4be8de5e6324ec83ccd3cd165a6063315d4e
          d57528bb50
P.y     = 2cec0d98c098fa8ba20efd99dcfba5e280f626166d233b8ba809a2
          2c4bae08f9
u[0]    = 3773e77cd90a5240e89a99a6c2bfd89be64432559ddd4dd24a1d20
          13f543bfaf
Q.x     = c2e2b95f97de0360ba4be8de5e6324ec83ccd3cd165a6063315d4e
          d57528bb50
Q.y     = 2cec0d98c098fa8ba20efd99dcfba5e280f626166d233b8ba809a2
          2c4bae08f9

msg     = abcdef0123456789
P.x     = a8e4fe519fadbd9040ca8f055e98d9ce595d44a1590ed9c6eb82d7
          18df9d579e
P.y     = e05e2e9f2e239108f3491d059aa80fa9480adcbf644ee37685ccf7
          1d54a3f84f
u[0]    = bd7bd1e4150da866c9d15824a66ffd186e8e91b47810d29a887334
          848fd87db3
Q.x     = a8e4fe519fadbd9040ca8f055e98d9ce595d44a1590ed9c6eb82d7
          18df9d579e
Q.y     = e05e2e9f2e239108f3491d059aa80fa9480adcbf644ee37685ccf7
          1d54a3f84f

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 49be71a6b06c0b505babd759c8639a955b12f1d4cbdc9fe755f30f
          0329923147
P.y     = f0718d3c31edc4e3c5b0745a313d25b7c24fde52bac894db257955
          4f67715830
u[0]    = 675c344812428d6ade56021a2c9eb566b5071ad75d369316534342
          00dfaf20b2
Q.x     = 49be71a6b06c0b505babd759c8639a955b12f1d4cbdc9fe755f30f
          0329923147
Q.y     = f0718d3c31edc4e3c5b0745a313d25b7c24fde52bac894db257955
          4f67715830
~~~

## BLS12-381 G1

### BLS12381G1\_XMD:SHA-256\_SSWU\_RO\_

~~~
suite   = BLS12381G1_XMD:SHA-256_SSWU_RO_
dst     = BLS12381G1_XMD:SHA-256_SSWU_RO_TESTGEN

msg     =
P.x     = 0576730ab036cbac1d95b38dca905586f28d0a59048db4e8778782
          d89bff856ddef89277ead5a21e2975c4a6e3d8c79e
P.y     = 1273e568bebf1864393c517f999b87c1eaa1b8432f95aea8160cd9
          81b5b05d8cd4a7cf00103b6ef87f728e4b547dd7ae
u[0]    = 0633af2b38973d1cfb6e905292c41f209fe52e5be989b5e0d32c06
          a0e3c23e4843927cb8289b440f3cde0da46dc9ba0d
u[1]    = 022474974e47d74c495de648eff1c8e4fabbae0d8ce3e30e3d1a5f
          9386cdf2582f78df056342d59ccca34321d93ef13d
Q0.x    = 0b63f31bcc08df890f35ee362c8538fac22cf22637aa2ba22d9c85
          bc1bda995926ab690d86830bf8ae06f4d537ccf6d7
Q0.y    = 0666f3763cc7b223ab237e313f6474c9a3c2f5ed985ee8d1faa092
          8b4b428ec1a366226125ce8f415edb3f706e71d80e
Q1.x    = 0362c0f9d6cf4b73309a16b439d096b3ead588ab03cff57daf56fe
          747ab6d7774d5bfc0bd0a55bbeb0f05ec25cc191f6
Q1.y    = 18d279b38babbd69aa176031655d138a731c049385aeef6eff3bf8
          0e45ebcad0a941cdfc135e9ea1690a25eb6eac38e5

msg     = abc
P.x     = 061daf0cc00d8912dac1d4cf5a7c32fca97f8b3bf3f805121888e5
          eb89f77f9a9f406569027ac6d0e61b1229f42c43d6
P.y     = 0de1601e5ba02cb637c1d35266f5700acee9850796dc88e860d022
          d7b9e7e3dce5950952e97861e5bb16d215c87f030d
u[0]    = 07df547923a0c77ddc4fea1a8a2eb156aef1746d5452239a55a378
          c5d3590e0b75cddff0eef2a9214a41923f2be27b55
u[1]    = 0f95fd8f00e25c3073ec07f249a7d527e580f01a6986158aeb064e
          d831d544fb9c5dbceb6604c908db5430d8f3d1c4f3
Q0.x    = 0e8334d819ca7fad50979a487e0bc95cb1410914f1d760f842fc3d
          d0102755e7ca81b0356da7b9771ab11bf50efbca67
Q0.y    = 120397edf7002610f907c2d4ecfcc4e817f1f8915becb591951079
          6bf595d854048461662ad960347216b00dfc79db38
Q1.x    = 013e1240e4da2abda009e263089cb8e57f1b24d0d1df09f644cc9c
          9a8b3fde7d154c7f1b0895a0af22b902a8140fb3ce
Q1.y    = 0d6a9f75f2088dcac8f8ec0ab94bf2dac23b7b832bf23c91f9241f
          753c5831054b058192351a972347cb19806e78477d

msg     = abcdef0123456789
P.x     = 0fb3455436843e76079c7cf3dfef75e5a104dfe257a29a850c1455
          68d500ad31ccfe79be9ae0ea31a722548070cf98cd
P.y     = 177989f7e2c751658df1b26943ee829d3ebcf131d8f805571712f3
          a7527ee5334ecff8a97fc2a50cea86f5e6212e9a57
u[0]    = 0a5d2ed6108aa08d652ab61af11c12d8750ed179cb962779c7b539
          3f219ad4b78b7b252a2896a341ad451e93f1904fb0
u[1]    = 17d6cd69f4bd29b85c550539a296c76ced075d9d39a81f4cdc2804
          a7184ff9ea4a5a85dac4a2a61e317894d0fba55740
Q0.x    = 03ff794b445b926906b2fa710ba5db9f7b8689429a1630ab672854
          b5ba1a7c59bf3667d64aa63824a8798dcb631bfa9a
Q0.y    = 1581711cffadabb6136f4bf57749e04b92787c7486da6b6da1fa75
          8655c9af275b23540370d9f3987a100f0d3dc8e6db
Q1.x    = 133bdea6715b4ef780693cd0055025b221becc8e04506a77648459
          0df9b43af62ef402778a9c98ec540bc293e9741565
Q1.y    = 0d953a5bdb2d16e62bfeab742e70ea64fddd83e8210b2416d40a02
          b0d90986fd0d00a3d77751ac467964ecc037dc284a

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 0514af2137c1ae1d78d5cb97ee606ea142824c199f0f25ac463a0c
          78200de57640d34686521d3e9cf6b3721834f8a038
P.y     = 047a85d6898416a0899e26219bca7c4f0fa682717199de196b02b9
          5eaf9fb55456ac3b810e78571a1b7f5692b7c58ab6
u[0]    = 111e524a9da7ae49a1cf6b03f5bc9d374f16951dcba59d03529a94
          afd4e5ba171fb1dffa373d13993503d594abd1b5ed
u[1]    = 006ad90d8d5101c88db3923376f2a33ff922ba39342d1a54627857
          96b6ebdec10dedb5e9cd9ff8e611af939f7f617844
Q0.x    = 17dc55e956f1e24c800fa6a61ccba179fbba6bbe27e96ab16b862d
          efa4782d567f8733f1ee39acd7b665ba0204318d7f
Q0.y    = 0252510413c32677817c4ee5f84e4c8f66721e489913a50eac550f
          41ad48b01b763ec9eed5bd68bcac76131ca9ebd741
Q1.x    = 03d2f5444d39ed19b6087cd684d2a72795038d1ffe9ab120f7e5ce
          41fb48af76bba3eb4efc8a696418fcb3c5cfdbfd94
Q1.y    = 061a1fe191cbf373b74d5f642148722160b5524dd2c06a49c5e4d5
          480966de5b0854d53cbea144b482fa687eaf9fdc66
~~~

### BLS12381G1\_XMD:SHA-256\_SSWU\_NU\_

~~~
suite   = BLS12381G1_XMD:SHA-256_SSWU_NU_
dst     = BLS12381G1_XMD:SHA-256_SSWU_NU_TESTGEN

msg     =
P.x     = 1223effdbb2d38152495a864d78eee14cb0992d89a241707abb038
          19a91a6d2fd65854ab9a69e9aacb0cbebfd490732c
P.y     = 0f925d61e0b235ecd945cbf0309291878df0d06e5d80d6b84aa4ff
          3e00633b26f9a7cb3523ef737d90e6d71e8b98b2d5
u[0]    = 07fdf49ea58e96015d61f6b5c9d1c8f277146a533ae7fbca2a8ef4
          c41055cd961fbc6e26979b5554e4b4f22330c0e16d
Q.x     = 062bef7110b5a85023eb7766d8b923f654cb65ef23acc571de3266
          e46fb87c2efe7ed2b07f7d078dcb0970f30545523d
Q.y     = 095aaedd31b4bfecd080de37112afa90db9bb15e3798b122f8b7c9
          3ff7984b8a41233d5ee994a4fceae1b8162dcc0cac

msg     = abc
P.x     = 179d3fd0b4fb1da43aad06cea1fb3f828806ddb1b1fa9424b1e394
          4dfdbab6e763c42636404017da03099af0dcca0fd6
P.y     = 0d037cb1c6d495c0f5f22b061d23f1be3d7fe64d3c6820cfcd99b6
          b36fa69f7b4c1f4addba2ae7aa46fb25901ab483e4
u[0]    = 1275ab3adbf824a169ed4b1fd669b49cf406d822f7fe90d6b2f8c6
          01b5348436f89761bb1ad89a6fb1137cd91810e5d2
Q.x     = 0ac8969372efb9ae5f9b6d53a440f4a57d9ff2e40b4903f8d167d5
          8ba59ead7218a06b4b1821f2ca28ab1239502e1de2
Q.y     = 01541a3325e7311a4aabff560a091467b847ffca590e1aaf354aae
          e1a6075d050ddd556d9c28e1fbfb97ca8749a8d68d

msg     = abcdef0123456789
P.x     = 15aa66c77eded1209db694e8b1ba49daf8b686733afaa7b68c683d
          0b01788dfb0617a2e2d04c0856db4981921d3004af
P.y     = 0952bb2f61739dd1d201dd0a79d74cda3285403d47655ee886afe8
          60593a8a4e51c5b77a22d2133e3a4280eaaaa8b788
u[0]    = 0e93d11d30de6d84b8578827856f5c05feef36083eef0b7b263e35
          ecb9b56e86299614a042e57d467fa20948e8564909
Q.x     = 07f6e801e5102c171d6fdaf312be3b1bb2d01c9c4842ebf199d703
          51abf8c28e24347fa87694f72952c9e1a46f83d3e3
Q.y     = 17dd3a8bf9d7f433a33f15ccb0b8e9e26e850cbe7c87293887ec70
          4aa5dc8454b22299ff0eaecbf487a761a5625c81ee

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 06328ce5106e837935e8da84bd9af473422e62492930aa5f460369
          baad9545defa468d9399854c23a75495d2a80487ee
P.y     = 094bfdfe3e552447433b5a00967498a3f1314b86ce7a7164c8a8f4
          131f99333b30a574607e301d5f774172c627fd0bca
u[0]    = 015a41481155d17074d20be6d8ec4d46632a51521cd9c916e265bd
          9b47343b3689979b50708c8546cbc2916b86cb1a3a
Q.x     = 053a91131611b1160954bdd0e69ffac08246ec85067a5dffb9f90e
          24623975265f798212fce88b41b2e67a7934fcfcfc
Q.y     = 1913fd2b7c72b8b702a87906c6f98e1e81b5c6774f1fd708118d5f
          2b9d90f4c756e79df8c9323af7a203b94a2018546a
~~~

### BLS12381G1\_XMD:SHA-256\_SVDW\_RO\_

~~~
suite   = BLS12381G1_XMD:SHA-256_SVDW_RO_
dst     = BLS12381G1_XMD:SHA-256_SVDW_RO_TESTGEN

msg     =
P.x     = 163505b44d4a47de22946139337d787f93f4356075c55401f4fdbe
          b3ede4f3138684e2437e50175f94eac511d7c673d6
P.y     = 0d09a4540a792daf4d0368f20afb5bd859e537e362edfc9b6f3529
          0b6d05df90937ea91e6277d1cb91638c1abaec4eca
u[0]    = 10baa9e54a51ad63c6d8675830a2d74c43abd00a4e56432e90aa77
          ccf95997286d3b7bf1f61059b76663878995426b9d
u[1]    = 0acf2dcf2bf547d48c01b96379801bd7e2b9f815f22132a07d1ae1
          ffe49040825ba7b28082696a67b3de2cf9de5f886f
Q0.x    = 04c5db8bf2c09bda41eab080eb6ffed00f30d4c650a0c0c8cb136d
          9041a9e9b420aa5737fc8dcd1ec2eda971b4bbf7e1
Q0.y    = 05b8cc1054ff8ec690a4c073649b474b7b96f2b26ebf83cdd35419
          7ab89f66d78f120407a934d5aac78913d16a8092a5
Q1.x    = 0ace795fe3b2f40cceda72f6fc9086009db87b1e63e906df2eeca7
          48df8f961ae3c83e83bf6c11b5d833e7b93c8911f6
Q1.y    = 02be94da9204c38c42828e677cc941184b62ab9aaebe408f90035c
          50afd732611550dcd31cec9625874596c8d45dd2f5

msg     = abc
P.x     = 02967a7955df3c43807263e9d33c28912daebcdf915ada74ea6ec1
          31210a3f304d97a59d6e3b7bcd98d84f61efb2f659
P.y     = 13dab558fae67943edd68f571bdc82ad6944f2d80285d9f578d4b1
          be0d7b4641c653ca52f13eb3474922617c00e4eab5
u[0]    = 12b51a783412cbfae1f1b20d7000184c74c889382dc65762ad98a8
          d6d654aec9a05fa4621693072c67e41987e36b3998
u[1]    = 150a735bb2fb20d4b6221a2d20cfbe275826a63a38f04f757ac63a
          35dc0a26041d842e9d7f27e3394a007bbeee92fe85
Q0.x    = 118e12a015459f171fa12049d2bf7a43aa2d07b10709c2e21757f1
          91cc60a3313e447c4ceefb3dc89e05893af65b133d
Q0.y    = 0c02fa378304433efcf458c0cc531b72b8613e425cb8404be8612a
          ee0f7850724ed2a6c6d02a8310cf381b99c85293c6
Q1.x    = 107450b1fd1a5e7b8fdf96cd40da9c1919ba86c124160ab6d5d2ed
          9f83ee8f97c1530437f6f811fa4f4cd1d0a7d69c42
Q1.y    = 039185c9fb255a0ac30d091675f02d29bfcf6045b1532384056876
          a389819d48da77fd71669516e7c98e12da273cddd7

msg     = abcdef0123456789
P.x     = 084b64b095e373b86441e9fe737a3f8e56fe7f0016a973ed9938db
          9958505a8927ca220d8e8235901d4bc1dccd4362bb
P.y     = 0fd10114cded64bf037d3ba00b4a85e5f19847535dbc960bdaaa8a
          92bbb9d8a845dc355370ed0edb9d4403afc39bd30c
u[0]    = 163831497fddb01bbad44e3f592ad34635579e055d36be71d53bec
          8b22c27525a471ea058bea4a188a857861fd1af802
u[1]    = 0cf8d175460236795d8163d01d5068d82b218295a1f8a8eca094ce
          27ff208ab5c9c3f4212e3fcdef3980a267598f6830
Q0.x    = 01bbafd66bbe5955cf186e1b050f962f7a2efa4f03ff50353dbda7
          8568f5541aa8582c25057a9fe414f9a1bd82eccf0a
Q0.y    = 0c96fd01df526fda79643a45b1ec5d435e63a3af5cf4088f30c073
          02ff8e0a271aff59e5da618ab9b89326fe8b4338fa
Q1.x    = 086bb205df6314011dedc477b201229f383c1e2585b5aaf269fc67
          62ccb2397690064429dddbf9f304367508aac0fe83
Q1.y    = 02f80d27fd2981db284b0f66cf3d8e06f751464e610009b9f3fbb8
          18f526ff85f7f1a38ea3c85008c5814ff19d05a1ee

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 1362872938edd5f0f648d3f8f71225b38a9bbf6c28dee168d76b27
          4125ef4596d1959dfa622861848b2bf713fda12601
P.y     = 0308f950d4321be5e06a751aee088d09da8fdb36c4bc6b801d529e
          43250f3e90d55c8d9fea6d3762912f92866bd89d02
u[0]    = 130bc594dc2a536afba69280db5d4675051f5eb3a5d147290874f5
          3fd275acddf4faca77145fb23aa6d9357a00e0a4f4
u[1]    = 02e5a19a37149c402114906448c3f7558125edbfce8c5241056d32
          bac7980d95d820ecf23dbfa5eafa9c4f8c3dbb4b70
Q0.x    = 17f78156bb227c0fefb04a3d58f7315cd7eb696e52b7efeef9fa82
          171e8c6d8dd265f7fcffa8e6e734c6cc2611363e80
Q0.y    = 000a6e05625536b8cc8fff02ebe2ff0a6f137d5f0b644afae033fd
          bec60e41e281383e97333a342e3492baeddf637e36
Q1.x    = 191f209664bd324339cbbc4e3afe7e713fd47e57c476ff8c224bef
          6b59745384ec6f15edd912c56336299733b9650f3a
Q1.y    = 108c7a3b7d2e6c83e1e9bbcb03960a3b9115d871cce130d8622576
          339bbb3fd02565de45b06620d557e9244c4a4944d8
~~~

### BLS12381G1\_XMD:SHA-256\_SVDW\_NU\_

~~~
suite   = BLS12381G1_XMD:SHA-256_SVDW_NU_
dst     = BLS12381G1_XMD:SHA-256_SVDW_NU_TESTGEN

msg     =
P.x     = 10a5d58b52dc8b0e5b9c83e5e5ca49cc48d9efe5018d4d9816200b
          2e6a2ed51a64f62bd413f1139d7504bae8e777e970
P.y     = 10a24635478b4cb41a2919057d76d4b41bf41ebf23f8622f6f709e
          722a7f4922ccfd001ead45f275685b5136e0d09012
u[0]    = 118f642bd1c2a29911bb43e9838991f9399c41e3bf92a71b9219c8
          a5edbdce319f51b90e72b949848851b608e0caee0e
Q.x     = 008b9526bf4806b9157907fbfdf03849905a586ab3b4faa2e1287d
          54b151639c1c4e49e02c03df7e77384eab5f05b559
Q.y     = 0888e71e577d22fa3891063e89307590efa7eaac676ce879afc53a
          79155698f4ee55008e66be14dd77cf7ff41c55722a

msg     = abc
P.x     = 0dead3d3db337422694f10ba8e2391fffb6efff65c6bd60f624d0c
          e10fa200481a72ce0aaad111a4410a38a4b4108a46
P.y     = 0038a800c995de01127f278169d365089cfa9ef09efd538dee91c9
          7c8ec40891df0f50843864ad23904129d5b4f4a1d6
u[0]    = 08a8225bcdee1e9db85e01ebee4b14a8825cc401189ae1c0474b48
          3b0970b28e1ac12082c22954bfbb825fdcef77ecdc
Q.x     = 12e095c062d0a4358c5b382f8610e6104aed69944447f0d04b0a9f
          0afd378e8fa8de4f0711168cd3aff501a145615503
Q.y     = 0fe86fc6d6e51c6f9d75fc83c9da98a724a062ed25934740219653
          228b882182d6a4fac1a42480228db3c12344d2145e

msg     = abcdef0123456789
P.x     = 15651e258c566dc7527a165698f8d71157078344c2dd359d220cf0
          0168e536ec89222681f49c0b9b4cd0e8ffe85fcce7
P.y     = 0077640379dd49d0ac509ac041a5f3c8a54cddbc6add66d5ce4ff8
          6896fb293f43696ad6c628400be7fba6b058e3db8c
u[0]    = 0979bb7682c048cc9fe6b9cbd69a009a8347ae1fe3931b3afe24c2
          9867adb96aa967e7682b3a47f9b9567c8551218a46
Q.x     = 0319e7028069c8fc4ab9155d810c607186b9f97f854018d195f717
          34039f83fd42d839dcdc044acb91db25d155c5fa58
Q.y     = 1171bd0048f0741d7f2b5f1316678b5017cdc2d2efd28ef9d81406
          33b200d57343b04d9f1ae25d9ef4a1bccdb57bbda8

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 06b8d589c3d2018d069d4cc57a359402a27ccb5bc017d9a2d67762
          720a63afb9e2a12c0c417becc4b51efcb39e8cd2d4
P.y     = 1307d340e6d9d16d822105a014419e9f6be6dd3fdbc42e2f960990
          58a9fa24f17d81d4ce82cbd473bbe51bc95e988751
u[0]    = 0aeef9f4c2881a00b584bcfe2fe19b861cb00fef6edcc5779b3217
          8e952f033bf9066489921612cf3d25a8be095809d1
Q.x     = 138307c4c46b63f05521143275b28a48a6ee2dbccef2b75e77e872
          57b775a346905090bbfe4c35948bc76be1a6307b33
Q.y     = 1668fe7bd31692c9ed74c657d631e82faa5aba8f89703870def397
          4fe42947b1f36f2f3787e7f690ebf2fc8fb6e91dd1
~~~

## BLS12-381 G2

### BLS12381G2\_XMD:SHA-256\_SSWU\_RO\_

~~~
suite   = BLS12381G2_XMD:SHA-256_SSWU_RO_
dst     = BLS12381G2_XMD:SHA-256_SSWU_RO_TESTGEN

msg     =
P.x     = 0a650bd36ae7455cb3fe5d8bb1310594551456f5c6593aec9ee0c0
          3d2f6cb693bd2c5e99d4e23cbaec767609314f51d3
    + I * 0fbdae26f9f9586a46d4b0b70390d09064ef2afe5c99348438a3c7
          d9756471e015cb534204c1b6824617a85024c772dc
P.y     = 0d8d49e7737d8f9fc5cef7c4b8817633103faf2613016cb86a1f3f
          c29968fe2413e232d9208d2d74a89bf7a48ac36f83
    + I * 02e5cf8f9b7348428cc9e66b9a9b36fe45ba0b0a146290c3a68d92
          895b1af0e1f2d9f889fb412670ae8478d8abd4c5aa
u[0]    = 0ae8ca9aed945924c3a12f3b6f419cac381bae8f16044ab6c66b41
          999e4bd0ea169b44f2fce3634a0ddea05b9186c6b2
    + I * 1134506e471554affe377f908c29fc7cd7d247b3a14f9e092b9f4c
          5b02577939ce01bd6b43d9d59d9a994e9fb5fb5096
u[1]    = 0b28b14113885b1d8ad08f5da9111add00d8c496fb3d5d7b5d3b65
          58a058e9e62cd02dafa7a95f968cb3063f09fc0e21
    + I * 03378e456f437ce445b6bc95121566d85b1b3b8ca057064fe7a8a1
          aad7e8a6e9f886cfb1704ad712e9042f4f002f4bd1
Q0.x    = 090f7997311a1d4ec54520f81046063f4e9e7a64570133dc41c360
          0ade2a4d21aae59714cf290f95f90a98b658f5b64a
    + I * 08427a6a0dc88a36698823d07ab25d11f95a9508cb5bb1ad2bd57b
          c02b5efb8c7b1da66ed02b0f915002446e24fd5d38
Q0.y    = 10e03a54fd5ff7a0a69543aeeef42e22cb589e0b33455943cf84f0
          c5b28e93fe17c0bbba2fafb10aea29b28705eec303
    + I * 053b939496e87877fb1569c911bf618056396fac2458757da71cd8
          3fa152239d605c6a4e4e847295080ea3874f84a832
Q1.x    = 0df5643a19f8de7e8e45575551cfb8909f4a75722ec8fbc43cb8df
          284cdde9e2c61ea0c6116bdd86d84063c96fc7dc7f
    + I * 1241a410598f1d57907850699a694720712feddb916f343db08f2c
          18481df46cbdf7afe8eaf214127e427736ea281c5b
Q1.y    = 0ad66ed30cb6f55a83feed4b12c141bd41f593292403127b07e1bc
          6dabacd8ea53f8a322b5d4080e4393184c713865fa
    + I * 0c4e6fb11ad2fe3a081a399df36094465aafb232f7564f4d35abb0
          092ef9ee855bcfdac2e6775cd7d383241f13ed856a

msg     = abc
P.x     = 1953ce6d4267939c7360756d9cca8eb34aac4633ef35369a7dc249
          445069888e7d1b3f9d2e75fbd468fbcbba7110ea02
    + I * 03578447618463deb106b60e609c6f7cc446dc6035f84a72801ba1
          7c94cd800583b493b948eff0033f09086fdd7f6175
P.y     = 0882ab045b8fe4d7d557ebb59a63a35ac9f3d312581b509af0f8ea
          a2960cbc5e1e36bb969b6e22980b5cbdd0787fcf4e
    + I * 0184d26779ae9d4670aca9b267dbd4d3b30443ad05b8546d36a195
          686e1ccc3a59194aea05ed5bce7c3144a29ec047c4
u[0]    = 0a7d239c9bdb41ed2ad810820a8b4f0703f60cf5833440cd684e38
          6e235b0f092da91adbaa69562b911ebd3f820655f2
    + I * 16302b56f5a9f538c7168cd5194957903b82be6749171f8de112c8
          bd3360ca24847d0567d6e42eae0c43a7fd8530b378
u[1]    = 0a1cb4196dec71b1f704f3533cdf27f247e3ea175ddcc1ca6df0f4
          5c587eb77efc6c493848f4df98e24a32753dfcf96b
    + I * 07aac42db7f3dfbc5146c70ca0ac6157893abf4e2162e303510e0c
          efb8d024c24080b9c2a9896f6c03ffe680fc18b788
Q0.x    = 0c292ac371849207564e7b8f4edf47dc4b4d7a618dbacf6a322dc7
          32f014cc2a22049eb69de11657c301cb4202b98541
    + I * 0f37118e477c16005cae8f639e54119ff796eafe80461bf39ecce5
          c0192b93075febc80d4f73f9e0893adafa17b13b45
Q0.y    = 15853304d7fd9f47df2ef6c4bd1fb0b3500386b23d1acc530be0c1
          4e027f15b0aa83856d82edb723f3d857358ecffb80
    + I * 0626fcfc6b3d8460df7ed2aeca6449cf6701dc7ff51c143ed20054
          ecf18732f4c5985455864c79a4065b13e26ecccf9f
Q1.x    = 0bce3e2dd15f6acf55cce0e3a4cde190a6d45434a8b0ba7cf79ff3
          7f737ed90dbfd2988a257db65e10e684e5876b50db
    + I * 19c1ad3eb0abb3590087d706eb155a4cd166484e82cdccb2465ce1
          93b15a27d919aaa37d1824a9a9d87f31fefca1baee
Q1.y    = 110c9643a8dfd00123bb9e6a956426f26bedb0d430130026ce49b8
          62431e80f5e306850239c857474f564915fc9a4ba6
    + I * 1748ca13032a2c262295863897a15cd9a7e0baf003336bec6fc6e4
          0b982d866fe3250619fdd2ceadb49fab8055f47e65

msg     = abcdef0123456789
P.x     = 17b461fc3b96a30c2408958cbfa5f5927b6063a8ad199d5ebf2d7c
          deffa9c20c85487204804fab53f950b2f87db365aa
    + I * 195fad48982e186ce3c5c82133aefc9b26d55979b6f530992a8849
          d4263ec5d57f7a181553c8799bcc83da44847bdc8d
P.y     = 174a3473a3af2d0302b9065e895ca4adba4ece6ce0b41148ba5970
          01abb152f852dd9a96fb45c9de0a43d944746f833e
    + I * 005cdf3d984e3391e7e969276fb4bc02323c5924a4449af167030d
          855acc2600cf3d4fab025432c6d868c79571a95bef
u[0]    = 0e17df0242a3dd0e7454a4b580cafdc956650736b45181b329ca89
          ee2348570a1d7a221554c7122b91e6e3c3525d396d
    + I * 0298e9fa0ff37440cd2862e91c0a27fed05087247acf79232f1a4e
          b7cf8f65997a92319a8cbd00f7b73ee9e82241eade
u[1]    = 1200056764f11beacdb6009acaf823e100da27b4bfe45e94097a52
          c1fed615b32dbc5503f964ab5277a7c30d9a2bf0de
    + I * 0d1d7feb418f29dbf4d4459c839dd33f904d4292d016f701b35e4a
          7611798c83de1b7deb1c6c1521e9142cc36a7d0579
Q0.x    = 1552566a422494f9edd07e21ee59067ecf031f333b3961b710fac1
          245fd003552c294ac47ef982432f0f1e1e9d07c4b6
    + I * 115a9de418d20ce3105eaa2db025d183cc679327c6d6a229960d53
          6b9fce33d3242f9819680a9200265ec2dd02b44b19
Q0.y    = 0cef664ee9270354c3bc06d1e0570e4d6663cc528711afca101189
          55990126f87917c87f7b9c4cf73aaf05c1b5875c6f
    + I * 0b136f41d233ea420bc3658c4156f717fb190775d3690d139c0923
          c231e44af54d780119b8edf16038208b63feb1f3ee
Q1.x    = 0332d5027c68f38ca78c6c63c013178fb58b31283a6135f6bf5629
          d18c76144accfd96905f51a49284f4ef622dfec003
    + I * 04865f680c5f2203de00f95dd6652c9b3dc0d36361ee0df16a39a8
          6d5f7cfc8df3674f3c3fddde88fb027353eac1a3dc
Q1.y    = 1651e6cc8af2241989a9006dd59a9cd41fc1bbc3a7f9e32875889a
          e54913b8398dfa106aff43ff1cfa9019141d9ad565
    + I * 09324bdbfedfb886899a7961f7827702743ef550f548bb89ab15d4
          b24c7c086196891fc300e3e39c21aec0257543a3fd

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 0a162306f3b0f2bb326f0c4fb0e1fea020019c3af796dcd1d7264f
          50ddae94cacf3cade74603834d44b9ab3d5d0a6c98
    + I * 123b6bd9feeba26dd4ad00f8bfda2718c9700dc093ea5287d77118
          44644eb981848316d3f3f57d5d3a652c6cdc816aca
P.y     = 15c1d4f1a685bb63ee67ca1fd96155e3d091e852a684b78d085fd3
          4f6091e5249ddddbdcf2e7ec82ce6c04c63647eeb7
    + I * 05483f3b96d9252dd4fc0868344dfaf3c9d145e3387db23fa8e449
          304fab6a7b6ec9c15f05c0a1ea66ff0efcc03e001a
u[0]    = 0ca92554c8c45581eac2eed7ec2db1fe757af0a2803dc8e6318060
          0eed2516f64b1c0d850c72a75c417f58723815795b
    + I * 12ef692f69b1d61854b80e071c7fd751b19da2c194ba0fbee9e684
          54073dd3693e2c56852938aa1b090991018ff15a94
u[1]    = 11043d352059287fe7424285da213d4cc414df4d5592ee25075030
          88b3f89220697753ea8cd47fa13c9a15dbfb0ef20c
    + I * 110efeacfff2801024c019cee7adbc3d8144c3b73c548ad8f0759c
          4976e0b3070293056f884dc0a1b3728546dddc6bcb
Q0.x    = 089b04f318946ce75b5b8c98607041488005ed412a4a99e7106b34
          0427d35682036cecc076827e700e47c17f65ee3f09
    + I * 03bef411c75f97147673952b19ee293e28df019be2fdecf5db09af
          b7caad4a5e984750b19c2007b50ae0b26f83088e8b
Q0.y    = 18b1ef96738c5df727e1fa2098178fe371751c0c169af30bdb95be
          22a0ecbf0a75c0e6c63e4a32f241250f877859c086
    + I * 0d04c624db798ca46a352637fa76516c83a5d98e147a25f629fb1e
          02a9a453970e42d835ba765bd7d94a4a3f9f50e4a1
Q1.x    = 121b1257fbd3dda5f478b5de6aee2ca88780248c59afad1a9c9c9d
          b5d03752792270cecc7cc676a1b91ee898b7f76977
    + I * 17eadb5c134a1cc0305ad5d99f6e2a1cd906a2fdac318d4356527c
          70fc94242ddb664486c814ebd5959a2cf4225a783a
Q1.y    = 00f0793bcfaf12e5d23fdd4173f7539e3cf182a0f5a1c98b488f59
          daca5ecf7b694912a93f6b81498a5c2282c09ee63f
    + I * 081adf3c45b42c35fdb678c8bdec1d8c12f9d5a30b22cf52c1afc9
          67d6ddc82fdae0673f76a5186a84f3602c7a22f6b8
~~~

### BLS12381G2\_XMD:SHA-256\_SSWU\_NU\_

~~~
suite   = BLS12381G2_XMD:SHA-256_SSWU_NU_
dst     = BLS12381G2_XMD:SHA-256_SSWU_NU_TESTGEN

msg     =
P.x     = 027e4bfada0b47f9f07e04aec463c7371e68f2fd0c738cd517932e
          a3801a35acf09db018deda57387b0f270f7a219e4d
    + I * 0d4333b77becbf9f9dfa3ca928002233d1ecc854b1447e5a71f751
          c9042d000f42db91c1d6649a5e0ad22bd7bf7398b8
P.y     = 053674cba9ef516ddc218fedb37324e6c47de27f88ab7ef123b006
          127d738293c0277187f7e2f80a299a24d84ed03da7
    + I * 0cc76dc777ea0d447e02a41004f37a0a7b1fafb6746884e8d9fc27
          6716ccf47e4e0899548a2ec71c2bdf1a2a50e876db
u[0]    = 0e775d7827adf385b83e20e4445bd3fab21d7b4498426daf3c1d60
          8b9d41e9edb5eda0df022e753b8bb4bc3bb7db4914
    + I * 025fbc07711ba267b7e70c82caa70a16fbb1d470ae24ceef307f5e
          2000751677820b7013ad4e25492dcf30052d3e5eca
Q.x     = 0155447bd67775ed9eaf35db498e8acf00b9240a8b336b284d4be1
          558036495c5872384378c0931b888f85575768f52f
    + I * 09fbb2d6ee99f38a93c38c891cb28c5e2f18e97c78c7b74fbbb2d4
          d21c1b02dd05170a3734bdf7ca97ac17091b85b1fc
Q.y     = 17d2d52554474a2cc19322bce0c3079671043190fc6d33679530df
          9341bf23424b2aa4470de343e65ab1b1a3c1f380d7
    + I * 052e9100ee074779a4da267cd34ba58be71f373b05ea5f9fb4a28d
          fb279a9129efd5f22156b2d3ae2b3c52ac0fc7004c

msg     = abc
P.x     = 09349f1cb5b2e55489dcd45a38545343451cc30a1681c57acd4fb0
          a6db125f8352c09f4a67eb7d1d8242cb7d3405f97b
    + I * 18f0f87b40af67c056915dbaf48534c592524e82c1c2b50c3734d0
          2c0172c80df780a60b5683759298a3303c5d942778
P.y     = 02f2d9deb2c7742512f5b8230bf0fd83ea42279d7d39779543c1a4
          3b61c885982b611f6a7a24b514995e8a098496b811
    + I * 10a2ba341bc689ab947b7941ce6ef39be17acaab067bd32bd652b4
          71ab0792c53a2bd03bdac47f96aaafe96e441f63c0
u[0]    = 045ab31ce4b5a8ba7c4b2851b64f063a66cd1223d3c85005b78e1b
          eee65e33c90ceef0244e45fc45a5e1d6eab6644fdb
    + I * 1870a7dbfd2a1deb74015a3546b20f598041bf5d5202997956a94a
          368d30d3f70f18cdaa1d33ce970a4e16af961cbdcb
Q.x     = 0d158306276e64752eb05c697c0e982c1f120d36a0001c20910632
          b8ef4de742ff03b77a1d5313c0c5b015249d804713
    + I * 03511e20d69ecd16eb9ed9bcbb500593abdf9b9dae12621a3b7faf
          fe3d2a78ecf9e1526b710ea9773a8b36e1c358f3e3
Q.y     = 1299a622ac19a0cd8215b9d3d64916770894d9af261e25b0c6dce3
          cd4025fa1ac58c4f20ca49f58db59ac4403f274dcc
    + I * 0cebbb186aa40e6ee61380ea20f21a1ce304ad0a0ca2c5126be0ff
          18863ee17494e0da7e63eb8184b6d6e7c8b2a09bb4

msg     = abcdef0123456789
P.x     = 149fe43777d34f0d25430dea463889bd9393bdfb4932946db23671
          727081c629ebb98a89604f3433fba1c67d356a4af7
    + I * 19808ec5930a53c7cf5912ccce1cc33f1b3dcff24a53ce1cc4cba4
          1fd6996dbed4843ccdd2eaf6a0cd801e562718d163
P.y     = 04c0d6793a766233b2982087b5f4a254f261003ccb3262ea7c5090
          3eecef3e871d1502c293f9e063d7d293f6384f4551
    + I * 04783e391c30c83f805ca271e353582fdf19d159f6a4c39b73acbb
          637a9b8ac820cfbe2738d683368a7c07ad020e3e33
u[0]    = 0b6e6135a4cd31ba980ddbd115ac48abef7ec60e226f264d7befe0
          02c165f3a496f36f76dd524efd75d17422558d10b4
    + I * 088fe329b054db8a6474f21a7fbfdf17b4c18044db299d9007af58
          2c3d5f17d00e56d99921d4b5640fce44b05219b5de
Q.x     = 12e15bef85566a4587d120dc054c935f2ffb198aa0f70137b02c40
          6ddbb80e01844e3efb7f4457f304d85410a5cb0e21
    + I * 01a3026ebdf89e103658689c35316e87c2de54633bc5548104b48c
          87690cb15008dde3cb0386923ff9cf89022adfb6ff
Q.y     = 068beb96b5ff990c8a44bd85e7dd2739dffd8942d749db0ac71273
          74d4818b35e35266c708a74e904cc18c464fb0fa8a
    + I * 0c9d5a6359f809813ffc2a17357a6f92d08fc6ccf098309ee27dd5
          27ba8ce43087971b963da5c663e958b7bbec04b105

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 0804152cbf8474669ad7d1796ab92d7ca21f32d8bed70898a748ed
          4e4e0ec557069003732fc86866d938538a2ae95552
    + I * 0b8e0094c886487870372eb6264613a6a087c7eb9804fab789be4e
          47a57b29eb19b1983a51165a1b5eb025865e9fc63a
P.y     = 09e5c8242dd7281ad32c03fe4af3f19167770016255fb25ad9b67e
          c51d62fade31a1af101e8f6172ec2ee8857662be3a
    + I * 14c80f068ece15a3936bb00c3c883966f75b4e8d9ddde809c11f78
          1ab92d23a2d1d103ad48f6f3bb158bf3e3a4063449
u[0]    = 0f45b50647d67485295aa9eb2d91a877b44813677c67c8d35b2173
          ff3ba95f7bd0806f9ca8a1436b8b9d14ee81da4d7e
    + I * 03df16a66a05e4c1188c234788f43896e0565bfb64ac49b9639e6b
          284cc47dad73c47bb4ea7e677db8d496beb907fbb6
Q.x     = 17b0481e72cb03d59686907d10243ca3208078151e4881c8754503
          587676512e182cc82b24e906a0b4ccf95e5adeb7fa
    + I * 09f9a74ec1f83ee91991c40858051460f1253283f101afc155b4fb
          141af20ae84714cda88ee0bbcceb3cc010c2b3172a
Q.y     = 0cf1edfd25dfadc366eb5b92d6d300b68a9a01deb833b754fec39e
          c049b70e8b8023c4abb1386a8c8419d44d414d7416
    + I * 0eb4061e6ee7136fa62bcb68df9b1750ad85fc225050f06669d715
          3bb96df7cea2eb1837aa2d482eeb1c4077c8885db9
~~~

### BLS12381G2\_XMD:SHA-256\_SVDW\_RO\_

~~~
suite   = BLS12381G2_XMD:SHA-256_SVDW_RO_
dst     = BLS12381G2_XMD:SHA-256_SVDW_RO_TESTGEN

msg     =
P.x     = 1247e409b2a18aa704b37c891ad429af1e81a7d03d97c1651d072a
          63acc5585967939adfe6b41e608c4cf1444be4ebaf
    + I * 1379e10a574e45e6e8ffc3d403bf975984237d4e0dd350a2209ee5
          025b738827620301e71bfe4449af7b9ea2a8fc0464
P.y     = 0f171ce60457b1bf85847e48469e8a50e28b26e126201664b2eb96
          2abe38c0eb2e1e84c953521c6e8cd82fe25fca520a
    + I * 02663ec2937ebd48810bbd17d88f03e9abea73025d7a59c5b7a0db
          80ac3bde5b1b6fb55f825686d170702f9a0b354e7b
u[0]    = 011a69c0b78b463729c1e9e6c7a543d4c10e1880a6a5c92748db67
          08c7492b170912c46abf43a50d6af40345ceeb16db
    + I * 1216c67865d83536ff57ed9480ac3ee581b7edc25860f73e2ed967
          c40f5647a4bc25d54538e14a0404d550acdbe8056f
u[1]    = 190bfaa5cd1654a6f71bcff0265236fc73a1a8c72f637b13fa9e3b
          7c69ad7a82de6419893f1a4f46b0aefeee08a5f877
    + I * 001af2852d68aefb42258ae84e63fa04f45e0603a54d245882a2e2
          373484d49277d885983e300dcc8a7632c476f6654e
Q0.x    = 0c518ce5d2e9e96a19ce4737e4f60ef6273231e706540bca662697
          e16303f0066ace3544d272492b5c01ab2a20d08d0f
    + I * 132f304e07b3a827b26eacbb0e3af39a32b260d95ca86e63aa2f8d
          0ba99b6f6ee5f15cbcd3afee9f9081879d5709c565
Q0.y    = 021575725c8fb5107d5ad64c1f178d923e19203590dcb1b509af82
          ffbf367b9c4cccb89301f0aea987dc788d44547f55
    + I * 00a2ba2f88f654fcde8197b94d1605c24515a5cb7823288d13760c
          c23e49c424db9a08d37e1e55c425f1334894ce0125
Q1.x    = 0fe40888ce7a67c99ba37194b2e62c77c9d2fb5d18d71faf81a408
          4b8edc805c30776a46dbe6b749ea170868bf4faadc
    + I * 1918a1f78646dc0451cfdd37725fa080cfb9d9ea473b0f58a9929b
          7b31ab8da8547346a091a7e2b3d073e3cc38ce0b12
Q1.y    = 152eebe67adbeb41ccc8a03926448c9dbe6692254203c6378f00a7
          e5bd56acdbde4ab9e8d1809aaf405bbe5ab395e385
    + I * 070cc5025c561c1dfcca06ba88853300d4314db466e187e60cd191
          5c735bf2c6dc3bd0903d988d7d9b3b9e46dbe3ee1d

msg     = abc
P.x     = 14dc75415d6482bae5db292316e9fce2a9ac7c9591222ba12ef70f
          e4ad5ddd2a95b696857234d9114812394b60f8871a
    + I * 121be08f8e5ebfd6bd080250aac7cde4ceb5672b5fd470bd8a9216
          4e7b7fef93631da6bb514892cf913e5ba6bba00adc
P.y     = 024233ce610d08957a91a989495af524ca3c4409e7f2fd38164ee7
          e76fc9694338370d90d2150f2e602bec35eda9e22d
    + I * 00bd976560d390194db01606af280f74b6b4282d4bf3f6ed2718ac
          67ebe1507e52eab74fbdfdfdf0092c0d9a106969e5
u[0]    = 08dde2c4f9306a44a460f832d9153c2eccbb8588a7ac35b8476b00
          6be691ce1b340486a56f180be2a022f3cee642ea2a
    + I * 05141fedc77647e15b94c7dd50010f0ab062f44dfb25bc4a127f94
          aeede48e4f5782c83a29c98295d27210c7ff74ba6c
u[1]    = 0f6d3efdc539af5edd8b806160272c9699ab924f37d161509d4cfa
          5a589d796d7b05b78fe5994bd082aa6765ef468421
    + I * 00ba433ee89bbbb64364644c770149bba3d8fc6de84e2c057fe7ea
          027fab92261a40a20214f4da43375f5d55d5c74361
Q0.x    = 0d0c596608ea6ae9b18b6e55d21663933db8256234f5c2b3b3479b
          7bfc490f7828c98f883e1a63c58cdc0fc028d4661a
    + I * 153ca080b13248f5f6b863a409ff2df352041c19f353f72dd0f323
          3a1ae2fdeea6e31a93a7a290a99a56a7cfe8448ff1
Q0.y    = 012454a1f725b9b478ebdfaf0e56870fa99a15ff3e003c21a15504
          2b44a39cc3a36421b7e11112da0a43e8528b15f820
    + I * 0116d64afa9e422e1d966a93b0e3a0e40c4e34dc34a4c7b2f71e15
          20812f401baa979c5c62e67e4adf15ce4a507f7db1
Q1.x    = 0083e95f0c761f7303c593bfacddf994635f12704cec7d2a1e8ce9
          ce3186b20acad0a8f63ff94cefd67400c72751fa29
    + I * 198853939c488f8d8e5bf0839aff9aee5513205a775a541ea3fbce
          3ebc27395f811147593a7b51e4b1874cf14c8a5c59
Q1.y    = 145f9d0d73567c83a5fccb0b05afc9585d302e1fe2e60fa91c673e
          12a2e760e74c64eb88c7747030b1b50ec8b8111d7f
    + I * 102641fb2d3f4866926783d40d04d3b0f5a6ec4f4aab132053499b
          50922a29dce7f535502e4038b1a8ce7ae79d2faacd

msg     = abcdef0123456789
P.x     = 185cad2867dc5c11b0f42842adc2bc16ebaf95c761b5d26541a089
          c19f54e5039ad911b2667de073c26d01911d203d58
    + I * 05e0ac4290a0620d1b5d20b8b98ace6d1b198273e05a36daa18b3c
          591ded4bfebbff7a8bb3bc2b9de009d5e9d0a78a12
P.y     = 025525d91f16601d32379f4d5cba4a256ad84d40423ef294dabdf7
          3e351f86b583c848f974899815a40c569465c68c7f
    + I * 09aa43a981af5885a0f86a1b9a143abbc1570d1bf342f8b506ff9f
          9bcc15dbb12a8ac062f7e37e06b90881b8cbc1f4e9
u[0]    = 11cb86b80f5715c34ebbbfd2b535a765de4e5e6de719f804b86e5d
          0e7415f00a2123397e06a9fe969ef09cd84c4d0146
    + I * 10c642ecf452b47f5dcff39e3ab10d9b240d9511837f2d6eb152f8
          6b2960a2fb8350f9d0387f8a8899a58bd2c5691b92
u[1]    = 05c8d547790510132e87b818de01994a7dcccbafcccffbfe38ada5
          ba2573eda9308f4bad0fb1beb79b12c7329c18766b
    + I * 11931693de41195bec4acae1beea0b9b2bf2e55902bebb8f08da80
          36989efacda79b275d0a5b06d42905826f99e05dfa
Q0.x    = 10319d966d19e9017cd0be3c551e4001c3e9d75a25e1700c3443b7
          756ae94fe1d442d6b3839d505682fa82269c7e910e
    + I * 1860d1ab41d2ffe81a587e6919b21348bb437a8ea88e932525c803
          d5c1ee68bf47f515c445ae102cde5cf5569de63970
Q0.y    = 133af9a9ac415000202b1a1fc258aa773902a937fa09af32267cfc
          f32baaa002eb80b1aefa92ee759867cd9222c55ea6
    + I * 07abb300d3f1a89f91e55b1abf628f83dd967a97d81d8938c87606
          0455abb77dfc9ce41c5a0beb99e9feb684b9f18d4e
Q1.x    = 14f0b1e5f3d5b113514a1ce6eb17de28d84fb686ed72b9a3091a9b
          e545977acaae253b65268c1057abccb2c47381a7b2
    + I * 136ba736cfc5c767b74be4814e647516ef71e512623d481ec17c6d
          89d65f536ed679900bf8050bed93a5833df4c032f5
Q1.y    = 10e035eb449a1ebbc06431ee73251c7a94b96f83102bacb8c3a6bb
          acf32486bd6715dcfdd1c1a5ac0058f4fd7930e22b
    + I * 06e89c91fe9ed6c5f6184c5e3766d7393002d06cdffe4b084a5cb4
          fd4ed71fa5f82590927ff983ea84cb7229a688d071

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 19925c3d247512c84e3ced29498eada349e82ee96689d5977e627c
          5b75a904800d789d1848a0551fd1d8b300efef8663
    + I * 07a1af1c92c0723656bb94b0ebae40d4c3e952b32473964710b9b9
          602b8dbd4e80a8950208fc2cb449daea25af54f138
P.y     = 179c7387bd605a594a778eb6305ba2d96d69383104c41fd6c5b151
          7b1728959e78fef47260863497292e056b745d847a
    + I * 174fd14a9224fc3a7fa9019b7c344557f67b98f40c4fe7cefffd99
          a57aac611de1456988947cbfa37728426d9eeaea52
u[0]    = 1412f7dcbbd4b37d2818e3174f2e51c6767b4d93501208d905d625
          a6decfd1253c626575c44b838cd8801653909fa3a1
    + I * 17bb0ac3a973bf8d3663102459b8dca358d9b971ebc700126f1111
          0c83f644f0ac5a86f1c7cd6babceb1f3705447665a
u[1]    = 0eaa03f98f9aa539262275d8862ce341537228572ea46dcd6e9e86
          62bd7f986948ddab6cf0594faa7b417b772ec96177
    + I * 0fdb46860616bdbd8faff9859ae8d92f282f9633a4b5050c924d71
          1f1b32a6cc20f431c207d47d66dd27fb6604c871b0
Q0.x    = 15e925b755b1d7ffadb242ae97d8f3826a46b6cebb87fc5afafa75
          a041dce9dab92daff7c76a27fdaabee83b58302e7c
    + I * 198976a1d24b585148aa5331536a8d9747584d2cd86bb424426c4a
          e7234aed4afb060f1e09d1ab36bbf7a439fc8da6d1
Q0.y    = 16cda73b5ec6993795f393f19129e0f4e3de82f803ca55f2196216
          2ac599e48e39f0ff78e8159a05d0eceabc6cf01291
    + I * 05b52d7a1673bb8168c3bbad3d3652abca5d7e0027a66791466877
          2ca6ca7e130b07ae7ea6b16695ed53e83789ca3a50
Q1.x    = 031241efa254ea61dd01d9ac138fa90b5b5a60b1d37bdac7984f1a
          038e867acb39f10d616b012b2d64f2a907ccf7a2c5
    + I * 10e01a11fd5e4af0c2f7d373dfd0b565055680087068bfe3d9694b
          443a76a472c409fd57e86647848615ed54bf85fac6
Q1.y    = 173cec16ebaf7dc61a0c3fadd3a50bc19362dddfe166c6ff7a8444
          3c04659c096be4982b3db1d7bb26ae16af4bfb532f
    + I * 13e3154a7eee424063ec3826c681675942bd36b9f2289854741442
          0bd69ba4e273090d4722297f6e5ba2729fba8cabd9
~~~

### BLS12381G2\_XMD:SHA-256\_SVDW\_NU\_

~~~
suite   = BLS12381G2_XMD:SHA-256_SVDW_NU_
dst     = BLS12381G2_XMD:SHA-256_SVDW_NU_TESTGEN

msg     =
P.x     = 001f5fd916a2b24f6106bc49cc96d35eee8ede2f7f9699e3168115
          19904e7b2803583f7078de54b1794d9f0704b85688
    + I * 13ecdb8d57ecfbec3ea381839df152a26e9cce35b492daf3d007b3
          250ec02b64d8080b4c8016853b388cea0b5489bc25
P.y     = 0c0d2918e5d653902be579f05c2b446a77878d778d03a226ef0b73
          412e793ecf6256e8cff50b8f5c8c7b3d5cbb8db2e4
    + I * 03351116cbeb320b89c9633aeadabfc404090131811f1f9bfebe17
          7a1920b1ebd5335eb4e0c140394cf00ce01ac778a4
u[0]    = 0eef24c4eb118a5bae06055c1d98a9ef9ba4eb0f2bb749f63f2eed
          d71de7c7af27d3a6e4e17e5e2c611650521ee6b0b4
    + I * 0908bd04d29ef7bfc7827b2e887ad025131aa38b1b96f15e879547
          5a477f6e82ec3c7e0546a36f31dfd2a0c031b0c707
Q.x     = 0e28eae4e4db410713f183018ead17eb7fdf149dcfc8d9bd010021
          cddee0d4988c9d3456d6c3dcb6c57eeddf65076edc
    + I * 08b791576a8cc3b65818b7cb88188a1a63688c0724758a452a31e1
          77b4900a750450ffa44f912c600b2bf45453a947d4
Q.y     = 117b6df28c7b9cd8d208c6c7ec1453e68c7c97230843e076f03941
          dd7f8c8e310f93fcf7560f2a490cf2f3c462f64b30
    + I * 00849eb75f4b8f5c4b3ee6a34e267a3e2a0416f1d42e5bb57bb5fb
          cde448c01c632fea40524353cd7851dd8e4b4fcb8c

msg     = abc
P.x     = 0ad0765905e941f59e03a3c3684430c8bb3470b247a70b2e0fc50e
          3dd0d6a3aa4bc2a970660aeaee1514ddbd02cb3bb0
    + I * 11ab385921eb2d52affc127ce814c5284410a68d390f497150729a
          717649673401d52f8da24baa71c696ffa904ce0c79
P.y     = 13f087308db9972ec87a9cc3d4064cd630734809829e5035e83d6c
          12fa9bd4fae2af9509ca80e5b34d04deeae5b1aab3
    + I * 0cbfbead826b4cf0bb5fb7a534aa700e18fc205c924b5ffbe105bb
          037fd27560c537c6c35184e53a56b392313a8ea036
u[0]    = 1197064aa416ed1d2236d5571ff99c5956085096acff695a1b5939
          5b2db29cb97b465016b4a4c1ecbc53760a05f1c600
    + I * 062e7c9bc14541239dff3d241091d3f0cb14c37698dccdd34b3998
          35b2cbcd9fc7a3ebb25bf5c2ed6c867a3504d8e028
Q.x     = 0be2212e9e3f4cfc5b14f590e3f1e07daf0f37cf0859927063b98f
          009d4cd93d524334019b0627147fce0c977ac4b06c
    + I * 0e792f3bdd691b2ec82c46b1d77978ee1f768465fe779805eaa1e8
          3f3c2c278553cdd4f549318fd2784156820a24c287
Q.y     = 0fa287923f6386606d240fc06fae037b04324b63523cae055e9aac
          b8d70988580690407ba3e7055c1dae0db384808eae
    + I * 08c9c5926bacd48744e8e365fb0f98e394d7a55b47d9c896ea96fe
          a516b09f53afecae1fde28afb7033cf3d3aad74e7c

msg     = abcdef0123456789
P.x     = 19d2e82a836c036fb0441e1c4ab657883526e732f0baae8b60e35a
          bdb432ec59c1978ba52f36a1f93c821d9c249f1a01
    + I * 077ebc79f190a4dbd11fa52f43fa8b339769e25b612d8c9cb1a9f4
          f487abb91b6e686b3fe3359f9b9864758623d0ccf5
P.y     = 02eabe731541c963778438ce58d7fc2882f04709c048827ebb9da7
          f08db7b80a2aea077becb561302f03691c512aa9ba
    + I * 114479c515e30ac4ed68f6950f31898e01a15765d76da4132eace7
          6a3ab1d5922e22ba7333619a3ca044ee568bdb126e
u[0]    = 04bd797baab9a7dec6a33e0f2ecf148bf13c9f0ed7d414db7f7e78
          bf654c7ff0366de76acf99b114b210004bd207ebd8
    + I * 011cc2dcb9c22912dd0c3ca91cebefe5e57c24f2317dbd0ab5fe7f
          f6454d1dbe1a5e4e17d92e7bffad4fc12cbffb16b7
Q.x     = 17baf01f2408702e29324660ec3a7415367ac32a5364c1acb3a2b9
          7f83923dfd7729b729cab2234e12137854bcd2f059
    + I * 00316054f1f0f5dcc0b7fe04e16d59109098c6d0bf8f6c32bc5d32
          87439ea082bdba9269bae4437acacfe84a71a49d63
Q.y     = 11618a2b53afef2553e7afa57495ed03cb7d072e52067dc2368d17
          dabf149ec2f70198efc49c7545f9818827016d3408
    + I * 0f1ebbdcbd6e2201799d869543362d8c7e1399dd14c9fe3b466b01
          0c1b5edb30739b53f64abd24fc396328e9cdbd808e

msg     = a512_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
P.x     = 12b242fc22a527edabca13f6e698d6476c24cf2a854c8bdd5da3bc
          00e190874b0db2a730ddd03f5fbe36ca85ba99c3b5
    + I * 04f3a9d0fcae0a360c08ab6adb11fb3c154164ebe3900990b265da
          e899cf7869cf6930cfb71f0ca965eec11b226f9485
P.y     = 0de39be8863c3e4d4d7a0536780004af090789f94e1430fadce34e
          a39330e7f276b327834be0fab8b95a68170bb252ed
    + I * 0962ee9b5b45333ecd3fde52f26e4193eeb6b78d49c7fffa3d8c40
          052938e118d0e7b9affb8bb602fbcfe3b73524463a
u[0]    = 0cd6693615b9cf94b465a00fee61765ab3a531dcd6ac6515255f13
          3b46ad2faaa0fcefbcb2d683d6a63f2742a10c1bc7
    + I * 116f472765841380180b72806c9c323ad7ef71ec044bde80dde1ea
          7b8d91b3aaa09112fdf2be583d1ab4aa409f7dfb63
Q.x     = 152527c9fae465fddae8ec34e3f8441e5e1768cb316d121a277e18
          2cc1995157359c0e4fdf151e77b070baa0ebab4dbf
    + I * 057831fc9cadafae5d8500bddf6c7b1f4e7b7e0df77ff0e3cda3d1
          150e4a33403d293a9c2bb441a4424b26e3a7a78781
Q.y     = 10fadd422a4aa508bc54eb926a97336d4f0c17448ffc71ed4b0a34
          f6ce2546271ca86d2d701021c0d940cdf0cfca6f97
    + I * 15cdafd712b63fc2bd0e47caa8ce68cf2a125ad70cc3a2a166e97c
          6b270070e7cf46e6207a9d9121eac906adbec4bff9
~~~
