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
    org: Cloudflare
    street: 101 Townsend St
    city: San Francisco
    country: United States of America
    email: caw@heapingbits.net

normative:
  RFC2119:
  RFC8017:
  RFC7748:
  EID4730:
    target: https://www.rfc-editor.org/errata/eid4730
    title: "RFC 7748, Errata ID 4730"
    date: July, 2016
    author:
      -
        ins: A. Langley
        name: Adam Langley
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
        ins: M. Tibouchi
        name: Mehdi Tibouchi
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

We describe two high-level encoding functions ({{term-encoding}}): nonuniform
and random oracle encoding. Although these functions have the same interface, the
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

# Utility functions {#utility}

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
8. return sign
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

# Hashing to a finite field {#hashtofield}

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
length is at least ceil(log2(p)) + k bits, where k is the target security
level for the suite in bits.
Reducing such integers mod p gives bias at most 2^-k for any p; this bias
is appropriate when targeting k-bit security.
For each such integer, hash\_to\_field uses expand\_message to obtain
L pseudorandom bytes, where L = ceil((ceil(log2(p)) + k) / 8); this
byte string is then interpreted as an integer via OS2IP {{RFC8017}}.
For example, for a 255-bit prime p, and k = 128-bit security,
L = ceil((255 + 128) / 8) = 48 bytes.

Note that k is an upper bound on the security level for the
corresponding curve.
See {{security-considerations-targets}} for more details, and
{{new-suite}} for guidelines on choosing k for a given curve.

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

# Deterministic mappings {#mappings}

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
The mappings in this section first identify an x such that
g(x) is square, then take a square root to find y. Since there
are two square roots when g(x) != 0, this may result in an ambiguity
regarding the sign of y.

When necessary, the mappings in this section resolve this ambiguity by
specifying the sign of the y-coordinate in terms of the input to the mapping
function.
Two main reasons support this approach: first, this covers elliptic curves
over any field in a uniform way, and second, it gives implementors leeway
to optimize their square-root implementations.

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

### Shallue-van de Woestijne method {#svdw}

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

{{straightline-svdw}} gives an example straight-line implementation of this
mapping.

### Simplified Shallue-van de Woestijne-Ulas method {#simple-swu}

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

{{straightline-sswu}} gives an example straight-line implementation of this
mapping.
{{sswu-opt}} gives optimized straight-line procedures that apply to specific
classes of curves and base fields.
For more information on optimizing this mapping, see
{{WB19}} Section 4 or the example code found at {{hash2curve-repo}}.

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

See {{hash2curve-repo}} or {{WB19}} Section 4.3 for details on implementing the isogeny map.

## Mappings for Montgomery curves {#montgomery}

The mapping defined in this section applies to a target curve M defined by the equation

~~~
    K * t^2 = s^3 + J * s^2 + s
~~~

### Elligator 2 method {#elligator2}

Bernstein, Hamburg, Krasnova, and Lange give a mapping that applies to any
curve with a point of order 2 {{BHKL13}}, which they call Elligator 2.

Preconditions: A Montgomery curve K * t^2 = s^3 + J * s^2 + s where
J != 0, K != 0, and (J^2 - 4) / K^2 is non-zero and non-square in F.

Constants:

- J and K, the parameters of the elliptic curve.

- Z, a non-square element of F.
  {{elligator-z-code}} gives a Sage {{SAGE}} script that outputs the RECOMMENDED Z.

Sign of t: this mapping fixes the sign of t as specified in {{BHKL13}}.
No additional adjustment is required.

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
6.  If is_square(gx1), set x = x1, y = sqrt(gx1), and sgn0(y) == 1.
7.  Else set x = x2, y = sqrt(gx2), and sgn0(y) == 0.
8.   s = x * K
9.   t = y * K
10. return (s, t)
~~~

{{straightline-ell2}} gives an example straight-line implementation of this
mapping.
{{ell2-opt}} gives optimized straight-line procedures that apply to specific
classes of curves and base fields.

## Mappings for twisted Edwards curves {#twisted-edwards}

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

There are two ways to select a Montgomery curve and rational map
for use when hashing to a given twisted Edwards curve.
The selected Montgomery curve and rational map MUST be specified as part of
the hash-to-curve suite for a given twisted Edwards curve; see {{suites}}.

1. When hashing to a standardized twisted Edwards curve for which a corresponding
Montgomery form and rational map are also standardized, the standard
Montgomery form and rational map SHOULD be used to ensure compatibility
with existing software.

    In certain cases, e.g., edwards25519 {{RFC7748}}, the sign of the rational
    map from the twisted Edwards curve to its corresponding Montgomery curve
    is not given explicitly.
    In this case, the sign MUST be fixed such that applying the rational map
    to the twisted Edwards curve's base point yields the Montgomery curve's
    base point with correct sign.
    (For edwards25519, see {{RFC7748}} and {{EID4730}}.)

    When defining new twisted Edwards curves, a Montgomery equivalent and rational
    map SHOULD also be specified, and the sign of the rational map SHOULD be stated
    explicitly.

2. When hashing to a twisted Edwards curve that does not have a standardized
Montgomery form or rational map, the map given in {{appx-rational-map}}
SHOULD be used.

### Elligator 2 method {#ell2edwards}

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

# Suites for hashing {#suites}

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

Suites with nonuniform encodings MUST NOT be used in applications whose security
relies on a random oracle. Applications using nonuniform encodings SHOULD carefully
analyze the security implications of using such an encoding. When the required
encoding is not clear, applications SHOULD use a random oracle.

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

P256\_XMD:SHA-256\_SSWU\_NU\_ is identical to P256\_XMD:SHA-256\_SSWU\_RO\_,
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

P384\_XMD:SHA-512\_SSWU\_NU\_ is identical to P384\_XMD:SHA-512\_SSWU\_RO\_,
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

P521\_XMD:SHA-512\_SSWU\_NU\_ is identical to P521\_XMD:SHA-512\_SSWU\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

An optimized example implementation of the Simplified SWU mapping
to P-521 is given in {{sswu-map-to-3mod4}}.

## Suites for curve25519 and edwards25519 {#suites-25519}

This section defines ciphersuites for curve25519 and edwards25519 {{RFC7748}}.

curve25519\_XMD:SHA-512\_ELL2\_RO\_ is defined as follows:

- encoding type: hash\_to\_curve ({{roadmap}})
- E: K * t^2 = s^3 + J * s^2 + s, where
  - J = 486662
  - K = 1
- p: 2^255 - 19
- m: 1
- k: 128
- expand\_message: expand\_message\_xmd ({{hashtofield-expand-xmd}})
- H: SHA-512
- L: 48
- f: Elligator 2 method, {{elligator2}}
- Z: 2
- h\_eff: 8

edwards25519\_XMD:SHA-512\_ELL2\_RO\_ is identical to curve25519\_XMD:SHA-512\_ELL2\_RO\_,
except for the following parameters:

- E: a * v^2 + w^2 = 1 + d * v^2 * w^2, where
  - a = -1
  - d = 0x52036cee2b6ffe738cc740797779e89800700a4d4141d8ab75eb4dca135978a3
- f: Twisted Edwards Elligator 2 method, {{ell2edwards}}
- M: curve25519 defined in {{RFC7748}}, Section 4.1
- rational\_map: the birational map defined in {{RFC7748}}, Section 4.1

curve25519\_XMD:SHA-512\_ELL2\_NU\_ is identical to curve25519\_XMD:SHA-512\_ELL2\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

edwards25519\_XMD:SHA-512\_ELL2\_NU\_ is identical to edwards25519\_XMD:SHA-512\_ELL2\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

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

secp256k1\_XMD:SHA-256\_SSWU\_NU\_ is identical to secp256k1\_XMD:SHA-256\_SSWU\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

An optimized example implementation of the Simplified SWU mapping
to the curve E' isogenous to secp256k1 is given in {{sswu-map-to-3mod4}}.

## Suites for BLS12-381 {#suites-bls12381}

This section defines ciphersuites for groups G1 and G2 of
the BLS12-381 elliptic curve {{BLS12-381}}.
The curve parameters in this section match the ones listed in
{{!I-D.irtf-cfrg-pairing-friendly-curves}}, Appendix C.

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

BLS12381G1\_XMD:SHA-256\_SSWU\_NU\_ is identical to BLS12381G1\_XMD:SHA-256\_SSWU\_RO\_,
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

BLS12381G2\_XMD:SHA-256\_SSWU\_NU\_ is identical to BLS12381G2\_XMD:SHA-256\_SSWU\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

Note that the h\_eff values for these suites are chosen for compatibility
with the fast cofactor clearing method described by
Budroni and Pintore ({{BP17}}, Section 4.1), and summarized in {{clear-cofactor-bls12381-g2}}.

An optimized example implementation of the Simplified SWU mapping
to the curve E' isogenous to BLS12-381 G2 is given in {{sswu-map-to-9mod16}}.

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

# IANA considerations

This document has no IANA actions.

# Security considerations {#security-considerations}

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

## Target security levels {#security-considerations-targets}

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


# Related work {#related}

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

This section gives rational maps that can be used when hashing to
twisted Edwards or Montgomery curves.

Given a twisted Edwards curve, {{appx-rational-map-edw}}
shows how to derive a corresponding Montgomery
curve and how to map from that curve to the twisted Edwards curve.
This mapping may be used when hashing to twisted Edwards curves
as described in {{twisted-edwards}}.

Given a Montgomery curve, {{appx-rational-map-mont}} shows
how to derive a corresponding Weierstrass curve and how to map from that
curve to the Montgomery curve.
This mapping can be used to hash to Montgomery or twisted Edwards curves
via the Shallue-van de Woestijne ({{svdw}}) or Simplified SWU ({{simple-swu}})
method, as follows:

- For Montgomery curves, first map to the Weierstrass curve, then convert
to Montgomery coordinates via the mapping.

- For twisted Edwards curves, compose the Weierstrass to Montgomery mapping
with the Montgomery to twisted Edwards mapping
({{appx-rational-map-edw}}) to obtain a Weierstrass curve and a mapping
to the target twisted Edwards curve.
Map to this Weierstrass curve, then convert to Edwards coordinates
via the mapping.

## Generic Montgomery to twisted Edwards map {#appx-rational-map-edw}

This section gives a generic birational map between twisted Edwards
and Montgomery curves.

The map in this section is a simplified version of the map given in
{{BBJLP08}}, Theorem 3.2.
Specifically, this section's map handles exceptional cases in a
simplified way that is geared towards hashing to a twisted Edwards
curve's prime-order subgroup.

The twisted Edwards curve

~~~
    a * v^2 + w^2 = 1 + d * v^2 * w^2
~~~

is birationally equivalent to the Montgomery curve

~~~
    K * t^2 = s^3 + J * s^2 + s
~~~

which has the form required by the Elligator 2 mapping of {{elligator2}}.
The coefficients of the Montgomery curve are

- J = 2 * (a + d) / (a - d)
- K = 4 / (a - d)

The rational map from the point (s, t) on the above Montgomery curve
to the point (v, w) on the twisted Edwards curve is given by

- v = s / t
- w = (s - 1) / (s + 1)

This mapping is undefined when t == 0 or s == -1, i.e., when
the denominator of either of the above rational functions is zero.
Implementations MUST detect exceptional cases and return the value
(v, w) = (0, 1), which is the identity point on all twisted Edwards curves.

The following straight-line implementation of the above rational map
handles the exceptional cases.

~~~
edw_to_monty_generic(s, t)

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

For completeness, we also give the inverse relations.
(Note that this map is not required when hashing to twisted Edwards curves.)
The coefficients of the twisted Edwards curve corresponding to
the above Montgomery curve are

- a = (J + 2) / K
- d = (J - 2) / K

The rational map from the point (v, w) on the twisted Edwards
curve to the point (s, t) on the Montgomery curve is given by

- s = (1 + w) / (1 - w)
- t = (1 + w) / (v * (1 - w))

The mapping is undefined when v == 0 or w == 1.
When the goal is to map into the prime-order subgroup of the Montgomery
curve, it suffices to return the identity point on the Montgomery curve
in the exceptional cases.

## Weierstrass to Montgomery map {#appx-rational-map-mont}

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

# Isogeny maps for suites {#appx-iso}

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


# Straight-line implementations of deterministic mappings {#straightline}

This section gives straight-line implementations of the mappings of {{mappings}}.
These implementations are generic, i.e., they are defined for any curve and field.
{{samplecode}} gives example implementations that are optimized for specific
classes of curves and fields.

## Shallue-van de Woestijne method {#straightline-svdw}

This section gives a straight-line implementation of the Shallue and van
de Woestijne method for any Weierstrass curve of the form given in
{{weierstrass}}.
See {{svdw}} for information on the constants used in this mapping.

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

## Simplified SWU method {#straightline-sswu}

This section gives a straight-line implementation of the simplified
SWU method for any Weierstrass curve of the form given in {{weierstrass}}.
See {{simple-swu}} for information on the constants used in this mapping.

{{sswu-opt}} gives optimized straight-line procedures that apply to specific
classes of curves and base fields.

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

## Elligator 2 method {#straightline-ell2}

This section gives a straight-line implementation of the Elligator 2
method for any Montgomery curve of the form given in {{montgomery}}.
See {{elligator2}} for information on the constants used in this mapping.

{{ell2-opt}} gives optimized straight-line procedures that apply to specific
classes of curves and base fields, including curve25519 and curve448 {{RFC7748}}.

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
18.  e3 = sgn0(y) == 1
19.   y = CMOV(y, -y, e2 XOR e3)    # fix sign of y
20.   s = x * K
21.   t = y * K
22. return (s, t)
~~~


# Optimized sample code {#samplecode}

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

## Simplified SWU {#sswu-opt}

### q = 3 (mod 4) {#sswu-map-to-3mod4}

The following is a straight-line implementation of the Simplified SWU
mapping that applies to any curve over GF(q) where q = 3 (mod 4).
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

Constants:
1.  c1 = (q - 3) / 4           # Integer arithmetic
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
21.  y1 = tv4^c1               # (gx1 * gxd^3)^((q - 3) / 4)
22.  y1 = y1 * tv2             # gx1 * gxd * (gx1 * gxd^3)^((q - 3) / 4)
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

### q = 5 (mod 8) {#sswu-map-to-5mod8}

The following is a straight-line implementation of the Simplified SWU
mapping that applied to any curve over GF(q) where q = 5 (mod 8).

~~~
map_to_curve_simple_sswu_5mod8(u)

Input: u, an element of F.
Output: (xn, xd, yn, yd) such that (xn / xd, yn / yd) is a
        point on the target curve.

Constants:
1. c1 = (q - 5) / 8             # Integer arithmetic
2. c2 = sqrt(-1)
3. c3 = sqrt(Z^3 / c2)

Steps:
1.  tv1 = u^2
2.  tv3 = Z * tv1
3.  tv5 = tv3^2
4.   xd = tv5 + tv3
5.  x1n = xd + 1
6.  x1n = x1n * B
7.   xd = -A * xd
8.   e1 = xd == 0
9.   xd = CMOV(xd, Z * A, e1)   # If xd == 0, set xd = Z * A
10. tv2 = xd^2
11. gxd = tv2 * xd              # gxd == xd^3
12. tv2 = A * tv2
13. gx1 = x1n^2
14. gx1 = gx1 + tv2             # x1n^2 + A * xd^2
15. gx1 = gx1 * x1n             # x1n^3 + A * x1n * xd^2
16. tv2 = B * gxd
17. gx1 = gx1 + tv2             # x1n^3 + A * x1n * xd^2 + B * xd^3
18. tv4 = gxd^2
19. tv2 = tv4 * gxd             # gxd^3
20. tv4 = tv4^2                 # gxd^4
21. tv2 = tv2 * gx1             # gx1 * gxd^3
22. tv4 = tv4 * tv2             # gx1 * gxd^7
23.   y = tv4^c1                # (gx1 * gxd^7)^((q - 5) / 8)
24.   y = y * tv2               # This is almost sqrt(gx1)
25. tv4 = y * c2                # check the two possible sqrts
26. tv2 = tv4^2
27. tv2 = tv2 * gxd
28.  e2 = tv2 == gx1
29.   y = CMOV(y, tv4, e2)
30. gx2 = gx1 * tv5
31. gx2 = gx2 * tv3             # gx2 = gx1 * Z^3 * u^6
32. tv1 = y * tv1
33. tv1 = tv1 * u               # This is almost sqrt(gx2)
34. tv1 = tv1 * c3              # check the two possible sqrts
35. tv4 = tv1 * c2
36. tv2 = tv4^2
37. tv2 = tv2 * gxd
38.  e3 = tv2 == gx2
39. tv1 = CMOV(tv1, tv4, e3)
40. tv2 = y^2
41. tv2 = tv2 * gxd
42.  e4 = tv2 == gx1
43.   y = CMOV(tv1, y, e4)      # choose correct y-coordinate
44. tv2 = tv3 * x1n             # x2n = x2n / xd = Z * u^2 * x1n / xd
45.  xn = CMOV(tv2, x1n, e4)    # choose correct x-coordinate
46.  e5 = sgn0(u) == sgn0(y)    # Fix sign of y
47.   y = CMOV(-y, y, e5)
48. return (xn, xd, y, 1)
~~~

### q = 9 (mod 16) {#sswu-map-to-9mod16}

The following is a straight-line implementation of the Simplified SWU
mapping that applies to any curve over GF(q) where q = 9 (mod 16).
This includes the curve isogenous to BLS12-381 G2 ({{suites-bls12381-g2}}).

~~~
map_to_curve_simple_swu_9mod16(u)

Input: u, an element of F.
Output: (xn, xd, yn, yd) such that (xn / xd, yn / yd) is a
        point on the target curve.

Constants:
1. c1 = (q - 9) / 16            # Integer arithmetic
2. c2 = sqrt(-1)
3. c3 = sqrt(c2)
4. c4 = sqrt(Z^3 / c3)
5. c5 = sqrt(Z^3 / (c2 * c3))

Steps:
1.  tv1 = u^2
2.  tv3 = Z * tv1
3.  tv5 = tv3^2
4.   xd = tv5 + tv3
5.  x1n = xd + 1
6.  x1n = x1n * B
7.   xd = -A * xd
8.   e1 = xd == 0
9.   xd = CMOV(xd, Z * A, e1)   # If xd == 0, set xd = Z * A
10. tv2 = xd^2
11. gxd = tv2 * xd              # gxd == xd^3
12. tv2 = A * tv2
13. gx1 = x1n^2
14. gx1 = gx1 + tv2             # x1n^2 + A * xd^2
15. gx1 = gx1 * x1n             # x1n^3 + A * x1n * xd^2
16. tv2 = B * gxd
17. gx1 = gx1 + tv2             # x1n^3 + A * x1n * xd^2 + B * xd^3
18. tv4 = gxd^2
19. tv2 = tv4 * gxd             # gxd^3
20. tv4 = tv4^2                 # gxd^4
21. tv2 = tv2 * tv4             # gxd^7
22. tv2 = tv2 * gx1             # gx1 * gxd^7
23. tv4 = tv4^2                 # gxd^8
24. tv4 = tv2 * tv4             # gx1 * gxd^15
25.   y = tv4^c1                # (gx1 * gxd^15)^((q - 9) / 16)
26.   y = y * tv2               # This is almost sqrt(gx1)
27. tv4 = y * c2                # check the four possible sqrts
28. tv2 = tv4^2
29. tv2 = tv2 * gxd
30.  e2 = tv2 == gx1
31.   y = CMOV(y, tv4, e2)
32. tv4 = y * c3
33. tv2 = tv4^2
34. tv2 = tv2 * gxd
35.  e3 = tv2 == gx1
36.   y = CMOV(y, tv4, e3)
37. tv4 = tv4 * c2
38. tv2 = tv4^2
39. tv2 = tv2 * gxd
40.  e4 = tv2 == gx1
41.   y = CMOV(y, tv4, e4)      # if x1 is square, this is its sqrt
42. gx2 = gx1 * tv5
43. gx2 = gx2 * tv3             # gx2 = gx1 * Z^3 * u^6
44. tv5 = y * tv1
45. tv5 = tv5 * u               # This is almost sqrt(gx2)
46. tv1 = tv5 * c4              # check the four possible sqrts
47. tv4 = tv1 * c2
48. tv2 = tv4^2
49. tv2 = tv2 * gxd
50.  e5 = tv2 == gx2
51. tv1 = CMOV(tv1, tv4, e5)
52. tv4 = tv5 * c5
53. tv2 = tv4^2
54. tv2 = tv2 * gxd
55.  e6 = tv2 == gx2
56. tv1 = CMOV(tv1, tv4, e6)
57. tv4 = tv4 * c2
58. tv2 = tv4^2
59. tv2 = tv2 * gxd
60.  e7 = tv2 == gx2
61. tv1 = CMOV(tv1, tv4, e7)
62. tv2 = y^2
63. tv2 = tv2 * gxd
64.  e8 = tv2 == gx1
65.   y = CMOV(tv1, y, e8)      # choose correct y-coordinate
66. tv2 = tv3 * x1n             # x2n = x2n / xd = Z * u^2 * x1n / xd
67.  xn = CMOV(tv2, x1n, e8)    # choose correct x-coordinate
68.  e9 = sgn0(u) == sgn0(y)    # Fix sign of y
69.   y = CMOV(-y, y, e9)
70. return (xn, xd, y, 1)
~~~

## Elligator 2 {#ell2-opt}

### curve25519 (q = 5 (mod 8), K = 1) {#map-to-curve25519}

The following is a straight-line implementation of Elligator 2
for curve25519 {{RFC7748}} as specified in {{suites-25519}}.

This implementation can also be used for any Montgomery curve
with K = 1 over GF(q) where q = 5 (mod 8).

~~~
map_to_curve_elligator2_curve25519(u)

Input: u, an element of F.
Output: (xn, xd, yn, yd) such that (xn / xd, yn / yd) is a
        point on curve25519.

Constants:
1. c1 = (q + 3) / 8           # Integer arithmetic
2. c2 = 2^c1
3. c3 = sqrt(-1)
4. c4 = (q - 5) / 8           # Integer arithmetic

Steps:
1.  tv1 = u^2
2.  tv1 = 2 * tv1
3.   xd = tv1 + 1             # Nonzero: -1 is square (mod p), tv1 is not
4.  x1n = -J                  # x1 = x1n / xd = -J / (1 + 2 * u^2)
5.  tv2 = xd^2
6.  gxd = tv2 * xd            # gxd = xd^3
7.  gx1 = J * tv1             # x1n + J * xd
8.  gx1 = gx1 * x1n           # x1n^2 + J * x1n * xd
9.  gx1 = gx1 + tv2           # x1n^2 + J * x1n * xd + xd^2
10. gx1 = gx1 * x1n           # x1n^3 + J * x1n^2 * xd + x1n * xd^2
11. tv3 = gxd^2
12. tv2 = tv3^2               # gxd^4
13. tv3 = tv3 * gxd           # gxd^3
14. tv3 = tv3 * gx1           # gx1 * gxd^3
15. tv2 = tv2 * tv3           # gx1 * gxd^7
16. y11 = tv2^c4              # (gx1 * gxd^7)^((p - 5) / 8)
17. y11 = y11 * tv3           # gx1 * gxd^3 * (gx1 * gxd^7)^((p - 5) / 8)
18. y12 = y11 * c3
19. tv2 = y11^2
20. tv2 = tv2 * gxd
21.  e1 = tv2 == gx1
22.  y1 = CMOV(y12, y11, e1)  # If g(x1) is square, this is its sqrt
23. x2n = x1n * tv1           # x2 = x2n / xd = 2 * u^2 * x1n / xd
24. y21 = y11 * u
25. y21 = y21 * c2
26. y22 = y21 * c3
27. gx2 = gx1 * tv1           # g(x2) = gx2 / gxd = 2 * u^2 * g(x1)
28. tv2 = y21^2
29. tv2 = tv2 * gxd
30.  e2 = tv2 == gx2
31.  y2 = CMOV(y22, y21, e2)  # If g(x2) is square, this is its sqrt
32. tv2 = y1^2
33. tv2 = tv2 * gxd
34.  e3 = tv2 == gx1
35.  xn = CMOV(x2n, x1n, e3)  # If e3, x = x1, else x = x2
36.   y = CMOV(y2, y1, e3)    # If e3, y = y1, else y = y2
37.  e4 = sgn0(y) == 1        # Fix sign of y
38.   y = CMOV(y, -y, e3 XOR e4)
39. return (xn, xd, y, 1)
~~~

### edwards25519 {#map-to-edwards25519}

The following is a straight-line implementation of Elligator 2
for edwards25519 {{RFC7748}} as specified in {{suites-25519}}.
The subroutine map\_to\_curve\_elligator2\_curve25519
is defined in {{map-to-curve25519}}.

Note that the sign of the constant c1 below is chosen as specified
in {{rational-map}}, i.e., applying the rational map to the edwards25519
base point yields the curve25519 base point (see erratum {{EID4730}}).

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

### curve448 (q = 3 (mod 4), K = 1) {#map-to-curve448}

The following is a straight-line implementation of Elligator 2
for curve448 {{RFC7748}} as specified in {{suites-448}}.

This implementation can also be used for any Montgomery curve
with K = 1 over GF(q) where q = 3 (mod 4).

~~~
map_to_curve_elligator2_curve448(u)

Input: u, an element of F.
Output: (xn, xd, yn, yd) such that (xn / xd, yn / yd) is a
        point on curve448.

Constants:
1. c1 = (q - 3) / 4           # Integer arithmetic

Steps:
1.  tv1 = u^2
2.   e1 = tv1 == 1
3.  tv1 = CMOV(tv1, 0, e1)    # If Z * u^2 == -1, set tv1 = 0
4.   xd = 1 - tv1
5.  x1n = -J
6.  tv2 = xd^2
7.  gxd = tv2 * xd            # gxd = xd^3
8.  gx1 = -J * tv1            # x1n + J * xd
9.  gx1 = gx1 * x1n           # x1n^2 + J * x1n * xd
10. gx1 = gx1 + tv2           # x1n^2 + J * x1n * xd + xd^2
11. gx1 = gx1 * x1n           # x1n^3 + J * x1n^2 * xd + x1n * xd^2
12. tv3 = gxd^2
13. tv2 = gx1 * gxd           # gx1 * gxd
14. tv3 = tv3 * tv2           # gx1 * gxd^3
15.  y1 = tv3^c1              # (gx1 * gxd^3)^((p - 3) / 4)
16.  y1 = y1 * tv2            # gx1 * gxd * (gx1 * gxd^3)^((p - 3) / 4)
17. x2n = -tv1 * x1n          # x2 = x2n / xd = -1 * u^2 * x1n / xd
18.  y2 = y1 * u
19.  y2 = CMOV(y2, 0, e1)
20. tv2 = y1^2
21. tv2 = tv2 * gxd
22.  e2 = tv2 == gx1
23.  xn = CMOV(x2n, x1n, e2)  # If e2, x = x1, else x = x2
24.   y = CMOV(y2, y1, e2)    # If e2, y = y1, else y = y2
25.  e3 = sgn0(y) == 1        # Fix sign of y
26.   y = CMOV(y, -y, e2 XOR e3)
27. return (xn, xd, y, 1)
~~~

### edwards448 {#map-to-edwards448}

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

### q = 3 (mod 4) {#ell2-map-to-3mod4}

The following is a straight-line implementation of Elligator 2
that applies to any curve over GF(q) where q = 3 (mod 4).

For curves where K = 1, the implementation given in {{map-to-curve448}}
gives identical results with slightly reduced cost.

~~~
map_to_curve_elligator2_3mod4(u)

Input: u, an element of F.
Output: (xn, xd, yn, yd) such that (xn / xd, yn / yd) is a
        point on the target curve.

Constants:
1. c1 = (q - 3) / 4           # Integer arithmetic
2. c2 = K^2

Steps:
1.  tv1 = u^2
2.   e1 = tv1 == 1
3.  tv1 = CMOV(tv1, 0, e1)    # If Z * u^2 == -1, set tv1 = 0
4.   xd = 1 - tv1
5.   xd = xd * K
6.  x1n = -J                  # x1 = x1n / xd = -J / (K * (1 + 2 * u^2))
7.  tv2 = xd^2
8.  gxd = tv2 * xd
9.  gxd = gxd * c2            # gxd = xd^3 * K^2
10. gx1 = x1n * K
11. tv3 = xd * J
12. tv3 = gx1 + tv3           # x1n * K + xd * J
13. gx1 = gx1 * tv3           # K^2 * x1n^2 + J * K * x1n * xd
14. gx1 = gx1 + tv2           # K^2 * x1n^2 + J * K * x1n * xd + xd^2
15. gx1 = gx1 * x1n           # K^2 * x1n^3 + J * K * x1n^2 * xd + x1n * xd^2
16. tv3 = gxd^2
17. tv2 = gx1 * gxd           # gx1 * gxd
18. tv3 = tv3 * tv2           # gx1 * gxd^3
19.  y1 = tv3^c1              # (gx1 * gxd^3)^((q - 3) / 4)
20.  y1 = y1 * tv2            # gx1 * gxd * (gx1 * gxd^3)^((q - 3) / 4)
21. x2n = -tv1 * x1n          # x2 = x2n / xd = -1 * u^2 * x1n / xd
22.  y2 = y1 * u
23.  y2 = CMOV(y2, 0, e1)
24. tv2 = y1^2
25. tv2 = tv2 * gxd
26.  e2 = tv2 == gx1
27.  xn = CMOV(x2n, x1n, e2)  # If e2, x = x1, else x = x2
28.  xn = xn * K
29.   y = CMOV(y2, y1, e2)    # If e2, y = y1, else y = y2
30.  e3 = sgn0(y) == 1        # Fix sign of y
31.   y = CMOV(y, -y, e2 XOR e3)
32.   y = y * K
33. return (xn, xd, y, 1)
~~~

### q = 5 (mod 8) {#ell2-map-to-5mod8}

The following is a straight-line implementation of Elligator 2
that applies to any curve over GF(q) where q = 5 (mod 8).

For curves where K = 1, the implementation given in {{map-to-curve25519}}
gives identical results with slightly reduced cost.

~~~
map_to_curve_elligator2_5mod8(u)

Input: u, an element of F.
Output: (xn, xd, yn, yd) such that (xn / xd, yn / yd) is a
        point on the target curve.

Constants:
1. c1 = (q + 3) / 8           # Integer arithmetic
2. c2 = 2^c1
3. c3 = sqrt(-1)
4. c4 = (q - 5) / 8           # Integer arithmetic
5. c5 = K^2

Steps:
1.  tv1 = u^2
2.  tv1 = 2 * tv1
3.   xd = tv1 + 1             # Nonzero: -1 is square (mod p), tv1 is not
4.   xd = xd * K
5.  x1n = -J                  # x1 = x1n / xd = -J / (K * (1 + 2 * u^2))
6.  tv2 = xd^2
7.  gxd = tv2 * xd
8.  gxd = gxd * c5            # gxd = xd^3 * K^2
9.  gx1 = x1n * K
10. tv3 = xd * J
11. tv3 = gx1 + tv3           # x1n * K + xd * J
12. gx1 = gx1 * tv3           # K^2 * x1n^2 + J * K * x1n * xd
13. gx1 = gx1 + tv2           # K^2 * x1n^2 + J * K * x1n * xd + xd^2
14. gx1 = gx1 * x1n           # K^2 * x1n^3 + J * K * x1n^2 * xd + x1n * xd^2
15. tv3 = gxd^2
16. tv2 = tv3^2               # gxd^4
17. tv3 = tv3 * gxd           # gxd^3
18. tv3 = tv3 * gx1           # gx1 * gxd^3
19. tv2 = tv2 * tv3           # gx1 * gxd^7
20. y11 = tv2^c4              # (gx1 * gxd^7)^((q - 5) / 8)
21. y11 = y11 * tv3           # gx1 * gxd^3 * (gx1 * gxd^7)^((q - 5) / 8)
22. y12 = y11 * c3
23. tv2 = y11^2
24. tv2 = tv2 * gxd
25.  e1 = tv2 == gx1
26.  y1 = CMOV(y12, y11, e1)  # If g(x1) is square, this is its sqrt
27. x2n = x1n * tv1           # x2 = x2n / xd = 2 * u^2 * x1n / xd
28. y21 = y11 * u
29. y21 = y21 * c2
30. y22 = y21 * c3
31. gx2 = gx1 * tv1           # g(x2) = gx2 / gxd = 2 * u^2 * g(x1)
32. tv2 = y21^2
33. tv2 = tv2 * gxd
34.  e2 = tv2 == gx2
35.  y2 = CMOV(y22, y21, e2)  # If g(x2) is square, this is its sqrt
36. tv2 = y1^2
37. tv2 = tv2 * gxd
38.  e3 = tv2 == gx1
39.  xn = CMOV(x2n, x1n, e3)  # If e3, x = x1, else x = x2
40.  xn = xn * K
41.   y = CMOV(y2, y1, e3)    # If e3, y = y1, else y = y2
42.  e4 = sgn0(y) == 1        # Fix sign of y
43.   y = CMOV(y, -y, e3 XOR e4)
44.   y = y * K
45. return (xn, xd, y, 1)
~~~

## Cofactor clearing for BLS12-381 G2 {#clear-cofactor-bls12381-g2}

The curve BLS12-381, whose parameters are defined in {{suites-bls12381-g2}},
admits an efficiently-computable endomorphism psi that can be used to
speed up cofactor clearing for G2 {{SBCDK09}} {{FKR11}} {{BP17}} (see also
{{cofactor-clearing}}).
This section implements the endomorphism psi and a fast cofactor clearing
method described by Budroni and Pintore {{BP17}}.

The functions in this section operate on points whose coordinates are
represented as ratios, i.e., (xn, xd, yn, yd) corresponds to the point
(xn / xd, yn / yd); see {{projective-coords}} for further discussion of
projective coordinates.
When points are represented in affine coordinates, one can simply ignore
the denominators (xd == 1 and yd == 1).

The following function computes the Frobenius endomorphism for an element
of F = GF(p^2) with basis (1, I), where I^2 + 1 == 0 in F.
(This is the base field of the elliptic curve E defined in {{suites-bls12381-g2}}.)

~~~
frobenius(x)

Input: x, an element of GF(p^2).
Output: a, an element of GF(p^2).

Notation: x = x0 + I * x1, where x0 and x1 are elements of GF(p).

Steps:
1. a = x0 - I * x1
2. return a
~~~

The following function computes the endomorphism psi for points on the
elliptic curve E defined in {{suites-bls12381-g2}}.

~~~
psi(xn, xd, yn, yd)

Input: P, the point (xn / xd, yn / yd) on the curve E (see above).
Output: Q, a point on the same curve.

Constants:
1. c1 = 1 / (1 + I)^((p - 1) / 3)           # in GF(p^2)
2. c2 = 1 / (1 + I)^((p - 1) / 2)           # in GF(p^2)

Steps:
1. qxn = c1 * frobenius(xn)
2. qxd = frobenius(xd)
3. qyn = c2 * frobenius(yn)
4. qyd = frobenius(yd)
5. return (qxn, qxd, qyn, qyd)
~~~

The following function efficiently computes psi(psi(P)).

~~~
psi2(xn, xd, yn, yd)

Input: P, the point (xn / xd, yn / yd) on the curve E (see above).
Output: Q, a point on the same curve.

Constants:
1. c1 = 1 / 2^((p - 1) / 3)                 # in GF(p^2)

Steps:
1. qxn = c1 * xn
2. qyn = -yn
3. return (qxn, xd, qyn, yd)
~~~

The following function maps any point on the elliptic curve E ({{suites-bls12381-g2}})
into the prime-order subgroup G2.
This function returns a point equal to h\_eff * G2, where h\_eff is the parameter
given in {{suites-bls12381-g2}}.

~~~
clear_cofactor_bls12381_g2(P)

Input: P, the point (xn / xd, yn / yd) on the curve E (see above).
Output: Q, a point in the subgroup G2 of BLS12-381.

Constants:
1. c1 = -15132376222941642752       # the BLS parameter for BLS12-381
                                    # i.e., -0xd201000000010000

Notation: in this procedure, + and - represent elliptic curve point
addition and subtraction, respectively, and * represents scalar
multiplication.

Steps:
1.  t1 = c1 * P
2.  t2 = psi(P)
3.  t3 = 2 * P
4.  t3 = psi2(t3)
5.  t3 = t3 - t2
6.  t2 = t1 + t2
7.  t2 = c1 * t2
8.  t3 = t3 + t2
9.  t3 = t3 - t1
10.  Q = t3 - P
11. return Q
~~~

# Scripts for parameter generation {#paramgen}

This section gives Sage {{SAGE}} scripts used to generate parameters for the mappings of {{mappings}}.

## Finding Z for the Shallue-van de Woestijne map {#svdw-z-code}

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
dst     = QUUX-V01-CS02-with-P256_XMD:SHA-256_SSWU_RO_

msg     =
P.x     = 2c15230b26dbc6fc9a37051158c95b79656e17a1a920b11394ca91
          c44247d3e4
P.y     = 8a7a74985cc5c776cdfe4b1f19884970453912e9d31528c060be9a
          b5c43e8415
u[0]    = ad5342c66a6dd0ff080df1da0ea1c04b96e0330dd89406465eeba1
          1582515009
u[1]    = 8c0f1d43204bd6f6ea70ae8013070a1518b43873bcd850aafa0a9e
          220e2eea5a
Q0.x    = ab640a12220d3ff283510ff3f4b1953d09fad35795140b1c5d64f3
          13967934d5
Q0.y    = dccb558863804a881d4fff3455716c836cef230e5209594ddd33d8
          5c565b19b1
Q1.x    = 51cce63c50d972a6e51c61334f0f4875c9ac1cd2d3238412f84e31
          da7d980ef5
Q1.y    = b45d1a36d00ad90e5ec7840a60a4de411917fbe7c82c3949a6e699
          e5a1b66aac

msg     = abc
P.x     = 0bb8b87485551aa43ed54f009230450b492fead5f1cc91658775da
          c4a3388a0f
P.y     = 5c41b3d0731a27a7b14bc0bf0ccded2d8751f83493404c84a88e71
          ffd424212e
u[0]    = afe47f2ea2b10465cc26ac403194dfb68b7f5ee865cda61e9f3e07
          a537220af1
u[1]    = 379a27833b0bfe6f7bdca08e1e83c760bf9a338ab335542704edcd
          69ce9e46e0
Q0.x    = 5219ad0ddef3cc49b714145e91b2f7de6ce0a7a7dc7406c7726c7e
          373c58cb48
Q0.y    = 7950144e52d30acbec7b624c203b1996c99617d0b61c2442354301
          b191d93ecf
Q1.x    = 019b7cb4efcfeaf39f738fe638e31d375ad6837f58a852d032ff60
          c69ee3875f
Q1.y    = 589a62d2b22357fed5449bc38065b760095ebe6aeac84b01156ee4
          252715446e

msg     = abcdef0123456789
P.x     = 65038ac8f2b1def042a5df0b33b1f4eca6bff7cb0f9c6c15268118
          64e544ed80
P.y     = cad44d40a656e7aff4002a8de287abc8ae0482b5ae825822bb870d
          6df9b56ca3
u[0]    = 0fad9d125a9477d55cf9357105b0eb3a5c4259809bf87180aa01d6
          51f53d312c
u[1]    = b68597377392cd3419d8fcc7d7660948c8403b19ea78bbca4b133c
          9d2196c0fb
Q0.x    = a17bdf2965eb88074bc01157e644ed409dac97cfcf0c61c998ed0f
          a45e79e4a2
Q0.y    = 4f1bc80c70d411a3cc1d67aeae6e726f0f311639fee560c7f5a664
          554e3c9c2e
Q1.x    = 7da48bb67225c1a17d452c983798113f47e438e4202219dd0715f8
          419b274d66
Q1.y    = b765696b2913e36db3016c47edb99e24b1da30e761a8a3215dc0ec
          4d8f96e6f9

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
P.x     = 457ae2981f70ca85d8e24c308b14db22f3e3862c5ea0f652ca38b5
          e49cd64bc5
P.y     = ecb9f0eadc9aeed232dabc53235368c1394c78de05dd96893eefa6
          2b0f4757dc
u[0]    = 4ebc95a6e839b1ae3c63b847798e85cb3c12d3817ec6ebc10af6ee
          51adb29fec
u[1]    = 4e21af88e22ea80156aff790750121035b3eefaa96b425a8716e0d
          20b4e269ee
Q0.x    = d88b989ee9d1295df413d4456c5c850b8b2fb0f5402cc5c4c7e815
          412e926db8
Q0.y    = bb4a1edeff506cf16def96afff41b16fc74f6dbd55c2210e5b8f01
          1ba32f4f40
Q1.x    = a281e34e628f3a4d2a53fa87ff973537d68ad4fbc28d3be5e8d9f6
          a2571c5a4b
Q1.y    = f6ed88a7aab56a488100e6f1174fa9810b47db13e86be999644922
          961206e184
~~~

### P256\_XMD:SHA-256\_SSWU\_NU\_

~~~
suite   = P256_XMD:SHA-256_SSWU_NU_
dst     = QUUX-V01-CS02-with-P256_XMD:SHA-256_SSWU_NU_

msg     =
P.x     = f871caad25ea3b59c16cf87c1894902f7e7b2c822c3d3f73596c5a
          ce8ddd14d1
P.y     = 87b9ae23335bee057b99bac1e68588b18b5691af476234b8971bc4
          f011ddc99b
u[0]    = b22d487045f80e9edcb0ecc8d4bf77833e2bf1f3a54004d7df1d57
          f4802d311f
Q.x     = f871caad25ea3b59c16cf87c1894902f7e7b2c822c3d3f73596c5a
          ce8ddd14d1
Q.y     = 87b9ae23335bee057b99bac1e68588b18b5691af476234b8971bc4
          f011ddc99b

msg     = abc
P.x     = fc3f5d734e8dce41ddac49f47dd2b8a57257522a865c124ed02b92
          b5237befa4
P.y     = fe4d197ecf5a62645b9690599e1d80e82c500b22ac705a0b421fac
          7b47157866
u[0]    = c7f96eadac763e176629b09ed0c11992225b3a5ae99479760601cb
          d69c221e58
Q.x     = fc3f5d734e8dce41ddac49f47dd2b8a57257522a865c124ed02b92
          b5237befa4
Q.y     = fe4d197ecf5a62645b9690599e1d80e82c500b22ac705a0b421fac
          7b47157866

msg     = abcdef0123456789
P.x     = f164c6674a02207e414c257ce759d35eddc7f55be6d7f415e2cc17
          7e5d8faa84
P.y     = 3aa274881d30db70485368c0467e97da0e73c18c1d00f34775d012
          b6fcee7f97
u[0]    = 314e8585fa92068b3ea2c3bab452d4257b38be1c097d58a2189045
          6c2929614d
Q.x     = f164c6674a02207e414c257ce759d35eddc7f55be6d7f415e2cc17
          7e5d8faa84
Q.y     = 3aa274881d30db70485368c0467e97da0e73c18c1d00f34775d012
          b6fcee7f97

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
P.x     = 5c4bad52f81f39c8e8de1260e9a06d72b8b00a0829a8ea004a610b
          0691bea5d9
P.y     = c801e7c0782af1f74f24fc385a8555da0582032a3ce038de637ccd
          cb16f7ef7b
u[0]    = 0e1527840b9df2dfbef966678ff167140f2b27c4dccd884c25014d
          ce0e41dfa3
Q.x     = 5c4bad52f81f39c8e8de1260e9a06d72b8b00a0829a8ea004a610b
          0691bea5d9
Q.y     = c801e7c0782af1f74f24fc385a8555da0582032a3ce038de637ccd
          cb16f7ef7b
~~~

### P256\_XMD:SHA-256\_SVDW\_RO\_

~~~
suite   = P256_XMD:SHA-256_SVDW_RO_
dst     = QUUX-V01-CS02-with-P256_XMD:SHA-256_SVDW_RO_

msg     =
P.x     = 35c4a3c1b45331b5065208de29b9314ae940ebd08e5c51732fd067
          0cfb35b75e
P.y     = f0ddd7c7196f06fe9932fe0e37ab8b71a7f1f29ef40299f01c3d5d
          faefd547f3
u[0]    = 94096751f7db9f37f7fe7b920a68f1b78a6b8e3a8fa8e93e145d50
          63ad450d78
u[1]    = 31ec95b201a14d985501257755baa3f33bb1d5166867447d7269fa
          e2dc4e9086
Q0.x    = 8914eb728925315528807180d54d88fcc6201fe30aa361d52b3266
          0787a83ce9
Q0.y    = 580f79a4a7d96f7e7d11006a82264fa053ad4c44a762414e3d6cf6
          a0f3a52bee
Q1.x    = 75f04d9450883dd0d6c896a2935308e45c8376c9690f231c4aaa59
          4fe11c3cb7
Q1.y    = 3ead827ed76c6c67c1556cede2742382ad00ac90508c68c3b69e10
          0500adb760

msg     = abc
P.x     = 65cab68de18809514eec898f4cc0d2ea5542afc9cfcb9255bba0d3
          cf90f2e6aa
P.y     = f47853aee03b281f1d19ec696fea88465b741745a93caec7a0f482
          7ed9fc9ff1
u[0]    = 0d4d2722c3c453a0a8fcf1e6aa7fc045fd300831de260c75fc2d7c
          c418732fa9
u[1]    = fefa1e927216716cd4f6df0463d142125421c790286e60dfc88514
          71840dc387
Q0.x    = 4ef8b47b1651b67d9a0056dc8e79ba324a73fbb31f5fc7a2088d43
          2a78045a0b
Q0.y    = a8daaa2d342dd517769841e481feee14d9cb67840950193ce45b83
          d1dd200765
Q1.x    = 597fff78dad5158f1e45c326ad023a9c99046db356df839546e67d
          5b64944804
Q1.y    = 491f156d27c7809e0b81e66bd6fae79e9b4ede8dd05d03d81a2a2d
          2afbb4815b

msg     = abcdef0123456789
P.x     = 44087ca6f796da55d3cf04f1c8103c74c01cfb0495ead58a0842d1
          0fe4aaa264
P.y     = b6d7e914dbf854be1e7fa5254a61553e3b79d9ca1ed6c13063ef2f
          6bf3890663
u[0]    = bb15dfb4387ff3ca655c1ef20531476f731f1ec31377fe593117e4
          a09eaf961f
u[1]    = 60962f03c1e5b300be37b8d5ed44ce25b547dcc2e13fa72af75b72
          8a4cae1b52
Q0.x    = 3a3c9528ab9f4cb71c836753a1687bce9ef4405a947046e710b0f6
          27cac7eb17
Q0.y    = 1fb76e412ac772be957f3bb78d0450459bac776fa927ad83b603af
          71d2072435
Q1.x    = dee525d1f7664d8f1dd0e7dacbf6b39e24ce1e69fa9d3453cda183
          cf8ecdc003
Q1.y    = b31a5859c56484fc2b1680f2ddc5fa3ce8c5c4bafe4554a3390d7c
          6d9107afae

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
P.x     = 1b8712b7e6e329814fd3a77e410bfda9afd874e5552f974b95de3b
          98d7d0205a
P.y     = c2ccf6bfa55afbe4d7cbfcb5dbfdd02a219b3ef31900d5499e8407
          e6d89c6d66
u[0]    = 58b24b673df60f7a265084e213860ed81eec0dbc653b1f3f734954
          64f01b8ff3
u[1]    = 21cf275673621c67c4e0e7b472d2d86b72c6cae0ce72c97b93f254
          accf6d62a2
Q0.x    = d1073461ad32ac1cab416302c42a23ea9cc7afadfb4106c304939e
          6ca57457a3
Q0.y    = 2df9a6c50f991e1bd94d52bf20c0487dd9e5d0603b63e98c8516cd
          f4071ab4a1
Q1.x    = 4465f993d3fd9b71c749a33f4117664102bad0a74026080c674f89
          f6e8bacaca
Q1.y    = 6b4898c495fd6e5fe6fc1dec0812a43348ef9a480d80c1f881537a
          ea1afe9750
~~~

### P256\_XMD:SHA-256\_SVDW\_NU\_

~~~
suite   = P256_XMD:SHA-256_SVDW_NU_
dst     = QUUX-V01-CS02-with-P256_XMD:SHA-256_SVDW_NU_

msg     =
P.x     = eaba91934c7a764038c4ebd10b623b3cb66329adfc5675eb3ce1f5
          ab22ebacf9
P.y     = 1ec585d8e0578796bcd3175ab430438c91fbf6ecd481efa7064be0
          b58ccc642b
u[0]    = 880c0bd6fc34ef4142701f262769b8bc2d85f5469ee6b4c5f4ebd9
          6def37eaa9
Q.x     = eaba91934c7a764038c4ebd10b623b3cb66329adfc5675eb3ce1f5
          ab22ebacf9
Q.y     = 1ec585d8e0578796bcd3175ab430438c91fbf6ecd481efa7064be0
          b58ccc642b

msg     = abc
P.x     = f61f0d5fe1cfda24d5bc35ddbec3ec6f57df444027a74c27ab2558
          bbf67850f4
P.y     = 4014406df44a217ad2256fdc532e1f51be0ad37b0ce5ac24d2752f
          fb0dfd2dc9
u[0]    = 63aa489a00fa147431a011502e589ffb5986794b4efdcfaf5c8450
          5d6f0f4fb1
Q.x     = f61f0d5fe1cfda24d5bc35ddbec3ec6f57df444027a74c27ab2558
          bbf67850f4
Q.y     = 4014406df44a217ad2256fdc532e1f51be0ad37b0ce5ac24d2752f
          fb0dfd2dc9

msg     = abcdef0123456789
P.x     = 834b3c42b583353cf8119cfc3595958366688d2733791d0ff1d10b
          92e606cbed
P.y     = d5a398fab79b8fcdadd58e4faa1374716698fbef25c7ff74537c4a
          65870ea060
u[0]    = 6b9db40eba21e1006487f4b77a6f08629bbcf016a26034f79ea98c
          969b2e84aa
Q.x     = 834b3c42b583353cf8119cfc3595958366688d2733791d0ff1d10b
          92e606cbed
Q.y     = d5a398fab79b8fcdadd58e4faa1374716698fbef25c7ff74537c4a
          65870ea060

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
P.x     = 2dfc130a7cc45f662e3a0f505297e1aa7e38ec271b98be448bc193
          de10eafac3
P.y     = e3378e0b3340e73e6ab8179d183f241fa021cfe5d8a3febea041df
          50a687e364
u[0]    = 33bd1151d722c55c1659f9ff7738e4b13c8c5c8d7332e24e639648
          0ce6fc8422
Q.x     = 2dfc130a7cc45f662e3a0f505297e1aa7e38ec271b98be448bc193
          de10eafac3
Q.y     = e3378e0b3340e73e6ab8179d183f241fa021cfe5d8a3febea041df
          50a687e364
~~~

## NIST P-384

### P384\_XMD:SHA-512\_SSWU\_RO\_

~~~
suite   = P384_XMD:SHA-512_SSWU_RO_
dst     = QUUX-V01-CS02-with-P384_XMD:SHA-512_SSWU_RO_

msg     =
P.x     = c3144d47428d071d4169420c91006a0bd48d7259d492af86e7f82d
          98e3497519d8550045557b7d55cc2a0f339df088b9
P.y     = aa5f165f0146101363d1b34fe65bcf638532e3b2eb1744cdbd60e9
          384c6c1838bbaea988963cc9f0f0902798e9f8058a
u[0]    = 425c1d0b099ffa6c15069b08299e6e21a204e08c2a0627f5afc242
          15d19e45bc47d70da5972ff77e33f176b5e18e8485
u[1]    = cbefdd543ed48b5a9bbbd460f559d23b388aa72157279ba0206923
          1881eb2a947d887a5b1e0a6173bc92a5700f679a14
Q0.x    = 4589af7986491d42b7ee23726c57abeade65c7b8eba12d07fbce48
          065a01a78c4b018c739034d9fabc2c4ef6176c7c40
Q0.y    = 5b2985027c29802bf2afdb8a3c95fa655ad3189a2118209bd285d4
          20268bf71e610c9533e3f4f438ba4b64f66f6fbed9
Q1.x    = cbd6c34a12a266b447b444b303d577cd5d61e3c0af19d4676ababb
          470bb795741ebf167caa9f0910a4fcc899134596d7
Q1.y    = 63df08d5d3aa8090cbb94222b34aad35e1b11414d3aef8f1a26205
          c81b4d15bbbe4faf25d77924705bf09afd8812d2f0

msg     = abc
P.x     = 7bce42d575e64bc7828478f1bba94000c3ddb02ac03052061a7b7f
          f81479823350e2a8e1da74e17be3016ab163094bcf
P.y     = 6634b2f0acb32b84b75ecfad96c676b3863cb3cec4f76c9bccef18
          94a650830e60cd1c0f20c9d05e9ee58d8a611db87d
u[0]    = 5f1149c405f484c16e09954f174ac12fb658a3fc38862b97f8e4fc
          04c184ddd0d311acc1645b9bc34f1fd422614ef660
u[1]    = ba4fd167774b14ec3242029b05905b55529b14d349f7645b5edeb1
          c49485066f404a949df7d16b65738cb0ef6d233fb5
Q0.x    = 89e5ab0cbd8a4b55a8a6cad0bce5352b63162d2dc7b93174efb1d8
          e0efe2045aa024f86f4209cf71112baad18f520dac
Q0.y    = ef156b7a53500b97c2a556c91d3b62229380dba699cfcbddec4dcb
          0c1321ca667ba0ee08e04d52ddb9fb1c8722ba0456
Q1.x    = 7ffc595738280f4af3eb33e547b104998620123244b23343b039e6
          b0c911bd100f1640cf0b5d121eeb21dd9390b7d4de
Q1.y    = 440d05c93be24f3ae979e9e224716123a7f43faae9b9961784331c
          297b24618a2235c055966c6c1c5fc8f8e8dd5e5027

msg     = abcdef0123456789
P.x     = af1a87bee29167676e41d8eb0518a9e44e570207519c11fa126c33
          f32d62bbf6d312fd5812b182d59389f26ea496e58d
P.y     = 76ab30527be12a53a3bd63457072840ea516aa945fbe2dc48a42cf
          bd031c3f93896e4a66093b2f56cc9da4694ec95f27
u[0]    = 0ba98fc5c84360aa67eabc374cb64df3bd21835adb57d8f83d5f34
          fb13d0b7d9af036d28804175cba83facb79fa1969d
u[1]    = a6f12666eca45f0d206eea969e91ae2ffe375669f43c917326b263
          1f5e57c578ca6e64ff5a3a290cdc377114f33d1924
Q0.x    = d2e7df676ceaf3db77ef48d823da1d05d00f424d2b8d0e785f8f59
          721fb3fa24f744fde77a896f692d8997d2dc52f72c
Q0.y    = 4cf7e647de29c60d852b0103f636bed22e67e83476be1e285dae54
          d03d5ea05212a0f23b1ca233d85055244572740c6b
Q1.x    = 675c9b73a8b3e3c873da720eddc23cbb19895990f049174ccabd30
          31c7167841858247864ddd717dea77b6d4d8c7836b
Q1.y    = 8b6a2d1de2a46354737393a7b69c21d97b7f9f7671e94cfadcea2d
          fea3f8b2793cfffea5addb10a491ad55f0e47b2494

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
P.x     = ed18cea59aabd90a3c84b48eeb09b42409f42340aec2ec1b706872
          15fa4befc64fd4de4620d12e70b9890ad9a70e6ee8
P.y     = dbc9b0e5e718539c785b7b787829a1c01b92591aed954e08b853dc
          96fb303ba4bc8aad06712b8b3b4fae2047d6269d68
u[0]    = c4acd5ba90917a13ae55ee8d82443d40e65b6e77348d96cf6292f4
          de7da2eb5ffdbfcb9fe0887726462891c67956f177
u[1]    = 9da4e1ee3cc2e688e1ddf8cfa42317e122347d4c9db9fc298d2ab2
          a5b82c8ce1544712865a2c32d2851dfef51be99542
Q0.x    = bb5b5001c801fcf9d3e94cabef753cab38f1334b73846a38f9c3ea
          be8aa8935776daf4493d211164ac5b7f7a9237146b
Q0.y    = 46cd40a76fa001a70586b7e598d8c5eefcb54e53aa3df37cb46287
          99cffb73e722af2884a78d49721e821cc3a9ab0053
Q1.x    = d199c3954dd57dadb5c7dd37aa985d7f4dbda9adca980463874400
          39bf702b2f8f97747f46759a733ab2e3be9b6f488e
Q1.y    = b34a05bce9b77fdfde16568356f987a8d26438b6ad9a05bfe0d5bb
          2aea36173316df7191ba40acdf476f778f0ffdef7e
~~~

### P384\_XMD:SHA-512\_SSWU\_NU\_

~~~
suite   = P384_XMD:SHA-512_SSWU_NU_
dst     = QUUX-V01-CS02-with-P384_XMD:SHA-512_SSWU_NU_

msg     =
P.x     = 5b87392cdbf306d62141cf266a1fcc8b6a8129469b1e4a56a16db6
          371b70279d3155514580300f77a23dbeaa70eeda32
P.y     = 9094b16177a04f5c5afac87efc78b6e65a2583a5adc91c04cd508f
          d602d528530eb54932dff8b7e156d470996606cd9c
u[0]    = fcbb8741d963930b5e6438a9724db6023c157d6091c113d80bd9fa
          05ea70d677a3cd81aa6efbeccc8f6ef3404cc87468
Q.x     = 5b87392cdbf306d62141cf266a1fcc8b6a8129469b1e4a56a16db6
          371b70279d3155514580300f77a23dbeaa70eeda32
Q.y     = 9094b16177a04f5c5afac87efc78b6e65a2583a5adc91c04cd508f
          d602d528530eb54932dff8b7e156d470996606cd9c

msg     = abc
P.x     = 496ed56a37cb85a82826a4234948dd3ceee17da6412c87242165b7
          f798b702f2292237bddac386cfcfa8f22e7b85ca2d
P.y     = 9524181274d1313c12872ea835c7ddc9444124d22aae6e474d55b1
          fe68e480250374e689e6c2745323da7222732d2cce
u[0]    = 7dadfed8a179c844a0a1a50f0754353693ccce9234244477c3749c
          1c9adc7fc6fa049829dd070952efb8931118068fe2
Q.x     = 496ed56a37cb85a82826a4234948dd3ceee17da6412c87242165b7
          f798b702f2292237bddac386cfcfa8f22e7b85ca2d
Q.y     = 9524181274d1313c12872ea835c7ddc9444124d22aae6e474d55b1
          fe68e480250374e689e6c2745323da7222732d2cce

msg     = abcdef0123456789
P.x     = a1289920ba2c52de5f384b1316788438ac5564a20c2e0f7ff0ff2f
          a34cb4488bd4683c0cc45ee6234b4a515ddda31f99
P.y     = b5e24b855275729db25cecc83ec5fc1dcf8f055ad981a0901448d8
          4c6278cd10a28f65316db5ae1f5738ed06ae9c2f55
u[0]    = ce74ea70fd691ab87dca4cb630484521030bc4065f4dcc7fef9618
          c84fdf8d55520cd1372d96546b56c5a29a996cc3f1
Q.x     = a1289920ba2c52de5f384b1316788438ac5564a20c2e0f7ff0ff2f
          a34cb4488bd4683c0cc45ee6234b4a515ddda31f99
Q.y     = b5e24b855275729db25cecc83ec5fc1dcf8f055ad981a0901448d8
          4c6278cd10a28f65316db5ae1f5738ed06ae9c2f55

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
P.x     = bc36cda196f8084052fc41a5c4ef5c9e1c724cc0bd83ef8eaef07b
          b2cbc3db99ff5cdb31ba3018a6afe59b0db040c980
P.y     = 5106450163d90d99d3191bc92f8a3d116f15b18b23eff8e9996481
          c6878bd16c8e202f44abc3d09325c2016b5dacc8f0
u[0]    = 99523632b22588d852f02eac546df4a69f966cba55c82937f13cc2
          6b316e561459c5d6ddadac7b782b5ab8d15efe23ee
Q.x     = bc36cda196f8084052fc41a5c4ef5c9e1c724cc0bd83ef8eaef07b
          b2cbc3db99ff5cdb31ba3018a6afe59b0db040c980
Q.y     = 5106450163d90d99d3191bc92f8a3d116f15b18b23eff8e9996481
          c6878bd16c8e202f44abc3d09325c2016b5dacc8f0
~~~

### P384\_XMD:SHA-512\_SVDW\_RO\_

~~~
suite   = P384_XMD:SHA-512_SVDW_RO_
dst     = QUUX-V01-CS02-with-P384_XMD:SHA-512_SVDW_RO_

msg     =
P.x     = 737a107c904edf54d2bd4c8c443f713c478f0b0959349535a3b916
          f1851427323eb30f524c283fa952e9c403eb46b746
P.y     = 9fb88a11ac2a2f6845baeccb05ecc9f2f7adec2ed6cbe3f6cc4619
          2fc94793e5e4f1f666dd49f4733f2b7a0442e7ca7a
u[0]    = e2a0efc3fae434a53d717e83b3bf0154591f045fc63bcd21b7deae
          cd3070b8b2f597526f71fe8b17021a223d5e5fde25
u[1]    = 9709ee6fc8ebcba7171082210b18af85fffdfbe7ad7b8a27c30939
          edac3f551ef027204cdc120489b36d4205aeb018dd
Q0.x    = 3c540ad83a99a86c9268bb094b7588ee127f2f204f1036a6f30fe1
          76327ff39b1819543e0885be5c53187042c954e093
Q0.y    = 5cb137e7271e5b7a5dd67836435366130c223a0402394447391103
          d379d55f88e7acca4a0f959b42eb561782ea79dde7
Q1.x    = bfaf2c70a81d5c974df6660451b76583a1ae98642751e3cfed624b
          beccba0a908878bbe4a7c3a0d020e320404826cb7f
Q1.y    = 514f68f20c7da620f967a4a6d08d5d7b6e4767193fdf043a4d63cf
          e4de4b6ba40c5c6e0baee3220565b6577eda9ea743

msg     = abc
P.x     = 292eb1d771b62e359d679fd377b192aa57bc2ca9d86f3dcf1bd518
          869a71acc34b54caf97e6caeff60eb8997711b20f9
P.y     = f36981e14cb7bc8214797439d9cec37920764455eacc99f63cc257
          691684560aacff559e6de56814de5a0ae55e5033d5
u[0]    = ba01c64b79219e70f46b6de852ea563b5c345eb57692072ec2b293
          ce59db2d1afbe16348de3b85ebfe161aed5d89bc5b
u[1]    = 3eb64620570550bbf6538d5094d859dc784000141ee69b1a162ee8
          aeeb296af1623fac39324385baad3d41c8c92376c0
Q0.x    = 55102507f730c82ad4ba746e078f2867427a9575514c0ef3dbb6bb
          2a6ff5a38c311c98a553fdbc3a0a9c3204dc2a3ad9
Q0.y    = f08de969eb6f834d1a5f8220f2f287525054a8a507b51acf87a59e
          51997e4325b3b28559d03587bac2f8a0ddec0691ad
Q1.x    = 94e1a0dc1d539da3933dd2413d6df91f03f3951e33c9fb504c1e50
          80d3c1f81fca93bd24b5fa026fedd6b7edc10c01a9
Q1.y    = 66aa2751b0f5ec37e90e6ba500517f6e464de2fd393db3d1f94f11
          52a1057de36751f17c5133e176b7e33a0042050d3a

msg     = abcdef0123456789
P.x     = 572aee8f1b7eb0c1c5730bb04b5f5ac4a02ca7d87a21247c1f2c24
          50203fd621c15871172af30b760dac058a330dea20
P.y     = f417c98e3e2bda5b4338a849b3658cb4ce95d1d570e2db0499b1f1
          14f8b079c8a72fabe01509512b20ca7321a913cb9f
u[0]    = 9ee47cf5668907b9fc90522551eb44a917da90e46bf97dd9de9a28
          3484aa7f6678e75fee38190dcd0196d5657ea26846
u[1]    = aba0217c2795cfdbe98ee6bf5845a37d2effb748346d1c7d6a1e2f
          403b9cfc632cde827036f7a2487569dab656c83de6
Q0.x    = 4701b994690bc745d068a59b30891facebdf601b6ccc2726ece3ec
          63f682b2f384378051b50ea51b056e04e0cc89577c
Q0.y    = ab4d2f722eaa490ad7ce9146fdf1368bf164317e3aa0eaca7f214f
          a09263eff51570a272acb38f3bb30667c6a6ea1fc2
Q1.x    = 86173dff1646f53ef84c30c7ba0b7c019892d4f9d2b2bc4a1fba83
          0a7b96a5c0e14bbc50d57145460be49f6ca5993451
Q1.y    = f74a22a8cf776c9a842e2cf370195e2666897cac6cb506dd86a5dc
          468c0733890bdbf6ab64e9b2eb093d9e47dc8acc1a

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
P.x     = 8fb553454b1b692d0ea6a9b8f975390e0f1c2329b2a26276b9f933
          1142d5fc2d5dc2989dac9c18ae69d443eae49ae0d4
P.y     = d86aae939490c43478a00f9585258f3e84c6e0e7f281037c8fa265
          6142e17e0ce47142dc07480bc1c1392e5178708d8d
u[0]    = 7dab6544ef2034c7b18304e638e37c4c2cf76e7738d8d3976a38d6
          f4ed83cef6f1e088630d9ff0a709b772b9ed87214b
u[1]    = 14fb81dcbf94f04fd0a22e5b65308ed44159977b8a2370b2ecb9b0
          50680dc38a1cbbba196ea3f5cf46e841f76f1bbd4e
Q0.x    = d36e495e1c83e997416b36881cc9459d62f93c1964f682c68ec0e8
          415eda7323cb4d54e0299a1907cb911afebb4f7795
Q0.y    = 7a9e55d6a49e82fb6b3534726badc73d258db137d62dd31e711175
          498c2f93260d71d7d59006bda411d4605e6a13a46d
Q1.x    = 5616c6085d1391e7355352f21b0ed801053a36f840dcdbe90de6f6
          02145133dea24748a2b1d2d52c2162cf23d75dfd0c
Q1.y    = 55384ace913ce874b5602f0538f083a6a35120b96d5d48c9d44b38
          e4012b14eb6a7ab6478d124b40fc4f39102734a844
~~~

### P384\_XMD:SHA-512\_SVDW\_NU\_

~~~
suite   = P384_XMD:SHA-512_SVDW_NU_
dst     = QUUX-V01-CS02-with-P384_XMD:SHA-512_SVDW_NU_

msg     =
P.x     = 9432f0bdf92d0ac3e0310378432febb256e726cb148d78bd87bd55
          282551d82a96917c6c93ed1b2f940b9bc8620faf55
P.y     = 47d4e3c1063387a20d30990c144f89be58b5914835611bb702072b
          1b82f8a9de017457683a14b623b0e742d98279cd88
u[0]    = 9fe1db1d05941b11d4942055f90c29e958ccc83b96f38f61b9eb18
          df023f095bb6c6af48ca4ada70e4cc968d0ebf8434
Q.x     = 9432f0bdf92d0ac3e0310378432febb256e726cb148d78bd87bd55
          282551d82a96917c6c93ed1b2f940b9bc8620faf55
Q.y     = 47d4e3c1063387a20d30990c144f89be58b5914835611bb702072b
          1b82f8a9de017457683a14b623b0e742d98279cd88

msg     = abc
P.x     = 899356f06795f8aeb043f55201d6bed172d286ea6766825e632c11
          b9762cc29ac8330caf3052024baa8eb675dea51e38
P.y     = 76c2a12f9caa74d1e40439956ea4886da167329b7404643a6cb410
          d759ba278ec3a55f4a5c13b09cc73c4ff204c83b12
u[0]    = 3b9901b2861f4ca067bb53068f5e0333a8d926587fe00e05817901
          71ed9f78036014e58daa14cf7db3609731178abd46
Q.x     = 899356f06795f8aeb043f55201d6bed172d286ea6766825e632c11
          b9762cc29ac8330caf3052024baa8eb675dea51e38
Q.y     = 76c2a12f9caa74d1e40439956ea4886da167329b7404643a6cb410
          d759ba278ec3a55f4a5c13b09cc73c4ff204c83b12

msg     = abcdef0123456789
P.x     = d912e05e0de4f062c5fece36f490320fb1ed6ab2355e344aad4033
          3fa82d63a1884a5190738acb42ee06cb15f8ba1fa7
P.y     = 6b2428c24f7fec96f97b03dbb95bb50a31de0e64a94d1bf6b94d88
          43b1e4f0095ce4af177faf488668bf5cacd7be333c
u[0]    = d344575e63c0b7798d9a66ec38763ded39c6cef3d0bf1eb9c9273f
          5476ffe370086b088701baf9f27c889b1e2e74f2e2
Q.x     = d912e05e0de4f062c5fece36f490320fb1ed6ab2355e344aad4033
          3fa82d63a1884a5190738acb42ee06cb15f8ba1fa7
Q.y     = 6b2428c24f7fec96f97b03dbb95bb50a31de0e64a94d1bf6b94d88
          43b1e4f0095ce4af177faf488668bf5cacd7be333c

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
P.x     = d58f9f8fe0ae35f89116c6c8fe401091a70cd93035b0798c50b3f5
          eacf4890fe7a569b1f4ae424f90468d9d2e7c4418a
P.y     = 7e659dccf519ee946019949800255c2ba075a242b3f1666bd0c9b4
          3281957ffd100ca7427beb332f426c7c24f7dacbaf
u[0]    = 14a026d3294af43632160fcbe4f7ac3119118d76ff4ca4f9580a22
          3215ade5a485a8f067afe9300434c4fa41c94f4a8b
Q.x     = d58f9f8fe0ae35f89116c6c8fe401091a70cd93035b0798c50b3f5
          eacf4890fe7a569b1f4ae424f90468d9d2e7c4418a
Q.y     = 7e659dccf519ee946019949800255c2ba075a242b3f1666bd0c9b4
          3281957ffd100ca7427beb332f426c7c24f7dacbaf
~~~

## NIST P-521

### P521\_XMD:SHA-512\_SSWU\_RO\_

~~~
suite   = P521_XMD:SHA-512_SSWU_RO_
dst     = QUUX-V01-CS02-with-P521_XMD:SHA-512_SSWU_RO_

msg     =
P.x     = 00fd767cebb2452030358d0e9cf907f525f50920c8f607889a6a35
          680727f64f4d66b161fafeb2654bea0d35086bec0a10b30b14adef
          3556ed9f7f1bc23cecc9c088
P.y     = 0169ba78d8d851e930680322596e39c78f4fe31b97e57629ef6460
          ddd68f8763fd7bd767a4e94a80d3d21a3c2ee98347e024fc73ee1c
          27166dc3fe5eeef782be411d
u[0]    = 01e5f09974e5724f25286763f00ce76238c7a6e03dc396600350ee
          2c4135fb17dc555be99a4a4bae0fd303d4f66d984ed7b6a3ba3860
          93752a855d26d559d69e7e9e
u[1]    = 00ae593b42ca2ef93ac488e9e09a5fe5a2f6fb330d18913734ff60
          2f2a761fcaaf5f596e790bcc572c9140ec03f6cccc38f767f1c197
          5a0b4d70b392d95a0c7278aa
Q0.x    = 00b70ae99b6339fffac19cb9bfde2098b84f75e50ac1e80d6acb95
          4e4534af5f0e9c4a5b8a9c10317b8e6421574bae2b133b4f2b8c6c
          e4b3063da1d91d34fa2b3a3c
Q0.y    = 007f368d98a4ddbf381fb354de40e44b19e43bb11a1278759f4ea7
          b485e1b6db33e750507c071250e3e443c1aaed61f2c28541bb54b1
          b456843eda1eb15ec2a9b36e
Q1.x    = 01143d0e9cddcdacd6a9aafe1bcf8d218c0afc45d4451239e821f5
          d2a56df92be942660b532b2aa59a9c635ae6b30e803c45a6ac8714
          32452e685d661cd41cf67214
Q1.y    = 00ff75515df265e996d702a5380defffab1a6d2bc232234c7bcffa
          433cd8aa791fbc8dcf667f08818bffa739ae25773b32073213cae9
          a0f2a917a0b1301a242dda0c

msg     = abc
P.x     = 002f89a1677b28054b50d15e1f81ed6669b5a2158211118ebdef8a
          6efc77f8ccaa528f698214e4340155abc1fa08f8f613ef14a04371
          7503d57e267d57155cf784a4
P.y     = 010e0be5dc8e753da8ce51091908b72396d3deed14ae166f66d8eb
          f0a4e7059ead169ea4bead0232e9b700dd380b316e9361cfdba55a
          08c73545563a80966ecbb86d
u[0]    = 003d00c37e95f19f358adeeaa47288ec39998039c3256e13c2a4c0
          0a7cb61a34c8969472960150a27276f2390eb5e53e47ab193351c2
          d2d9f164a85c6a5696d94fe8
u[1]    = 01f3cbd3df3893a45a2f1fecdac4d525eb16f345b03e2820d69bc5
          80f5cbe9cb89196fdf720ef933c4c0361fcfe29940fd0db0a5da6b
          afb0bee8876b589c41365f15
Q0.x    = 01b254e1c99c835836f0aceebba7d77750c48366ecb07fb658e4f5
          b76e229ae6ca5d271bb0006ffcc42324e15a6d3daae587f9049de2
          dbb0494378ffb60279406f56
Q0.y    = 01845f4af72fc2b1a5a2fe966f6a97298614288b456cfc385a425b
          686048b25c952fbb5674057e1eb055d04568c0679a8e2dda3158dc
          16ac598dbb1d006f5ad915b0
Q1.x    = 007f08e813c620e527c961b717ffc74aac7afccb9158cebc347d57
          15d5c2214f952c97e194f11d114d80d3481ed766ac0a3dba3eb73f
          6ff9ccb9304ad10bbd7b4a36
Q1.y    = 0022468f92041f9970a7cc025d71d5b647f822784d29ca7b3bc3b0
          829d6bb8581e745f8d0cc9dc6279d0450e779ac2275c4c3608064a
          d6779108a7828ebd9954caeb

msg     = abcdef0123456789
P.x     = 006e200e276a4a81760099677814d7f8794a4a5f3658442de63c18
          d2244dcc957c645e94cb0754f95fcf103b2aeaf94411847c24187b
          89fb7462ad3679066337cbc4
P.y     = 001dd8dfa9775b60b1614f6f169089d8140d4b3e4012949b52f98d
          b2deff3e1d97bf73a1fa4d437d1dcdf39b6360cc518d8ebcc0f899
          018206fded7617b654f6b168
u[0]    = 00183ee1a9bbdc37181b09ec336bcaa34095f91ef14b66b1485c16
          6720523dfb81d5c470d44afcb52a87b704dbc5c9bc9d0ef524dec2
          9884a4795f55c1359945baf3
u[1]    = 00504064fd137f06c81a7cf0f84aa7e92b6b3d56c2368f0a08f447
          76aa8930480da1582d01d7f52df31dca35ee0a7876500ece3d8fe0
          293cd285f790c9881c998d5e
Q0.x    = 0021482e8622aac14da60e656043f79a6a110cbae5012268a62dd6
          a152c41594549f373910ebed170ade892dd5a19f5d687fae7095a4
          61d583f8c4295f7aaf8cd7da
Q0.y    = 0177e2d8c6356b7de06e0b5712d8387d529b848748e54a8bc0ef5f
          1475aa569f8f492fa85c3ad1c5edc51faf7911f11359bfa2a12d2e
          f0bd73df9cb5abd1b101c8b1
Q1.x    = 00abeafb16fdbb5eb95095678d5a65c1f293291dfd20a3751dbe05
          d0a9bfe2d2eef19449fe59ec32cdd4a4adc3411177c0f2dffd0159
          438706159a1bbd0567d9b3d0
Q1.y    = 007cc657f847db9db651d91c801741060d63dab4056d0a1d3524e2
          eb0e819954d8f677aa353bd056244a88f00017e00c3ce8beeedb43
          82d83d74418bd48930c6c182

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
P.x     = 00c12bc3e28db07b6b4d2a2b1167ab9e26fc2fa85c7b0498a17b03
          47edf52392856d7e28b8fa7a2dd004611159505835b687ecf1a764
          857e27e9745848c436ef3925
P.y     = 01cd287df9a50c22a9231beb452346720bb163344a41c5f5a24e83
          35b6ccc595fd436aea89737b1281aecb411eb835f0b939073fdd1d
          d4d5a2492e91ef4a3c55bcbd
u[0]    = 0033d06d17bc3b9a3efc081a05d65805a14a3050a0dd4dfb488461
          8eb5c73980a59c5a246b18f58ad022dd3630faa22889fbb8ba1593
          466515e6ab4aeb7381c26334
u[1]    = 0092290ab99c3fea1a5b8fb2ca49f859994a04faee3301cefab312
          d34227f6a2d0c3322cf76861c6a3683bdaa2dd2a6daa5d6906c663
          e065338b2344d20e313f1114
Q0.x    = 00041f6eb92af8777260718e4c22328a7d74203350c6c8f5794d99
          d5789766698f459b83d5068276716f01429934e40af3d1111a2278
          0b1e07e72238d2207e5386be
Q0.y    = 001c712f0182813942b87cab8e72337db017126f52ed797dd23458
          4ac9ae7e80dfe7abea11db02cf1855312eae1447dbaecc9d7e8c88
          0a5e76a39f6258074e1bc2e0
Q1.x    = 0125c0b69bcf55eab49280b14f707883405028e05c927cd7625d4e
          04115bd0e0e6323b12f5d43d0d6d2eff16dbcf244542f84ec05891
          1260dc3bb6512ab5db285fbd
Q1.y    = 008bddfb803b3f4c761458eb5f8a0aee3e1f7f68e9d7424405fa69
          172919899317fb6ac1d6903a432d967d14e0f80af63e7035aaae0c
          123e56862ce969456f99f102
~~~

### P521\_XMD:SHA-512\_SSWU\_NU\_

~~~
suite   = P521_XMD:SHA-512_SSWU_NU_
dst     = QUUX-V01-CS02-with-P521_XMD:SHA-512_SSWU_NU_

msg     =
P.x     = 01ec604b4e1e3e4c7449b7a41e366e876655538acf51fd40d08b97
          be066f7d020634e906b1b6942f9174b417027c953d75fb6ec64b8c
          ee2a3672d4f1987d13974705
P.y     = 00944fc439b4aad2463e5c9cfa0b0707af3c9a42e37c5a57bb4ecd
          12fef9fb21508568aedcdd8d2490472df4bbafd79081c81e99f4da
          3286eddf19be47e9c4cf0e91
u[0]    = 01e4947fe62a4e47792cee2798912f672fff820b2556282d9843b4
          b465940d7683a986f93ccb0e9a191fbc09a6e770a564490d2a4ae5
          1b287ca39f69c3d910ba6a4f
Q.x     = 01ec604b4e1e3e4c7449b7a41e366e876655538acf51fd40d08b97
          be066f7d020634e906b1b6942f9174b417027c953d75fb6ec64b8c
          ee2a3672d4f1987d13974705
Q.y     = 00944fc439b4aad2463e5c9cfa0b0707af3c9a42e37c5a57bb4ecd
          12fef9fb21508568aedcdd8d2490472df4bbafd79081c81e99f4da
          3286eddf19be47e9c4cf0e91

msg     = abc
P.x     = 00c720ab56aa5a7a4c07a7732a0a4e1b909e32d063ae1b58db5f0e
          b5e09f08a9884bff55a2bef4668f715788e692c18c1915cd034a6b
          998311fcf46924ce66a2be9a
P.y     = 003570e87f91a4f3c7a56be2cb2a078ffc153862a53d5e03e5dad5
          bccc6c529b8bab0b7dbb157499e1949e4edab21cf5d10b782bc1e9
          45e13d7421ad8121dbc72b1d
u[0]    = 0019b85ef78596efc84783d42799e80d787591fe7432dee1d9fa2b
          7651891321be732ddf653fa8fefa34d86fb728db569d36b5b6ed39
          83945854b2fc2dc6a75aa25b
Q.x     = 00c720ab56aa5a7a4c07a7732a0a4e1b909e32d063ae1b58db5f0e
          b5e09f08a9884bff55a2bef4668f715788e692c18c1915cd034a6b
          998311fcf46924ce66a2be9a
Q.y     = 003570e87f91a4f3c7a56be2cb2a078ffc153862a53d5e03e5dad5
          bccc6c529b8bab0b7dbb157499e1949e4edab21cf5d10b782bc1e9
          45e13d7421ad8121dbc72b1d

msg     = abcdef0123456789
P.x     = 00bcaf32a968ff7971b3bbd9ce8edfbee1309e2019d7ff373c3838
          7a782b005dce6ceffccfeda5c6511c8f7f312f343f3a891029c585
          8f45ee0bf370aba25fc990cc
P.y     = 00923517e767532d82cb8a0b59705eec2b7779ce05f9181c7d5d5e
          25694ef8ebd4696343f0bc27006834d2517215ecf79482a84111f5
          0c1bae25044fe1dd77744bbd
u[0]    = 01dba0d7fa26a562ee8a9014ebc2cca4d66fd9de036176aca8fc11
          ef254cd1bc208847ab7701dbca7af328b3f601b11a1737a899575a
          5c14f4dca5aaca45e9935e07
Q.x     = 00bcaf32a968ff7971b3bbd9ce8edfbee1309e2019d7ff373c3838
          7a782b005dce6ceffccfeda5c6511c8f7f312f343f3a891029c585
          8f45ee0bf370aba25fc990cc
Q.y     = 00923517e767532d82cb8a0b59705eec2b7779ce05f9181c7d5d5e
          25694ef8ebd4696343f0bc27006834d2517215ecf79482a84111f5
          0c1bae25044fe1dd77744bbd

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
P.x     = 01801de044c517a80443d2bd4f503a9e6866750d2f94a22970f62d
          721f96e4310e4a828206d9cdeaa8f2d476705cc3bbc490a6165c68
          7668f15ec178a17e3d27349b
P.y     = 0068889ea2e1442245fe42bfda9e58266828c0263119f35a61631a
          3358330f3bb84443fcb54fcd53a1d097fccbe310489b74ee143fc2
          938959a83a1f7dd4a6fd395b
u[0]    = 01aab1fb7e5cd44ba4d9f32353a383cb1bb9eb763ed40b32bdd5f6
          66988970205998c0e44af6e2b5f6f8e48e969b3f649cae3c6ab463
          e1b274d968d91c02f00cce91
Q.x     = 01801de044c517a80443d2bd4f503a9e6866750d2f94a22970f62d
          721f96e4310e4a828206d9cdeaa8f2d476705cc3bbc490a6165c68
          7668f15ec178a17e3d27349b
Q.y     = 0068889ea2e1442245fe42bfda9e58266828c0263119f35a61631a
          3358330f3bb84443fcb54fcd53a1d097fccbe310489b74ee143fc2
          938959a83a1f7dd4a6fd395b
~~~

### P521\_XMD:SHA-512\_SVDW\_RO\_

~~~
suite   = P521_XMD:SHA-512_SVDW_RO_
dst     = QUUX-V01-CS02-with-P521_XMD:SHA-512_SVDW_RO_

msg     =
P.x     = 00c2329028e301fc7408caba82fdc65f01b76274fe63b0f402a44f
          455257c7d2d8af78e4dcff691647da60a67172029ff93c5802a37e
          1ff7933d31cd4b961b3d8785
P.y     = 00b6c85e6867c9627032579ef90b7c936dc29c073ad165998aee1b
          f993fd1c79c1e3da6d7105dff520a318edb3bfde49452ddb9355cc
          9e8e96dcbf675b70fe12c7c6
u[0]    = 00b0c92f49e7149f4a36f850af843f2c4056568b6b628b9d56454e
          f3bdd09bda12c123e78e8062dfb67becf0606619bf49623dd41f6a
          4c8f815acac4ca29576bf942
u[1]    = 002077d2a1087befb6d142cb55e0e0567b9fd3caf4fc6da92f6530
          277566543979007e0aef4563b801a457fcfa4e0740660a3586f834
          f2340c0dd3c1c7c05bab631a
Q0.x    = 000e55e0c94a37c69cc2ab4988feb8eed305eeb49853b4aeba73c7
          a03f25218851138a05e041485301cf3262683fcafa0edf06604c6c
          e1a9be6354944d191ad9c2a9
Q0.y    = 013e01bec02d82f21e8735d3f2713fb8cfb445dba4ff781de77a30
          b7270945ac8ab81fe2b0acadb3cd65863145afc614fd3a79b4f546
          bf9724c0435c36ff8a16d0a8
Q1.x    = 00a5e0fdbf28c734882a44990a132724c20ebe8cee2fa373ec80ea
          9ec7fe3d1deefb574e1647a4f0f3c78e02243eaa207108139b2b44
          9bef9508780fa0e8abb87fe7
Q1.y    = 001a964c31d27a1a79136d0e29bfbb7da6f7eda9eb4a32ebc028cb
          47113bd15acc399d0ebe6f4f580f54f00f05648bd4113353a87834
          57901244f117b21379a5925e

msg     = abc
P.x     = 00df93c450803a6e189351dcf03627eb36bb1d05dc14dce708aa3a
          52316e7f81d3426dece40029913f6c714f6b0972d5cef29f1b0582
          63a8f81cdb9e21c6b7f6f0e5
P.y     = 00dcb658cb4da246c05f6e1f501e65a6b12906e9dd25976180088c
          15f091df60176a3f20ea854daa45f6c592fba0710af363addd530a
          c4ddf23d39bdb15ff0e3fd2d
u[0]    = 004455034c767539e3b585e21de16586d19598513d3b515c165b73
          d247c0257bda0ad8cbbe20949e03633b44dabebf21ae0bfe0fbaa1
          4a7788c125a2fd17bd63c51c
u[1]    = 00a03b8b9e4b79f651a63a6e4734cd44384a693317ff6452763945
          5f61db97dfb886b42de96fd9d2d042f3a7259120bd7d70ba007d8d
          1e87501cb35ae953a2240e19
Q0.x    = 011b703fb9e5a4ed4eb2c40db80df7502123a549ccebf63c860035
          8c6143730d49e3a79f6a18e1ea36369a71c45516d744c1a8ea0bba
          de7328b92277ed7ded7fe966
Q0.y    = 0144a648349bf3407a03945a371feced94aa4cb50f9c1694a34756
          0f7a802178aa825713ff2a7293486be6f9affa1b5530cd5cc1228e
          dd342d0c4ebe3635419688b6
Q1.x    = 008e72c9339111f657e7179b7e788699fcdec9b3743f5adc752c65
          10c7842c45e00b25edd0d4892016dc0272c37bd4b294c391e2deec
          0a5da8bc1cccbf9572b98f68
Q1.y    = 001d0d393890809a4743a38900cdc65a4a8a202d8666e362a587a3
          6242992b9153962a5933eea23ce5fc192a62649d8e89232ce1edaf
          6c8c793f8d9665ad1be35dbd

msg     = abcdef0123456789
P.x     = 004249eaa12cefe9c948cf91ca1a6b3f02143e74128595cb2db95a
          879ebdb2b4501b2c30358d6710e24fd804de451b72d248448ce8a2
          c43ebc687e0d4af8637424ee
P.y     = 0110e9196e55121463246b47df034d5a784c0dcf4024286d99cb41
          4a7496f5933f9d8dc3fc6e40eb7d2816dc0c5ab9f3b12fd37523bf
          429120ab2073f6ae18496523
u[0]    = 005d443b2be2e2a004f35285c935c6fdb94ca2d8573bc622f09f81
          7fafb91366c60994ed9fe117cdbc1de89fb3af71905f6212dd5110
          2237c1b25b395a4fd66f2d65
u[1]    = 01b89e64165f1f210d02fea13298b2dbc1b46d7666447c138c215e
          4e118b5c752e253c789ee0006408a7d63e7beb75d0268dc4395439
          7c87210fdfe5e100a5566321
Q0.x    = 00646618c91d752815029292d525864d8e3e013e7c5921d1c07efc
          3be89fb324b20d90d49c2f2c889d91a7f3cb06b70db6858290e37d
          d76c4fad78fb984ac76ce291
Q0.y    = 003485a77730e37e75f128b1cbf6e17a1c127469ce52d0eed044ec
          04681515a8d53d2c828dc4b6320cc21775fa671b07bb653ed775f8
          54adcd53d8f8140d52b22d5b
Q1.x    = 01c962d25cf26246e4c1f0791c66a5c461479c2b75ad7517c31797
          37186ea1af50378ac2fb607232c1bc8f346c5f2aad4b40f5bae0a0
          11b6f878123b8f5eaa755904
Q1.y    = 0095695352c31b7c8a9b07d62cab9e3aa0b3ec48e51ab05d40ef55
          9fe5ce5e8c2c9c8e834d112465a3f7f524a5bcc700c92774b814a3
          f33ab54804fb62104adc593f

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
P.x     = 00add10e0ae9283d836b40b4439370c36458b958428fc6aaec95e9
          f89d0ac17752768607dcf72f277466bd6fd6fc18b65ab3fbd4200f
          ecd730c70edc63290b261294
P.y     = 016f8e6c3796a7967be36d1c35b9a0e38967db819d2b648b150f1a
          5c01544ecde30a081cbf752b7c4abd2f7b386c12e33442a7fcf905
          a982f6a57d1f91c8d6a28c1c
u[0]    = 01db29b787e0673649313e53e746a51d492602d7959a2e4fc9cfc8
          55868172a04d3c9b881684b5daba15f6c01f77b74096285ff15917
          df01801ae9b4c1e52fa1eae9
u[1]    = 01826946e1ec69d714897099a4f4517f4b0ee2c681f1e867e07f88
          48da53acdf40f6f66778850c3752ab3665c8c51ed99c09437a3df7
          7d50a6b2822e40bc2d38422d
Q0.x    = 00016fb0ebf3f60e29f68cafebe331c569314dfa50f2246ee18b0a
          516888626e0d06f07655c815e1996c5edc44972d310cf4f19abe11
          557cbe1e75b7e410cf0f964d
Q0.y    = 00262e61ef4e607b2c7964ae8f3e33337f4b0993de38939dc24e07
          888f702381bfd6a0c1a662c270740c594d1d72699052b7e2782b52
          2d78d07e3bc2c869a10c7509
Q1.x    = 01534c2748791a1f8a311d70067f5865c79f5efebe44c04a961d8f
          539b6de7881d8f30c6ddb672e4327a30780b7bfc1f4004c1ff6f3f
          532987bb0713170df92d872f
Q1.y    = 01b29c4b52caaa3d6d93a91758519e82058cd5577f92f616ef89c3
          5fd019de3c802e34ac4529119c210efd7a8c3fe9d2bde1544f16d3
          d1de64406617cf73fbc523bb
~~~

### P521\_XMD:SHA-512\_SVDW\_NU\_

~~~
suite   = P521_XMD:SHA-512_SVDW_NU_
dst     = QUUX-V01-CS02-with-P521_XMD:SHA-512_SVDW_NU_

msg     =
P.x     = 00d324c3f3baef49bfb162add0a1e84fcdf0897cf56d30dcc294d2
          8b47ab97ea9404330aaa9ce997b663d55882c700c2feef860cbe31
          a4a5c3ed768975384ea4a2fc
P.y     = 0060b7be2fa5d312acef674e14c6dbbb1faafb68a1c0ed7c20638a
          3b3e58b1697ad0a37d6a172b49475eb48a62b5efb1c4cacce44579
          6c7754b373dcc24d669b9bf6
u[0]    = 016d41fa9f5bd842f2da951e773b709ca0332492485fb5a40732ba
          9f3181382da10df2556756c0c56501a30f48a1b3e88b4b04245a79
          370daddcf6aedfc97e47fcd6
Q.x     = 00d324c3f3baef49bfb162add0a1e84fcdf0897cf56d30dcc294d2
          8b47ab97ea9404330aaa9ce997b663d55882c700c2feef860cbe31
          a4a5c3ed768975384ea4a2fc
Q.y     = 0060b7be2fa5d312acef674e14c6dbbb1faafb68a1c0ed7c20638a
          3b3e58b1697ad0a37d6a172b49475eb48a62b5efb1c4cacce44579
          6c7754b373dcc24d669b9bf6

msg     = abc
P.x     = 0105dae4570958d52596b55a166de5e7680c9525bda4cc23323334
          a9f4cb43e09c329813488506221e33dedad54b0f8bbe18941a3839
          2c3def97e9a5c2d4991f30f0
P.y     = 00dd1ece89cd8a10c3f4034c917b23c4b777b807c53c6e0072d1a0
          f3281ce80ee3a403fc146f2b08e9b96002deee0fac117781e0d671
          d7658905997cd00620dc2ee3
u[0]    = 00aa8cfa32ca08b8999ab5fba02c833c477d2573f3ad7f072d9d17
          520cc2835a7f31da1b093469e327e08c87f3bbc41ed80fafbcf3eb
          a50c4dfd9bd0714f586575e1
Q.x     = 0105dae4570958d52596b55a166de5e7680c9525bda4cc23323334
          a9f4cb43e09c329813488506221e33dedad54b0f8bbe18941a3839
          2c3def97e9a5c2d4991f30f0
Q.y     = 00dd1ece89cd8a10c3f4034c917b23c4b777b807c53c6e0072d1a0
          f3281ce80ee3a403fc146f2b08e9b96002deee0fac117781e0d671
          d7658905997cd00620dc2ee3

msg     = abcdef0123456789
P.x     = 0026e883c32ed9a3765d51fc98d94aae7c80248aa4aef76845d32f
          4334a44cab4dc55ae2b4d076447d443a6e53888e90a76531fabbd6
          46588f1bf8565d75d982f47f
P.y     = 004afd2bd9fded7fb62025349391d3594c580d78a6f6507f033308
          15d8ac4e4258810151d472f3fc626e3e5e3ba38e5d811a94235c73
          7ad2f5ff7b867914afc6ebf3
u[0]    = 01a014afa8c1e8f75df573f25042d968bb56caf120b3ee5aa91794
          5b809861b22105fd632506d531e16b0392d4a6c593b62feda783b8
          1014af3f8c2f1b88a2ce78db
Q.x     = 0026e883c32ed9a3765d51fc98d94aae7c80248aa4aef76845d32f
          4334a44cab4dc55ae2b4d076447d443a6e53888e90a76531fabbd6
          46588f1bf8565d75d982f47f
Q.y     = 004afd2bd9fded7fb62025349391d3594c580d78a6f6507f033308
          15d8ac4e4258810151d472f3fc626e3e5e3ba38e5d811a94235c73
          7ad2f5ff7b867914afc6ebf3

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
P.x     = 010e4d3cd3f19f98d6acc40a1a8fdf044b1e4922f1934a1e06573a
          8371ec7f27516cdc606748d79a2d92d76277e82ecb3cc7b94e93a4
          0eac737afe95211a65fca810
P.y     = 01b7684cc5893ebbd35d8ce2c3145eea37c6415771ed923af55fe5
          bd9f5323b8ff413f4d9a94dc4284584496011f2da0fcef6cb773c5
          972d0caf17faf076e9eead9c
u[0]    = 014131160edfb9bafa6a0391d05368ee5cacad1c0456114f233f48
          cd56e71315e038543a46b9193b297600196a55b91203afc6e30505
          889da57fdaf5e342818d609e
Q.x     = 010e4d3cd3f19f98d6acc40a1a8fdf044b1e4922f1934a1e06573a
          8371ec7f27516cdc606748d79a2d92d76277e82ecb3cc7b94e93a4
          0eac737afe95211a65fca810
Q.y     = 01b7684cc5893ebbd35d8ce2c3145eea37c6415771ed923af55fe5
          bd9f5323b8ff413f4d9a94dc4284584496011f2da0fcef6cb773c5
          972d0caf17faf076e9eead9c
~~~

## curve25519

### curve25519\_XMD:SHA-256\_ELL2\_RO\_

~~~
suite   = curve25519_XMD:SHA-256_ELL2_RO_
dst     = QUUX-V01-CS02-with-curve25519_XMD:SHA-256_ELL2_RO_

msg     =
P.x     = 4862b8982319ecce44c1b6ccf7ba9c205d137764dc98a8bc515ddf
          05c0fddb82
P.y     = 3cee08cfd22a80a995c3cb6c4ebb9013f1b3d9ab510af661aef334
          92e62c2eba
u[0]    = 7a4e3b740e8dc911b8029ce6a65d6bc00bf03d8d92866a6ae99902
          6439451ea5
u[1]    = 5b7b0f765beb8b9051ce5ca68232c305fb1eb79426c43cb93efce2
          f8a985065b
Q0.x    = 50243f13d19b38590084e7a58e063a4cfc63123b57c868fb69aa29
          f90085f2f8
Q0.y    = 09920ffda8c180a2bcd999d411e032f799ab9e08ba312d5a236d13
          0f7ce824e2
Q1.x    = 41baf7c5cded32252f9051d537ea0cb8cb1a89fe61b7a7fc81228c
          793984075e
Q1.y    = 177ab481ae51c765ff5e5547760dd51f04b27107e3a0eb788d73fa
          ba5d9a7dd3

msg     = abc
P.x     = 1c44a862cd8ce1c2f5e9ef28f96fa22f1cc6d4bb3dee19e76c20e1
          b7e427e4de
P.y     = 0a2ca953d666a5aedfae4198f5c6fa7dd4c7b7b920aac855802832
          93c8a5481a
u[0]    = 1c72fdce7455952e317d9c99be2d41e0bd5ea9fdef44b3890a6f00
          e6df68dc08
u[1]    = 666ec661edfbc1e979a1b52c821e491069e7b6bf3e3071b2793669
          adb0d51d48
Q0.x    = 0cc50715428377fc3e246f18180a6dad804e76382ca30b228ade26
          ed417ce863
Q0.y    = 28247138ef21d16dc8b24196b30943292ef31738ff32317c6f5920
          227c9aa331
Q1.x    = 7d15f5242faac9dc9b24d5a92ee7059a193c75863c56cc28309a57
          5b1f113240
Q1.y    = 3b7c8d357c423a840173e263f592d1fd61f1756414655388fee002
          9e8a3df94b

msg     = abcdef0123456789
P.x     = 18b0cebd7c0c183faa6ef80de99c4e1f5a53fb012164d4fd20a28a
          1ba1cd15ee
P.y     = 764bdd170a631f9b17bb4bc01434f10920f4cb5e5ab49f54f7e5ce
          220368324f
u[0]    = 6403431b8b370088637a608849b184b257c0394dbd94416a765335
          1be9a769d7
u[1]    = 48a581f02df76a8b30d72b295e08aaf1a8b5c2a1774599d3ae069e
          ceaf5363b3
Q0.x    = 2e5e5f9f180d3f934de4f6e9665afb13f63af94822818fb7f6a6d4
          2eb630f558
Q0.y    = 44741c5756f2c4e9735c23dc17771d871636f849e097b0a73492bf
          df1882dbd7
Q1.x    = 40022c69f6df7e3fca358b3ca2188a1aceb6c87fd54104d61dc563
          ff7506f9aa
Q1.y    = 3e77a3381adbc93504f2a3e38749e47ab9db5068237be7b4b5b1b7
          5f368f779f

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
P.x     = 242e08f391333017bd0e073ff98a035ce12d06958d665bdc747f26
          aa4c068797
P.y     = 58c35ae3481ef62470e1ff7a74636b5217299120d7b9d64b0975f1
          534e214fd4
u[0]    = 5cb58f59fc0408aedd631a35127867c5f57c08dd16ed2f41d2c53a
          5d171c1f5f
u[1]    = 75256ab69d1682b3684aee79407187eadba42c2535951a5a9d0439
          119a09e220
Q0.x    = 3d2ddec936382349e044cb1bbd4ea77c5897be086cf0257a6e098b
          4c86593830
Q0.y    = 24f41fa861e1d5d50738d1feecfd97a09b25ff10a0ffd76ee5a4be
          9ceef20c03
Q1.x    = 61d6d7ecdf8adaa92aa234caf888d28b143d0df7a935a858a9b025
          38c83fcfa8
Q1.y    = 66219626f0e6b2eb140a457602b8464795203b2f0958dd341a5b67
          671f3c6446
~~~

### curve25519\_XMD:SHA-256\_ELL2\_NU\_

~~~
suite   = curve25519_XMD:SHA-256_ELL2_NU_
dst     = QUUX-V01-CS02-with-curve25519_XMD:SHA-256_ELL2_NU_

msg     =
P.x     = 29bdf5d29093fa455527f71e127051a2e041a49280491a76a1388a
          d076f6095d
P.y     = 3de8f04872088447568cad67c91dbeec50f5598fc877bf37cad9ab
          468bce0323
u[0]    = 4891f78130dadef68a54bdd970a27d8ee6ee71c757466de3c62567
          9be2b6b503
Q.x     = 108610cd44e0269b3850000447c055b05a64846111a30c94ba6339
          8771934ceb
Q.y     = 6acae1b616d835282f2c717e4439d6074f6cc000177c25e18ac8d8
          60a3dd63b2

msg     = abc
P.x     = 3358356987959ca72432c8662f46590267fd5ac352fbedcd3d6279
          499fedc0dc
P.y     = 1a8a98a200593bc8f3355fc8e60e2cf09c5b288eb7232bea227886
          b39ed54d1d
u[0]    = 21d66e516ae54fae0a51c3bb70446ec38c5f19eb506ae8686e6748
          72d950d2c2
Q.x     = 2b123502330b33d1a880146c1e84ec5ff95679bea200d6d5cf4042
          99af42def8
Q.y     = 44920d10af5b5a20b113572479cdd02253b70eff8f612afa782c55
          278d997213

msg     = abcdef0123456789
P.x     = 43c767fc98423fa43546890d80e5da0e214928d3d4a596661bb61d
          82a67b998d
P.y     = 62da60fc3d86471d6b181bb66948f3eb24fedfc0dea953caf305be
          07e829a6f1
u[0]    = 48b37143c123d622f5ecab78883f76c853fb679d084454efae891a
          e1f3f34979
Q.x     = 5bb746418e69e835ec6cc74d6b498ee04dd598b5b9ca805b73bb33
          0ae3a72151
Q.y     = 4b0969181ba9cb050e16367b6469d31cc017e68ed38f0ffdc3312f
          067fe897ca

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
P.x     = 5fdb7e86a2e7dc2b58d68916a88060261612ce60792116be083962
          dd938cd396
P.y     = 3cb7911525bda90a355e0346f81a00cc765e39cfc32651a6eb4777
          744d71c677
u[0]    = 4408df5a3aaaab5aea075c0713feda3675c2c4cd6b6b09672aab2f
          0749553d08
Q.x     = 2c8722b119aa6da7b32fcd4737ecb649a117b5262460e1aa2f0ebf
          a56f4cc5a2
Q.y     = 5e93469aa8cab6e6b557b27d55ddae13c68c7dca950fba33c79022
          2cb6c99eca
~~~

### curve25519\_XMD:SHA-512\_ELL2\_RO\_

~~~
suite   = curve25519_XMD:SHA-512_ELL2_RO_
dst     = QUUX-V01-CS02-with-curve25519_XMD:SHA-512_ELL2_RO_

msg     =
P.x     = 2de3780abb67e861289f5749d16d3e217ffa722192d16bbd9d1bfb
          9d112b98c0
P.y     = 3b5dc2a498941a1033d176567d457845637554a2fe7a3507d21abd
          1c1bd6e878
u[0]    = 005fe8a7b8fef0a16c105e6cadf5a6740b3365e18692a9c05bfbb4
          d97f645a6a
u[1]    = 1347edbec6a2b5d8c02e058819819bee177077c9d10a4ce165aab0
          fd0252261a
Q0.x    = 36b4df0c864c64707cbf6cf36e9ee2c09a6cb93b28313c169be295
          61bb904f98
Q0.y    = 6cd59d664fb58c66c892883cd0eb792e52055284dac3907dd756b4
          5d15c3983d
Q1.x    = 3fa114783a505c0b2b2fbeef0102853c0b494e7757f2a089d0daae
          7ed9a0db2b
Q1.y    = 76c0fe7fec932aaafb8eefb42d9cbb32eb931158f469ff3050af15
          cfdbbeff94

msg     = abc
P.x     = 2b4419f1f2d48f5872de692b0aca72cc7b0a60915dd70bde432e82
          6b6abc526d
P.y     = 1b8235f255a268f0a6fa8763e97eb3d22d149343d495da1160eff9
          703f2d07dd
u[0]    = 49bed021c7a3748f09fa8cdfcac044089f7829d3531066ac9e74e0
          994e05bc7d
u[1]    = 5c36525b663e63389d886105cee7ed712325d5a97e60e140aba7e2
          ce5ae851b6
Q0.x    = 16b3d86e056b7970fa00165f6f48d90b619ad618791661b7b5e1ec
          78be10eac1
Q0.y    = 4ab256422d84c5120b278cbdfc4e1facc5baadffeccecf8ee9bf39
          46106d50ca
Q1.x    = 7ec29ddbf34539c40adfa98fcb39ec36368f47f30e8f888cc7e86f
          4d46e0c264
Q1.y    = 10d1abc1cae2d34c06e247f2141ba897657fb39f1080d54f09ce0a
          f128067c74

msg     = abcdef0123456789
P.x     = 68ca1ea5a6acf4e9956daa101709b1eee6c1bb0df1de3b90d46023
          82a104c036
P.y     = 2a375b656207123d10766e68b938b1812a4a6625ff83cb8d5e86f5
          8a4be08353
u[0]    = 6412b7485ba26d3d1b6c290a8e1435b2959f03721874939b21782d
          f17323d160
u[1]    = 24c7b46c1c6d9a21d32f5707be1380ab82db1054fde82865d5c9e3
          d968f287b2
Q0.x    = 71de3dadfe268872326c35ac512164850860567aea0e7325e6b91a
          98f86533ad
Q0.y    = 26a08b6e9a18084c56f2147bf515414b9b63f1522e1b6c5649f7d4
          b0324296ec
Q1.x    = 5704069021f61e41779e2ba6b932268316d6d2a6f064f997a22fef
          16d1eaeaca
Q1.y    = 50483c7540f64fb4497619c050f2c7fe55454ec0f0e79870bb4430
          2e34232210

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
P.x     = 1bc61845a138e912f047b5e70ba9606ba2a447a4dade024c8ef3dd
          42b7bbc5fe
P.y     = 623d05e47b70e25f7f1d51dda6d7c23c9a18ce015fe3548df596ea
          9e38c69bf1
u[0]    = 20f481e85da7a3bf60ac0fb11ed1d0558fc6f941b3ac5469aa8b56
          ec883d6d7d
u[1]    = 017d57fd257e9a78913999a23b52ca988157a81b09c5442501d07f
          ed20869465
Q0.x    = 02d606e2699b918ee36f2818f2bc5013e437e673c9f9b9cdc15fd0
          c5ee913970
Q0.y    = 29e9dc92297231ef211245db9e31767996c5625dfbf92e1c8107ef
          887365de1e
Q1.x    = 38920e9b988d1ab7449c0fa9a6058192c0c797bb3d42ac34572434
          1a1aa98745
Q1.y    = 24dcc1be7c4d591d307e89049fd2ed30aae8911245a9d8554bf603
          2e5aa40d3d
~~~

### curve25519\_XMD:SHA-512\_ELL2\_NU\_

~~~
suite   = curve25519_XMD:SHA-512_ELL2_NU_
dst     = QUUX-V01-CS02-with-curve25519_XMD:SHA-512_ELL2_NU_

msg     =
P.x     = 1bb913f0c9daefa0b3375378ffa534bda5526c97391952a7789eb9
          76edfe4d08
P.y     = 4548368f4f983243e747b62a600840ae7c1dab5c723991f85d3a97
          68479f3ec4
u[0]    = 608d892b641f0328523802a6603427c26e55e6f27e71a91a478148
          d45b5093cd
Q.x     = 51125222da5e763d97f3c10fcc92ea6860b9ccbbd2eb1285728f56
          6721c1e65b
Q.y     = 343d2204f812d3dfc5304a5808c6c0d81a903a5d228b342442aa3c
          9ba5520a3d

msg     = abc
P.x     = 7c22950b7d900fa866334262fcaea47a441a578df43b894b4625c9
          b450f9a026
P.y     = 5547bc00e4c09685dcbc6cb6765288b386d8bdcb595fa5a6e3969e
          08097f0541
u[0]    = 46f5b22494bfeaa7f232cc8d054be68561af50230234d7d1d63d1d
          9abeca8da5
Q.x     = 7d56d1e08cb0ccb92baf069c18c49bb5a0dcd927eff8dcf75ca921
          ef7f3e6eeb
Q.y     = 404d9a7dc25c9c05c44ab9a94590e7c3fe2dcec74533a0b24b188a
          5d5dacf429

msg     = abcdef0123456789
P.x     = 31ad08a8b0deeb2a4d8b0206ca25f567ab4e042746f792f4b7973f
          3ae2096c52
P.y     = 405070c28e78b4fa269427c82827261991b9718bd6c6e95d627d70
          1a53c30db1
u[0]    = 235fe40c443766ce7e18111c33862d66c3b33267efa50d50f9e8e5
          d252a40aaa
Q.x     = 3fbe66b9c9883d79e8407150e7c2a1c8680bee496c62fabe4619a7
          2b3cabe90f
Q.y     = 08ec476147c9a0a3ff312d303dbbd076abb7551e5fce82b48ab14b
          433f8d0a7b

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
P.x     = 5fd892c0958d1a75f54c3182a18d286efab784e774d1e017ba2fb2
          52998b5dc1
P.y     = 750af3c66101737423a4519ac792fb93337bd74ee751f19da4cf1e
          94f4d6d0b8
u[0]    = 1a68a1af9f663592291af987203393f707305c7bac9c8d63d6a729
          bdc553dc19
Q.x     = 3bcd651ee54d5f7b6013898aab251ee8ecc0688166fce6e9548d38
          472f6bd196
Q.y     = 1bb36ad9197299f111b4ef21271c41f4b7ecf5543db8bb5931307e
          bdb2eaa465
~~~

## edwards25519

### edwards25519\_XMD:SHA-256\_ELL2\_RO\_

~~~
suite   = edwards25519_XMD:SHA-256_ELL2_RO_
dst     = QUUX-V01-CS02-with-edwards25519_XMD:SHA-256_ELL2_RO_

msg     =
P.x     = 53ac663046740a4bc180891e996db82fb48a5a051f2dd0d3808048
          97ed65e1bd
P.y     = 1566a66619869788e3118b8729c95d516f02e2046c51aa7ab46170
          eea2b154f2
u[0]    = 1cda39a155fe178dd5a88ba5c5ff456baa595579e050aebb7d89b9
          18c9a78e98
u[1]    = 234243d476b1f9186e895791b807cadd65f14561cee07ac508aa60
          e81dc5f76e
Q0.x    = 7ab9c1b7138b02fa701183b053d70180e814bf8250783135957a96
          40c78d27f9
Q0.y    = 4dbdd251600f4d319c59994bc33a3e128ca3d66b0ab4ae73d806ae
          c3aaf2a6eb
Q1.x    = 6f3b9ae48cbd7bc4e7f8a9087bc70f775e9e348a64844b6bad406c
          a9d22bf623
Q1.y    = 4e6d9f086413708220e077200c520b905db98be707731a2f3ae2ba
          90c2ccf341

msg     = abc
P.x     = 150a8b22d71dc515d0bc015e036fff6063c2738bed062b4bd4e45d
          fb306bb672
P.y     = 44f8c2f0717c37c2e841fd09ee88a238b07eb4072734046b161088
          d56212ccca
u[0]    = 392fbef0f4c3d92db0dd03b6dd0b113df1f9e128396fe4278b9660
          6526da9e4c
u[1]    = 5b4e8ceb8ac3285926c00fcd2e28078abb873e8bca23d26ecbf3bf
          c563f38aec
Q0.x    = 65ac095f1233ccc52b2f6d3b956dd453c6b2cdb615eccb5e470458
          2c635e0d29
Q0.y    = 2c6ee9f560541fc13471a2bdb746a5122eccde8aeabe0939f689f2
          6c0a668171
Q1.x    = 3d227071ab5124dfa9f04a19384ce442a33898345f0bdbfc4ec2d4
          72b0714210
Q1.y    = 198dd2b0302536412535d23e0620b1612cd698d6176eb9c84732c9
          d28438f69b

msg     = abcdef0123456789
P.x     = 19b4423cd35c33c79d0cd3f0698a855c92dc36617d523ff3647c76
          80fb82b09a
P.y     = 761dd3547fc2212368eaec049556c3ae8399ba9fd21252d9ca3bbb
          64a1ce8bf4
u[0]    = 547dab6ccf2e84c0a37f99e1aa4a15dc4d3ba5309e72eb03fc4496
          c222238385
u[1]    = 6fb74a3b4d14cce173963884c18fb4c3f07b9ea580234a04cf6413
          a730ec4aa9
Q0.x    = 1203c38c3dbef03bea6183a1164f9c9f518bdb359a441bd3bb8faf
          a718e668db
Q0.y    = 201a5f67d1d6f44febd2f3213595deee5b2bf0153c3456852524fd
          c1ddbc55d1
Q1.x    = 638759f445d6b1c898fdee416748d5e23380d2683c0a9fe9466fe7
          0db5270ae9
Q1.y    = 00bf76dc96b8155e38e5a768a559e2be034f618440c905466d0123
          7cf8d7e2ea

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
P.x     = 52969df2b9fc0ba7b20ed9059b1e403b6070f4d761d5ac60f294f3
          14df6a408e
P.y     = 1cfebca1e0b814be10a242ccb253c1e99c64ecd3195330bd6f3167
          8a360cad6b
u[0]    = 75f8afc35f93cad88d59f4b73576f06e72de65e6aff741fc0903c0
          1026e981fb
u[1]    = 4f5a310a3b276eb4398e9c22894bed97cda5670f4793468b9739c7
          cf2698da87
Q0.x    = 768deb6e6a4e65add93a5bf404e4ce76ef57dcc3be1e177d9bd519
          0642200f79
Q0.y    = 03caedd4af6f21bcc9fee6e40a1303f2793570db5bf1e60e2c2663
          2da0e32ad5
Q1.x    = 1f46eda025be2913f89227bd22461b7db2c42467bb3eabeecd2721
          657e3d735f
Q1.y    = 4c32cc1ae29429c1a09d4e12a87791af0356e3241c03c36b0470c8
          deb24ce5a4
~~~

### edwards25519\_XMD:SHA-256\_ELL2\_NU\_

~~~
suite   = edwards25519_XMD:SHA-256_ELL2_NU_
dst     = QUUX-V01-CS02-with-edwards25519_XMD:SHA-256_ELL2_NU_

msg     =
P.x     = 0fe5d93c5b7e884f21ff6d26d399aaa480b02aa2a448c1698388f2
          fc2f4a4780
P.y     = 0790ea483b3c32db6bf309284b4505a223fc924566aec49c07818e
          6f47828fae
u[0]    = 02a1cfe37eb58fe86a4000791177a5b43aa1886711d4ba24f56976
          2045700085
Q.x     = 25c3d41731b9b929e0df904056444c8d69c425b2c1abb4b36357aa
          1a344a9734
Q.y     = 1ef6f720a96797dcc7118c98daae4189cdc1f8405a39e3c4e15546
          03410178ac

msg     = abc
P.x     = 7306c55c38f0407ba67123cb0185998ff1807d27541b3d7a98c9c3
          e143801f38
P.y     = 767f521b90cb19a5c9918df81d212a9b50be4500ee246e81f48baf
          5911bfd5f5
u[0]    = 1debc09abffdf870affecb05d1656ba98d41404506b55a08c4bbdb
          42a40969bc
Q.x     = 02079693d400c83ab5e0d49e12fecd0cc6bdda4bae5dc61627cff9
          8e1f88589c
Q.y     = 4ebddb42951ec7ff17770a3f1a63f023c0c94df20f9e64ca4686f0
          7adf3262a7

msg     = abcdef0123456789
P.x     = 4b6bbd347ea59230daaadaad2bec527d0ab54d4e33bf3c041553a5
          d2e1fcad33
P.y     = 7850c843092d554be1f3ac27ba4e3cfe18c510a10ddc32de67657c
          0a5a806881
u[0]    = 3dd81e4eb3c6231942f9140e1dd0d18bc0200b754ef8d3b2f39d1b
          044edf1c5d
Q.x     = 036b0261181df7b7510d9aae789693a6a6c8ecd93288b63117bd25
          20174f8a99
Q.y     = 1b348cf9a9be673f47f6ab1c4db44ad72ab22cd1a91383098ded8e
          bd4eff5c99

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
P.x     = 60f765a74455643897a2f9d66b054d28f46c57084a7f0baec2401c
          fb4150b44d
P.y     = 76f903b132761d6983ae88558da61086673e3da33356892e154304
          11e2ad8261
u[0]    = 6abcc53ddc54f5e1927b92cbe1aca2ee28b37338e72dbc74736457
          5986a93c7e
Q.x     = 0035341a80d048a93eee132344832f9af6af4cd73ef0c6445afd44
          8125364430
Q.y     = 31af431a1ab3fb618a9f02288d53295ba11745d346a7c194864973
          0a9e1acffe
~~~

### edwards25519\_XMD:SHA-512\_ELL2\_RO\_

~~~
suite   = edwards25519_XMD:SHA-512_ELL2_RO_
dst     = QUUX-V01-CS02-with-edwards25519_XMD:SHA-512_ELL2_RO_

msg     =
P.x     = 3c3da6925a3c3c268448dcabb47ccde5439559d9599646a8260e47
          b1e4822fc6
P.y     = 09a6c8561a0b22bef63124c588ce4c62ea83a3c899763af26d7953
          02e115dc21
u[0]    = 03fef4813c8cb5f98c6eef88fae174e6e7d5380de2b007799ac7ee
          712d203f3a
u[1]    = 780bdddd137290c8f589dc687795aafae35f6b674668d92bf92ae7
          93e6a60c75
Q0.x    = 6549118f65bb617b9e8b438decedc73c496eaed496806d3b2eb9ee
          60b88e09a7
Q0.y    = 7315bcc8cf47ed68048d22bad602c6680b3382a08c7c5d3f439a97
          3fb4cf9feb
Q1.x    = 31dcfc5c58aa1bee6e760bf78cbe71c2bead8cebb2e397ece0f37a
          3da19c9ed2
Q1.y    = 7876d81474828d8a5928b50c82420b2bd0898d819e9550c5c82c39
          fc9bafa196

msg     = abc
P.x     = 608040b42285cc0d72cbb3985c6b04c935370c7361f4b7fbdb1ae7
          f8c1a8ecad
P.y     = 1a8395b88338f22e435bbd301183e7f20a5f9de643f11882fb237f
          88268a5531
u[0]    = 5081955c4141e4e7d02ec0e36becffaa1934df4d7a270f70679c78
          f9bd57c227
u[1]    = 005bdc17a9b378b6272573a31b04361f21c371b256252ae5463119
          aa0b925b76
Q0.x    = 5c1525bd5d4b4e034512949d187c39d48e8cd84242aa4758956e4a
          dc7d445573
Q0.y    = 2bf426cf7122d1a90abc7f2d108befc2ef415ce8c2d09695a74072
          40faa01f29
Q1.x    = 37b03bba828860c6b459ddad476c83e0f9285787a269df2156219b
          7e5c86210c
Q1.y    = 285ebf5412f84d0ad7bb4e136729a9ffd2195d5b8e73c0dc85110c
          e06958f432

msg     = abcdef0123456789
P.x     = 6d7fabf47a2dc03fe7d47f7dddd21082c5fb8f86743cd020f3fb14
          7d57161472
P.y     = 53060a3d140e7fbcda641ed3cf42c88a75411e648a1add71217f70
          ea8ec561a6
u[0]    = 285ebaa3be701b79871bcb6e225ecc9b0b32dff2d60424b4c50642
          636a78d5b3
u[1]    = 2e253e6a0ef658fedb8e4bd6a62d1544fd6547922acb3598ec6b36
          9760b81b31
Q0.x    = 3ac463dd7fddb773b069c5b2b01c0f6b340638f54ee3bd92d452fc
          ec3015b52d
Q0.y    = 7b03ba1e8db9ec0b390d5c90168a6a0b7107156c994c674b61fe69
          6cbeb46baf
Q1.x    = 0757e7e904f5e86d2d2f4acf7e01c63827fde2d363985aa7432106
          f1b3a444ec
Q1.y    = 50026c96930a24961e9d86aa91ea1465398ff8e42015e2ec1fa397
          d416f6a1c0

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
P.x     = 0efcfde5898a839b00997fbe40d2ebe950bc81181afbd5cd6b9618
          aa336c1e8c
P.y     = 6dc2fc04f266c5c27f236a80b14f92ccd051ef1ff027f26a07f8c0
          f327d8f995
u[0]    = 6e34e04a5106e9bd59f64aba49601bf09d23b27f7b594e56d5de06
          df4a4ea33b
u[1]    = 1c1c2cb59fc053f44b86c5d5eb8c1954b64976d0302d3729ff66e8
          4068f5fd96
Q0.x    = 21091b2e3f9258c7dfa075e7ae513325a94a3d8a28e1b1cb3b5b6f
          5d65675592
Q0.y    = 41a33d324c89f570e0682cdf7bdb78852295daf8084c669f2cc969
          2896ab5026
Q1.x    = 4c07ec48c373e39a23bd7954f9e9b66eeab9e5ee1279b867b3d531
          5aa815454f
Q1.y    = 67ccac7c3cb8d1381242d8d6585c57eabaddbb5dca5243a68a8aeb
          5477d94b3a
~~~

### edwards25519\_XMD:SHA-512\_ELL2\_NU\_

~~~
suite   = edwards25519_XMD:SHA-512_ELL2_NU_
dst     = QUUX-V01-CS02-with-edwards25519_XMD:SHA-512_ELL2_NU_

msg     =
P.x     = 1ff2b70ecf862799e11b7ae744e3489aa058ce805dd323a936375a
          84695e76da
P.y     = 222e314d04a4d5725e9f2aff9fb2a6b69ef375a1214eb19021ceab
          2d687f0f9b
u[0]    = 7f3e7fb9428103ad7f52db32f9df32505d7b427d894c5093f7a0f0
          374a30641d
Q.x     = 42836f691d05211ebc65ef8fcf01e0fb6328ec9c4737c26050471e
          50803022eb
Q.y     = 22cb4aaa555e23bd460262d2130d6a3c9207aa8bbb85060928beb2
          63d6d42a95

msg     = abc
P.x     = 5f13cc69c891d86927eb37bd4afc6672360007c63f68a33ab423a3
          aa040fd2a8
P.y     = 67732d50f9a26f73111dd1ed5dba225614e538599db58ba30aaea1
          f5c827fa42
u[0]    = 09cfa30ad79bd59456594a0f5d3a76f6b71c6787b04de98be5cd20
          1a556e253b
Q.x     = 333e41b61c6dd43af220c1ac34a3663e1cf537f996bab50ab66e33
          c4bd8e4e19
Q.y     = 51b6f178eb08c4a782c820e306b82c6e273ab22e258d972cd0c511
          787b2a3443

msg     = abcdef0123456789
P.x     = 1dd2fefce934ecfd7aae6ec998de088d7dd03316aa1847198aecf6
          99ba6613f1
P.y     = 2f8a6c24dd1adde73909cada6a4a137577b0f179d336685c4a955a
          0a8e1a86fb
u[0]    = 475ccff99225ef90d78cc9338e9f6a6bb7b17607c0c4428937de75
          d33edba941
Q.x     = 55186c242c78e7d0ec5b6c9553f04c6aeef64e69ec2e824472394d
          a32647cfc6
Q.y     = 5b9ea3c265ee42256a8f724f616307ef38496ef7eba391c08f99f3
          bea6fa88f0

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
P.x     = 6e5e1f37e99345887fc12111575fc1c3e36df4b289b8759d23af14
          d774b66bff
P.y     = 2c90c3d39eb18ff291d33441b35f3262cdd307162cc97c31bfcc7a
          4245891a37
u[0]    = 3cb0178a8137cefa5b79a3a57c858d7eeeaa787b2781be4a362a2f
          0750d24fa0
Q.x     = 3e6368cff6e88a58e250c54bd27d2c989ae9b3acb6067f2651ad28
          2ab8c21cd9
Q.y     = 38fb39f1566ca118ae6c7af42810c0bb9767ae5960abb5a8ca7925
          30bfb9447d
~~~

## curve448

### curve448\_XMD:SHA-512\_ELL2\_RO\_

~~~
suite   = curve448_XMD:SHA-512_ELL2_RO_
dst     = QUUX-V01-CS02-with-curve448_XMD:SHA-512_ELL2_RO_

msg     =
P.x     = da2332a516a063fef60267e6d89120bb999247ff7f52b313c8eee2
          777e03320f30996a53280b6d8c3847cfb9ea565f46310e582a3733
          4f69
P.y     = dc7be59148778dbf9fbeaeaf2ce578b9b82f8d72fe8e7073ad92f2
          77fb987b34711ba8571b30f89de8049d744ba3107399f2dc3c9d5c
          c8b2
u[0]    = e06d3a0f99597cd9fa6ccb2c3db31d163e50940d2c7504e1bfba16
          ac69c2a7cbb52df77f100c4e6908788b50ebfb7c47b2e96586ca59
          b47b
u[1]    = 88267fb8a9a813556844b3ac7861b380ad7597ed0ef030be490274
          54b83f441e34aee8682afabdae4f3deafaa894b15de9bd6af5059e
          f0ff
Q0.x    = 8219c3ff382cfe2f02a2a20f5ffd54564203edc7336022abc6b397
          3ec7e61fc2d458a81846385080febb458695746c0ffc04e080b2fd
          ecf2
Q0.y    = 9712f659ce8ddbd2bc581af3c6c359038d877174805b8772a647b3
          b0bc9d66a579f72bc9ada3b836aaf2642d909ed9b96dc686ae668a
          b5c1
Q1.x    = 2730fc1f5ea277c6ee5096eece84901d42fa3f78c018b1174c4685
          e0be780f769933d28d29b13b330352353b9e1c98bb5ea6dabdf7e5
          8e5a
Q1.y    = 5cb3a598ff66725b74c0e9f33e23b317a82a8bd6d1be02816688ef
          74a5d704c14d09440f123573666e81a01cb19d91e25a4e98bab1f2
          4668

msg     = abc
P.x     = 126bdbaa7d8690fbf97447adf5b0ead68a48e3c75fb49d4ee584d9
          7f08fadb3fd00d107455bd5a032c682d8a80b4f796960d61fc01e3
          9faf
P.y     = d973b5f9d4babfb95e1e28484068fdd3314b2e334f8bfcbccb9878
          a1b9d0247bb4294c035caf1558c7d5fe140fb440fc32f7c4637f56
          2db5
u[0]    = c0f1c170cea7276b72c0e744f4b1d6974da6a57b50bf3e0551f208
          c500a3797fd2279e9d19a3379fcb82ee31d22654645eb4e1440e0f
          012a
u[1]    = f264aea0654f5055d2fbe15a00635fd8a93c90bde40f22632da6c0
          cc2e62403261ebd0d21d08ef90704772b9f381f03d46a0a271fcde
          22ee
Q0.x    = 97f4538634980c078431983bc90dd20bffaa3c7e3d0343742738eb
          2f9a6a49357798a8900239e49b384e88acfeeaa4819de34b6be12b
          b583
Q0.y    = cd0a7ca6b2bc2f3483ece0ae77307301fe8de23d31077f792ac7a6
          bc6362178b22be3188ac29940e576d33f477be976aa1bd60272dde
          8fae
Q1.x    = 7c03c44df3e7d00f16eb363e25573f1cbe229303deb83c4744df1c
          d1f8542748d41d8eb004fa7633752c8ca82c71e30de3dda8cbe542
          3a9d
Q1.y    = eb29f9825c4f564a6b94bacf78e0eea3888597ee6a893cea9f5ebe
          7ada5edbb1a1601a98124e3c3355ed413f9661089b5a11947685c4
          371a

msg     = abcdef0123456789
P.x     = 474e477439d7a9592a13094b38c54e25828c681c7c8b81ba2d54c8
          0148a25be684ce2e8e25fc0149c10ed1f601bf0883ae16c364c6d3
          fa63
P.y     = 1989aff846273a5cc768b4624884c707f25d050b9dc9293cbe109c
          019ee084d28de004b83ebb0ba175081792c91b721215df14dabf0d
          6a70
u[0]    = 5f09c4906a56cd7b4a620fbed243b8c1bffa30e58ca6c709273e63
          e14e547f1fde8545e04b63e34d4bb2df6143ed0469172fee016040
          3e9d
u[1]    = 8816db97222c7cf1a728ae635542497683c6959f042e51c62ba270
          eb437d7e9cce9080e5c8e05b05e0b0a298823bd661d5272258c7f6
          d76e
Q0.x    = e6d0c0fd0e30e1a27d9bbee310398e2461e9199000476e57d819be
          2f343a32165bcc5e524c3feffca3b272bc801367b47032b6f5ae21
          b514
Q0.y    = 87ecc285bada245d203e67f6a5cf19876abdd4fb994b1d72f2bd21
          5b19048721359eed24d2de20d344a06cb859445a726c4c76156160
          13a7
Q1.x    = feebcf52ae07ffc9c6665912c8e6ab14adf880dba9679d1862af6a
          1eedc25b33c641af1cf8385771afec096701e247602e54c1e183ff
          d151
Q1.y    = 47a95cb1361c02caeaac9d036b99bb11e733fa2f140c9831694057
          eab0e7878b0b823891b02428ee2cb09627bb6cbf860bf72cad6b44
          61c4

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
P.x     = 63f7b02ccfdcc3dda4c2f3162b3a29cce131bfec05c937f47fbea6
          92da6c35611ea3b02056184530a7a16a266e24aa440201418650a9
          b1d6
P.y     = e7c55ef24be0109fd3a32e982809aa389e9583cc0861ff42e08b4d
          1d261f50ddaa4887642aa80a3a7658a107159d0f60c6809bf052f2
          feec
u[0]    = ec36b3337ec9b94b8a32a192617f278c72d89b0c31f19d184c29c2
          a26c7d53ce880de19d980be7ba2c43451966a3e5b9b7b3496834e7
          3868
u[1]    = 8b5ff5b833a4655293cc8f8feb940bc84e8f2e240370a002457346
          628a892cbb8abd96c1140ca044a1bca85181a0a4ffcaf8a42a95ef
          f4c9
Q0.x    = 3d94294cbb050707f5ad5a0dfc596445848c05a81d2a175a05b34e
          409748cbe98970d1a0fd4bcdc030969481d669f0ce8befe72e0e7a
          3506
Q0.y    = 11718321d9ed5ce14aaa7d1d06f6a91ca3875eb2bef70e96b54aa2
          51387629633860898faf3ec18ae47d5a6a0d605536435140d0f8e9
          802d
Q1.x    = b283ab36f5dff4d54dca265e74ca355d751983fb013f458f44dcb6
          b00302569788ed0a3567ca93be803e6a5aa883587e3a9da9368626
          6ecf
Q1.y    = 7bebe0e4520198e026127cf8bd4308db737358afaca143788637c6
          75812282336699de18e4b239e7c5e95797154b8cd00aa51b830993
          9abc
~~~

### curve448\_XMD:SHA-512\_ELL2\_NU\_

~~~
suite   = curve448_XMD:SHA-512_ELL2_NU_
dst     = QUUX-V01-CS02-with-curve448_XMD:SHA-512_ELL2_NU_

msg     =
P.x     = ea84fb65c9404271a743b99e734888d7d5170dee33421936180745
          66b8c4faf0d751b46bcdcebbce41e44d101f93b098e150836eeb26
          3d90
P.y     = a8378c8c97c14c4127ebf6b36c9d4a6524be2b85ad76fd195315d3
          d6eecf5147c9d96edb7f574935d0e945f6664040dbe0270d4ae24d
          ab64
u[0]    = 89b0674b247b36697f028e39edb34bd9ee6ba968148447c80773ea
          54650f5f57e005f69898502ea754f3dd710562cf80f347296b15f2
          b040
Q.x     = e57024bb58651499c5e87dffb879b0bd3abfbfa9f5af2962c2597c
          61cc24e2ad7a2802d5f98bc6265ea54e7b83befb8c59afd0854f5e
          bc09
Q.y     = 0f2a66e25fba03deb43daf0dc694d6265e0f426f041a0bc5970206
          871f88a0a09b0463607ff6ac94cb3609ed74d7eb9e7842a7b5f652
          89c2

msg     = abc
P.x     = 2e7014413676426069da399013d0a825ea436f6036fc895099838d
          0c2e047b69a8c98b2b5e5a5e1d203bc58829141bbcc1bbf66d5d7c
          eb85
P.y     = 843b3542bd5c3175fa8a1160b0f5b3ce54f9650a18b0b8f02b83b6
          2f4adfda146b0ab04bf902fb098459d0cf2171c640f003df8d79ee
          e4db
u[0]    = 413957bbc65b091215af8af48ad7e24bf048e9f6d9a73aec17e998
          a2b51cfc4ccdb4c25693e764db7799619f163532ec1ce5692e1753
          0384
Q.x     = 8e4ff7f3bf4e42202441a441da4afaa6d4f32f95d0406742172e88
          af8ffa304022eb3d2fddc5cffbb0241466daf3f152fddc26184074
          12fb
Q.y     = 22e7d04d6dabbf15eee6529bf1f6a3a9efaa3a772956de1c08441d
          94ef63b163ecea2065aebb004e8cfc12cfd2f946de05277caabba1
          4a96

msg     = abcdef0123456789
P.x     = fec43c1455df411dcb549c6cd3c25915bc73b1bb1655b164b98298
          c557dc1bf6f33791a43d167375cd645a51a13e34e645d0f5a05def
          b6a5
P.y     = b9ede648411291433b4ecb333869315db05522a26c34ad87a73d52
          3fa34f77b6ae8299d992ad5dc5d0d08f708975d19124168dd7d840
          f7e4
u[0]    = fe602896e4a559685e0deb1c7c8ff4eec02cda9037bb6bd009d003
          31b0b51227b64704e2462fd9cad0ebc24cb8817c5758703f720125
          1c94
Q.x     = 1f1aefee6f36a913a0c63a69439400e00d6b900554489e3a25eaa6
          6d4b68cafd0dc63e5645701b37edd7535b1b38305efb0460d8f103
          616a
Q.y     = 2e8d502126f2ab8c125f8213c7a5fed8ca59857a8c9bd2955f938f
          4beb89b57f3edbb823bdc4fa94e15e9bbf9f644137bf865ec7659b
          deb9

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
P.x     = 1953f9cb8340b7968c1d820fad943cb58d132ec5db85a3bc22a408
          b834f4d14fae0826164d92f285a71977ee1ca21c48fb08ecccf71f
          b43f
P.y     = 2a5ebf1f4082bb8fa4ead0a54bb9b9d820018b06c2a9c81be048bc
          6cae60fb99099cbcb9daf82a88cb177be328283f96f6e623af362a
          6165
u[0]    = 264d09a96a80db8aac3b51d54f7f115dfe3a615e85713f2d4d4bf6
          2c47ce0e8ebe261fc3a281166e9c25ea689010639f8131ffb6d8c0
          d5c9
Q.x     = 62d81718b0b327cf3b0dd77885de6cf3202bc2c0a20bbd3af18127
          16104fb5a39878dbe92862f40c28e1ae078a0b8c25ba23c9bca5fa
          ed8a
Q.y     = 6505d475959b61e33f9e4c2c6d8033b5dbd09432993997c07ae2c2
          4a31d7a35c02e15f357aebf0178b7b8525074b2400ec3d1bb8eda1
          b9ee
~~~

## edwards448

### edwards448\_XMD:SHA-512\_ELL2\_RO\_

~~~
suite   = edwards448_XMD:SHA-512_ELL2_RO_
dst     = QUUX-V01-CS02-with-edwards448_XMD:SHA-512_ELL2_RO_

msg     =
P.x     = 132e90a3f7110a41ad796ef3e83baff6839d5569854f5a11c16b2a
          7a26d86e32a6bcdc93e954aaea197768d04091aab18f5779ae4f85
          9d18
P.y     = 12165b672a52370f21268ce2c261c3ed32adac6a3404fbd50d31a5
          51a9111d109b0c691868aa6e9d92fd94dfa2a7397a2c111be9c432
          c0cd
u[0]    = 6369f90cf2806a86841398114dccf2ffd06d2d57c782a449df5297
          189de02384b22cf73a0b5f678fe486ad59280d15431f4a65fec93d
          0039
u[1]    = a6b424f6f6c995dec127ac862ebc93b82ab3604087d70a78189054
          b09be6c9e76ab85ee8351870bfd93dca7607fe864dac096e3f333a
          145b
Q0.x    = bb132e877b5fe35b189ee7041c53f03d943d36ea7265dce2c267cc
          5500f281a2f8981c393a05e94962f8d8017ec6ad3a6b34cbad3480
          6c12
Q0.y    = 15e1762b3c85a31ba3a9b7ba52eba6c7f02d5a802068afa8935e4d
          20ffa3e0356cf57398b8b9065554c3036a6f17e48b1f2ee0e5615c
          5d73
Q1.x    = cc44d47637c8fcbe1dc1020b87eb21205f055d6dec872efcc09b8c
          50935cdb38342340f389d6284a2b4bc5486f8c05a3fec6c7ef59c0
          2e2f
Q1.y    = c875e0cb547828c2707097c2cb6e3d7f03f92a715d6c66c370b08d
          09be11b69cc07c4798ff3ed30e64b5c1742bed375bb51b61963617
          9adb

msg     = abc
P.x     = bdb13f312a5d478f57bc852b743acd3ce51dd2de96f181ff88556f
          2b41d568ed64c2b210286be54b7c84d23cbc09a01902172a903b9c
          8c1e
P.y     = 6165182fc928064e375777e700f44e56b54b5980a42c72f747ba95
          829bd8ff80de5fd159e149a8169397029553bd89b5c28df416e10c
          b36b
u[0]    = 4c3b600dba4a986944840b32e154510af806aa095f856fdf8fe320
          1221314704aba830579f3da5e30f3300e89814324a0bef26a9cd3a
          b6a0
u[1]    = f0ae99c47274ed37fc582a7edc75aa0ddfdb7ed77e7eebbc293dca
          8312a6ff43e7c34c6796f9fe2a21c337deab5523d4825aebde5f14
          1869
Q0.x    = 46b89d09965812c09af0f484a1262246b14f25e8f68a34678302ca
          76e461968c61f6ae1d4d7f32d930bbe153f2a02085a12a15e3e11b
          5af8
Q0.y    = d1cfb0fb4572b51b0c4e27d574adb4fd5a3276e4c59709c732ef1b
          7ce9e59fd87df98a79c65fb709110a3922ffdf8b4593c3ed9caf96
          6e9e
Q1.x    = 94558aaac183cb8f263caa55eb79d1c4d44f681d2c9e2efc23927b
          6e272b7e3261f5d178dc166a6724aa2b2b5abfd4a97c6fc38ce423
          998f
Q1.y    = 1ee82f88f4e0b552b1a2bf048de95f8196d2f565de8edc1ae94d9f
          8fc8fd1a0d193f9bd58833b3bbab5ab97e85ae758b5fa01eadcb0b
          9ced

msg     = abcdef0123456789
P.x     = 01a04ed1b758a20245ea227827350eaedef92ef2860e58e5c5a982
          0a1fc6157082b3722d25c9754bc2642b126c4a9188a1fe9c8b2b39
          6b53
P.y     = 88ac7496b9ebc2b446695324e2f76ad54f4b8b21d0077ac15b69ad
          7a4abcd00e881cadbd829db2d2d0f28fc84eac4fc59264b2d14063
          e770
u[0]    = f3c7984b7cbaf248dacc25599c8ac774782c5a3ed7bd24343fb935
          602469b76541f8fd54dd78a7c54b6d991e17ec416742f92a18e8e6
          805b
u[1]    = 98fb498e5f6c40762899444a200e052ab25d336b84571f27670c7b
          cea54efc78f167a770275179dad42b6df0e3cc477abdf115f0b5f1
          cc49
Q0.x    = cc2286ee7e052ffccbc10607bfa8bb7ced94924dfc6fee6f34eedd
          fa559000f8d0d238c14cbe2e3509b39843e5711583982a80f652dd
          e738
Q0.y    = 774c9a9f0f4143ca2779b4bbb4ef397da643db7b74ac8bad1a54fb
          c86f728571fc401ca5b2a8432a018a5d545b526387f364701b232e
          3dbd
Q1.x    = e0fa0e6ff453760f52ea77ae9d605d00fc9930e9302a7779243fd6
          5e29970c3ebc26799a17ce7a24b7ea18f2c5b572fc29d6dbf73a89
          672a
Q1.y    = 6b5b06e9ab686c8377ac404f142444ded5adcd68daafde1bdfa7ef
          671708636da22adba4fda2b2472e37cddebec47fe30e38a11dcd06
          d10d

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
P.x     = c7c7899dab9813b5d10cadf43aa0cf5f26c21e98e5c0ffbe690059
          67dbfd066e5564bdc6c67adeb87f55951c4a077c8d4a6095a23559
          3201
P.y     = 547c2293a8b8489270957118e69a241227dc32c5587819269630ff
          687bb88284b88376fa8f86e0dbafc09d8dbba49a4a433fbd379d10
          3c5c
u[0]    = 967a9f376c20a33d6a041ed783fd7a6b7fba24ab92029bc69340a2
          6441c287d368b8496fb14d19631ff406e057bcf8e8553660e7e73d
          561d
u[1]    = 78d710dd21fedeb0dc93ec424e17e879935a689aa2c14b207a0055
          f1e57a44d83929731ca74fcca2fd0cb6bbaab12265fe104dd6fae4
          87a5
Q0.x    = 5f238a69135b8207607ea4dcebed925425adb75dfdb86e6e7f1279
          6f2086cba1add20f36a2e38176dd4feda1ad25aa8657728d390ce4
          b818
Q0.y    = 225a31f6a260be2b81b735ea1bdaaa65486a50777e3e3b83265e69
          a572e2054e63f0519a06537fba0d15076c993c6e19121fd077e8e4
          5ee9
Q1.x    = a1d4f1d07717adbcc3926caaf2d731532c2065c191dfca7b60a5e1
          499a1c237985807b441004b5476c896105806f8157e362ef96f16e
          7293
Q1.y    = e320a16c1417d41241f03507ca0ea48d0e494cfd8bb067107bc18a
          939c69581ecaee71a5f656fcd091688391f41ca1b23b3fad4876e6
          8e01
~~~

### edwards448\_XMD:SHA-512\_ELL2\_NU\_

~~~
suite   = edwards448_XMD:SHA-512_ELL2_NU_
dst     = QUUX-V01-CS02-with-edwards448_XMD:SHA-512_ELL2_NU_

msg     =
P.x     = 9edd52909ac5f8d4506149c30e1ea8709eed77c409d3ba2b3834a9
          18c4d7bf47cb11c464847fc5edfc4ec5dcb6e2e1c4a4bf2cf93914
          44af
P.y     = 6d73a9acd7c51479d59f7aab60bd0090ec44fe64d82ffea0ccff18
          ac5060632be1c44219adef88937e2f28ebab0b4edf16c501b6ae83
          7409
u[0]    = d244401e5d2f510c21944e96203cff15813d57c3f40b1a15bd73e1
          d9ac031966137e39e1111cf46e590ed4726ea9c96616a581a57cb4
          6010
Q.x     = ce981eeb6c73a7edba5c4c29af37010c398f1dbe39fe00be52100e
          b7c107f71793ce5928c2a34ce7fc37e054838d2788c46abad5b1f7
          009f
Q.y     = e822cb7fa3f0e97e1215619f13ed7fde59137dc807a37ffbb7a375
          7f948f3fb50168c7fd6a5077a1fe7e6f484ba4881c964e5fff2b99
          e9af

msg     = abc
P.x     = 2df5a5ee45640cc4e297f969c9771b36e4358463d47a530e375fe1
          3d442a17cc5f27818365eead72adee48c5911eb4ad7ed4e242f81d
          37b8
P.y     = a1ba8d111dd6338338f88c552d3338077fc5fe037860f2eb2b7496
          6a4a96f7fc59f859518caba87a1cf3fefbcace608e7b651ab5cb9e
          1eed
u[0]    = 2f3bcc6253b74569ea64a9d90ea4ee52c71bd168241eaa88c6f458
          93ffe00fe9888f2966a6308ce194cff35059d09cf59c68f3b961d0
          fd17
Q.x     = 4dc176c8c7cacf550289ae7cba158307880fa606e7bdb607d976dd
          398e60088bf1316e193b56784ea4a295884176efee84a500d46003
          7e1f
Q.y     = 711909a05b086efe857ec86729a667a531d958d17f5f7a4b9d9fa1
          59d3d7668d74ae4f4dd1b7273e2a26c68029c881255e462d046f89
          ebe0

msg     = abcdef0123456789
P.x     = 7120e8a2d8f4c34743b8afc1ec9f72fee0e9fd60d25f776fabc9a8
          bd5c3ea1d5797653b782483cad1af66e41acf04fa893844e0986be
          739c
P.y     = 6098bc3d041ba1d31074e9ca1b788c42c9db695f13ddda8d3e8275
          478d54fc4ba754c2b397ddafc021810a4068a2b3f6e6e08cfd7787
          ebd6
u[0]    = b9e80bb5fc08b259cd3b8e9f9ab722b427becf3797b2316ec94e2b
          6ff8286908fd2c70470c1290939ab14bda375185054ea4205e0ea0
          23ca
Q.x     = c7c2691fbb36a69fc3a04970d2c9881dbede0b68a69ba7c92b9160
          112293d97103b360cdca664a47ebdc31b7b60c6d5bebb6c5691a46
          c1c8
Q.y     = 8c9e09b8a17559a59cf3071f48e68c5d1fa1836f66c59bc3b76df0
          9a62df5ebb5c0ac1a6f6f71e51f876241b3e7d459f45b142891057
          eb63

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
P.x     = e6856da5667f5083bddc84e447578522373fe36b45af60245d5e40
          adbe2c1934918a1d2071a1826dbbaed45bbaef0d888a4ffd513281
          26a0
P.y     = 3e2108cc4d0a88c5bceb7a0ac983b1f3b224efa288f59178f2cc30
          615635d1269be84482cc443035bfae0a01f25a262b3b650c778162
          4c1e
u[0]    = 74e63d0db5942bc43c2505caf4b71eb5a826ce0f3f4f23ba2bbbd0
          9948a0b0eee887163a93a90566b456c687bb8671ef2e2fe4e51ebd
          8def
Q.x     = 60d1975f6f5b78a8e6edf580958acead694b229a7b35e79b1f214d
          e76b2391d3fa39ccb1b0d19d719f37f91fc191c554b97acff501af
          6fac
Q.y     = 5dbd9a91c9865928da7fffcd548ad4da813539d349aa40798fed5d
          33c872ca56e6545ca0b851eba4b1b05cf9a710b15c94de700a6d6d
          d1c8
~~~

## secp256k1

### secp256k1\_XMD:SHA-256\_SSWU\_RO\_

~~~
suite   = secp256k1_XMD:SHA-256_SSWU_RO_
dst     = QUUX-V01-CS02-with-secp256k1_XMD:SHA-256_SSWU_RO_

msg     =
P.x     = c1cae290e291aee617ebaef1be6d73861479c48b841eaba9b7b585
          2ddfeb1346
P.y     = 64fa678e07ae116126f08b022a94af6de15985c996c3a91b64c406
          a960e51067
u[0]    = 6b0f9910dd2ba71c78f2ee9f04d73b5f4c5f7fc773a701abea1e57
          3cab002fb3
u[1]    = 1ae6c212e08fe1a5937f6202f929a2cc8ef4ee5b9782db68b0d579
          9fd8f09e16
Q0.x    = 74519ef88b32b425a095e4ebcc84d81b64e9e2c2675340a720bb1a
          1857b99f1e
Q0.y    = c174fa322ab7c192e11748beed45b508e9fdb1ce046dee9c2cd3a2
          a86b410936
Q1.x    = 44548adb1b399263ded3510554d28b4bead34b8cf9a37b4bd0bd2b
          a4db87ae63
Q1.y    = 96eb8e2faf05e368efe5957c6167001760233e6dd2487516b46ae7
          25c4cce0c6

msg     = abc
P.x     = 3377e01eab42db296b512293120c6cee72b6ecf9f9205760bd9ff1
          1fb3cb2c4b
P.y     = 7f95890f33efebd1044d382a01b1bee0900fb6116f94688d487c6c
          7b9c8371f6
u[0]    = 128aab5d3679a1f7601e3bdf94ced1f43e491f544767e18a4873f3
          97b08a2b61
u[1]    = 5897b65da3b595a813d0fdcc75c895dc531be76a03518b044daaa0
          f2e4689e00
Q0.x    = 07dd9432d426845fb19857d1b3a91722436604ccbbbadad8523b8f
          c38a5322d7
Q0.y    = 604588ef5138cffe3277bbd590b8550bcbe0e523bbaf1bed4014a4
          67122eb33f
Q1.x    = e9ef9794d15d4e77dde751e06c182782046b8dac05f8491eb88764
          fc65321f78
Q1.y    = cb07ce53670d5314bf236ee2c871455c562dd76314aa41f012919f
          e8e7f717b3

msg     = abcdef0123456789
P.x     = bac54083f293f1fe08e4a70137260aa90783a5cb84d3f35848b324
          d0674b0e3a
P.y     = 4436476085d4c3c4508b60fcf4389c40176adce756b398bdee27bc
          a19758d828
u[0]    = ea67a7c02f2cd5d8b87715c169d055a22520f74daeb080e6180958
          380e2f98b9
u[1]    = 7434d0d1a500d38380d1f9615c021857ac8d546925f5f2355319d8
          23a478da18
Q0.x    = 576d43ab0260275adf11af990d130a5752704f7947862876172080
          8862544b5d
Q0.y    = 643c4a7fb68ae6cff55edd66b809087434bbaff0c07f3f9ec4d49b
          b3c16623c3
Q1.x    = f89d6d261a5e00fe5cf45e827b507643e67c2a947a20fd9ad71039
          f8b0e29ff8
Q1.y    = b33855e0cc34a9176ead91c6c3acb1aacb1ce936d563bc1cee1dcf
          fc806caf57

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
P.x     = e3c8d35aaaf0b9b647e88a0a0a7ee5d5bed5ad38238152e4e6fd8c
          1f8cb7c998
P.y     = 8446eeb6181bf12f56a9d24e262221cc2f0c4725c7e3803024b588
          8ee5823aa6
u[0]    = 8d862e7e7e23d7843fe16d811d46d7e6480127a6b78838c277bca1
          7df6900e9f
u[1]    = 68071d2530f040f081ba818d3c7188a94c900586761e9115efa47a
          e9bd847938
Q0.x    = b32b0ab55977b936f1e93fdc68cec775e13245e161dbfe556bbb1f
          72799b4181
Q0.y    = 2f5317098360b722f132d7156a94822641b615c91f8663be691698
          70a12af9e8
Q1.x    = 148f98780f19388b9fa93e7dc567b5a673e5fca7079cd9cdafd719
          82ec4c5e12
Q1.y    = 3989645d83a433bc0c001f3dac29af861f33a6fd1e04f4b36873f5
          bff497298a
~~~

### secp256k1\_XMD:SHA-256\_SSWU\_NU\_

~~~
suite   = secp256k1_XMD:SHA-256_SSWU_NU_
dst     = QUUX-V01-CS02-with-secp256k1_XMD:SHA-256_SSWU_NU_

msg     =
P.x     = a4792346075feae77ac3b30026f99c1441b4ecf666ded19b7522cf
          65c4c55c5b
P.y     = 62c59e2a6aeed1b23be5883e833912b08ba06be7f57c0e9cdc663f
          31639ff3a7
u[0]    = 0137fcd23bc3da962e8808f97474d097a6c8aa2881fceef4514173
          635872cf3b
Q.x     = a4792346075feae77ac3b30026f99c1441b4ecf666ded19b7522cf
          65c4c55c5b
Q.y     = 62c59e2a6aeed1b23be5883e833912b08ba06be7f57c0e9cdc663f
          31639ff3a7

msg     = abc
P.x     = 3f3b5842033fff837d504bb4ce2a372bfeadbdbd84a1d2b678b6e1
          d7ee426b9d
P.y     = 902910d1fef15d8ae2006fc84f2a5a7bda0e0407dc913062c3a493
          c4f5d876a5
u[0]    = e03f894b4d7caf1a50d6aa45cac27412c8867a25489e32c5ddeb50
          3229f63a2e
Q.x     = 3f3b5842033fff837d504bb4ce2a372bfeadbdbd84a1d2b678b6e1
          d7ee426b9d
Q.y     = 902910d1fef15d8ae2006fc84f2a5a7bda0e0407dc913062c3a493
          c4f5d876a5

msg     = abcdef0123456789
P.x     = 07644fa6281c694709f53bdd21bed94dab995671e4a8cd1904ec4a
          a50c59bfdf
P.y     = c79f8d1dad79b6540426922f7fbc9579c3018dafeffcd4552b1626
          b506c21e7b
u[0]    = e7a6525ae7069ff43498f7f508b41c57f80563c1fe4283510b3224
          46f32af41b
Q.x     = 07644fa6281c694709f53bdd21bed94dab995671e4a8cd1904ec4a
          a50c59bfdf
Q.y     = c79f8d1dad79b6540426922f7fbc9579c3018dafeffcd4552b1626
          b506c21e7b

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
P.x     = 17d22b867658977b5002dbe8d0ee70a8cfddec3eec50fb93f36136
          070fd9fa6c
P.y     = e9178ff02f4dab73480f8dd590328aea99856a7b6cc8e5a6cdf289
          ecc2a51718
u[0]    = a9ffbeee1d6e41ac33c248fb3364612ff591b502386c1bf6ac4aaf
          1ea51f8c3b
Q.x     = 17d22b867658977b5002dbe8d0ee70a8cfddec3eec50fb93f36136
          070fd9fa6c
Q.y     = e9178ff02f4dab73480f8dd590328aea99856a7b6cc8e5a6cdf289
          ecc2a51718
~~~

### secp256k1\_XMD:SHA-256\_SVDW\_RO\_

~~~
suite   = secp256k1_XMD:SHA-256_SVDW_RO_
dst     = QUUX-V01-CS02-with-secp256k1_XMD:SHA-256_SVDW_RO_

msg     =
P.x     = 681cdcff1040e531295769e1385a001d786082e3df5d4c665eb6c4
          348a862f72
P.y     = b81e84dfe09c09f7196809e33c8ccc965aa544904e881c27b23818
          f4e7123649
u[0]    = ce39f067e4ce73ff4271c958894b2f246f4192e6994793d22d66e5
          1d36c04c55
u[1]    = c50f834ee4c78053e21a4484e697471534b6d30db1b4c91e3745fa
          d81b7d99d5
Q0.x    = e8a15c0ab6731a2859adc3de46528133261ce51aa218b7aa3418cf
          c4093cd41d
Q0.y    = 8f22fbc4d441d40a7e6f5441d5b1e957761558f8656bb0e61e2fbb
          56e7fc58a9
Q1.x    = d5acd2b6c12a9148411654555f74d2fbf0ddf4b8c4db5780905dd0
          391a7ca386
Q1.y    = bc12d5bb5ba8058f87627c2ae7cf283fb700bcaab64d2d6f164e9c
          e2a80531c5

msg     = abc
P.x     = b7835e0724df5109be807b20d3c21e74c77dfb03de3ec7ae1183dc
          dc5fca2319
P.y     = 8a18ed2c760d6042e78d40635e834a10dda769de04ec59feaf3dac
          98f651774f
u[0]    = e6595690edfe0443ac43f03bafbe2441d7c9531f8c2a228e2e2ec7
          fd2707c957
u[1]    = 902920cee9a88deac22437f27edd23ea0caddb302583994f2486eb
          83806b9608
Q0.x    = 571ae96af49f82976a1fcd9db9ae1c548646902d69ee8acf05815c
          96203a7266
Q0.y    = 85bbf930ed0e70632efd9b6c11125d966351c11214f0996767a1b7
          a2b287790b
Q1.x    = bf5faa0d179e6447fa580121404aa276c8bc0c74fde7a0e4974d6a
          c19e482bbd
Q1.y    = 46779e7fb4972bd79ba8ed9edc83502f4cd78317e406b210ecc64c
          2b0e61834a

msg     = abcdef0123456789
P.x     = c288b6ecc8591667cda4c85b5512ec7bc6150200852efa1ddd48ff
          b849500d0d
P.y     = 1c728ccb672f1d81b9603107b9b715b509f6d3d8196081de1ea2e9
          83a0590321
u[0]    = b9c17e7c01c9383fa68acfea580b8a8d9cd6b99509ef9643da56f3
          f860430cf9
u[1]    = 004b6ed134e82a8c87bf5608152850f2c19645291f720ed24d819b
          a10fece75c
Q0.x    = 3d97acba8e03dfd6182154ed74e2b5da35251e905c85dfd97912ed
          6e7fd48630
Q0.y    = ff16232f07dfdef99fe33c049b24247f2f64cfd9ef57f9c5edbe54
          adfc6a18d7
Q1.x    = c24e8340854cddfac64597be3c97becfc77fced643629004b2fcf5
          4fa88c7cd0
Q1.y    = 1a5f0895de0e39a45fa1c34ed310ade02aff6fb24c1a31c37995e7
          78282d833a

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
P.x     = 8193b74bae0faaba0bad9b52120e5b880cef87768286d8b66e7730
          d63a0dbdde
P.y     = 38004a2647072c692198c57503b8734cc08cb3d75088c698f9dfcf
          8374fdae53
u[0]    = 314ac8337582505cc4ddbd6bf9ee428ff1a184b6a86b4bd6c1e618
          59b3ccfb81
u[1]    = b2e042919d6b101e7b532cead4cf2b32450b2cf1efe016876af0bc
          babfa33946
Q0.x    = 610005757272554508886af92c541eb7c2ca9c515d676d12b9b484
          82cb71189e
Q0.y    = 8a9534bfd189a8ea6ef6d161e91f0497a89a63f306815f2296f7d9
          be9d4cf6fd
Q1.x    = 601de6ff81f5cd99d5c6d448c12ff95f425eee9b1a45cf1cbf6197
          30bc5f618e
Q1.y    = 454c504165d4338cea3ce020ed83e0c9a9364a4c03eac9dc66d7dc
          1c968481fe
~~~

### secp256k1\_XMD:SHA-256\_SVDW\_NU\_

~~~
suite   = secp256k1_XMD:SHA-256_SVDW_NU_
dst     = QUUX-V01-CS02-with-secp256k1_XMD:SHA-256_SVDW_NU_

msg     =
P.x     = 9522be2c6356ac3116299a77d6519c1dd81e0245927ae54ec35777
          cd76090beb
P.y     = 436261fecce2a42ae2900e6065408a527d42ce495f0b8972256844
          1684c75bc9
u[0]    = c83dca043ffd7c53ffcacb10b2d6eb45d9e00ba547960c52cf713a
          3f002f5b1f
Q.x     = 9522be2c6356ac3116299a77d6519c1dd81e0245927ae54ec35777
          cd76090beb
Q.y     = 436261fecce2a42ae2900e6065408a527d42ce495f0b8972256844
          1684c75bc9

msg     = abc
P.x     = 93b31b3af1ff977c0c44a44c161bdd8399e9bded157ee85f1bc3c9
          47464febc1
P.y     = 9d93fa4ac18b3e8bc4b73aff932a11dfeea42b92bb6a7de16cc973
          1e5131bdab
u[0]    = 4acc3c03893f3754e90e2b95433b1a11c67a5d25db3a23e3abb54d
          09548d8a61
Q.x     = 93b31b3af1ff977c0c44a44c161bdd8399e9bded157ee85f1bc3c9
          47464febc1
Q.y     = 9d93fa4ac18b3e8bc4b73aff932a11dfeea42b92bb6a7de16cc973
          1e5131bdab

msg     = abcdef0123456789
P.x     = ca1ae3784ca4b07ddc6b42967c71f484a2df8572a90d658c759c25
          23776f9280
P.y     = f47ab406b1ca24a65220bb5a37cad0d53102504584057cb6df341b
          9d38bf107f
u[0]    = 85f7fc345214e082a16acc739daf7f3b83130d21a3f8dcc484d830
          74a1b0ef4b
Q.x     = ca1ae3784ca4b07ddc6b42967c71f484a2df8572a90d658c759c25
          23776f9280
Q.y     = f47ab406b1ca24a65220bb5a37cad0d53102504584057cb6df341b
          9d38bf107f

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
P.x     = 4da63499ee61d5d395e4d3ab137200a2888bfbb70634457e1041cd
          4ed7089207
P.y     = 7904daf4f9bf2b233f68fca4699d139107e5c6c63746853616d656
          1fce8228d3
u[0]    = 4d4ff69e27b4062fde8a0d014db239ad81fce3f076ecd7b0557ad7
          6bfdaa29bf
Q.x     = 4da63499ee61d5d395e4d3ab137200a2888bfbb70634457e1041cd
          4ed7089207
Q.y     = 7904daf4f9bf2b233f68fca4699d139107e5c6c63746853616d656
          1fce8228d3
~~~

## BLS12-381 G1

### BLS12381G1\_XMD:SHA-256\_SSWU\_RO\_

~~~
suite   = BLS12381G1_XMD:SHA-256_SSWU_RO_
dst     = QUUX-V01-CS02-with-BLS12381G1_XMD:SHA-256_SSWU_RO_

msg     =
P.x     = 052926add2207b76ca4fa57a8734416c8dc95e24501772c8142787
          00eed6d1e4e8cf62d9c09db0fac349612b759e79a1
P.y     = 08ba738453bfed09cb546dbb0783dbb3a5f1f566ed67bb6be0e8c6
          7e2e81a4cc68ee29813bb7994998f3eae0c9c6a265
u[0]    = 0ba14bd907ad64a016293ee7c2d276b8eae71f25a4b941eece7b0d
          89f17f75cb3ae5438a614fb61d6835ad59f29c564f
u[1]    = 019b9bd7979f12657976de2884c7cce192b82c177c80e0ec604436
          a7f538d231552f0d96d9f7babe5fa3b19b3ff25ac9
Q0.x    = 11a3cce7e1d90975990066b2f2643b9540fa40d6137780df4e753a
          8054d07580db3b7f1f03396333d4a359d1fe3766fe
Q0.y    = 0eeaf6d794e479e270da10fdaf768db4c96b650a74518fc67b04b0
          3927754bac66f3ac720404f339ecdcc028afa091b7
Q1.x    = 160003aaf1632b13396dbad518effa00fff532f604de1a7fc2082f
          f4cb0afa2d63b2c32da1bef2bf6c5ca62dc6b72f9c
Q1.y    = 0d8bb2d14e20cf9f6036152ed386d79189415b6d015a20133acb4e
          019139b94e9c146aaad5817f866c95d609a361735e

msg     = abc
P.x     = 03567bc5ef9c690c2ab2ecdf6a96ef1c139cc0b2f284dca0a9a794
          3388a49a3aee664ba5379a7655d3c68900be2f6903
P.y     = 0b9c15f3fe6e5cf4211f346271d7b01c8f3b28be689c8429c85b67
          af215533311f0b8dfaaa154fa6b88176c229f2885d
u[0]    = 0d921c33f2bad966478a03ca35d05719bdf92d347557ea166e5bba
          579eea9b83e9afa5c088573c2281410369fbd32951
u[1]    = 003574a00b109ada2f26a37a91f9d1e740dffd8d69ec0c35e1e9f4
          652c7dba61123e9dd2e76c655d956e2b3462611139
Q0.x    = 125435adce8e1cbd1c803e7123f45392dc6e326d292499c2c45c58
          65985fd74fe8f042ecdeeec5ecac80680d04317d80
Q0.y    = 0e8828948c989126595ee30e4f7c931cbd6f4570735624fd25aef2
          fa41d3f79cfb4b4ee7b7e55a8ce013af2a5ba20bf2
Q1.x    = 11def93719829ecda3b46aa8c31fc3ac9c34b428982b898369608e
          4f042babee6c77ab9218aad5c87ba785481eff8ae4
Q1.y    = 0007c9cef122ccf2efd233d6eb9bfc680aa276652b0661f4f820a6
          53cec1db7ff69899f8e52b8e92b025a12c822a6ce6

msg     = abcdef0123456789
P.x     = 11e0b079dea29a68f0383ee94fed1b940995272407e3bb916bbf26
          8c263ddd57a6a27200a784cbc248e84f357ce82d98
P.y     = 03a87ae2caf14e8ee52e51fa2ed8eefe80f02457004ba4d486d6aa
          1f517c0889501dc7413753f9599b099ebcbbd2d709
u[0]    = 062d1865eb80ebfa73dcfc45db1ad4266b9f3a93219976a3790ab8
          d52d3e5f1e62f3b01795e36834b17b70e7b76246d4
u[1]    = 0cdc3e2f271f29c4ff75020857ce6c5d36008c9b48385ea2f2bf6f
          96f428a3deb798aa033cd482d1cdc8b30178b08e3a
Q0.x    = 08834484878c217682f6d09a4b51444802fdba3d7f2df9903a0dda
          db92130ebbfa807fffa0eabf257d7b48272410afff
Q0.y    = 0b318f7ecf77f45a0f038e62d7098221d2dbbca2a394164e2e3fe9
          53dc714ac2cde412d8f2d7f0c03b259e6795a2508e
Q1.x    = 158418ed6b27e2549f05531a8281b5822b31c3bf3144277fbb977f
          8d6e2694fedceb7011b3c2b192f23e2a44b2bd106e
Q1.y    = 1879074f344471fac5f839e2b4920789643c075792bec5af4282c7
          3f7941cda5aa77b00085eb10e206171b9787c4169f

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
P.x     = 082aabae8b7dedb0e78aeb619ad3bfd9277a2f77ba7fad20ef6aab
          dc6c31d19ba5a6d12283553294c1825c4b3ca2dcfe
P.y     = 05b84ae5a942248eea39e1d91030458c40153f3b654ab7872d779a
          d1e942856a20c438e8d99bc8abfbf74729ce1f7ac8
u[0]    = 0a8ffa7447f6be1c5a2ea4b959c9454b431e29ccc0802bc052413a
          9c5b4f9aac67a93431bd480d15be1e057c8a08e8c6
u[1]    = 05d487032f602c90fa7625dbafe0f4a49ef4a6b0b33d7bb349ff4c
          f5410d297fd6241876e3e77b651cfc8191e40a68b7
Q0.x    = 0cf97e6dbd0947857f3e578231d07b309c622ade08f2c08b32ff37
          2bd90db19467b2563cc997d4407968d4ac80e154f8
Q0.y    = 127f0cddf2613058101a5701f4cb9d0861fd6c2a1b8e0afe194fcc
          f586a3201a53874a2761a9ab6d7220c68661a35ab3
Q1.x    = 092f1acfa62b05f95884c6791fba989bbe58044ee6355d100973bf
          9553ade52b47929264e6ae770fb264582d8dce512a
Q1.y    = 028e6d0169a72cfedb737be45db6c401d3adfb12c58c619c82b93a
          5dfcccef12290de530b0480575ddc8397cda0bbebf
~~~

### BLS12381G1\_XMD:SHA-256\_SSWU\_NU\_

~~~
suite   = BLS12381G1_XMD:SHA-256_SSWU_NU_
dst     = QUUX-V01-CS02-with-BLS12381G1_XMD:SHA-256_SSWU_NU_

msg     =
P.x     = 184bb665c37ff561a89ec2122dd343f20e0f4cbcaec84e3c3052ea
          81d1834e192c426074b02ed3dca4e7676ce4ce48ba
P.y     = 04407b8d35af4dacc809927071fc0405218f1401a6d15af775810e
          4e460064bcc9468beeba82fdc751be70476c888bf3
u[0]    = 156c8a6a2c184569d69a76be144b5cdc5141d2d2ca4fe341f011e2
          5e3969c55ad9e9b9ce2eb833c81a908e5fa4ac5f03
Q.x     = 11398d3b324810a1b093f8e35aa8571cced95858207e7f49c4fd74
          656096d61d8a2f9a23cdb18a4dd11cd1d66f41f709
Q.y     = 19316b6fb2ba7717355d5d66a361899057e1e84a6823039efc7bec
          cefe09d023fb2713b1c415fcf278eb0c39a89b4f72

msg     = abc
P.x     = 009769f3ab59bfd551d53a5f846b9984c59b97d6842b20a2c565ba
          a167945e3d026a3755b6345df8ec7e6acb6868ae6d
P.y     = 1532c00cf61aa3d0ce3e5aa20c3b531a2abd2c770a790a26138183
          03c6b830ffc0ecf6c357af3317b9575c567f11cd2c
u[0]    = 147e1ed29f06e4c5079b9d14fc89d2820d32419b990c1c7bb7dbea
          2a36a045124b31ffbde7c99329c05c559af1c6cc82
Q.x     = 1998321bc27ff6d71df3051b5aec12ff47363d81a5e9d2dff55f44
          4f6ca7e7d6af45c56fd029c58237c266ef5cda5254
Q.y     = 034d274476c6307ae584f951c82e7ea85b84f72d28f4d647173235
          6121af8d62a49bc263e8eb913a6cf6f125995514ee

msg     = abcdef0123456789
P.x     = 1974dbb8e6b5d20b84df7e625e2fbfecb2cdb5f77d5eae5fb2955e
          5ce7313cae8364bc2fff520a6c25619739c6bdcb6a
P.y     = 15f9897e11c6441eaa676de141c8d83c37aab8667173cbe1dfd6de
          74d11861b961dccebcd9d289ac633455dfcc7013a3
u[0]    = 04090815ad598a06897dd89bcda860f25837d54e897298ce31e694
          7378134d3761dc59a572154963e8c954919ecfa82d
Q.x     = 17d502fa43bd6a4cad2859049a0c3ecefd60240d129be65da271a4
          c03a9c38fa78163b9d2a919d2beb57df7d609b4919
Q.y     = 109019902ae93a8732abecf2ff7fecd2e4e305eb91f41c9c3267f1
          6b6c19de138c7272947f25512745da6c466cdfd1ac

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
P.x     = 0e7a16a975904f131682edbb03d9560d3e48214c9986bd50417a77
          108d13dc957500edf96462a3d01e62dc6cd468ef11
P.y     = 0ae89e677711d05c30a48d6d75e76ca9fb70fe06c6dd6ff988683d
          89ccde29ac7d46c53bb97a59b1901abf1db66052db
u[0]    = 0dd824886d2123a96447f6c56e3a3fa992fbfefdba17b6673f9f63
          0ff19e4d326529db37e1c1be43f905bf9202e0278d
Q.x     = 1775d400a1bacc1c39c355da7e96d2d1c97baa9430c4a3476881f8
          521c09a01f921f592607961efc99c4cd46bd78ca19
Q.y     = 1109b5d59f65964315de65a7a143e86eabc053104ed289cf480949
          317a5685fad7254ff8e7fe6d24d3104e5d55ad6370
~~~

### BLS12381G1\_XMD:SHA-256\_SVDW\_RO\_

~~~
suite   = BLS12381G1_XMD:SHA-256_SVDW_RO_
dst     = QUUX-V01-CS02-with-BLS12381G1_XMD:SHA-256_SVDW_RO_

msg     =
P.x     = 0046646cdee5e2427e34c3ef0246e46b7d302fc8d1663ebe88dce9
          9cf30d13f92a5e8c067619a04f262c656cb2f441aa
P.y     = 0370dfd014379e48ee0e74a58992f5a44a35e6386f578c21b4b969
          534f5fa45e26069955f6176ed29fc4fe80dd145b6b
u[0]    = 10712f3f71e65bc70b3e4558ac8ab4f31d7804a7646390c4be0386
          f32d33f2570a1b9d3ecf0bdcf82d7cfddf3294e208
u[1]    = 117352b18beefcc5d42920255568dd3f7e2229a490c16760a131f6
          e054598ca9bbccf0f01001c508d8af8a21bf02877c
Q0.x    = 02635c900de5fda2e16303230b8332a59f7ee320f912602ca56e4e
          4ba33f1642ef1d105dd2cb5985344dce46b496d7ef
Q0.y    = 0d2765bb3dc05efc3b16596b91826eda77598ab35fc945a1c7fcd0
          07f01defa30e9d8d61976e5a03c12c2a46e167bcac
Q1.x    = 15d56648a6587a45a94d6a161b7e44c198e28dcf0cd312e4b91f89
          2da2ea81dca527ed22801b0562212a359fdead8da4
Q1.y    = 0c692be34ed2a408d33aac7c45c18f48ee4065dff8e75e0b58526c
          cd0b270499efc95c92d760229711858d8f10d36588

msg     = abc
P.x     = 0bf5d3c7102b57329e31bb8b4d6c962422803f18f6ced5554772c1
          6c2b158122a4c0e256d32b5afe3406f6dcebb68f95
P.y     = 03edf325c94564fcd14a76e48bf62e86adca061fa788d371620a7b
          49c608df09a2cde92e7a24c84a07822b1de491f486
u[0]    = 107cf2df3dd40d06afb8478e6234c0480d04e8f2102bac157e5564
          1ff0398b6542febdc7f340c4630232b45e1c8d91d8
u[1]    = 0b4e7ae863184dbdc8db591285c253778d392302e87ec5d8e6413a
          8c4821a1d30ddafbc9476f711ac812a0838ff6def8
Q0.x    = 16a94b53df034fd41e271786f82b9402d63ec02deaa2ab4d98a896
          d743909e18006ccd538eda775f50d0fbf28c87f8e6
Q0.y    = 026ba033ad9e8f3c78a8c7675f4d591b1b2bd2e9bcddcd760c5d79
          7679961d0f616e4fe845e7fc34ebaf23ab103425e6
Q1.x    = 03fd96d708328ee89ad01ef96ff71f4b0a1c7f9f0a94229f939e9a
          5591d51235eb2546722d3f12e6464e27d6b2cafa72
Q1.y    = 13e0039ca804938ef383aee7150ad4e383d0f93cb368809e064222
          ce44bf16391e5bf7e63e1358404a08536d45442432

msg     = abcdef0123456789
P.x     = 175875b44c43f44274ef2b544fe8b03bca6fffb88678fd6bbb484a
          4094009db0640cc9196794cd2c114d2923ef8e4633
P.y     = 014937c7cbe0f207c4723289976d638942db4891bffec145cc97e0
          b43b604b1e8f2b1ec5137e91c0575e3a617af38f86
u[0]    = 12870bd6d3df39c81a7552c93c9c90c031f877adb0ac285231461e
          397cac7e70e6a857b387f01038d6811b268082dece
u[1]    = 088b238f936b4f4cdf7a73216b3735c77ee79506ca4b982bde6760
          4cb4736ef61b348f61141edbb5e86f08e4b8a051ec
Q0.x    = 09c4bb4327c675d5f7ff8c5053c2477f713547a3d9fe21bf43472b
          dd1e57c3c408c84f63ccd26579def3c8203d9c392e
Q0.y    = 11846b08ac6e7136c77e71882b2e7c9cf60782bddac3079518cbe0
          a80591bf6ac79df3b1bdf99b01ff10e4c66376458c
Q1.x    = 04636de75d433c88987e0347e7c9f3322307cb7177f5becf4a7d9a
          38ebb9a78c862a439ad0e23960fe282d3ffb3321af
Q1.y    = 0d7a22314d049a0d9dc8dddf3d6478e754cd9579825007564f746e
          bc2bc677e218b45c47775f99445c2f5d0b4e4742aa

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
P.x     = 050d57f609e8d5e3afef254f31555023fddfb32a70aeb373165c5c
          aae6530a49578867114801b3a6c693a9d3e731006c
P.y     = 0189d4a6de408e304cbe6af94b931da65966ff483b25c402933983
          6bf50f0ee52d8998e13d8891d38e0f1e5daafac0a7
u[0]    = 133850adf446a089d3179e6d745b81f0a3084a98d505318648e5e5
          a5dbcd7be1cbccae883531c56556437cba1dfa63df
u[1]    = 0ee54c1145341af04492ce0fc4ca14f8a6b96a725e55a0dc5e3139
          a64dedf0d76052568a3dcbccc08d9a0b8ea3ebfd02
Q0.x    = 054db2b33859c79106107506e8627c1c5bd7da6dbf2e4e84363b0d
          e4c512c43a14f647d99aa9e9069b21d29f188f2249
Q0.y    = 062f680647ce3c6d043f6e9d29b348f053e4146cd63214d67dabfa
          28c45fc992f328a61d16bbeb9431d3392befed4ee3
Q1.x    = 046d6980f4e2649611c2211c21d7ee30af0b1a03cccc63e5effc1f
          b680b5c24ce631bde4ac1b1f35d92dd8340c9e6837
Q1.y    = 0bf2d9e2cff5a15291c81e6440bb1d42dc2d74af80e4a73ea7bb8a
          c2bf7110abd28fb8beb55224979698942ca94ec88e
~~~

### BLS12381G1\_XMD:SHA-256\_SVDW\_NU\_

~~~
suite   = BLS12381G1_XMD:SHA-256_SVDW_NU_
dst     = QUUX-V01-CS02-with-BLS12381G1_XMD:SHA-256_SVDW_NU_

msg     =
P.x     = 00b32edeff0f3b47dbd7f7fc9fc3e22c89024940a17f16dae74665
          a30ba1f6596a107a03157b711fba1382459ce0ee08
P.y     = 136c46bb465f3f958f4c52a39289436a857adafc322f09d047f046
          fc2f28bef3f801750444b4bb043c09bd4b8e57e531
u[0]    = 1123677487a797673f62baaaf6302f5ad64879b28f8f7b23b62759
          958e6aa74c0890adda1274ca7d5740fa9f2e94b417
Q.x     = 044287a055cdd2e6966f5bcc5818fd28594e6723906ce97c8c3359
          6a95447493387834a57754b5cadace9b327a42ba88
Q.y     = 10e157633aa6ef9359f07d3f32447af6db91c8726ac8e94e947ee9
          5d61bc43c5240b1b613e3c77ed3c94014b766ea3b9

msg     = abc
P.x     = 012f529a761260571c58e1e7ba917acde1bc56b4b27bab5495e89e
          eb244918c52ee8b0090b9c0c31dc8cfc214b5f37e3
P.y     = 03121de2a5623a5f83f263b6787dbef1101b08f9b586c670f28b87
          874b826c28b79f0e19ada9d4f2e912a17e050eabab
u[0]    = 0fc2607c21d2daa2ba4130fd8025d6d76b27bf5194a80af1f9aecf
          34f7f2539e7baaf4f65efacae2db4e98bf0a409202
Q.x     = 1774ca19fb55f4d2bd6a42035546ad3e3df0738436282052503965
          8fe4b5f9f0a9a1e544fc022c490981c60eda6c7530
Q.y     = 08271f24f9029b7f3bf8a8ab54a8bd1c023d28ec6cf2d43ab7fb38
          e79c1310207b06697aa255424a645864f3f707fe62

msg     = abcdef0123456789
P.x     = 12243c6380e6ef5ca75d25b182bacc0e6e68a3f1f0c04944794558
          e7fdb1fd6d2b2a81824068b40d31eed515aaf3d90f
P.y     = 12ffb90ed9b2166d4a11c1b0460b79809dd017d66e20d00cfaae6f
          55a5b2d4fa1c82ddaf75aa457b269cb8d1ba58304b
u[0]    = 0af1c17efbc6ef934c0ce82dbb10e7db10d8d43ef1cd6e73c74313
          89fdb48669e51fb4a34082dd2e32c4b9d304699dce
Q.x     = 12726849232499e8e6fcc8192c0ed83a3a730deed97b1f4e98c3e3
          57b39c4f1fcd4e3d7a0800a6d046d524803e72fdcc
Q.y     = 12ee88f97dd0d4fdd247abee8fccf9a43a31426386a576de54f103
          9803561782ec4062afcdb89cccae5645545f11d8aa

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
P.x     = 12371c348276bd530b54a90adb190b03d78614e1521e80d00e2f3a
          d5a372040f2ab66a33ecde9a1ee48c53b59203f570
P.y     = 0ee3cb6fa94f34059bd46d18c7099ce44a90c1df027bba4b9631c9
          01e920805c47a20ed3083942048516b0c291b70122
u[0]    = 117d3c0151a65c617903f42b0afdc1851225d2cee31c38ea926497
          27610e5b7efb885d9d54911ae40429edd7bc774094
Q.x     = 128ad2b109d7bac5859e236397ab3a301582cb065b00b224bba334
          5a24bd3a42c47ae0f6216b247c11190ad3b68d476b
Q.y     = 0b510e9ff778624d6cc107ca8d0a9d6c21253ea1e4aa9df2303879
          c9a17d88278de635f3f80b97ced6674fe3c553c7fe
~~~

## BLS12-381 G2

### BLS12381G2\_XMD:SHA-256\_SSWU\_RO\_

~~~
suite   = BLS12381G2_XMD:SHA-256_SSWU_RO_
dst     = QUUX-V01-CS02-with-BLS12381G2_XMD:SHA-256_SSWU_RO_

msg     =
P.x     = 0141ebfbdca40eb85b87142e130ab689c673cf60f1a3e98d693352
          66f30d9b8d4ac44c1038e9dcdd5393faf5c41fb78a
    + I * 05cb8437535e20ecffaef7752baddf98034139c38452458baeefab
          379ba13dff5bf5dd71b72418717047f5b0f37da03d
P.y     = 0503921d7f6a12805e72940b963c0cf3471c7b2a524950ca195d11
          062ee75ec076daf2d4bc358c4b190c0c98064fdd92
    + I * 12424ac32561493f3fe3c260708a12b7c620e7be00099a974e259d
          dc7d1f6395c3c811cdd19f1e8dbf3e9ecfdcbab8d6
u[0]    = 03dbc2cce174e91ba93cbb08f26b917f98194a2ea08d1cce75b2b9
          cc9f21689d80bd79b594a613d0a68eb807dfdc1cf8
    + I * 05a2acec64114845711a54199ea339abd125ba38253b70a92c876d
          f10598bd1986b739cad67961eb94f7076511b3b39a
u[1]    = 02f99798e8a5acdeed60d7e18e9120521ba1f47ec090984662846b
          c825de191b5b7641148c0dbc237726a334473eee94
    + I * 145a81e418d4010cc027a68f14391b30074e89e60ee7a22f87217b
          2f6eb0c4b94c9115b436e6fa4607e95a98de30a435
Q0.x    = 019ad3fc9c72425a998d7ab1ea0e646a1f6093444fc6965f1cad5a
          3195a7b1e099c050d57f45e3fa191cc6d75ed7458c
    + I * 171c88b0b0efb5eb2b88913a9e74fe111a4f68867b59db252ce586
          8af4d1254bfab77ebde5d61cd1a86fb2fe4a5a1c1d
Q0.y    = 0ba10604e62bdd9eeeb4156652066167b72c8d743b050fb4c1016c
          31b505129374f76e03fa127d6a156213576910fef3
    + I * 0eb22c7a543d3d376e9716a49b72e79a89c9bfe9feee8533ed931c
          bb5373dde1fbcd7411d8052e02693654f71e15410a
Q1.x    = 113d2b9cd4bd98aee53470b27abc658d91b47a78a51584f3d4b950
          677cfb8a3e99c24222c406128c91296ef6b45608be
    + I * 13855912321c5cb793e9d1e88f6f8d342d49c0b0dbac613ee9e17e
          3c0b3c97dfbb5a49cc3fb45102fdbaf65e0efe2632
Q1.y    = 0fd3def0b7574a1d801be44fde617162aa2e89da47f464317d9bb5
          abc3a7071763ce74180883ad7ad9a723a9afafcdca
    + I * 056f617902b3c0d0f78a9a8cbda43a26b65f602f8786540b9469b0
          60db7b38417915b413ca65f875c130bebfaa59790c

msg     = abc
P.x     = 02c2d18e033b960562aae3cab37a27ce00d80ccd5ba4b7fe0e7a21
          0245129dbec7780ccc7954725f4168aff2787776e6
    + I * 139cddbccdc5e91b9623efd38c49f81a6f83f175e80b06fc374de9
          eb4b41dfe4ca3a230ed250fbe3a2acf73a41177fd8
P.y     = 1787327b68159716a37440985269cf584bcb1e621d3a7202be6ea0
          5c4cfe244aeb197642555a0645fb87bf7466b2ba48
    + I * 00aa65dae3c8d732d10ecd2c50f8a1baf3001578f71c694e03866e
          9f3d49ac1e1ce70dd94a733534f106d4cec0eddd16
u[0]    = 15f7c0aa8f6b296ab5ff9c2c7581ade64f4ee6f1bf18f55179ff44
          a2cf355fa53dd2a2158c5ecb17d7c52f63e7195771
    + I * 01c8067bf4c0ba709aa8b9abc3d1cef589a4758e09ef53732d670f
          d8739a7274e111ba2fcaa71b3d33df2a3a0c8529dd
u[1]    = 187111d5e088b6b9acfdfad078c4dacf72dcd17ca17c82be35e79f
          8c372a693f60a033b461d81b025864a0ad051a06e4
    + I * 08b852331c96ed983e497ebc6dee9b75e373d923b729194af8e72a
          051ea586f3538a6ebb1e80881a082fa2b24df9f566
Q0.x    = 12b2e525281b5f4d2276954e84ac4f42cf4e13b6ac4228624e1776
          0faf94ce5706d53f0ca1952f1c5ef75239aeed55ad
    + I * 05d8a724db78e570e34100c0bc4a5fa84ad5839359b40398151f37
          cff5a51de945c563463c9efbdda569850ee5a53e77
Q0.y    = 02eacdc556d0bdb5d18d22f23dcb086dd106cad713777c7e640794
          3edbe0b3d1efe391eedf11e977fac55f9b94f2489c
    + I * 04bbe48bfd5814648d0b9e30f0717b34015d45a861425fabc1ee06
          fdfce36384ae2c808185e693ae97dcde118f34de41
Q1.x    = 19f18cc5ec0c2f055e47c802acc3b0e40c337256a208001dde14b2
          5afced146f37ea3d3ce16834c78175b3ed61f3c537
    + I * 15b0dadc256a258b4c68ea43605dffa6d312eef215c19e6474b3e1
          01d33b661dfee43b51abbf96fee68fc6043ac56a58
Q1.y    = 05e47c1781286e61c7ade887512bd9c2cb9f640d3be9cf87ea0bad
          24bd0ebfe946497b48a581ab6c7d4ca74b5147287f
    + I * 19f98db2f4a1fcdf56a9ced7b320ea9deecf57c8e59236b0dc21f6
          ee7229aa9705ce9ac7fe7a31c72edca0d92370c096

msg     = abcdef0123456789
P.x     = 121982811d2491fde9ba7ed31ef9ca474f0e1501297f68c298e9f4
          c0028add35aea8bb83d53c08cfc007c1e005723cd0
    + I * 190d119345b94fbd15497bcba94ecf7db2cbfd1e1fe7da034d26cb
          ba169fb3968288b3fafb265f9ebd380512a71c3f2c
P.y     = 05571a0f8d3c08d094576981f4a3b8eda0a8e771fcdcc8ecceaf13
          56a6acf17574518acb506e435b639353c2e14827c8
    + I * 0bb5e7572275c567462d91807de765611490205a941a5a6af3b169
          1bfe596c31225d3aabdf15faff860cb4ef17c7c3be
u[0]    = 0313d9325081b415bfd4e5364efaef392ecf69b087496973b22930
          3e1816d2080971470f7da112c4eb43053130b785e1
    + I * 062f84cb21ed89406890c051a0e8b9cf6c575cf6e8e18ecf63ba86
          826b0ae02548d83b483b79e48512b82a6c0686df8f
u[1]    = 1739123845406baa7be5c5dc74492051b6d42504de008c635f3535
          bb831d478a341420e67dcc7b46b2e8cba5379cca97
    + I * 01897665d9cb5db16a27657760bbea7951f67ad68f8d55f7113f24
          ba6ddd82caef240a9bfa627972279974894701d975
Q0.x    = 0f48f1ea1318ddb713697708f7327781fb39718971d72a9245b973
          1faaca4dbaa7cca433d6c434a820c28b18e20ea208
    + I * 06051467c8f85da5ba2540974758f7a1e0239a5981de441fdd8768
          0a995649c211054869c50edbac1f3a86c561ba3162
Q0.y    = 168b3d6df80069dbbedb714d41b32961ad064c227355e1ce5fac8e
          105de5e49d77f0c64867f3834848f152497eb76333
    + I * 134e0e8331cee8cb12f9c2d0742714ed9eee78a84d634c9a95f6a7
          391b37125ed48bfc6e90bf3546e99930ff67cc97bc
Q1.x    = 004fd03968cd1c99a0dd84551f44c206c84dcbdb78076c5bfee24e
          89a92c8508b52b88b68a92258403cbe1ea2da3495f
    + I * 1674338ea298281b636b2eb0fe593008d03171195fd6dcd4531e8a
          1ed1f02a72da238a17a635de307d7d24aa2d969a47
Q1.y    = 0dc7fa13fff6b12558419e0a1e94bfc3cfaf67238009991c5f24ee
          94b632c3d09e27eca329989aee348a67b50d5e236c
    + I * 169585e164c131103d85324f2d7747b23b91d66ae5d947c449c819
          4a347969fc6bbd967729768da485ba71868df8aed2

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
P.x     = 01a6ba2f9a11fa5598b2d8ace0fbe0a0eacb65deceb476fbbcb64f
          d24557c2f4b18ecfc5663e54ae16a84f5ab7f62534
    + I * 11fca2ff525572795a801eed17eb12785887c7b63fb77a42be46ce
          4a34131d71f7a73e95fee3f812aea3de78b4d01569
P.y     = 0b6798718c8aed24bc19cb27f866f1c9effcdbf92397ad6448b5c9
          db90d2b9da6cbabf48adc1adf59a1a28344e79d57e
    + I * 03a47f8e6d1763ba0cad63d6114c0accbef65707825a511b251a66
          0a9b3994249ae4e63fac38b23da0c398689ee2ab52
u[0]    = 190b513da3e66fc9a3587b78c76d1d132b1152174d0b83e3c11140
          66392579a45824c5fa17649ab89299ddd4bda54935
    + I * 12ab625b0fe0ebd1367fe9fac57bb1168891846039b4216b9d9400
          7b674de2d79126870e88aeef54b2ec717a887dcf39
u[1]    = 0e6a42010cf435fb5bacc156a585e1ea3294cc81d0ceb81924d950
          40298380b164f702275892cedd81b62de3aba3f6b5
    + I * 117d9a0defc57a33ed208428cb84e54c85a6840e7648480ae42883
          8989d25d97a0af8e3255be62b25c2a85630d2dddd8
Q0.x    = 17cadf8d04a1a170f8347d42856526a24cc466cb2ddfd506cff011
          91666b7f944e31244d662c904de5440516a2b09004
    + I * 0d13ba91f2a8b0051cf3279ea0ee63a9f19bc9cb8bfcc7d78b3cbd
          8cc4fc43ba726774b28038213acf2b0095391c523e
Q0.y    = 17ef19497d6d9246fa94d35575c0f8d06ee02f21a284dbeaa78768
          cb1e25abd564e3381de87bda26acd04f41181610c5
    + I * 12c3c913ba4ed03c24f0721a81a6be7430f2971ffca8fd1729aafe
          496bb725807531b44b34b59b3ae5495e5a2dcbd5c8
Q1.x    = 16ec57b7fe04c71dfe34fb5ad84dbce5a2dbbd6ee085f1d8cd17f4
          5e8868976fc3c51ad9eeda682c7869024d24579bfd
    + I * 13103f7aace1ae1420d208a537f7d3a9679c287208026e4e3439ab
          8cd534c12856284d95e27f5e1f33eec2ce656533b0
Q1.y    = 0958b2c4c2c10fcef5a6c59b9e92c4a67b0fae3e2e0f1b6b5edad9
          c940b8f3524ba9ebbc3f2ceb3cfe377655b3163bd7
    + I * 0ccb594ed8bd14ca64ed9cb4e0aba221be540f25dd0d6ba15a4a4b
          e5d67bcf35df7853b2d8dad3ba245f1ea3697f66aa
~~~

### BLS12381G2\_XMD:SHA-256\_SSWU\_NU\_

~~~
suite   = BLS12381G2_XMD:SHA-256_SSWU_NU_
dst     = QUUX-V01-CS02-with-BLS12381G2_XMD:SHA-256_SSWU_NU_

msg     =
P.x     = 00e7f4568a82b4b7dc1f14c6aaa055edf51502319c723c4dc2688c
          7fe5944c213f510328082396515734b6612c4e7bb7
    + I * 126b855e9e69b1f691f816e48ac6977664d24d99f8724868a18418
          6469ddfd4617367e94527d4b74fc86413483afb35b
P.y     = 0caead0fd7b6176c01436833c79d305c78be307da5f6af6c133c47
          311def6ff1e0babf57a0fb5539fce7ee12407b0a42
    + I * 1498aadcf7ae2b345243e281ae076df6de84455d766ab6fcdaad71
          fab60abb2e8b980a440043cd305db09d283c895e3d
u[0]    = 07355d25caf6e7f2f0cb2812ca0e513bd026ed09dda65b177500fa
          31714e09ea0ded3a078b526bed3307f804d4b93b04
    + I * 02829ce3c021339ccb5caf3e187f6370e1e2a311dec9b753631170
          63ab2015603ff52c3d3b98f19c2f65575e99e8b78c
Q.x     = 18ed3794ad43c781816c523776188deafba67ab773189b8f18c49b
          c7aa841cd81525171f7a5203b2a340579192403bef
    + I * 0727d90785d179e7b5732c8a34b660335fed03b913710b60903cf4
          954b651ed3466dc3728e21855ae822d4a0f1d06587
Q.y     = 00764a5cf6c5f61c52c838523460eb2168b5a5b43705e19cb612e0
          06f29b717897facfd15dd1c8874c915f6d53d0342d
    + I * 19290bb9797c12c1d275817aa2605ebe42275b66860f0e4d04487e
          bc2e47c50b36edd86c685a60c20a2bd584a82b011a

msg     = abc
P.x     = 108ed59fd9fae381abfd1d6bce2fd2fa220990f0f837fa30e0f279
          14ed6e1454db0d1ee957b219f61da6ff8be0d6441f
    + I * 0296238ea82c6d4adb3c838ee3cb2346049c90b96d602d7bb1b469
          b905c9228be25c627bffee872def773d5b2a2eb57d
P.y     = 033f90f6057aadacae7963b0a0b379dd46750c1c94a6357c99b65f
          63b79e321ff50fe3053330911c56b6ceea08fee656
    + I * 153606c417e59fb331b7ae6bce4fbf7c5190c33ce9402b5ebe2b70
          e44fca614f3f1382a3625ed5493843d0b0a652fc3f
u[0]    = 138879a9559e24cecee8697b8b4ad32cced053138ab913b9987277
          2dc753a2967ed50aabc907937aefb2439ba06cc50c
    + I * 0a1ae7999ea9bab1dcc9ef8887a6cb6e8f1e22566015428d220b7e
          ec90ffa70ad1f624018a9ad11e78d588bd3617f9f2
Q.x     = 0f40e1d5025ecef0d850aa0bb7bbeceab21a3d4e85e6bee857805b
          09693051f5b25428c6be343edba5f14317fcc30143
    + I * 02e0d261f2b9fee88b82804ec83db330caa75fbb12719cfa71ccce
          1c532dc4e1e79b0a6a281ed8d3817524286c8bc04c
Q.y     = 0cf4a4adc5c66da0bca4caddc6a57ecd97c8252d7526a8ff478e0d
          fed816c4d321b5c3039c6683ae9b1e6a3a38c9c0ae
    + I * 11cad1646bb3768c04be2ab2bbe1f80263b7ff6f8f9488f5bc3b68
          50e5a3e97e20acc583613c69cf3d2bfe8489744ebb

msg     = abcdef0123456789
P.x     = 038af300ef34c7759a6caaa4e69363cafeed218a1f207e93b2c70d
          91a1263d375d6730bd6b6509dcac3ba5b567e85bf3
    + I * 0da75be60fb6aa0e9e3143e40c42796edf15685cafe0279afd2a67
          c3dff1c82341f17effd402e4f1af240ea90f4b659b
P.y     = 19b148cbdf163cf0894f29660d2e7bfb2b68e37d54cc83fd4e6e62
          c020eaa48709302ef8e746736c0e19342cc1ce3df4
    + I * 0492f4fed741b073e5a82580f7c663f9b79e036b70ab3e51162359
          cec4e77c78086fe879b65ca7a47d34374c8315ac5e
u[0]    = 18c16fe362b7dbdfa102e42bdfd3e2f4e6191d479437a59db4eb71
          6986bf08ee1f42634db66bde97d6c16bbfd342b3b8
    + I * 0e37812ce1b146d998d5f92bdd5ada2a31bfd63dfe18311aa91637
          b5f279dd045763166aa1615e46a50d8d8f475f184e
Q.x     = 13a9d4a738a85c9f917c7be36b240915434b58679980010499b9ae
          8d7a1bf7fbe617a15b3cd6060093f40d18e0f19456
    + I * 16fa88754e7670366a859d6f6899ad765bf5a177abedb2740aacc9
          252c43f90cd0421373fbd5b2b76bb8f5c4886b5d37
Q.y     = 0a7fa7d82c46797039398253e8765a4194100b330dfed6d7fbb46d
          6fbf01e222088779ac336e3675c7a7a0ee05bbb6e3
    + I * 0c6ee170ab766d11fa9457cef53253f2628010b2cffc102b3b2835
          1eb9df6c281d3cfc78e9934769d661b72a5265338d

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
P.x     = 0ea4e7c33d43e17cc516a72f76437c4bf81d8f4eac69ac355d3bf9
          b71b8138d55dc10fd458be115afa798b55dac34be1
    + I * 1565c2f625032d232f13121d3cfb476f45275c303a037faa255f9d
          a62000c2c864ea881e2bcddd111edc4a3c0da3e88d
P.y     = 043b6f5fe4e52c839148dc66f2b3751e69a0f6ebb3d056d6465d50
          d4108543ecd956e10fa1640dfd9bc0030cc2558d28
    + I * 0f8991d2a1ad662e7b6f58ab787947f1fa607fce12dde171bc1790
          3b012091b657e15333e11701edcf5b63ba2a561247
u[0]    = 03f80ce4ff0ca2f576d797a3660e3f65b274285c054feccc3215c8
          79e2c0589d376e83ede13f93c32f05da0f68fd6a10
    + I * 006488a837c5413746d868d1efb7232724da10eca410b07d8b505b
          9363bdccf0a1fc0029bad07d65b15ccfe6dd25e20d
Q.x     = 19592c812d5a50c5601062faba14c7d670711745311c879de1235a
          0a11c75aab61327bf2d1725db07ec4d6996a682886
    + I * 0eef4fa41ddc17ed47baf447a2c498548f3c72a02381313d13bef9
          16e240b61ce125539090d62d9fbb14a900bf1b8e90
Q.y     = 1260d6e0987eae96af9ebe551e08de22b37791d53f4db9e0d59da7
          36e66699735793e853e26362531fe4adf99c1883e3
    + I * 0dbace5df0a4ac4ac2f45d8fdf8aee45484576fdd6efc4f98ab9b9
          f4112309e628255e183022d98ea5ed6e47ca00306c
~~~

### BLS12381G2\_XMD:SHA-256\_SVDW\_RO\_

~~~
suite   = BLS12381G2_XMD:SHA-256_SVDW_RO_
dst     = QUUX-V01-CS02-with-BLS12381G2_XMD:SHA-256_SVDW_RO_

msg     =
P.x     = 0e2ca6ac396817c6bfadf5a540d8237bf706d33fab35de15f4fcfe
          f3d7bdcac65eb555b9f5e664981667ed43f857cbf1
    + I * 0d9615e9f5e1f815206a11be4247a30173a3bd2aec009eb40445da
          147d2e444c94e50b82e9bb5dcb52160191391b56d8
P.y     = 0b473b06c297aa4955e78dcbe11af4977c07d634bfa7ff55513b44
          77c4f2d96c0ac81c22f9cb857808216e54c7a4262f
    + I * 1466db113ccf3c7cc0cf96173485bdf900fa21bf38645220987932
          ba599f5ec0ea559f14fdc5ed9e5a2d883d4cd380c1
u[0]    = 171c2e85f502b47ddbab6f3ddc5b5f6569264591f2976085ee178e
          6fcae10b728c124b6151f765129e72d3e9c668c57f
    + I * 0733baa0ed578dcb604f9b9b6f29600c159251718764ada67173b2
          befdb5338cbc8c9209d1212d215b8c23bd76c0d2ae
u[1]    = 0af24ae79f9e15e8ac38f0417c4e04d66da312ab99985c2a8d4350
          a671afa1e38f717f9341b97af1d91acf2ee9945eb6
    + I * 0095588a099bf3dfb8ec786002c7a7ce4fe42817e07d1aa1dc6489
          dce96f7cae05d76c0293665d2b7de511ff7565eb5c
Q0.x    = 1374b154734f556cfe19ebf4eb1dcc182c99141b0fbc076f317176
          4f8fee3d64d6142c477328b8c1e4570e85a6368e4b
    + I * 011890283a18c866f7f80ba5f983e7aee8f61285c0e80180d6f454
          4252ba211f80c65b353abce1f0e231b8cdc417ceb0
Q0.y    = 19246a1500a21684e62c8a3176eba56d47b300a1a4039387e3ef4d
          44d4d074ea88bfe37b0535e5fe5325fae205eac95d
    + I * 02d3a09279344ec9d8987dce63a31ac828a3a8d8651b57f905a91d
          fe4518dc7f010e33dc1262c42db22feafa9a470659
Q1.x    = 0c5f3ded8d42afa880915eefc764946973e9d54f7458626100bde9
          9941053d4fa0b9212936c8e3d1517dfd010144b9a7
    + I * 17146146bb9d122bcb047bee456b240d66f5b2dc17257f538ca4f9
          ecbae282d2bd66ac66690b35fdbac5ef5c17609b6e
Q1.y    = 018bcc75ecc990116538ebd8f5aafb8a84e185232cfcd7de35fb65
          30a92ce357f36812fb7202a69fee37301669ae309c
    + I * 0250781e6fb4e0e39ae386521145743f37a160fcd6f2dcdc732978
          44b3120ce06fb8c87a19a5f2f5bbc532308732534d

msg     = abc
P.x     = 10c314ad416a603efd3d8c510abe24b04e86fd4b4c8431378fc03f
          a4358ef9085871742d628a72ac3e8787aac4a9e642
    + I * 059eb057ec63f9316e6d214bb6eb088834a8e1784792faf1892a22
          c84ffc0bee493a3a46bf7b9b336ae35c039b1b91ae
P.y     = 0800fe0f7da6d45dc2aa4372e856b7783a048349826d6fedec35f4
          64324628ed470301c4feb2996238414da949f681d3
    + I * 0270e82333f390d70f3f4f78d376bd806a51bbdd3b2146e585795d
          ffdf4a3a640a1802d7df4091d1f3959106a3e77c2f
u[0]    = 0bc76b6279842c042cf4460096ea8eaf8a118442ba0981e8a358cb
          8c4a3b373847da64b7bc87af5060838875f627521c
    + I * 014fb10360165ad67973b79526ece1a53dfbecfc4adf89c9d10668
          2af954211615d19697c48f140e168a844b1674cb21
u[1]    = 11ee42bc0afcdc3427d53c1fbcd43aca6e479631175b071bc0dad5
          9ca6e98a3a36d8b9df017c34fa6bdf5b4c69ba1b71
    + I * 038495ef8975de190e22b6fbf16f1e9e0ac72c0b1140806a3bcd65
          ab265ddfe4cabb12c390e64e04617e6046ddc0d00e
Q0.x    = 113ff93ca914b8a5b97869ffa6a15839cedfc3ba3c05e69fb65a35
          1be48cdf343e3cdbc2e8cb937fe1c018664d24cb47
    + I * 0196727701fdd4db9b365addfba2b251046b142b4990971524e982
          d654302815cd0dad3552ba8eda1fe15232fc10e6b5
Q0.y    = 0cfadad5d823f19e69d3e5542be9bebf4a0647fe452e636b61dfde
          43a75793dc99fcc37449e831d100edf2f994a5270e
    + I * 08b63b703c65058eb5734dd2115abb79dbbad0887d480a37a6a4bf
          05a7a3b0d127981f86e9453609ec8ab02454ae889c
Q1.x    = 1380fa1dcbd0cd99bc3d5278a868571ec6cdbedee26f4c03d8c3ef
          9380a38d91f3e051ac877f901b42bfab35793149db
    + I * 0c4e6cb24df706078ba550ea5f1913d72047465815d155d970adb7
          abb00b83f31c3fc725640a6b3458d667f6828e2fa0
Q1.y    = 039070022374114ecb31f79263f3151f07b7d854ebd5e45b21cb81
          5c6b85709efa12549b8bfa8dbbd1a192bd3f21e2f1
    + I * 0884bf6d2a748a08d15d55baab89e4c91cd190feeec8be6e82f6a6
          8e90abbfd47c47b55264d403606e6c9d60b38b9bc0

msg     = abcdef0123456789
P.x     = 020e2399be44e2a97ccd55a6092d08f274132a3459816801dbcf18
          3d204dc5136a84b6db4fb0d3270180a288d22d8fad
    + I * 02a41233f3ee379164ecb18bd42090c021e1ed1250854dade2b5a3
          5f0a02cb5eef8fceedd6d077b5b988e946b092da37
P.y     = 0437ac29431c2e77b53fa093d0da0e4175dd0c73adf922d08a1196
          0cf952d18ac37c3b445aeda583c1cfaa3b1e990aec
    + I * 05c8cb3cf0a668b6f7f0b98ddea23cf4fa560a45f6457ea634018f
          9bdf94da8cfa1f26f139f6c1b15b86a798c803ee3a
u[0]    = 16c7afb18b8005300e1fec63aa4c516abe86f0970bbdadb5e832b9
          3ead30537842ccd4d35f191b9ba409ef634ffa6912
    + I * 0200e158d4e252cdb4a31dbcdd1f0f11266678bb919d6695b5e5dc
          253ab78aeb89198c52702a06a86ddc7d5cdb4688e2
u[1]    = 0ea5bec03d8644d0f986d511a25863f63a58349d43e10463244a4a
          1b787ae92ff6a6c2c21e2ce53d06f6646c5c7e117c
    + I * 18004a332d6b7c78fd125d7cb78c18b0e5be1133cad9907c7f00bd
          b46a3a9761ae305a86e42199fdadbbf9258fd89142
Q0.x    = 067c873663f55940b5ec9f215cb95385ce3d074a704ebb63ac3597
          8a9cbdc437e4d809e801f3487b8e9355853efcb0a6
    + I * 086bca0394b8c8a91e09d7d17ab0a960253ad1576745e58d463823
          734d23f9843adba74ab22402a96b713a0808b87920
Q0.y    = 054e59e60e4f03d31dfc586fc50ac7463ecaa1e831e086637033e5
          473a75eb5c113acbb86f792c94b1891ff62fcc5e74
    + I * 0c8b48bd37c6c0773aabff20b688c861a749785953c5147a4255dc
          65d80c70d0e5bd644ed00d47e474a58461fc23c184
Q1.x    = 14423f200f6eb39961d8001bf6357b1ed64d9955a513095d44d51b
          d67c13283515273738b63119e8472ae322f4259969
    + I * 0c76058a015226841a0060efc1018f4e495e319c26b56e5213fdd1
          9126078e3f017be65494f5af6482c3cba5e48e2620
Q1.y    = 1138a80d42b2c6e4abc35a131451f3b7699aec89d4fadecca60ef8
          e534712c101209cf318dee139cc7ea8ddd9915a5a4
    + I * 137a9c31b0c58f04eb13e2920f45cc37e6dbe4d607b3648f34051d
          bb09debac2d9a3bda8098ed4e9de63e043abac667a

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
P.x     = 11c612f3d1a43a30cf7f13526b1c5858c338ada1b175a50346add0
          9538a369feb93dcf7137ccb619e4a96dcb38e83c91
    + I * 0b251af463d03250fbe8772fb2ba19b4aaa971cf8d49617a8943b3
          16c5923ed41677a7835122ce359c184a0dc9134e63
P.y     = 0ffa178d31427948da2833d5cc04de2bb279f9550db5c5292d4db1
          d642b01a1c99e56f836b3dd0f7a1d4610779371dbd
    + I * 1874189a185d27e3750d12473ed54c6050cbe925c3ab883b26ca56
          ff0c8908985073ae5a7ae5f73cc71d8961b50b5f62
u[0]    = 0be9d2f7f1dfa94984e0207d073d1e62d3597dc65c5d230cd554b5
          7f1b541f24edf70cbe2f27ad3108648f73f4669aed
    + I * 141007dff28fd683551916d7e506adabdcc1289c8c850f6365277b
          43670a110ff6c4efc180a597eb2ffa5812adfa12e0
u[1]    = 13d04052e31d7b3437ba708b6c42298e537981b11d522321ed53de
          fdc0d87b67f7b82d1117610702608bd24edcb3e4b5
    + I * 0fda20f62d488f8dfbf024e5bb503c27acfd120aeaac39be4840ea
          f4c3697fe47c7fced8cf5a139f15f3f433e7f8a9a9
Q0.x    = 072e16a99492640900e0cf6048f1bc681c103c748978a07d509a5f
          22f57fc2de2774514a376432b88d858c9c9c7ff727
    + I * 130bd240ae9d7e564750983ee10d3de1a8b5187fdd952323041241
          6861593b47a5afcb4d180b48fc31ae281f4e3fcaef
Q0.y    = 19793b1bb15b3d052d3fce48bddda13ca172186d52bb9d27663201
          8793bd0575874a2314cee3b28710cb4aa80f7719a5
    + I * 0c0e8a0201cd526b20ce83da87a4ef492efd905fc30d96e4218fbf
          80c915cc160cbde368d4a3c81c2fdb909906d75d3d
Q1.x    = 0c917d61d2fe0e3be167b9ef069fd0a49d0607a8d5abd382f0ef51
          f4e5832486fb7e0c82ce3c109a59f22fde2f330167
    + I * 03b1bcfec38c4acbb345d6aeedda1ef96c73f45eef746daff44143
          5f9ac8ab147f6fa65a32251e3077e33770528d873f
Q1.y    = 00443f83d69ec2591bff97323668fbc013e68178d658fe445ee208
          1f25c4d7128d7565ab2bd02cf4aa1c1247d2df9407
    + I * 06e7e3c145bc98de722c4b3c8b0803a1308eca4062eeca5a69148f
          5b3c4242e79654211a7198f522548e3b42cc8bc84c
~~~

### BLS12381G2\_XMD:SHA-256\_SVDW\_NU\_

~~~
suite   = BLS12381G2_XMD:SHA-256_SVDW_NU_
dst     = QUUX-V01-CS02-with-BLS12381G2_XMD:SHA-256_SVDW_NU_

msg     =
P.x     = 002d96c14769e1ecb71611d42e71e4177b8c351677cd0143baa1ac
          5c5c87262b76bb1cc5bb1c7eaa2f440c9cb2d45929
    + I * 156d2ade93a199bdf4a634994a2801287ed5d4125f7021700c6afb
          caccc35ab72ea8a7e58eee76b64ea8c867dcbbdf95
P.y     = 13433ca716e870098c5c5d4fff067a90938c4a9a3cbca24d0fe241
          a44ebc19a552ae13178d4470ea9bb29db0bb948e33
    + I * 108750f102345fdcec4f882ee6e1c33f4cbe81abd5ccc344520ca8
          705dd7374246210fead41decb6a984761587536c13
u[0]    = 156148e7f5866922098a78999c6272df521cc0f491e0d365096e6a
          8015a51c6306e5818c3c910a7ce69c1597c3452329
    + I * 0b749379233b0a7d95f65743e4f5c1a1b8c922ad42674e2f4d09f9
          6babdd29becdd13e94401fc9e490238d765b3193e9
Q.x     = 11b1d71290bf6a4758c1e5fcfc2fc8c73bbdfd052f2c52cd713703
          b7db75a3fcb2ea06531ba4e71466ac4f106ae966dd
    + I * 0f48c55f7727aebae75414c262928e485a2dabe9b91c1dcd68f972
          f7926d7d8494f98ce6f6e29a2a6c8531a0e28c43a0
Q.y     = 01a18078be60cc28f2b8115f2ae7f6e1ae9e916ff53e4e1e6b30a1
          300a7a6b2f63b7436ef19347201b26af9a5a618869
    + I * 11e86eaa7849273ffa4c95db69e074506237261a1cadf837c5af44
          8a9f2e30c674c9cc3ee6e0c32f798a5e29154cc92d

msg     = abc
P.x     = 16b879c863491df602ef5e9f7dbbb6e038b0d1f4f92c24bcfa4591
          50af4e73d2b1632d0d211d6194395f7481c02bd5fc
    + I * 0829872ab298ac0c0208123acd7fafc32baa07d20277f528d86431
          ec66b32c2766bda2a60535955af0368a6284eb3b8f
P.y     = 0a899bf4c45cd4a6ad3a9d6d92a58588ddbd4045e4c49fabb43a36
          849513d02b2ec1e136f214e5f5437710819fdbacd8
    + I * 059cadbe574db81d096ee5e1a1b539cb5bf97206b9dea6c4d54561
          c30e0a056bac25ed13e2ea7f892729e753c6b766f6
u[0]    = 0d5d55f03df748358b4cbb4c0302fe09f288d5d178f70327b94618
          0c5a50e85cac3cf6d56c1d4ff8d02e447cb86629b2
    + I * 0b4c2281e855c6a3b32136a84ff071d975ccc7647d596d6224f70e
          ad04e3ffa39db6859dc0f663f7d074c1cb08dc567c
Q.x     = 1930e08b8b5891d8feffaa3fcb1062d7a0220df21c41c95f31a9fe
          479fa005f44fe78d87f1c76f944284c5ff531df604
    + I * 0bdb30000b51ab723911f7a5ed1312dd548129fe21f0ea5000f76b
          1647d26bea367b50db09512b265ebbf06f01c78373
Q.y     = 18d21bb316acb42c4f9a7cf0b0a9da380a87e1f9fc20c7fef2f73c
          0a11889ed8501a96bd9aa56903049975f51737f75e
    + I * 169290273de9e79ef83ac883cb6a599e4584666f0496d33cf63fe4
          26f40fb4fdf24c03c3d2ebc7f8fafd37a735b7f35c

msg     = abcdef0123456789
P.x     = 10581ed8f0bf035de24757268dbdcfd4aaf2f2e842243b5ba6d550
          a09eed009eea6f90df32b7b5967b1943d31916ca4e
    + I * 06fced762aaa9c585fa9a70e07a2888279e2890124cec2a7fdb0d1
          0ca3192a6320bd0fda2f0ff04d957af63e22338591
P.y     = 11a5862cd4e40347924d636c18a403ce33987ef59f2b0a79815922
          aa93a490d55466fd7d694df72aa8824431b5b679c5
    + I * 0bffa6da982ef742bb75a26f4b47d63b5bce78b706396a37bac92f
          2418db8d353c01df4dd317a32393499f2bd51b3c66
u[0]    = 11e2848db825cc1ecd0f340c06eb0c604fed819ad89199e1ec9d11
          794355b8977ae866d626e32e27c6fb154afa03922b
    + I * 149805306f6e36d62007cf9cd5fc1ff929f2e9a6812b51dffe145f
          21f26bb2ab5512b7f5acfa6d26633d9a1d0a5fb514
Q.x     = 176b1aa72834e81a81e53a2bf41e41904e786352222218a8269427
          0b7c5c51508d7c6480ca0430ab3c31eaccc8cd0504
    + I * 169dfc870ee5596189471f107a45c55e2be973a2d6a88073090bdb
          63868e6ca9982604431446615407470e5261dd7c05
Q.y     = 0b50d35f9ea56f4a156d5ae6774704112485087697070a305f7661
          576c9ad0cf56a77414c036c1d2a86e0cb5d6afe6a3
    + I * 0edd7833d8ef608ed9d6835fd9c4c7879678fda8ad47e07478b55c
          8e73dc8931ad79c31ff824db6738129f4efb467810

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
P.x     = 0af2f4ff6c6f78a10a4ad6113efc9a3b9811db2d2e0d84509d44fb
          de176d93dce8b2ba6df4a50d5ca465d90e24fe04e8
    + I * 0bc513da308fbe9da859c30d0973fc4adad6f1eac34b9f1d298e1e
          5e5d0d81d477e26e7e710fdb291f51055a766b3d90
P.y     = 04ffd09c623d8209fed4c33b52e8fdd504c4c7c6ac3df8ee5a6305
          2e5dcbdbd57e205c753381c7677215267f3738436e
    + I * 0a817465f59b43fbb1ae25f2c0b733666a2e018933b4a00de55c4c
          050c070edd276afaec92abca141b293a2b5e17d806
u[0]    = 0f879b2cd4955d506063bb2d4debcf4e24698c9063adefbf9bf98d
          1c3d469c76b889ea7672b81150eb7748289ed89122
    + I * 10bac36fd96108b7cdf0a6ec43eb913c9431c568c5c32c9a2b7b03
          d8c0a7bf7cc2361a1b41b8f2940a1badebcf94f159
Q.x     = 058fb32320c025c581777f39238f53cc1045d0e41ae03e6d0ec5c4
          ebe6507d058b3d5e48495b65edec150da21d10b759
    + I * 0c80240239ff83591e996b5bfff5d37a29063fdf6c648ef8c80ba1
          3b34a2d0e517a97c934b568e6a25678b46d0f554bc
Q.y     = 00827354b150c0e337c8974d22d5d2dca27a76c9879bc4fd475fc9
          ab3c8848368082f2ab4c9c4b4f2058a84f721bd9bc
    + I * 094353a53f447ba559d0d883118214927abe76b73858148b87602e
          9294483bec36646ec2580d8067ae24c1c5fdbd7b28
~~~
