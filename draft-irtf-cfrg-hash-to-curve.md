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
  BR93:
    title: "Random oracles are practical: a paradigm for designing efficient protocols"
    seriesinfo:
      "In": Proceedings of the 1993 ACM Conference on Computer and Communications Security
      "pages": 62-73
      DOI: 10.1145/168588.168596
    target: https://doi.org/10.1145/168588.168596
    date: Dec, 1993
    author:
      -
        ins: M. Bellare
        name: Mihir Bellare
        org: UC San Diego
      -
        ins: P. Rogaway
        name: Phillip Rogaway
        org: UC Davis
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
  VR20:
    title: "Dragonblood: Analyzing the Dragonfly Handshake of WPA3 and EAP-pwd"
    seriesinfo:
        "In": IEEE Symposium on Security & Privacy (SP)
    target: https://eprint.iacr.org/2019/383
    date: 2020
    author:
      -
        ins: M. Vanhoef
        name: Mathy Vanhoef
        org: New York University Abu Dhabi
      -
        ins: E. Ronen
        name: Eyal Ronen
        org: Tel Aviv University and KU Leuven
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
  BM92:
    title: "Encrypted key exchange: Password-based protocols secure against dictionary attacks"
    seriesinfo:
        "In": IEEE Symposium on Security and Privacy - Oakland 1992
        "pages": 72-84
        DOI: 10.1109/RISP.1992.213269
    target: https://doi.org/10.1109/RISP.1992.213269
    date: 1992
    author:
      -
        ins: S. M. Bellovin
        name: Steven M. Bellovin
        org: AT&T Bell Laboratories
      -
        ins: M. Merritt
        name: Michael Merritt
        org: AT&T Bell Laboratories
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
        "In": Proceedings of the 2013 ACM SIGSAC Conference on Computer and Communications Security
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
  MOV96:
    title: Handbook of Applied Cryptography
    seriesinfo:
        publisher: CRC Press
        ISBN: 9780849385230
    target: http://cacr.uwaterloo.ca/hac/
    date: 1996
    author:
      -
        ins: A. J. Menezes
        name: Alfred J. Menezes
      -
        ins: P. C. van Oorschot
        name: Paul C. van Oorschot
      -
        ins: S. A. Vanstone
        name: Scott A. Vanstone
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
  MRV99:
    title: Verifiable Random Functions
    seriesinfo:
      "In": Symposium on the Foundations of Computer Science
      DOI:  10.1109/SFFCS.1999.814584
    target: https://doi.org/10.1109/SFFCS.1999.814584
    date: October, 1999
    author:
      -
        ins: S. Micali
        name: Silvio Micali
        org: MIT Laboratory for Computer Science
      -
        ins: M. Rabin
        name: Michael Rabin
        org: Harvard University Department of Applied Science
      -
        ins: S. Vadhan
        name: Salil Vadhan
        org: MIT Laboratory for Computer Science
  NR97:
    title: "Number-theoretic constructions of efficient pseudo-random functions"
    seriesinfo:
      "In": Symposium on the Foundations of Computer Science
      DOI: 10.1109/SFCS.1997.646134
    target: https://doi.org/10.1109/SFCS.1997.646134
    date: October, 1997
    author:
      -
        ins: M. Naor
        name: Moni Naor
        org: Weizmann Institute
      -
        ins: O. Reingold
        name: Omer Reingold
        org: Weizmann Institute
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
  RCB16:
    title: "Complete addition formulas for prime order elliptic curves"
    seriesinfo:
      "In": Advances in Cryptology - EUROCRYPT 2016
      "pages": 403-428
      DOI: 10.1007/978-3-662-49890-3_16
    target: https://doi.org/10.1007/978-3-662-49890-3_16
    date: May, 2016
    author:
      -
        ins: J. Renes
        name: Joost Renes
        org: Radboud University
      -
        ins: C. Costello
        name: Craig Costello
        org: Microsoft Research
      -
        ins: L. Batina
        name: Lejla Batina
        org: Radboud University
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
  p1363.2:
    title: "IEEE Standard Specification for Password-Based Public-Key Cryptography Techniques"
    target: https://standards.ieee.org/standard/1363_2-2008.html
    date: September, 2008
    author:
      -
        org: IEEE Computer Society
  p1363a:
    title: "IEEE Standard Specifications for Public-Key Cryptography---Amendment 1: Additional Techniques"
    target: https://standards.ieee.org/standard/1363a-2004.html
    date: March, 2004
    author:
      -
        org: IEEE Computer Society
  MT98:
    title: "Mersenne twister: A 623-dimensionally equidistributed uniform pseudo-random number generator"
    seriesinfo:
      "In": ACM Transactions on Modeling and Computer Simulation (TOMACS), Volume 8, Issue 1
      "pages": 3-30
      DOI: 10.1145/272991.272995
    date: January, 1998
    author:
      - ins: M. Matsumoto
      - ins: T. Nishimura
    target: https://doi.org/10.1145/272991.272995
  P20:
    title: "Efficient Elliptic Curve Operations On Microcontrollers With Finite Field Extensions"
    target: https://eprint.iacr.org/2020/009
    date: 2020
    author:
      -
        ins: T. Pornin
        name: Thomas Pornin
        org: NCC Group
  H20:
    title: "Indifferentiable hashing from Elligator 2"
    target: https://eprint.iacr.org/2020/1513
    date: 2020
    author:
      -
        ins: M. Hamburg
        name: Mike Hamburg
        org: Rambus Inc

--- abstract

This document specifies a number of algorithms for encoding or hashing an
arbitrary string to a point on an elliptic curve.

--- middle

# Introduction {#introduction}

Many cryptographic protocols require a procedure that encodes an arbitrary input,
e.g., a password, to a point on an elliptic curve. This procedure is known
as hashing to an elliptic curve. Prominent examples of cryptosystems that
hash to elliptic curves include password-authenticated
key exchanges {{BM92}} {{J96}} {{BMP00}} {{p1363.2}}, Identity-Based
Encryption {{BF01}}, Boneh-Lynn-Shacham signatures {{BLS01}} {{?I-D.irtf-cfrg-bls-signature}},
Verifiable Random Functions {{MRV99}} {{?I-D.irtf-cfrg-vrf}}, and Oblivious Pseudorandom
Functions {{NR97}} {{?I-D.irtf-cfrg-voprf}}.

Unfortunately for implementors, the precise hash function that is suitable
for a given protocol implemented using a given elliptic curve is often unclear
from the protocol's description. Meanwhile, an incorrect choice of hash
function can have disastrous consequences for security.

This document aims to bridge this gap by providing a comprehensive set of
recommended algorithms for a range of curve types.
Each algorithm conforms to a common interface: it takes as input an arbitrary-length
byte string and produces as output a point on an elliptic curve.
We provide implementation details for each algorithm, describe
the security rationale behind each recommendation, and give guidance for
elliptic curves that are not explicitly covered. We also present optimized
implementations for internal functions used by these algorithms.

Readers wishing to quickly specify or implement a conforming hash function
should consult {{suites}}, which lists recommended hash-to-curve suites
and describes both how to implement an existing suite and how to specify
a new one.

This document does not cover rejection sampling methods, sometimes referred to
as "try-and-increment" or "hunt-and-peck," because the goal is to describe
algorithms that can plausibly be computed in constant time. Use of these rejection
methods is NOT RECOMMENDED, because they have been a perennial cause of
side-channel vulnerabilities. See Dragonblood {{VR20}} as one example of this
problem in practice.

## Requirements Notation

{::boilerplate bcp14}

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
(Note that all choices of basis are isomorphic, but certain choices may
result in a more efficient implementation; this document does not make
any particular assumptions about choice of basis.)

An elliptic curve E is specified by an equation in two variables and a
finite field F. An elliptic curve equation takes one of several standard forms,
including (but not limited to) Weierstrass, Montgomery, and Edwards.

The curve E induces an algebraic group of order n, meaning that the group
has n distinct elements.
(This document uses additive notation for the elliptic curve group operation.)
Elements of an elliptic curve group are points with affine coordinates (x, y)
satisfying the curve equation, where x and y are elements of F.
In addition, all elliptic curve groups have a distinguished element, the identity
point, which acts as the identity element for the group operation.
On certain curves (including Weierstrass and Montgomery curves), the identity
point cannot be represented as an (x, y) coordinate pair.

For security reasons, cryptographic uses of elliptic curves generally require
using a (sub)group of prime order.
Let G be such a subgroup of the curve of prime order r, where n = h * r.
In this equation, h is an integer called the cofactor.
An algorithm that takes as input an arbitrary point on the curve E and
produces as output a point in the subgroup G of E is said to "clear
the cofactor." Such algorithms are discussed in {{cofactor-clearing}}.

Certain hash-to-curve algorithms restrict the form of the curve equation, the
characteristic of the field, or the parameters of the curve. For each
algorithm presented, this document lists the relevant restrictions.

The table below summarizes quantities relevant to hashing to curves:

| Symbol | Meaning | Relevance |
|:------:|---------|-----------|
| F,q,p | A finite field F of characteristic p and #F = q = p^m. | For prime fields, q = p; otherwise, q = p^m and m>1. |
| E | Elliptic curve. | E is specified by an equation and a field F. |
| n | Number of points on the elliptic curve E. | n = h * r, for h and r defined below. |
| G | A prime-order subgroup of the points on E. | Destination group to which byte strings are encoded. |
| r | Order of G. | r is a prime factor of n (usually, the largest such factor). |
| h | Cofactor, h >= 1. | An integer satisfying n = h * r. |

## Terminology

In this section, we define important terms used throughout the document.

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
since the mapping is defined to be deterministic.

Mappings may also be invertible, meaning that there is an efficient algorithm
that, for any point P output by the mapping, outputs an x in F such that
applying the mapping to x outputs P.
Some of the mappings given in {{mappings}} are invertible, but this
document does not discuss inversion algorithms.

### Encodings {#term-encoding}

Encodings are closely related to mappings.
Like a mapping, an encoding is a function that outputs a point on an elliptic curve.
In contrast to a mapping, however, the input to an encoding is an arbitrary-length
byte string.

This document constructs deterministic encodings by composing a hash function Hf
with a deterministic mapping.
In particular, Hf takes as input an arbitrary string and outputs an element of F.
The deterministic mapping takes that element as input and outputs a point on an
elliptic curve E defined over F.
Since Hf takes arbitrary-length byte strings as inputs, it cannot be injective:
the set of inputs is larger than the set of outputs, so there must
be distinct inputs that give the same output (i.e., there must be collisions).
Thus, any encoding built from Hf is also not injective.

Like mappings, encodings may be invertible, meaning that there is an efficient
algorithm that, for any point P output by the encoding, outputs a string s
such that applying the encoding to s outputs P.
The instantiation of Hf used by all encodings specified in this document ({{hashtofield}})
is not invertible. Thus, the encodings are also not invertible.

In some applications of hashing to elliptic curves, it is important that
encodings do not leak information through side channels.
{{VR20}} is one example of this type of leakage leading to a security vulnerability.
See {{security-considerations}} for further discussion.

### Random oracle encodings {#term-rom}

A random-oracle encoding satisfies a strong property: it can be proved
indifferentiable from a random oracle {{MRH04}} under a suitable assumption.

Both constructions described in {{roadmap}} are indifferentiable from
random oracles {{MRH04}} when instantiated following the guidelines in this document.
The constructions differ in their output distributions: one gives a uniformly random
point on the curve, the other gives a point sampled from a nonuniform distribution.

A random-oracle encoding with a uniform output distribution is suitable for use
in many cryptographic protocols proven secure in the random oracle model.
See {{security-considerations}} for further discussion.

### Serialization {#term-serialization}

A procedure related to encoding is the conversion of an elliptic curve point to a bit string.
This is called serialization, and is typically used for compactly storing or transmitting points.
The inverse operation, deserialization, converts a bit string to an elliptic curve point.
For example, {{SEC1}} and {{p1363a}} give standard methods for serialization and deserialization.

Deserialization is different from encoding in that only certain strings
(namely, those output by the serialization procedure) can be deserialized.
In contrast, this document is concerned with encodings from arbitrary strings
to elliptic curve points.
This document does not cover serialization or deserialization.

### Domain separation {#term-domain-separation}

Cryptographic protocols proven secure in the random oracle model are often analyzed
under the assumption that the random oracle only answers queries associated
with that protocol (including queries made by adversaries) {{BR93}}.
In practice, this assumption does not hold if two protocols use the
same function to instantiate the random oracle.
Concretely, consider protocols P1 and P2 that query a random oracle RO:
if P1 and P2 both query RO on the same value x, the security analysis of
one or both protocols may be invalidated.

A common way of addressing this issue is called domain separation,
which allows a single random oracle to simulate multiple, independent oracles.
This is effected by ensuring that each simulated oracle sees queries that are
distinct from those seen by all other simulated oracles.
For example, to simulate two oracles RO1 and RO2 given a single oracle RO,
one might define

    RO1(x) := RO("RO1" || x)
    RO2(x) := RO("RO2" || x)

where \|\| is the concatenation operator.
In this example, "RO1" and "RO2" are called domain separation tags;
they ensure that queries to RO1 and RO2 cannot result in identical
queries to RO, meaning that it is safe to treat RO1 and RO2 as
independent oracles.

In general, domain separation requires defining a distinct injective
encoding for each oracle being simulated.
In the above example, "RO1" and "RO2" have the same length and thus
satisfy this requirement when used as prefixes.
The algorithms specified in this document take a different approach to ensuring
injectivity; see {{hashtofield-expand}} and {{security-considerations-domain-separation}}
for more details.

# Encoding byte strings to elliptic curves {#roadmap}

This section presents a general framework and interface for encoding byte strings
to points on an elliptic curve. The constructions in this section rely on three
basic functions:

-   The function hash\_to\_field, {0, 1}^\* x {1, 2, ...} -> (F, F, ...), hashes arbitrary-length byte strings
    to a list of one or more elements of a finite field F; its implementation is defined in
    {{hashtofield}}.

-   The function map\_to\_curve, F -> E, calculates a point on the elliptic curve E
    from an element of the finite field F over which E is defined.
    {{mappings}} describes mappings for a range of curve families.

-   The function clear\_cofactor, E -> G, sends any point on the curve E to
    the subgroup G of E. {{cofactor-clearing}} describes methods to perform
    this operation.

The two encodings ({{term-encoding}}) defined in this section have the
same interface and are both random-oracle encodings ({{term-rom}}).
The difference between the two is that their outputs are sampled from
different distributions:

- encode\_to\_curve is a nonuniform encoding from byte strings to points in G.
  That is, the distribution of its output is not uniformly random in G:
  the set of possible outputs of encode\_to\_curve is only a fraction of the
  points in G, and some points in this set are more likely to be output than others.
  {{security-considerations-encode}} gives a more precise definition of
  encode\_to\_curve's output distribution.

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

- hash\_to\_curve is a uniform encoding from byte strings to points in G.
  That is, the distribution of its output is statistically close to uniform in G.

  This function is suitable for most applications requiring a random oracle
  returning points in G, when instantiated with any of the map\_to\_curve
  functions described in {{mappings}}.
  See {{security-considerations}} for further discussion.

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

Each hash-to-curve suite in {{suites}} instantiates one of these encoding
functions for a specifc elliptic curve.

## Domain separation requirements {#domain-separation}

All uses of the encoding functions defined in this document MUST include
domain separation ({{term-domain-separation}}) to avoid interfering with
other uses of similar functionality.

Applications that instantiate multiple, independent instances of either
hash\_to\_curve or encode\_to\_curve MUST enforce domain separation
between those instances.
This requirement applies both in the case of multiple instances targeting
the same curve and in the case of multiple instances targeting different curves.
(This is because the internal hash\_to\_field primitive ({{hashtofield}})
requires domain separation to guarantee independent outputs.)

Domain separation is enforced with a domain separation tag (DST),
which is a byte string constructed according to the following requirements:

1. Tags MUST be supplied as the DST parameter to hash\_to\_field, as
   described in {{hashtofield}}.

2. Tags MUST have nonzero length. A minimum length of 16 bytes
   is RECOMMENDED to reduce the chance of collisions with other
   applications.

3. Tags SHOULD begin with a fixed identification string
   that is unique to the application.

4. Tags SHOULD include a version number.

5. For applications that define multiple ciphersuites, each ciphersuite's
   tag MUST be different. For this purpose, it is RECOMMENDED to
   include a ciphersuite identifier in each tag.

6. For applications that use multiple encodings, either to the same curve
   or to different curves, each encoding MUST use a different tag.
   For this purpose, it is RECOMMENDED to include the encoding's
   Suite ID ({{suites}}) in the domain separation tag.
   For independent encodings based on the same suite, each tag SHOULD
   also include a distinct identifier, e.g., "ENC1" and "ENC2".

As an example, consider a fictional application named Quux
that defines several different ciphersuites.
A reasonable choice of tag is "QUUX-V\<xx\>-CS\<yy\>-\<suiteID\>", where
\<xx\> and \<yy\> are two-digit numbers indicating the version and
ciphersuite, respectively, and \<suiteID\> is the Suite ID of the
encoding used in ciphersuite \<yy\>.

As another example, consider a fictional application named Baz that requires
two independent random oracles to the same curve.
Reasonable choices of tags for these oracles are
"BAZ-V\<xx\>-CS\<yy\>-\<suiteID\>-ENC1" and "BAZ-V\<xx\>-CS\<yy\>-\<suiteID\>-ENC2",
respectively, where \<xx\>, \<yy\>, and \<suiteID\> are as described above.

The example tags given above are assumed to be ASCII-encoded byte strings
without null termination, which is the RECOMMENDED format.
Other encodings CAN be used, but in all cases the encoding as a sequence of
bytes MUST be specified unambiguously.

# Utility functions {#utility}

Algorithms in this document use the utility functions described below,
plus standard arithmetic operations (addition, multiplication, modular
reduction, etc.) and elliptic curve point operations (point addition and
scalar multiplication).

For security, implementations of these functions SHOULD be constant time:
in brief, this means that execution time and memory access patterns SHOULD NOT
depend on the values of secret inputs, intermediate values, or outputs.
For such constant-time implementations, all arithmetic, comparisons, and
assignments MUST also be implemented in constant time.
{{security-considerations}} briefly discusses constant-time security issues.

Guidance on implementing low-level operations (in constant time or otherwise)
is beyond the scope of this document; readers should consult standard reference
material {{MOV96}} {{CFADLNV05}}.

-   CMOV(a, b, c): If c is False, CMOV returns a, otherwise it returns b.
    For constant-time implementations, this operation must run in
    time independent of the value of c.

-   AND, OR, NOT, and XOR are standard bitwise logical operators.
    For constant-time implementations, short-circuit operators MUST be avoided.

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

-   sqrt(x): The sqrt operation is a multi-valued function, i.e., there exist
    two roots of x in the field F whenever x is square (except when x = 0).
    To maintain compatibility across implementations while allowing implementors
    leeway for optimizations, this document does not require sqrt() to return a
    particular value. Instead, as explained in {{point-sign}}, any function that
    calls sqrt also specifies how to determine the correct root.

    The preferred way of computing square roots is to fix a deterministic
    algorithm particular to F. We give several algorithms in {{appx-sqrt}}.

-   sgn0(x): This function returns either 0 or 1 indicating the "sign" of x,
    where sgn0(x) == 1 just when x is "negative".
    (In other words, this function always considers 0 to be positive.)
    {{sgn0-function}} defines this function and discusses its implementation.

-   inv0(x): This function returns the multiplicative inverse of x in F,
    extended to all of F by fixing inv0(0) == 0.
    A straightforward way to implement inv0 in constant time is to compute

    ~~~
    inv0(x) := x^(q - 2).
    ~~~

    Notice that on input 0, the output is 0 as required.
    Certain fields may allow faster inversion methods; detailed discussion
    of such methods is beyond the scope of this document.

-   I2OSP and OS2IP: These functions are used to convert a byte string to
    and from a non-negative integer as described in {{!RFC8017}}.
    (Note that these functions operate on byte strings in big-endian byte
    order.)

-   a \|\| b: denotes the concatenation of byte strings a and b. For example,
    "ABC" \|\| "DEF" == "ABCDEF".

-   substr(str, sbegin, slen): for a byte string str, this function returns
    the slen-byte substring starting at position sbegin; positions are zero
    indexed.
    For example, substr("ABCDEFG", 2, 3) == "CDE".

-   len(str): for a byte string str, this function returns the length of str
    in bytes. For example, len("ABC") == 3.

-   strxor(str1, str2): for byte strings str1 and str2, strxor(str1, str2)
    returns the bitwise XOR of the two strings.
    For example, strxor("abc", "XYZ") == "9;9" (the strings in this example
    are ASCII literals, but strxor is defined for arbitrary byte strings).
    In this document, strxor is only applied to inputs of equal length.

## The sgn0 function {#sgn0-function}

This section defines a generic sgn0 implementation that applies to any field F = GF(p^m).
It also gives simplified implementations for the cases F = GF(p) and F = GF(p^2).

The definition of the sgn0 function for extension fields relies on
the polynomial basis or vector representation of field elements, and
iterates over the entire vector representation of the input element.
As a result, sgn0 depends on the primitive polynomial used to define
the polynomial basis; see {{suites}} for more information about this
basis, and see {{bg-curves}} for a discussion of representing elements
of extension fields as vectors.

~~~
sgn0(x)

Parameters:
- F, a finite field of characteristic p and order q = p^m.
- p, the characteristic of F (see immediately above).
- m, the extension degree of F, m >= 1 (see immediately above).

Input: x, an element of F.
Output: 0 or 1.

Steps:
1. sign = 0
2. zero = 1
3. for i in (1, 2, ..., m):
4.   sign_i = x_i mod 2
5.   zero_i = x_i == 0
6.   sign = sign OR (zero AND sign_i) # Avoid short-circuit logic ops
7.   zero = zero AND zero_i
8. return sign
~~~

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

Input: x, an element of GF(p^2).
Output: 0 or 1.

Steps:
1. sign_0 = x_0 mod 2
2. zero_0 = x_0 == 0
3. sign_1 = x_1 mod 2
4. s = sign_0 OR (zero_0 AND sign_1) # Avoid short-circuit logic ops
5. return s
~~~

# Hashing to a finite field {#hashtofield}

The hash\_to\_field function hashes a byte string msg of arbitrary length into
one or more elements of a field F.
This function works in two steps: it first hashes the input byte string
to produce a uniformly random byte string, and then interprets this byte string
as one or more elements of F.

For the first step, hash\_to\_field calls an auxiliary function expand\_message.
This document defines two variants of expand\_message: one appropriate
for hash functions like SHA-2 {{FIPS180-4}} or SHA-3 {{FIPS202}}, and another
appropriate for extensible-output functions such as SHAKE128 {{FIPS202}}.
Security considerations for each expand\_message variant are discussed
below ({{hashtofield-expand-xmd}}, {{hashtofield-expand-xof}}).

Implementors MUST NOT use rejection sampling to generate a uniformly random
element of F, to ensure that the hash\_to\_field function is amenable to
constant-time implementation.
The reason is that rejection sampling procedures are difficult to implement
in constant time, and later well-meaning "optimizations" may silently render
an implementation non-constant-time.
This means that any hash\_to\_field function based on rejection sampling
would be incompatible with constant-time implementation.

The hash\_to\_field function is also suitable for securely hashing to scalars.
For example, when hashing to the scalar field for an elliptic curve (sub)group
with prime order r, it suffices to instantiate hash\_to\_field with target field
GF(r).

## Security considerations {#hashtofield-sec}

The hash\_to\_field function is designed to be indifferentiable from a
random oracle {{MRH04}} when expand\_message ({{hashtofield-expand}})
is modeled as a random oracle (see {{security-considerations-hash-to-field}}).
Ensuring indifferentiability requires care; to see why, consider a prime
p that is close to 3/4 * 2^256.
Reducing a random 256-bit integer modulo this p yields a value that is in
the range \[0, p / 3\] with probability roughly 1/2, meaning that this value
is statistically far from uniform in \[0, p - 1\].

To control bias, hash\_to\_field instead uses random integers whose
length is at least ceil(log2(p)) + k bits, where k is the target security
level for the suite in bits.
Reducing such integers mod p gives bias at most 2^-k for any p; this bias
is appropriate when targeting k-bit security.
For each such integer, hash\_to\_field uses expand\_message to obtain
L uniform bytes, where

~~~
L = ceil((ceil(log2(p)) + k) / 8)
~~~

These uniform bytes are then interpreted as an integer via OS2IP {{RFC8017}}.
For example, for a 255-bit prime p, and k = 128-bit security,
L = ceil((255 + 128) / 8) = 48 bytes.

Note that k is an upper bound on the security level for the
corresponding curve.
See {{security-considerations-targets}} for more details, and
{{new-suite}} for guidelines on choosing k for a given curve.

## Efficiency considerations in extension fields {#hashtofield-exteff}

The hash\_to\_field function described in this section is inefficient for certain
extension fields. Specifically, when hashing to an element of the extension
field GF(p^m), hash\_to\_field requires expanding msg into m * L bytes (for L as defined above).
For extension fields where log2(p) is significantly smaller than the security
level k, this approach is inefficient: it requires expand\_message to output
roughly m * log2(p) + m * k bits, whereas m * log2(p) + k bytes suffices to
generate an element of GF(p^m) with bias at most 2^-k. In such cases, an
applications MAY use an alternative hash\_to\_field function, provided it
meets the following security requirements:

- The function MUST output field element(s) that are uniformly random except with bias at most 2^-k.

- The function MUST NOT use rejection sampling.

- The function SHOULD be amenable to straight line implementations.

For example, Pornin {{P20}} describes a method for hashing to GF(9767^19) that meets
these requirements while using fewer output bits from expand\_message than
hash\_to\_field would for that field.

## hash\_to\_field implementation {#hashtofield-impl}

The following procedure implements hash\_to\_field.

The expand\_message parameter to this function MUST conform to the requirements
given in {{hashtofield-expand}}. {{domain-separation}} discusses the REQUIRED
method for constructing DST, the domain separation tag.

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
  domain separation tag into a uniformly random byte string
  (see discussion above).

Inputs:
- msg, a byte string containing the message to hash.
- count, the number of elements of F to output.

Outputs:
- (u_0, ..., u_(count - 1)), a list of field elements.

Steps:
1. len_in_bytes = count * m * L
2. uniform_bytes = expand_message(msg, DST, len_in_bytes)
3. for i in (0, ..., count - 1):
4.   for j in (0, ..., m - 1):
5.     elm_offset = L * (j + i * m)
6.     tv = substr(uniform_bytes, elm_offset, L)
7.     e_j = OS2IP(tv) mod p
8.   u_i = (e_0, ..., e_(m - 1))
9. return (u_0, ..., u_(count - 1))
~~~

## expand\_message {#hashtofield-expand}

expand\_message is a function that generates a uniformly random byte string.
It takes three arguments:

1. msg, a byte string containing the message to hash,
2. DST, a byte string that acts as a domain separation tag, and
3. len\_in\_bytes, the number of bytes to be generated.

This document defines the following two variants of expand\_message:

- expand\_message\_xmd ({{hashtofield-expand-xmd}}) is appropriate for use
with a wide range of hash functions, including SHA-2 {{FIPS180-4}}, SHA-3
{{FIPS202}}, BLAKE2 {{?RFC7693}}, and others.

- expand\_message\_xof ({{hashtofield-expand-xof}}) is appropriate for use
with extensible-output functions (XOFs) including functions in the SHAKE
{{FIPS202}} or BLAKE2X {{BLAKE2X}} families.

These variants should suffice for the vast majority of use cases, but other
variants are possible; {{hashtofield-expand-other}} discusses requirements.

### expand\_message\_xmd {#hashtofield-expand-xmd}

The expand\_message\_xmd function produces a uniformly random byte string using
a cryptographic hash function H that outputs b bits. For security, H must meet
the following requirements:

- The number of bits output by H MUST be b >= 2 * k, for k the target
security level in bits, and b MUST be divisible by 8.
The first requirement ensures k-bit collision resistance; the second
ensures uniformity of expand\_message\_xmd's output.

- H MAY be a Merkle-Damgaard hash function like SHA-2.
In this case, security holds when the underlying compression function is
modeled as a random oracle {{CDMP05}}. (See
{{security-considerations-expand-xmd}} for discussion.)

- H MAY be a sponge-based hash function like SHA-3 or BLAKE2.
In this case, security holds when the inner function is modeled as a
random transformation or as a random permutation {{BDPV08}}.

- Otherwise, H MUST be a hash function that has been proved indifferentiable
from a random oracle {{MRH04}} under a reasonable cryptographic assumption.

SHA-2 {{FIPS180-4}} and SHA-3 {{FIPS202}} are typical and RECOMMENDED choices.
As an example, for the 128-bit security level, b >= 256 bits and either SHA-256 or
SHA3-256 would be an appropriate choice.

The hash function H is assumed to work by repeatedly ingesting fixed-length
blocks of data. The length in bits of these blocks is called the input block
size (s). As examples, s = 1024 for SHA-512 {{FIPS180-4}} and s = 576 for
SHA3-512 {{FIPS202}}. For correctness, H requires b <= s.

The following procedure implements expand\_message\_xmd.

~~~
expand_message_xmd(msg, DST, len_in_bytes)

Parameters:
- H, a hash function (see requirements above).
- b_in_bytes, b / 8 for b the output size of H in bits.
  For example, for b = 256, b_in_bytes = 32.
- s_in_bytes, the input block size of H, measured in bytes (see
  discussion above). For example, for SHA-256, s_in_bytes = 64.

Input:
- msg, a byte string.
- DST, a byte string of at most 255 bytes.
  See below for information on using longer DSTs.
- len_in_bytes, the length of the requested output in bytes,
  not greater than the lesser of (255 * b_in_bytes) or 2^16-1.

Output:
- uniform_bytes, a byte string.

Steps:
1.  ell = ceil(len_in_bytes / b_in_bytes)
2.  ABORT if ell > 255
3.  DST_prime = DST || I2OSP(len(DST), 1)
4.  Z_pad = I2OSP(0, s_in_bytes)
5.  l_i_b_str = I2OSP(len_in_bytes, 2)
6.  msg_prime = Z_pad || msg || l_i_b_str || I2OSP(0, 1) || DST_prime
7.  b_0 = H(msg_prime)
8.  b_1 = H(b_0 || I2OSP(1, 1) || DST_prime)
9.  for i in (2, ..., ell):
10.    b_i = H(strxor(b_0, b_(i - 1)) || I2OSP(i, 1) || DST_prime)
11. uniform_bytes = b_1 || ... || b_ell
12. return substr(uniform_bytes, 0, len_in_bytes)
~~~

Note that the string Z\_pad is prefixed to msg when computing b\_0 (step 7).
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
Z\_pad. Then, when computing b\_0, initialize H using the saved state.
Further details are implementation dependent, and beyond the scope of this document.

### expand\_message\_xof {#hashtofield-expand-xof}

The expand\_message\_xof function produces a uniformly random byte string
using an extensible-output function (XOF) H.
For security, H must meet the following criteria:

- The collision resistance of H MUST be at least k bits.

- H MUST be an XOF that has been proved indifferentiable from a random oracle
under a reasonable cryptographic assumption.

The SHAKE {{FIPS202}} XOF family is a typical and RECOMMENDED choice.
As an example, for 128-bit security, SHAKE128 would be an appropriate choice.

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
- uniform_bytes, a byte string.

Steps:
1. DST_prime = DST || I2OSP(len(DST), 1)
2. msg_prime = msg || I2OSP(len_in_bytes, 2) || DST_prime
3. uniform_bytes = H(msg_prime, len_in_bytes)
4. return uniform_bytes
~~~

### Using DSTs longer than 255 bytes {#hashtofield-expand-dst}

The expand\_message variants defined in this section accept domain separation
tags of at most 255 bytes.
If applications require a domain separation tag longer than 255 bytes, e.g., because
of requirements imposed by an invoking protocol, implementors MUST compute a short
domain separation tag by hashing, as follows:

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
under an appropriate assumption about the underlying cryptographic primitives;
see {{security-considerations-hash-to-field}} for more information.

In addition, expand\_message variants:

- MUST give collision resistance commensurate with the security level of
the target elliptic curve.

- MUST be built on primitives designed for use in applications requiring
cryptographic randomness. As examples, a secure stream cipher is an appropriate
primitive, whereas a Mersenne twister pseudorandom number generator {{MT98}} is not.

- MUST NOT use rejection sampling.

- MUST give independent values for distinct (msg, DST, length) inputs.
Meeting this requirement is subtle.
As a simplified example, hashing msg \|\| DST does not work,
because in this case distinct (msg, DST) pairs whose concatenations are equal
will return the same output (e.g., ("AB", "CDEF") and ("ABC", "DEF")).
The variants defined in this document use a suffix-free encoding of DST
to avoid this issue.

- MUST use the domain separation tag DST to ensure that invocations of
cryptographic primitives inside of expand\_message are domain separated
from invocations outside of expand\_message.
For example, if the expand\_message variant uses a hash function H, an encoding
of DST MUST be added either as a prefix or a suffix of the input to each invocation
of H. Adding DST as a suffix is the RECOMMENDED approach.

- SHOULD read msg exactly once, for efficiency when msg is long.

In addition, each expand\_message variant MUST specify a unique EXP\_TAG
that identifies that variant in a Suite ID. See {{suiteIDformat}} for more information.

# Deterministic mappings {#mappings}

The mappings in this section are suitable for implementing either nonuniform
or uniform encodings using the constructions in {{roadmap}}.
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
The affine coordinates (x, y) specify a point on an elliptic curve defined
over F. Note, however, that the point (x, y) is not a uniformly random point.

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
in optimizing square-root implementations.

## Exceptional cases {#map-exceptions}

Mappings may have exceptional cases, i.e., inputs u
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
5. tv4 = sqrt(-g(Z) * (3 * Z^2 + 4 * A))    # can be precomputed
6. If sgn0(tv4) == 1, set tv4 = -tv4        # sgn0(tv4) MUST equal 0
7. tv5 = u * tv1 * tv3 * tv4
8. tv6 = -4 * g(Z) / (3 * Z^2 + 4 * A)      # can be precomputed
9.  x1 = -Z / 2 - tv5
10. x2 = -Z / 2 + tv5
11. x3 = Z + tv6 * (tv2^2 * tv3)^2
12. If is_square(g(x1)), set x = x1 and y = sqrt(g(x1))
13. Else If is_square(g(x2)), set x = x2 and y = sqrt(g(x2))
14. Else set x = x3 and y = sqrt(g(x3))
15. If sgn0(u) != sgn0(y), set y = -y
16. return (x, y)
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

{{straightline-sswu}} gives a general and optimized straight-line implementation of
this mapping. For more information on optimizing this mapping, see {{WB19}} Section
4 or the example code found at {{hash2curve-repo}}.

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
(See {{WB19}}, Appendix A, for one way of finding E' using {{SAGE}}.)
This isogeny defines a map iso\_map(x', y') given by a pair of rational functions.
iso\_map takes as input a point on E' and produces as output a point on E.

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
Exceptional cases of iso\_map are inputs that cause the denominator of
either rational function to evaluate to zero; such cases MUST return the
identity point on E.

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

    In certain cases, e.g., edwards25519 {{!RFC7748}}, the sign of the rational
    map from the twisted Edwards curve to its corresponding Montgomery curve
    is not given explicitly.
    In this case, the sign MUST be fixed such that applying the rational map
    to the twisted Edwards curve's base point yields the Montgomery curve's
    base point with correct sign.
    (For edwards25519, see {{!RFC7748}} and {{EID4730}}.)

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
takes as input any point on the curve and produces as output a point in the
prime-order (sub)group G ({{bg-curves}}).

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
Applications that require hashing to an elliptic curve should use either
an existing suite or a new suite specified as described in {{new-suite}}.

All applications using a hash-to-curve suite MUST choose a domain
separation tag (DST) in accordance with the guidelines in {{domain-separation}}.
In addition, applications whose security requires a random oracle that returns
uniformly random points on the target curve MUST use a suite whose encoding type
is hash\_to\_curve; see {{roadmap}} and immediately below for more information.

A hash-to-curve suite comprises the following parameters:

- Suite ID, a short name used to refer to a given suite.
  {{suiteIDformat}} discusses the naming conventions for suite IDs.
- encoding type, either uniform (hash\_to\_curve) or nonuniform (encode\_to\_curve).
  See {{roadmap}} for definitions of these encoding types.
- E, the target elliptic curve over a field F.
- p, the characteristic of the field F.
- m, the extension degree of the field F. If m > 1, the suite MUST also specify
  the polynomial basis used to represent extension field elements.
- k, the target security level of the suite in bits.
  (See {{security-considerations-targets}} for discussion.)
- L, the length parameter for hash\_to\_field ({{hashtofield-sec}}).
- expand\_message, one of the variants specified in {{hashtofield-expand}}
  plus any parameters required for the specified variant (for example, H,
  the underlying hash function).
- f, a mapping function from {{mappings}}.
- h\_eff, the scalar parameter for clear\_cofactor ({{cofactor-clearing}}).

In addition to the above parameters, the mapping f may require
additional parameters Z, M, rational\_map, E', or iso\_map.
When applicable, these MUST be specified.

The below table lists suites RECOMMENDED for some elliptic curves.
The corresponding parameters are given in the following subsections.
Applications instantiating cryptographic protocols whose security analysis
relies on a random oracle that outputs points with a uniform distribution MUST NOT use a
nonuniform encoding.
Moreover, applications that use a nonuniform encoding SHOULD carefully
analyze the security implications of nonuniformity.
When the required encoding is not clear, applications SHOULD use a
uniform encoding for security.


| E            | Suites | Section |
|--------------|--------|---------|
| NIST P-256   | P256\_XMD:SHA-256\_SSWU\_RO\_ P256\_XMD:SHA-256\_SSWU\_NU\_ | {{suites-p256}} |
| NIST P-384   | P384\_XMD:SHA-384\_SSWU\_RO\_ P384\_XMD:SHA-384\_SSWU\_NU\_ | {{suites-p384}} |
| NIST P-521   | P521\_XMD:SHA-512\_SSWU\_RO\_ P521\_XMD:SHA-512\_SSWU\_NU\_ | {{suites-p521}} |
| curve25519   | curve25519\_XMD:SHA-512\_ELL2\_RO\_ curve25519\_XMD:SHA-512\_ELL2\_NU\_ | {{suites-25519}} |
| edwards25519 | edwards25519\_XMD:SHA-512\_ELL2\_RO\_ edwards25519\_XMD:SHA-512\_ELL2\_NU\_ | {{suites-25519}} |
| curve448     | curve448\_XMD:SHA-512\_ELL2\_RO\_ curve448\_XMD:SHA-512\_ELL2\_NU\_ | {{suites-448}} |
| edwards448   | edwards448\_XMD:SHA-512\_ELL2\_RO\_ edwards448\_XMD:SHA-512\_ELL2\_NU\_ | {{suites-448}} |
| secp256k1    | secp256k1\_XMD:SHA-256\_SSWU\_RO\_ secp256k1\_XMD:SHA-256\_SSWU\_NU\_ | {{suites-secp256k1}} |
| BLS12-381 G1 | BLS12381G1\_XMD:SHA-256\_SSWU\_RO\_ BLS12381G1\_XMD:SHA-256\_SSWU\_NU\_ | {{suites-bls12381}} |
| BLS12-381 G2 | BLS12381G2\_XMD:SHA-256\_SSWU\_RO\_ BLS12381G2\_XMD:SHA-256\_SSWU\_NU\_ | {{suites-bls12381}} |

## Implementing a hash-to-curve suite {#suites-howto}

A hash-to-curve suite requires the following functions.
Note that some of these require utility functions from {{utility}}.

1. Base field arithmetic operations for the target elliptic curve, e.g.,
   addition, multiplication, and square root.

2. Elliptic curve point operations for the target curve, e.g.,
   point addition and scalar multiplication.

3. The hash\_to\_field function; see {{hashtofield}}. This includes the expand\_message
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
- f: Simplified SWU method ({{simple-swu}})
- Z: -10
- h\_eff: 1

P256\_XMD:SHA-256\_SSWU\_NU\_ is identical to P256\_XMD:SHA-256\_SSWU\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

An optimized example implementation of the Simplified SWU mapping
to P-256 is given in {{straightline-sswu}}.

## Suites for NIST P-384 {#suites-p384}

This section defines ciphersuites for the NIST P-384 elliptic curve {{FIPS186-4}}.

P384\_XMD:SHA-384\_SSWU\_RO\_ is defined as follows:

- encoding type: hash\_to\_curve ({{roadmap}})
- E: y^2 = x^3 + A * x + B, where
  - A = -3
  - B = 0xb3312fa7e23ee7e4988e056be3f82d19181d9c6efe8141120314088f5013875ac656398d8a2ed19d2a85c8edd3ec2aef
- p: 2^384 - 2^128 - 2^96 + 2^32 - 1
- m: 1
- k: 192
- expand\_message: expand\_message\_xmd ({{hashtofield-expand-xmd}})
- H: SHA-384
- L: 72
- f: Simplified SWU method ({{simple-swu}})
- Z: -12
- h\_eff: 1

P384\_XMD:SHA-384\_SSWU\_NU\_ is identical to P384\_XMD:SHA-384\_SSWU\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

An optimized example implementation of the Simplified SWU mapping
to P-384 is given in {{straightline-sswu}}.

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
- f: Simplified SWU method ({{simple-swu}})
- Z: -4
- h\_eff: 1

P521\_XMD:SHA-512\_SSWU\_NU\_ is identical to P521\_XMD:SHA-512\_SSWU\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

An optimized example implementation of the Simplified SWU mapping
to P-521 is given in {{straightline-sswu}}.

## Suites for curve25519 and edwards25519 {#suites-25519}

This section defines ciphersuites for curve25519 and edwards25519 {{!RFC7748}}.
Note that these ciphersuites SHOULD NOT be used when hashing to ristretto255
{{?I-D.irtf-cfrg-ristretto255-decaf448}}.
See {{appx-ristretto255}} for information on how to hash to that group.

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
- f: Elligator 2 method ({{elligator2}})
- Z: 2
- h\_eff: 8

edwards25519\_XMD:SHA-512\_ELL2\_RO\_ is identical to curve25519\_XMD:SHA-512\_ELL2\_RO\_,
except for the following parameters:

- E: a * v^2 + w^2 = 1 + d * v^2 * w^2, where
  - a = -1
  - d = 0x52036cee2b6ffe738cc740797779e89800700a4d4141d8ab75eb4dca135978a3
- f: Twisted Edwards Elligator 2 method ({{ell2edwards}})
- M: curve25519 defined in {{!RFC7748}}, Section 4.1
- rational\_map: the birational map defined in {{!RFC7748}}, Section 4.1

curve25519\_XMD:SHA-512\_ELL2\_NU\_ is identical to curve25519\_XMD:SHA-512\_ELL2\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

edwards25519\_XMD:SHA-512\_ELL2\_NU\_ is identical to edwards25519\_XMD:SHA-512\_ELL2\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

Optimized example implementations of the above mappings are given in
{{map-to-curve25519}} and {{map-to-edwards25519}}.

## Suites for curve448 and edwards448 {#suites-448}

This section defines ciphersuites for curve448 and edwards448 {{!RFC7748}}.
Note that these ciphersuites SHOULD NOT be used when hashing to decaf448
{{I-D.irtf-cfrg-ristretto255-decaf448}}.
See {{appx-decaf448}} for information on how to hash to that group.

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
- f: Elligator 2 method ({{elligator2}})
- Z: -1
- h\_eff: 4

edwards448\_XMD:SHA-512\_ELL2\_RO\_ is identical to curve448\_XMD:SHA-512\_ELL2\_RO\_,
except for the following parameters:

- E: a * v^2 + w^2 = 1 + d * v^2 * w^2, where
  - a = 1
  - d = -39081
- f: Twisted Edwards Elligator 2 method ({{ell2edwards}})
- M: curve448, defined in {{!RFC7748}}, Section 4.2
- rational\_map: the 4-isogeny map defined in {{!RFC7748}}, Section 4.2

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
- f: Simplified SWU for AB == 0 ({{simple-swu-AB0}})
- Z: -11
- E': y'^2 = x'^3 + A' * x' + B', where
  - A': 0x3f8731abdd661adca08a5558f0f5d272e953d363cb6f0e5d405447c01a444533
  - B': 1771
- iso\_map: the 3-isogeny map from E' to E given in {{appx-iso-secp256k1}}
- h\_eff: 1

secp256k1\_XMD:SHA-256\_SSWU\_NU\_ is identical to secp256k1\_XMD:SHA-256\_SSWU\_RO\_,
except that the encoding type is encode\_to\_curve ({{roadmap}}).

An optimized example implementation of the Simplified SWU mapping
to the curve E' isogenous to secp256k1 is given in {{straightline-sswu}}.

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
- f: Simplified SWU for AB == 0 ({{simple-swu-AB0}})
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
to the curve E' isogenous to BLS12-381 G1 is given in {{straightline-sswu}}.

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
- f: Simplified SWU for AB == 0 ({{simple-swu-AB0}})
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
to the curve E' isogenous to BLS12-381 G2 is given in {{straightline-sswu}}.

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
except that underscore (i.e., 0x5f) is not allowed.

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

    1. For expand\_message\_xof ({{hashtofield-expand-xof}}) with SHAKE128,
       HASH\_ID is "XOF:SHAKE128".

    2. For expand\_message\_xmd ({{hashtofield-expand-xmd}}) with SHA3-256,
       HASH\_ID is "XMD:SHA3-256".

  Suites that use an alternative hash\_to\_field function that meets the requirements
  in {{hashtofield-exteff}} MUST indicate this by appending a tag identifying that function
  to the HASH\_ID field, separated by a colon (":", ASCII 0x3A).

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
    version of a uniform encoding suite, while "RO:V02:FOO01:BAR17" might be
    used to indicate a variant of that suite.

# IANA considerations

This document has no IANA actions.

# Security considerations {#security-considerations}

{{domain-separation}} describes considerations related to domain separation.
See {{security-considerations-domain-separation}} for further discussion.

{{hashtofield}} describes considerations for uniformly hashing to field elements;
see {{security-considerations-hash-to-field}} and {{security-considerations-expand-xmd}}
for further discussion.

Each encoding type ({{roadmap}}) accepts an arbitrary byte string and maps
it to a point on the curve sampled from a distribution that depends on the
encoding type.
It is important to note that using a nonuniform encoding or directly
evaluating one of the mappings of {{mappings}} produces an output that is
easily distinguished from a uniformly random point.
Applications that use a nonuniform encoding SHOULD carefully analyze the security
implications of nonuniformity.
When the required encoding is not clear, applications SHOULD use a uniform
encoding.

Both encodings given in {{roadmap}} can output the identity element of the group G.
The probability that either encoding function outputs the identity element is
roughly 1/r for a random input, which is negligible for cryptographically useful
elliptic curves.
Further, it is computationally infeasible to find an input to either encoding function
whose corresponding output is the identity element.
(Both of these properties hold when the encoding functions are instantiated with a
hash\_to\_field function that follows all guidelines in {{hashtofield}}.)
Protocols that use these encoding functions SHOULD NOT add a special case
to detect and "fix" the identity element.

When the hash\_to\_curve function ({{roadmap}}) is instantiated with a
hash\_to\_field function that is indifferentiable from a random oracle
({{hashtofield}}), the resulting function is indifferentiable from a random
oracle ({{MRH04}}, {{BCIMRT10}}, {{FFSTV13}}, {{LBB19}}, {{H20}}).
In many cases such a function can be safely used in cryptographic protocols
whose security analysis assumes a random oracle that outputs uniformly random
points on an elliptic curve.
As Ristenpart et al. discuss in {{RSS11}}, however, not all security proofs
that rely on random oracles continue to hold when those oracles are replaced
by indifferentiable functionalities.
This limitation should be considered when analyzing the security of protocols
relying on the hash\_to\_curve function.

When hashing passwords using any function described in this document, an adversary
who learns the output of the hash function (or potentially any intermediate value,
e.g., the output of hash\_to\_field) may be able to carry out a dictionary attack.
To mitigate such attacks, it is recommended to first execute a more costly key
derivation function (e.g., PBKDF2 {{?RFC2898}}, scrypt {{?RFC7914}}, or Argon2
{{?I-D.irtf-cfrg-argon2}}) on the password, then hash the output of that
function to the target elliptic curve.
For collision resistance, the hash underlying the key derivation function
should be chosen according to the guidelines listed in {{hashtofield-expand-xmd}}.

Constant-time implementations of all functions in this document are STRONGLY
RECOMMENDED for all uses, to avoid leaking information via side channels.
It is especially important to use a constant-time implementation when inputs to
an encoding are secret values; in such cases, constant-time implementations
are REQUIRED for security against timing attacks (e.g., {{VR20}}).
When constant-time implementations are required, all basic operations and
utility functions must be implemented in constant time, as discussed in
{{utility}}.
In some applications (e.g., embedded systems), leakage through other side
channels (e.g., power or electromagnetic side channels) may be pertinent.
Defending against such leakage is outside the scope of this document, because
the nature of the leakage and the appropriate defense depend on the application.

## encode\_to\_curve: output distribution and indifferentiability {#security-considerations-encode}

The encode\_to\_curve function ({{roadmap}}) returns points sampled from a
distribution that is statistically far from uniform.
This distribution is bounded roughly as follows:
first, it includes at least one eighth of the points in G, and second, the
probability of points in the distribution varies by at most a factor of four.
These bounds hold when encode\_to\_curve is instantiated with any of the
map\_to\_curve functions in {{mappings}}.

The bounds above are derived from several works in the literature.
Specifically:

- Shallue and van de Woestijne {{SW06}} and Fouque and Tibouchi {{FT12}}
  derive bounds on the Shallue-van de Woestijne mapping ({{svdw}}).

- Fouque and Tibouchi {{FT10}} and Tibouchi {{T14}} derive bounds for the
  Simplified SWU mapping ({{simple-swu}}, {{simple-swu-AB0}}).

- Bernstein et al. {{BHKL13}} derive bounds for the Elligator 2 mapping
  ({{elligator2}}, {{ell2edwards}}).

Indifferentiability of encode\_to\_curve follows from an argument similar
to the one given by Brier et al. {{BCIMRT10}}; we briefly sketch.
Consider an ideal random oracle Hc() that samples from the distribution induced
by the map\_to\_curve function called by encode\_to\_curve, and assume for
simplicity that the target elliptic curve has cofactor 1 (a similar argument
applies for non-unity cofactors).
Indifferentiability holds just if it is possible to efficiently simulate
the "inner" random oracle in encode\_to\_curve, namely, hash\_to\_field.
The simulator works as follows:
on a fresh query msg, the simulator queries Hc(msg) and receives a point
P in the image of map\_to\_curve (if msg is the same as a prior query,
the simulator just returns the value it gave in response to that query).
The simulator then computes the possible preimages of P under map\_to\_curve,
i.e., elements u of F such that map\_to\_curve(u) == P
(Tibouchi {{T14}} shows that this can be done efficiently for the Shallue-van
de Woestijne and Simplified SWU maps, and Bernstein et al. show the same for
Elligator 2).
The simulator selects one such preimage at random and returns this value
as the simulated output of the "inner" random oracle.
By hypothesis, Hc() samples from the distribution induced by map\_to\_curve
on a uniformly random input element of F, so this value is uniformly random
and induces the correct point P when passed through map\_to\_curve.

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
In particular, expand\_message\_xmd computes b\_0 by prefixing the message
with one block of 0-bytes plus auxiliary information (length, counter, and DST).
Then, each of the output blocks b\_i, i >= 1 in expand\_message\_xmd is the
result of invoking H on a unique, prefix-free encoding of b\_0.
This is true, first, because the length of the input to all such invocations
is equal and fixed by the choice of H and DST, and
second, because each such input has a unique suffix (because of the inclusion
of the counter byte I2OSP(i, 1)).

The essential difference between the construction of {{CDMP05}} and
expand\_message\_xmd is that the latter hashes a counter appended to
strxor(b\_0, b\_(i - 1)) (step 10) rather than to b\_0.
This approach increases the Hamming distance between inputs to different
invocations of H, which reduces the likelihood that nonidealities in H
affect the distribution of the b\_i values.

We note that expand\_message\_xmd can be used to instantiate a general-purpose
indifferentiable functionality with variable-length output based on any hash
function meeting one of the above criteria.
Applications that use expand\_message\_xmd outside of hash\_to\_field should
ensure domain separation by picking a distinct value for DST.

## Domain separation recommendations {#security-considerations-domain-separation}

As discussed in {{term-domain-separation}}, the purpose of domain separation
is to ensure that security analyses of cryptographic protocols that query
multiple independent random oracles remain valid even if all of these random
oracles are instantiated based on one underlying function H.
The expand\_message variants in this document ({{hashtofield-expand}}) ensure
domain separation by appending a suffix-free-encoded domain separation tag
DST\_prime to all strings hashed by H, an underlying hash or extensible
output function.
(Other expand\_message variants that follow the guidelines in
{{hashtofield-expand-other}} are expected to behave similarly,
but these should be analyzed on a case-by-case basis.)
For security, applications that use the same function H outside of expand\_message
should enforce domain separation between those uses of H and expand\_message,
and should separate all of these from uses of H in other applications.

This section suggests four methods for enforcing domain separation
from expand\_message variants, explains how each method achieves domain
separation, and lists the situations in which each is appropriate.
These methods share a high-level structure: the application designer fixes a tag
DST\_ext distinct from DST\_prime and augments calls to H with DST\_ext.
Each method augments calls to H differently, and each may impose
additional requirements on DST\_ext.

These methods can be used to instantiate multiple domain separated functions
(e.g., H1 and H2) by selecting distinct DST\_ext values for each
(e.g., DST\_ext1, DST\_ext2).

1.  (Suffix-only domain separation.)
    This method is useful when domain separating invocations of H
    from expand\_message\_xmd or expand\_message\_xof.
    It is not appropriate for domain separating expand\_message from HMAC-H
    {{?RFC2104}}; for that purpose, see method 4.

    To instantiate a suffix-only domain separated function Hso, compute

        Hso(msg) = H(msg || DST_ext)

    DST\_ext should be suffix-free encoded (e.g., by appending one byte
    encoding the length of DST\_ext) to make it infeasible to find distinct
    (msg, DST\_ext) pairs that hash to the same value.

    This method ensures domain separation because all distinct invocations of
    H have distinct suffixes, since DST\_ext is distinct from DST\_prime.

2.  (Prefix-suffix domain separation.)
    This method can be used in the same cases as the suffix-only method.

    To instantiate a prefix-suffix domain separated function Hps, compute

        Hps(msg) = H(DST_ext || msg || I2OSP(0, 1))

    DST\_ext should be prefix-free encoded (e.g., by adding a one-byte prefix
    that encodes the length of DST\_ext) to make it infeasible to find distinct
    (msg, DST\_ext) pairs that hash to the same value.

    This method ensures domain separation because
    appending the byte I2OSP(0, 1) ensures that inputs to H inside Hps
    are distinct from those inside expand\_message.
    Specifically, the final byte of DST\_prime encodes the length of DST, which
    is required to be nonzero ({{domain-separation}}, requirement 2), and
    DST\_prime is always appended to invocations of H inside expand\_message.

3.  (Prefix-only domain separation.)
    This method is only useful for domain separating invocations of H
    from expand\_message\_xmd.
    It does not give domain separation for expand\_message\_xof or HMAC-H.

    To instantiate a prefix-only domain separated function Hpo, compute

        Hpo(msg) = H(DST_ext || msg)

    In order for this method to give domain separation, DST\_ext should
    be at least b bits long, where b is the number of bits output by the
    hash function H.
    In addition, at least one of the first b bits must be nonzero.
    Finally, DST\_ext should be prefix-free encoded (e.g., by adding a
    one-byte prefix that encodes the length of DST\_ext) to make it infeasible to
    find distinct (msg, DST\_ext) pairs that hash to the same value.

    This method ensures domain separation as follows.
    First, since DST\_ext contains at least one nonzero bit among its first b bits,
    it is guaranteed to be distinct from the value Z\_pad
    ({{hashtofield-expand-xmd}}, step 4), which ensures that all inputs to H
    are distinct from the input used to generate b\_0 in expand\_message\_xmd.
    Second, since DST\_ext is at least b bits long, it is almost certainly
    distinct from the values b\_0 and strxor(b\_0, b\_(i - 1)), and therefore
    all inputs to H are distinct from the inputs used to generate b\_i, i >= 1,
    with high probability.

4.  (XMD-HMAC domain separation.)
    This method is useful for domain separating invocations of H inside
    HMAC-H (i.e., HMAC {{?RFC2104}} instantiated with hash function H) from
    expand\_message\_xmd.
    It also applies to HKDF-H {{?RFC5869}}, as discussed below.

    Specifically, this method applies when HMAC-H is used with a non-secret
    key to instantiate a random oracle based on a hash function H
    (note that expand\_message\_xmd can also be used for this purpose; see
    {{security-considerations-expand-xmd}}).
    When using HMAC-H with a high-entropy secret key, domain separation is not
    necessary; see discussion below.

    To choose a non-secret HMAC key DST\_key that ensures domain separation
    from expand\_message\_xmd, compute

        DST_key_preimage = "DERIVE-HMAC-KEY-" || DST_ext || I2OSP(0, 1)
        DST_key = H(DST_key_preimage)

    Then, to instantiate the random oracle Hro using HMAC-H, compute

        Hro(msg) = HMAC-H(DST_key, msg)

    The trailing zero byte in DST\_key\_preimage ensures that this value
    is distinct from inputs to H inside expand\_message\_xmd (because all
    such inputs have suffix DST\_prime, which cannot end with a zero byte
    as discussed above).
    This ensures domain separation because, with overwhelming probability,
    all inputs to H inside of HMAC-H using key DST\_key have prefixes that
    are distinct from the values Z\_pad, b\_0, and strxor(b\_0, b\_(i - 1))
    inside of expand\_message\_xmd.

    For uses of HMAC-H that instantiate a private random oracle by fixing
    a high-entropy secret key, domain separation from expand\_message\_xmd
    is not necessary.
    This is because, similarly to the case above, all inputs to H inside
    HMAC-H using this secret key almost certainly have distinct prefixes
    from all inputs to H inside expand\_message\_xmd.

    Finally, this method can be used with HKDF-H {{?RFC5869}} by fixing
    the salt input to HKDF-Extract to DST\_key, computed as above.
    This ensures domain separation for HKDF-Extract by the same argument
    as for HMAC-H using DST\_key.
    Moreover, assuming that the IKM input to HKDF-Extract has sufficiently
    high entropy (say, commensurate with the security parameter), the
    HKDF-Expand step is domain separated by the same argument as for
    HMAC-H with a high-entropy secret key (since PRK is exactly that).

## Target security levels {#security-considerations-targets}

Each ciphersuite specifies a target security level (in bits) for the underlying
curve. This parameter ensures the corresponding hash\_to\_field instantiation is
conservative and correct. We stress that this parameter is only an upper bound on
the security level of the curve, and is neither a guarantee nor endorsement of its
suitability for a given application. Mathematical and cryptographic advancements
may reduce the effective security level for any curve.

# Acknowledgements

The authors would like to thank Adam Langley for his detailed writeup of Elligator 2 with
Curve25519 {{L13}};
Dan Boneh, Christopher Patton, Benjamin Lipp, and Leonid Reyzin for educational discussions; and
David Benjamin, Daniel Bourdrez, Frank Denis, Sean Devlin, Justin Drake, Bjoern Haase, Mike Hamburg,
Dan Harkins, Daira Hopwood, Thomas Icart, Andy Polyakov, Mamy Ratsimbazafy, Michael Scott,
Filippo Valsorda, and Mathy Vanhoef for helpful feedback.

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
pseudorandom number generator, then use the generator to produce a
value x in F.
If x is the x-coordinate of a point on the elliptic curve, output that
point. Otherwise, generate a new value x in F and try again.
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
curves {{!RFC7748}}. Bernstein et al. {{BLMP19}} extend the Elligator 2 map
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

# Hashing to ristretto255 {#appx-ristretto255}

ristretto255 {{I-D.irtf-cfrg-ristretto255-decaf448}} provides a prime-order
group based on Curve25519 {{!RFC7748}}.
This section describes hash\_to\_ristretto255, which implements a random-oracle
encoding to this group that has a uniform output distribution ({{term-rom}})
and the same security properties and interface as the hash\_to\_curve function
({{roadmap}}).

The ristretto255 API defines a one-way map ({{I-D.irtf-cfrg-ristretto255-decaf448}},
Section 4.3.4); this section refers to that map as ristretto255\_map.

The hash\_to\_ristretto255 function MUST be instantiated with an expand\_message
function that conforms to the requirements given in {{hashtofield-expand}}.
In addition, it MUST use a domain separation tag constructed as described
in {{domain-separation}}, and all domain separation recommendations given
in {{security-considerations-domain-separation}} apply when implementing
protocols that use hash\_to\_ristretto255.

~~~
hash_to_ristretto255(msg)

Parameters:
- DST, a domain separation tag (see discussion above).
- expand_message, a function that expands a byte string and
  domain separation tag into a uniformly random byte string
  (see discussion above).
- ristretto255_map, the one-way map from the ristretto255 API.

Input: msg, an arbitrary-length byte string.
Output: P, an element of the ristretto255 group.

Steps:
1. uniform_bytes = expand_message(msg, DST, 64)
2. P = ristretto255_map(uniform_bytes)
3. return P
~~~

Since hash\_to\_ristretto255 is not a hash-to-curve suite, it does not
have a Suite ID.
If a similar identifier is needed, it MUST be constructed following
the guidelines in {{suiteIDformat}}, with the following parameters:

- CURVE\_ID: "ristretto255"
- HASH\_ID: as described in {{suiteIDformat}}
- MAP\_ID: "R255MAP"
- ENC\_VAR: "RO"

For example, if expand\_message is expand\_message\_xmd using SHA-512, the
REQUIRED identifier is:

    ristretto255_XMD:SHA-512_R255MAP_RO_

# Hashing to decaf448 {#appx-decaf448}

Similar to ristretto255, decaf448 {{I-D.irtf-cfrg-ristretto255-decaf448}} provides
a prime-order group based on Curve448 {{!RFC7748}}.
This section describes hash\_to\_decaf448, which implements a random-oracle
encoding to this group that has a uniform output distribution ({{term-rom}})
and the same security properties and interface as the hash\_to\_curve function
({{roadmap}}).

The decaf448 API defines a one-way map ({{I-D.irtf-cfrg-ristretto255-decaf448}},
Section 5.3.4); this section refers to that map as decaf448\_map.

The hash\_to\_decaf448 function MUST be instantiated with an expand\_message
function that conforms to the requirements given in {{hashtofield-expand}}.
In addition, it MUST use a domain separation tag constructed as described
in {{domain-separation}}, and all domain separation recommendations given
in {{security-considerations-domain-separation}} apply when implementing
protocols that use hash\_to\_decaf448.

~~~
hash_to_decaf448(msg)

Parameters:
- DST, a domain separation tag (see discussion above).
- expand_message, a function that expands a byte string and
  domain separation tag into a uniformly random byte string
  (see discussion above).
- decaf448_map, the one-way map from the decaf448 API.

Input: msg, an arbitrary-length byte string.
Output: P, an element of the decaf448 group.

Steps:
1. uniform_bytes = expand_message(msg, DST, 112)
2. P = decaf448_map(uniform_bytes)
3. return P
~~~

Since hash\_to\_decaf448 is not a hash-to-curve suite, it does not
have a Suite ID. If a similar identifier is needed, it MUST be constructed
following the guidelines in {{suiteIDformat}}, with the following parameters:

- CURVE\_ID: "decaf448"
- HASH\_ID: as described in {{suiteIDformat}}
- MAP\_ID: "D448MAP"
- ENC\_VAR: "RO"

For example, if expand\_message is expand\_message\_xof using SHAKE256, the
REQUIRED identifier is:

    decaf448_XOF:SHAKE256_D448MAP_RO_

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
{{samplecode}} gives further implementations that are optimized for specific
classes of curves and fields.

## Shallue-van de Woestijne method {#straightline-svdw}

This section gives a straight-line implementation of the Shallue and van
de Woestijne method for any Weierstrass curve of the form given in
{{weierstrass}}.
See {{svdw}} for information on the constants used in this mapping.

Note that the constant c3 below MUST be chosen such that sgn0(c3) = 0.
In other words, if the square-root computation returns a value cx such that
sgn0(cx) = 1, set c3 = -cx; otherwise, set c3 = cx.

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
21.  e2 = is_square(gx2) AND NOT e1   # Avoid short-circuit logic ops
22.  x3 = tv2^2
23.  x3 = x3 * tv3
24.  x3 = x3^2
25.  x3 = x3 * c4
26.  x3 = x3 + Z
27.   x = CMOV(x3, x1, e1)   # x = x1 if gx1 is square, else x = x3
28.   x = CMOV(x, x2, e2)    # x = x2 if gx2 is square and gx1 is not
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

This optimized, straight-line procedure applies to any base field.
The sqrt_ratio subroutine is defined in {{straightline-sswu-sqrt-ratio}}.

~~~
map_to_curve_simple_swu(u)

Input: u, an element of F.
Output: (x, y), a point on E.

Steps:
1.  tv1 = u^2
2.  tv1 = Z * tv1
3.  tv2 = tv1^2
4.  tv2 = tv2 + tv1
5.  tv3 = tv2 + 1
6.  tv3 = B * tv3
7.  tv4 = CMOV(Z, -tv2, tv2 != 0)
8.  tv4 = A * tv4
9.  tv2 = tv3^2
10. tv6 = tv4^2
11. tv5 = A * tv6
12. tv2 = tv2 + tv5
13. tv2 = tv2 * tv3
14. tv6 = tv6 * tv4
15. tv5 = B * tv6
16. tv2 = tv2 + tv5
17.   x = tv1 * tv3
18. (is_gx1_square, y1) = sqrt_ratio(tv2, tv6)
19.   y = tv1 * u
20.   y = y * y1
21.   x = CMOV(x, tv3, is_gx1_square)
22.   y = CMOV(y, y1, is_gx1_square)
23.  e1 = sgn0(u) == sgn0(y)
24.   y = CMOV(-y, y, e1)
25.   x = x / tv4
26. return (x, y)
~~~

### sqrt_ratio subroutines {#straightline-sswu-sqrt-ratio}

This section defines three variants of the sqrt_ratio subroutine used by the
above procedure.
The first variant can be used with any field; the others are optimized versions
for specific fields.

The routines given in this section depend on the constant Z from the simplified SWU map.
For correctness, sqrt_ratio and map_to_curve_simple_swu MUST use the same value for Z.

#### sqrt_ratio for any field

~~~
sqrt_ratio(u, v)

Parameters:
- F, a finite field of characteristic p and order q = p^m.
- Z, the constant from the simplified SWU map.

Input: u and v, elements of F, where v != 0.
Output: (b, y), where
  b = True and y = sqrt(u / v) if (u / v) is square in F, and
  b = False and y = sqrt(Z * (u / v)) otherwise.

Constants:
1. c1, the largest integer such that 2^c1 divides q - 1.
2. c2 = (q - 1) / (2^c1)        # Integer arithmetic
3. c3 = (c2 - 1) / 2            # Integer arithmetic
4. c4 = 2^c1 - 1                # Integer arithmetic
5. c5 = 2^(c1 - 1)              # Integer arithmetic
6. c6 = Z^c2
7. c7 = Z^((c2 + 1) / 2)

Procedure:
1. tv1 = c6
2. tv2 = v^c4
3. tv3 = tv2^2
4. tv3 = tv3 * v
5. tv5 = u * tv3
6. tv5 = tv5^c3
7. tv5 = tv5 * tv2
8. tv2 = tv5 * v
9. tv3 = tv5 * u
10. tv4 = tv3 * tv2
11. tv5 = tv4^c5
12. isQR = tv5 == 1
13. tv2 = tv3 * c7
14. tv5 = tv4 * tv1
15. tv3 = CMOV(tv2, tv3, isQR)
16. tv4 = CMOV(tv5, tv4, isQR)
17. for i in (c1, c1 - 1, ..., 2):
18.    tv5 = i - 2
19.    tv5 = 2^tv5
20.    tv5 = tv4^tv5
21.    e1 = tv5 == 1
22.    tv2 = tv3 * tv1
23.    tv1 = tv1 * tv1
24.    tv5 = tv4 * tv1
25.    tv3 = CMOV(tv2, tv3, e1)
26.    tv4 = CMOV(tv5, tv4, e1)
27. return (isQR, tv3)
~~~

#### optimized sqrt_ratio for q = 3 mod 4

~~~
sqrt_ratio_3mod4(u, v)

Parameters:
- F, a finite field of characteristic p and order q = p^m,
  where q = 3 mod 4.
- Z, the constant from the simplified SWU map.

Input: u and v, elements of F, where v != 0.
Output: (b, y), where
  b = True and y = sqrt(u / v) if (u / v) is square in F, and
  b = False and y = sqrt(Z * (u / v)) otherwise.

Constants:
1. c1 = (q - 3) / 4     # Integer arithmetic
2. c2 = sqrt(-Z)

Procedure:
1. tv1 = v^2
2. tv2 = u * v
3. tv1 = tv1 * tv2
4. y1 = tv1^c1
5. y1 = y1 * tv2
6. y2 = y1 * c2
7. tv3 = y1^2
8. tv3 = tv3 * v
9. isQR = tv3 == u
10. y = CMOV(y2, y1, isQR)
11. return (isQR, y)
~~~

#### optimized sqrt_ratio for q = 5 mod 8

~~~
sqrt_ratio_5mod8(u, v)

Parameters:
- F, a finite field of characteristic p and order q = p^m,
  where q = 5 mod 8.
- Z, the constant from the simplified SWU map.

Input: u and v, elements of F, where v != 0.
Output: (b, y), where
  b = True and y = sqrt(u / v) if (u / v) is square in F, and
  b = False and y = sqrt(Z * (u / v)) otherwise.

Constants:
1. c1 = (q - 5) / 8
2. c2 = sqrt(-1)
3. c3 = sqrt(Z / c2)

Steps:
1. tv1 = v^2
2. tv2 = tv1 * v
3. tv1 = tv1^2
4. tv2 = tv2 * u
5. tv1 = tv1 * tv2
6. y1 = tv1^c1
7. y1 = y1 * tv2
8. tv1 = y1 * c2
9. tv2 = tv1^2
10. tv2 = tv2 * v
11. e1 = tv2 == u
12. y1 = CMOV(y1, tv1, e1)
13. tv2 = y1^2
14. tv2 = tv2 * v
15. isQR = tv2 == u
16. y2 = y1 * c3
17. tv1 = y2 * c2
18. tv2 = tv1^2
19. tv2 = tv2 * v
20. tv3 = Z * u
21. e2 = tv2 == tv3
22. y2 = CMOV(y2, tv1, e2)
23. y = CMOV(y2, y1, isQR)
24. return (isQR, y)
~~~

## Elligator 2 method {#straightline-ell2}

This section gives a straight-line implementation of the Elligator 2
method for any Montgomery curve of the form given in {{montgomery}}.
See {{elligator2}} for information on the constants used in this mapping.

{{ell2-opt}} gives optimized straight-line procedures that apply to specific
classes of curves and base fields, including curve25519 and curve448 {{!RFC7748}}.

~~~
map_to_curve_elligator2(u)

Input: u, an element of F.
Output: (s, t), a point on M.

Constants:
1.   c1 = J / K
2.   c2 = 1 / K^2

Steps:
1.  tv1 = u^2
2.  tv1 = Z * tv1            # Z * u^2
3.   e1 = tv1 == -1          # exceptional case: Z * u^2 == -1
4.  tv1 = CMOV(tv1, 0, e1)   # if tv1 == -1, set tv1 = 0
5.   x1 = tv1 + 1
6.   x1 = inv0(x1)
7.   x1 = -c1 * x1           # x1 = -(J / K) / (1 + Z * u^2)
8.  gx1 = x1 + c1
9.  gx1 = gx1 * x1
10. gx1 = gx1 + c2
11. gx1 = gx1 * x1           # gx1 = x1^3 + (J / K) * x1^2 + x1 / K^2
12.  x2 = -x1 - c1
13. gx2 = tv1 * gx1
14.  e2 = is_square(gx1)     # If is_square(gx1)
15.   x = CMOV(x2, x1, e2)   #   then  x = x1,  else  x = x2
16.  y2 = CMOV(gx2, gx1, e2) #   then y2 = gx1, else y2 = gx2
17.   y = sqrt(y2)
18.  e3 = sgn0(y) == 1
19.   y = CMOV(y, -y, e2 XOR e3)    # fix sign of y
20.   s = x * K
21.   t = y * K
22. return (s, t)
~~~

# Curve-specific optimized sample code {#samplecode}

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

The resulting affine point (x, y) is given by (xn / xd, yn / yd).

The reason for this modified interface is that it enables further
optimizations when working with points in a projective coordinate
system.
This is desirable, for example, when the resulting point will be
immediately multiplied by a scalar, since most scalar multiplication
algorithms operate on projective points.

Projective coordinates are also useful when implementing random oracle
encodings ({{roadmap}}).
One reason is that, in general, point addition is faster using projective
coordinates.
Another reason is that, for Weierstrass curves, projective coordinates
allow using complete addition formulas {{RCB16}}.
This is especially convenient when implementing a constant-time encoding,
because it eliminates the need for a special case when Q0 == Q1, which
incomplete addition formulas usually do not handle.

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

## Elligator 2 {#ell2-opt}

### curve25519 (q = 5 (mod 8), K = 1) {#map-to-curve25519}

The following is a straight-line implementation of Elligator 2
for curve25519 {{!RFC7748}} as specified in {{suites-25519}}.

This implementation can also be used for any Montgomery curve
with K = 1 over GF(q) where q = 5 (mod 8).

~~~
map_to_curve_elligator2_curve25519(u)

Input: u, an element of F.
Output: (xn, xd, yn, yd) such that (xn / xd, yn / yd) is a
        point on curve25519.

Constants:
1. c1 = (q + 3) / 8       # Integer arithmetic
2. c2 = 2^c1
3. c3 = sqrt(-1)
4. c4 = (q - 5) / 8       # Integer arithmetic

Steps:
1.  tv1 = u^2
2.  tv1 = 2 * tv1
3.   xd = tv1 + 1         # Nonzero: -1 is square (mod p), tv1 is not
4.  x1n = -J              # x1 = x1n / xd = -J / (1 + 2 * u^2)
5.  tv2 = xd^2
6.  gxd = tv2 * xd        # gxd = xd^3
7.  gx1 = J * tv1         # x1n + J * xd
8.  gx1 = gx1 * x1n       # x1n^2 + J * x1n * xd
9.  gx1 = gx1 + tv2       # x1n^2 + J * x1n * xd + xd^2
10. gx1 = gx1 * x1n       # x1n^3 + J * x1n^2 * xd + x1n * xd^2
11. tv3 = gxd^2
12. tv2 = tv3^2           # gxd^4
13. tv3 = tv3 * gxd       # gxd^3
14. tv3 = tv3 * gx1       # gx1 * gxd^3
15. tv2 = tv2 * tv3       # gx1 * gxd^7
16. y11 = tv2^c4          # (gx1 * gxd^7)^((p - 5) / 8)
17. y11 = y11 * tv3       # gx1 * gxd^3 * (gx1 * gxd^7)^((p - 5) / 8)
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
for edwards25519 {{!RFC7748}} as specified in {{suites-25519}}.
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
1. c1 = sqrt(-486664) # sgn0(c1) MUST equal 0

Steps:
1.  (xMn, xMd, yMn, yMd) = map_to_curve_elligator2_curve25519(u)
2.  xn = xMn * yMd
3.  xn = xn * c1
4.  xd = xMd * yMn    # xn / xd = c1 * xM / yM
5.  yn = xMn - xMd
6.  yd = xMn + xMd    # (n / d - 1) / (n / d + 1) = (n - d) / (n + d)
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
for curve448 {{!RFC7748}} as specified in {{suites-448}}.

This implementation can also be used for any Montgomery curve
with K = 1 over GF(q) where q = 3 (mod 4).

~~~
map_to_curve_elligator2_curve448(u)

Input: u, an element of F.
Output: (xn, xd, yn, yd) such that (xn / xd, yn / yd) is a
        point on curve448.

Constants:
1. c1 = (q - 3) / 4         # Integer arithmetic

Steps:
1.  tv1 = u^2
2.   e1 = tv1 == 1
3.  tv1 = CMOV(tv1, 0, e1)  # If Z * u^2 == -1, set tv1 = 0
4.   xd = 1 - tv1
5.  x1n = -J
6.  tv2 = xd^2
7.  gxd = tv2 * xd          # gxd = xd^3
8.  gx1 = -J * tv1          # x1n + J * xd
9.  gx1 = gx1 * x1n         # x1n^2 + J * x1n * xd
10. gx1 = gx1 + tv2         # x1n^2 + J * x1n * xd + xd^2
11. gx1 = gx1 * x1n         # x1n^3 + J * x1n^2 * xd + x1n * xd^2
12. tv3 = gxd^2
13. tv2 = gx1 * gxd         # gx1 * gxd
14. tv3 = tv3 * tv2         # gx1 * gxd^3
15.  y1 = tv3^c1            # (gx1 * gxd^3)^((p - 3) / 4)
16.  y1 = y1 * tv2          # gx1 * gxd * (gx1 * gxd^3)^((p - 3) / 4)
17. x2n = -tv1 * x1n        # x2 = x2n / xd = -1 * u^2 * x1n / xd
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
for edwards448 {{!RFC7748}} as specified in {{suites-448}}.
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
1. c1 = (q - 3) / 4        # Integer arithmetic
2. c2 = K^2

Steps:
1.  tv1 = u^2
2.   e1 = tv1 == 1
3.  tv1 = CMOV(tv1, 0, e1) # If Z * u^2 == -1, set tv1 = 0
4.   xd = 1 - tv1
5.   xd = xd * K
6.  x1n = -J          # x1 = x1n / xd = -J / (K * (1 + 2 * u^2))
7.  tv2 = xd^2
8.  gxd = tv2 * xd
9.  gxd = gxd * c2    # gxd = xd^3 * K^2
10. gx1 = x1n * K
11. tv3 = xd * J
12. tv3 = gx1 + tv3   # x1n * K + xd * J
13. gx1 = gx1 * tv3   # K^2 * x1n^2 + J * K * x1n * xd
14. gx1 = gx1 + tv2   # K^2 * x1n^2 + J * K * x1n * xd + xd^2
15. gx1 = gx1 * x1n   # K^2 * x1n^3 + J * K * x1n^2 * xd + x1n * xd^2
16. tv3 = gxd^2
17. tv2 = gx1 * gxd   # gx1 * gxd
18. tv3 = tv3 * tv2   # gx1 * gxd^3
19.  y1 = tv3^c1      # (gx1 * gxd^3)^((q - 3) / 4)
20.  y1 = y1 * tv2    # gx1 * gxd * (gx1 * gxd^3)^((q - 3) / 4)
21. x2n = -tv1 * x1n  # x2 = x2n / xd = -1 * u^2 * x1n / xd
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
3.   xd = tv1 + 1     # Nonzero: -1 is square (mod p), tv1 is not
4.   xd = xd * K
5.  x1n = -J          # x1 = x1n / xd = -J / (K * (1 + 2 * u^2))
6.  tv2 = xd^2
7.  gxd = tv2 * xd
8.  gxd = gxd * c5    # gxd = xd^3 * K^2
9.  gx1 = x1n * K
10. tv3 = xd * J
11. tv3 = gx1 + tv3   # x1n * K + xd * J
12. gx1 = gx1 * tv3   # K^2 * x1n^2 + J * K * x1n * xd
13. gx1 = gx1 + tv2   # K^2 * x1n^2 + J * K * x1n * xd + xd^2
14. gx1 = gx1 * x1n   # K^2 * x1n^3 + J * K * x1n^2 * xd + x1n * xd^2
15. tv3 = gxd^2
16. tv2 = tv3^2       # gxd^4
17. tv3 = tv3 * gxd   # gxd^3
18. tv3 = tv3 * gx1   # gx1 * gxd^3
19. tv2 = tv2 * tv3   # gx1 * gxd^7
20. y11 = tv2^c4      # (gx1 * gxd^7)^((q - 5) / 8)
21. y11 = y11 * tv3   # gx1 * gxd^3 * (gx1 * gxd^7)^((q - 5) / 8)
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
# - A and B, the coefficients of the curve y^2 = x^3 + A * x + B
def find_z_svdw(F, A, B, init_ctr=1):
    g = lambda x: F(x)^3 + F(A) * F(x) + F(B)
    h = lambda Z: -(F(3) * Z^2 + F(4) * A) / (F(4) * g(Z))
    # NOTE: if init_ctr=1 fails to find Z, try setting it to F.gen()
    ctr = init_ctr
    while True:
        for Z_cand in (F(ctr), F(-ctr)):
            # Criterion 1:
            #   g(Z) != 0 in F.
            if g(Z_cand) == F(0):
                continue
            # Criterion 2:
            #   -(3 * Z^2 + 4 * A) / (4 * g(Z)) != 0 in F.
            if h(Z_cand) == F(0):
                continue
            # Criterion 3:
            #   -(3 * Z^2 + 4 * A) / (4 * g(Z)) is square in F.
            if not is_square(h(Z_cand)):
                continue
            # Criterion 4:
            #   At least one of g(Z) and g(-Z / 2) is square in F.
            if is_square(g(Z_cand)) or is_square(g(-Z_cand / F(2))):
                return Z_cand
        ctr += 1
~~~

## Finding Z for Simplified SWU {#sswu-z-code}

The below function outputs an appropriate Z for the Simplified SWU map ({{simple-swu}}).

~~~sage
# Arguments:
# - F, a field object, e.g., F = GF(2^521 - 1)
# - A and B, the coefficients of the curve y^2 = x^3 + A * x + B
def find_z_sswu(F, A, B):
    R.<xx> = F[]                       # Polynomial ring over F
    g = xx^3 + F(A) * xx + F(B)        # y^2 = g(x) = x^3 + A * x + B
    ctr = F.gen()
    while True:
        for Z_cand in (F(ctr), F(-ctr)):
            # Criterion 1: Z is non-square in F.
            if is_square(Z_cand):
                continue
            # Criterion 2: Z != -1 in F.
            if Z_cand == F(-1):
                continue
            # Criterion 3: g(x) - Z is irreducible over F.
            if not (g - Z_cand).is_irreducible():
                continue
            # Criterion 4: g(B / (Z * A)) is square in F.
            if is_square(g(B / (Z_cand * A))):
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
            # Z must be a non-square in F.
            if is_square(Z_cand):
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
2.  t = z * z
3.  t = t * x
4.  z = z * x
5.  b = t
6.  c = c5
7.  for i in (c1, c1 - 1, ..., 2):
8.      for j in (1, 2, ..., i - 2):
9.           b = b * b
10.     e = b == 1
11.     zt = z * c
12.     z = CMOV(zt, z, e)
13.     c = c * c
14.     tt = t * c
15.     t = CMOV(tt, t, e)
16.     b = t
17. return z
~~~

## is\_square for F = GF(p^2) {#appx-sqrt-issq}

The following is\_square method applies to any field F = GF(p^2)
with basis (1, I) represented as described in {{bg-curves}}, i.e.,
an element x = (x\_1, x\_2) = x\_1 + x\_2 * I.

Other optimizations of this type are possible in other extension
fields; see, e.g., {{AR13}} for more information.

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



# Suite test vectors {#testvectors}

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
dst     = QUUX-V01-CS02-with-P256_XMD:SHA-256_SSWU_RO_-

msg     = 
P.x     = 2192ab7089e70b22ad14ed77c0ce6e8678ca7a878b9d49dc9feaba
          dead1e56d0
P.y     = 4ed1ab230c162c3ce9afb8681716fb7b4a600b027f3fefb4974d20
          7ed94ff8c8
u[0]    = 6a87329bb91d3d1407a2bd8cbe8e1f1dd41c7af4fa98228d4dae69
          278ff8110d
u[1]    = b10803700b9f899d9c8407875cb9a606fa2abfdcb43c1be6ccc9fd
          35834618c3
Q0.x    = d7ff69180f1ac7a0d5f2bc21afe811d3a853a4b97cd879afb0e37b
          79fe5ca2b4
Q0.y    = 32410e8945aaafdbf7db6ed4b11b8c43a3a4bb8aa5aca766b0d177
          ac3a7acd0d
Q1.x    = df75e0668c5e671c86e30d0b2e9c649a5f1a387f8a8e2ffa86a9d8
          bceb5d4496
Q1.y    = 73244a3aea239d3239c32e3a738ca913e661928722f3cc1b947f19
          3efbf8c48b

msg     = abc
P.x     = abf433905743356a28ea3e425fef2085c70cb6664e0e26bdac4120
          88118cfb7d
P.y     = f1975e5f32702558d07f04e863f23fa8ae0172c033d05fa38b53fe
          c0c2787dca
u[0]    = 4832cc52ea389032472a92525401c69b4be761e91f79f3cdeac94c
          35902f1060
u[1]    = bb2f445cf70f3dffd0589e1cb1a2aed4ca46df06bdbfe3a2db495b
          37ab601807
Q0.x    = 5587402be67216fceebef433b92c6b9c41eac0fd0586cebb187548
          605d247804
Q0.y    = 53a023b747f68d72ada8fbee4b6f29e3460dcb2631fabaa8dd0aa4
          80d6fae9f6
Q1.x    = 676991b1b82c3638ecd26415924c4f2bffa65435a3ca093d673641
          b6c6bf7763
Q1.y    = 2a97c58d547b6c21a374d393a88848c641b5d8dd336e9ac77da2d3
          bcbf9b77db

msg     = abcdef0123456789
P.x     = 4371106eb5fe75b392f0a1bd4961f41c6e5ad2d7de7e7bc09f8f78
          d4f7bff0af
P.y     = 88fa1183fd9c14812ffe0e3c41fd25a638c8c05b9debcef4391dcd
          354517274e
u[0]    = a0f6256416be7a5371547baf44fa7d3f8ebb15129bc7c806cff9c7
          b4a66f81b0
u[1]    = a316017a9dd7c77b0cf0db0b04f940e8a0ee51c59d2b66fff620eb
          f621a35c3f
Q0.x    = 810fb0ba51009dbd880bd771cccb74d4c12ce94694f4193c7bc98c
          2c6c0a8f2c
Q0.y    = 9eacc5e076ff6a06d28f5125c879957a8067097f31ac94c449023a
          64000f6982
Q1.x    = 9e703c2d820d414e8c4c4fd04b23544ee6bd90dad92e385d78710b
          15ab3ec77c
Q1.y    = ad1c4ef8823577a4aec7f14dd5c2366f8ee9a11fa7b9440bebfe80
          e1d0539571

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 30d2e5c5e891f930ba3fe1ffd9fce9e3a11fd1b1a59b19bab834d1
          6f74f88e4a
P.y     = 85689855b8cf7e78326373c4a148301bb1dc0f71b7e68f7db06686
          b11d9ea47b
u[0]    = 839439a48070a2355e96f3a5b594af9f9125329124cb0446255c32
          43c13dc948
u[1]    = e664b2ce95b6379713cef294db65baefb949abe9b39fec59610786
          3c4bb45305
Q0.x    = c5c1daa359a5f8ab231f27d649900e4b39f229520dd2bcfd9e1a8f
          3d0534643b
Q0.y    = 6db72978ef430a6d7ab67f7459f8f01c2af7e3b49a35fe593d2a53
          4a3bd6d6f2
Q1.x    = 7ed97bad8717b3514846c8f97b4b977a7361a277064cc9e5e4428a
          6eaf7b6f6c
Q1.y    = 324433bb97015b30dfb5f67df5788f699abb806e4e973d70adbf2d
          99c9f09859

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
P.x     = 341dc4491302755882bcd272e1f1b74e1e531f7b5cf5ef26765238
          ec13267e32
P.y     = 955107374ccefa0fece9ed3fd352bf6cdee16d9e8eea865fd67010
          71522956b4
u[0]    = d1e1d7373515fbbcc8f8e89893dae94883c85c91c45bd873004bc6
          4aebc509cc
u[1]    = 4bc1458ae52820fd80ad062919d979247d196a97b06568611f5bb4
          74639fdcf4
Q0.x    = 3b20b9d8bd7b17395728111b54e133d99aa4ba99e3d36d5070c1ca
          6360261278
Q0.y    = 180e58a9286f9434f610302741f4e734289429ae76bab89c451368
          fb63d1707c
Q1.x    = f9505b59ea14087ca4b50eb13b9b43ed2a3c5e8fc3b046a7c14c96
          01f4f01e6c
Q1.y    = 8038feb8ffdfda879368f9e2da57fb4abb62a2d18274de299a8fee
          1cfd302486
~~~

### P256\_XMD:SHA-256\_SSWU\_NU\_

~~~
suite   = P256_XMD:SHA-256_SSWU_NU_
dst     = QUUX-V01-CS02-with-P256_XMD:SHA-256_SSWU_NU_-

msg     = 
P.x     = a404e70e566650f57a1e240e5fdd6217e5140f3850296c589b9bb4
          8f9e4c7b07
P.y     = 369dde2c6e91a19764272c3c71fa430e1f10b5b0485c27c4654ec5
          d03eb9cff0
u[0]    = f863b1e2c269cd7d77420343ba99226079b1ca233c95a9a75a35ca
          622f9e49f4
Q.x     = a404e70e566650f57a1e240e5fdd6217e5140f3850296c589b9bb4
          8f9e4c7b07
Q.y     = 369dde2c6e91a19764272c3c71fa430e1f10b5b0485c27c4654ec5
          d03eb9cff0

msg     = abc
P.x     = dd392891435f346ec210b50321dc52a157ff65ca66885930955a7a
          84b778d37a
P.y     = e2f1639b0c8bcb4350681c7b592da35bc0e1e6cae6353665a49f13
          e3e77799c6
u[0]    = 3aac457d0c983f198eb3528ff0b556cd50cf3db94871be6c6b8cca
          42e0453054
Q.x     = dd392891435f346ec210b50321dc52a157ff65ca66885930955a7a
          84b778d37a
Q.y     = e2f1639b0c8bcb4350681c7b592da35bc0e1e6cae6353665a49f13
          e3e77799c6

msg     = abcdef0123456789
P.x     = 492b8e1ac9c25467ecc89688a9e4ef2f47b49e0bbcfdf7310ddbb2
          83a617a627
P.y     = 89f7e7b986e151e2d9146b7eeb3bc3da24a4b27cdad2430555d300
          49891b5fef
u[0]    = 22352c49723d9bd2a7c2ae3f557e8e67e59459417c48839944359a
          0646dc8219
Q.x     = 492b8e1ac9c25467ecc89688a9e4ef2f47b49e0bbcfdf7310ddbb2
          83a617a627
Q.y     = 89f7e7b986e151e2d9146b7eeb3bc3da24a4b27cdad2430555d300
          49891b5fef

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 3582415f59774e5d4e0f5ba9c07ab0206192c52ff7c931a7394706
          2fe5908d56
P.y     = fc50f9d9e07d1866f6fde7154986173a733da9ba5432ab87eac45a
          64d812e622
u[0]    = 06e959844f317c4983d50b42154ec3965441094c2e92008b046510
          4cc7f189c8
Q.x     = 3582415f59774e5d4e0f5ba9c07ab0206192c52ff7c931a7394706
          2fe5908d56
Q.y     = fc50f9d9e07d1866f6fde7154986173a733da9ba5432ab87eac45a
          64d812e622

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
P.x     = e040a663acc9e2f408feedd0a8df077c2bb42696df08ea1eba6afd
          3fffd6b628
P.y     = cfbd7f7c0bba6c65b600cf299b7ae8e5bb2bab5cfe80d0c9ab113e
          1e5f27d8aa
u[0]    = a0081cd0c81e9fdef4f46586e8041ec19b303d6fccf1b57c48737b
          59aaeae2de
Q.x     = e040a663acc9e2f408feedd0a8df077c2bb42696df08ea1eba6afd
          3fffd6b628
Q.y     = cfbd7f7c0bba6c65b600cf299b7ae8e5bb2bab5cfe80d0c9ab113e
          1e5f27d8aa
~~~

## NIST P-384

### P384\_XMD:SHA-384\_SSWU\_RO\_

~~~
suite   = P384_XMD:SHA-384_SSWU_RO_
dst     = QUUX-V01-CS02-with-P384_XMD:SHA-384_SSWU_RO_-

msg     = 
P.x     = 1a62e440ccce7e5d2d596efad87ca4efd761981cc48e8abcbd9fd0
          95653af0853d920b0679417c1b54d1a29d6ac23321
P.y     = 153066d9acedd9ef0bd13b7f8a5bf28eb000c057902cfd8448a72f
          284e9bf6b5efd47df5f26907d9fb4267b54d132a86
u[0]    = 1c6fcba37e868df39866fae4708ceaeadf0a891a4a44823ff6db8e
          a45d7a5295a6aab2d805c6684175a30129b0ea44ab
u[1]    = 81a2a74c79c84206a71a96b81d96ac60778a46ad9726898fe62506
          04f074fd1de90ca1720571eb90400e5aeadfd49c07
Q0.x    = cc6f17a0c0b7fe36d847ac126ca5feb04ad9eca6637899e834b6b6
          27bacf0c298fee78f7d34b48aaf6aca379604832e7
Q0.y    = 648c887fa4db378e4325b1184213dc5448dd4be9c629eb7eb5bbcd
          784100cadce5b5d4cf0ac024e352cab57b84f36003
Q1.x    = cf3ba0923bd780d181ea074ebcfaa560cf6586df57dcefde306cf3
          e930914a3c007b9ce7547fd012423dac0e4c5da13a
Q1.y    = 86b8ae996da5ad0a8078349f18eacbd5c11359000232461d9b9ba1
          68ccdac5b67db0b64fbece246f9bb0d27ade287a11

msg     = abc
P.x     = 929766f12a828188bc7b1aaf0fc9a080c0d497ca07f4908527cb95
          30d7623a11c0afd484297ca2ec5d3ab7b516e10089
P.y     = 9b68be809e730a1acb4ef79e1249aa6c4450681d310ae1b12301ca
          607342b8a779fd39949899f30d93436df9c4231b34
u[0]    = d602430b23486a629497fa23f96eb0199e78da79758cf474ab2a13
          1a7e7691459dd57e526f1569ab1c3e42fd1637e82d
u[1]    = 3f56739d7020d05235b8f7961e1ddc0e9eca41e2b090abed2cc1eb
          4f10986bdd132edeaac0b3672c367e61e17d176694
Q0.x    = e17902afd14cae6dec42e27d2e86bf2db9a80b53a2d41165704c99
          651d5a46033b904963653420b338eb625d84d508e7
Q0.y    = da50390a0a093eb79cb1c173e11d90aa47ba0831d06fca7d552f9d
          424721658181a44ec78a4f8f0bb254b3e28a460b1b
Q1.x    = 0473effba43b7b39f454ee7b13fefd67fb9687982e80491523c5a2
          3024b1e7fd398f77725b8e06d6c7df36a1ab4af77f
Q1.y    = 9e1bd63b6885d2dd30b5cd483071ac55d497ccb35876209c15dfaa
          d0b40036d6ea3b49142b57f00350b8d69ca8b86318

msg     = abcdef0123456789
P.x     = e2a1217eabd29ad730110899a34cfca42b0232c20e3ef228031854
          b81f61080c83cc2f3c4abe74338d8b28ad1a7303bb
P.y     = 549869060197674cbed53b6099aee4588acf4eafb0bec71e4d9422
          83595e7359662248184446f3c1cac4d327a68500bb
u[0]    = 995184a160ace8e6db1a98c4b38a8a05748ee76fc58526041b6170
          dc8c63758f96652359894003ad416d1c45bb773f85
u[1]    = 19b86674197b78641c6c49575dfd9586620f15bd292ea6f3a3b1aa
          eca66484132db504e2a7fee56ebcdfea1358da6052
Q0.x    = d8a9accdf163c2476f350d7870a6a8d1773d58f58bac25220a558e
          92c2a67aa43082ac78b1c48b30175f7627abbbff63
Q0.y    = 39ea1adc2588a01aff87f7b9b685bad0fc6618a2dce5239c1b2af9
          5921cf20d6a116fe8bb87c6079e33d322e7baaa6af
Q1.x    = 61ad8df2081e8a78bf6abcc41dc880708b8060f7696049b9413f61
          f8b620a7e7fbbb54a89d437055932de52b0800ff96
Q1.y    = 6df8543da61f3f11a5720fe84660ec91b1bee11d18fbb2e6a58ea8
          7299b20059258647e5c98c023a55a8fddb4967f8b6

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 79d81d530e1be68aaa2cd921f28c34859aa735583a3dde20f8e306
          8468cbf0d4650380b7cfba12d166cf893e32cfc350
P.y     = bfb533d2a0616d38fe65082957d9c655479b210e9356e52bb453b3
          64ada22b5615e084bf96eb9b32db74c4bf2df85c89
u[0]    = c31c23b84c36eebdc8a13d5c75bbd744d062328e5505b3c1afa390
          4b242bce0c4d1a976d2a6c47e89e69610356ff278a
u[1]    = 1f3726caef959dc96d1a501a17c8141086d32619c65571152a598d
          02bf96ef79b1710a20e33e3cf6a14b6b047ebac818
Q0.x    = 12c243192789c32a8e665ba29a74e6f7c38d694e867b6945854d85
          109f7739d91db73533060ee70d2283db70446a0405
Q0.y    = 42fa1ea78bc56cd4717a2d333eff565c89a0b4b3a56df204846276
          f9f38ab43c42095f55187fc837094d6e42bfee22ac
Q1.x    = 3c04d9789b6ada51bddcf1b1776a4ff01b63936d82c1cdde533450
          788ddd5a2ef9f04d3957865c970a3c09a817b854f0
Q1.y    = cab66659c423fef6d8d14cf519e88fb9e4138a6deb9fcdceab2d6d
          ed549c3b4582159701424d55228b273f78050c8f4e

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
P.x     = 6b1737fd8a5dfc6917bbe13242854ffbf69dd8749a660bed45a436
          01aa99ecba0f43e72ee1d1f21c2a51ba02e1e87fea
P.y     = aa0bce31e6e456f6a014d7a7cbf2792cb4356e1e2e7e909ca3098f
          bf062d4f00cbf7e62aeb4d02d20d94271aa3a00d10
u[0]    = aaaf9b647d4081f344caa9ca32aa41971ff7946af4f9f0af1426a7
          6150c56306a728fe7b15af61da93cf994ef407a11f
u[1]    = f114aa8edf17b73f4cb70a4b11b696c905ab99e9fb0685e5d1acbf
          e64abc7103ccdf245f400729030a2bd7e34d906b0b
Q0.x    = 1dba81f06d6693d353aaeaa5d8fad76560f73e5371b1f7c93f8ce8
          77279cb7006c5f975f268f8042e4b71f8196ff8bc0
Q0.y    = c09d8b19e1f76d2db51e5a9fdd828dbce1532b31af80919f591e42
          689e9541800af8b06e8fac374547d8f09feae263d7
Q1.x    = 74f048c5318c85d77d2018ace82a1cc545a0a5de86c00b6e2f2e08
          fc0ebea7db6351e738568a135f18219b103972ebf9
Q1.y    = 26738143271a22e86619e49b2a8637a0882af3c9f474f01671f4da
          e7157b6c55aa5f9e5b50109a87fa2c28d5eb72fd33
~~~

### P384\_XMD:SHA-384\_SSWU\_NU\_

~~~
suite   = P384_XMD:SHA-384_SSWU_NU_
dst     = QUUX-V01-CS02-with-P384_XMD:SHA-384_SSWU_NU_-

msg     = 
P.x     = 836425769615b22c04da5fbae6c7d63c528f1a4eb83c92268e9cc4
          36b40cc9a8049f5fd8b14f73ad7ec905a1dbac9746
P.y     = b294793ce90aaf0e1aefdb657896168c7005f5d65f8719fd967a3f
          a80afb8707097a14429d6d2a0a7518ac1e2639567c
u[0]    = 2772277aed2d22078eda0ea66631fd2cd686812e89688ed11b4f17
          04d9e9c10f972b4e12a761b540fccbc407b0be328a
Q.x     = 836425769615b22c04da5fbae6c7d63c528f1a4eb83c92268e9cc4
          36b40cc9a8049f5fd8b14f73ad7ec905a1dbac9746
Q.y     = b294793ce90aaf0e1aefdb657896168c7005f5d65f8719fd967a3f
          a80afb8707097a14429d6d2a0a7518ac1e2639567c

msg     = abc
P.x     = a857990b957f366f01e6b33f4ee588462f77e84af354ca0c8bbb7f
          c1f18cb50629e5e27abd0022770fa0da9c188ed098
P.y     = f081bef1aac97205c7021b3c546ea0b1860abfb341857a8ebb9f75
          bc093feb82855b14f04504c124e7f4139ddac9d0f5
u[0]    = 7bc1129e2176f92ee9c24a67e4a024e7638fe7325b68c04f287ce0
          5110ca379bdc93aa5e35f55d38988f6a31acc14623
Q.x     = a857990b957f366f01e6b33f4ee588462f77e84af354ca0c8bbb7f
          c1f18cb50629e5e27abd0022770fa0da9c188ed098
Q.y     = f081bef1aac97205c7021b3c546ea0b1860abfb341857a8ebb9f75
          bc093feb82855b14f04504c124e7f4139ddac9d0f5

msg     = abcdef0123456789
P.x     = 098319e3cafd64f8faaf7bad4c9299a110fa291340aefece40ff41
          040e13b91e642bdea411cc66ece484638787a07737
P.y     = 38e24ae2c7ec8c43fb43e506757d227ff18ded6bf32a99069291e0
          12e989f925f8cdd48e08fd539ec7f43d0020be5256
u[0]    = 3b6fc28dc17ef05e74c2457e5cd5264024998b3077cf18834e4268
          43acd5d8377da34fd2caff874be8a6af98a23455f8
Q.x     = 098319e3cafd64f8faaf7bad4c9299a110fa291340aefece40ff41
          040e13b91e642bdea411cc66ece484638787a07737
Q.y     = 38e24ae2c7ec8c43fb43e506757d227ff18ded6bf32a99069291e0
          12e989f925f8cdd48e08fd539ec7f43d0020be5256

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = e4cb40454200a9fbfb29880d42b2089dc806c9628388d2072c9032
          544f1004a65b3d275ffe2691e54291cc2861504d93
P.y     = 2b1e4bcc1d09e5f9300d3315b21d5b7c948cc79a27f64f9dd7bdab
          486681541a4d0fbc248e9f78f073a65471bd600093
u[0]    = a6b9b4ad801f0580709c801443d2f5ad9b5ad2944cb501c7a81f4f
          6b4b0022bcba7dac64957d71b3222bc00a6aa6b4ed
Q.x     = e4cb40454200a9fbfb29880d42b2089dc806c9628388d2072c9032
          544f1004a65b3d275ffe2691e54291cc2861504d93
Q.y     = 2b1e4bcc1d09e5f9300d3315b21d5b7c948cc79a27f64f9dd7bdab
          486681541a4d0fbc248e9f78f073a65471bd600093

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
P.x     = 659f95d055df4c5d75f84645dfe76d4a421ec5a87e42c31372c6d0
          3f391005b8941f2f6b6fc98f8225f49227a9694d04
P.y     = 190270a166d0314d27a266cd5c1f662bfcaa4fcca765bba80abc41
          05d27c971098540f8f6e846efa5da4dbbc02a6f271
u[0]    = a937b53202cf3876741ac1a8434b4778b5235e8a56c57ee0e02afa
          b061d8e61d6b438d2bb4904b4fbce326a15ae8f44f
Q.x     = 659f95d055df4c5d75f84645dfe76d4a421ec5a87e42c31372c6d0
          3f391005b8941f2f6b6fc98f8225f49227a9694d04
Q.y     = 190270a166d0314d27a266cd5c1f662bfcaa4fcca765bba80abc41
          05d27c971098540f8f6e846efa5da4dbbc02a6f271
~~~

## NIST P-521

### P521\_XMD:SHA-512\_SSWU\_RO\_

~~~
suite   = P521_XMD:SHA-512_SSWU_RO_
dst     = QUUX-V01-CS02-with-P521_XMD:SHA-512_SSWU_RO_-

msg     = 
P.x     = 01cd64478125d07328bff89cfc1295721de61b849ac9548d6e80e2
          fbe8a1214d58141ef0d85e22e98613dd9aceaae48310f91d5c9da1
          b33b353183ba77eaae8bde58
P.y     = 00b3e374abcde54c449854f9c9d93b9968e061036179be8ee704f2
          1628d4ba0b75f5c68c2098cd7152e7d14bd85a1ca3adce321abc62
          e786b39410eede5b812113a1
u[0]    = 01458391867085c977ff5eecb0deb0e33f120649468b9aeb130e56
          48153895b3096090308fb859cfc4e6505e70454258d1948e139915
          478906b835bf6e697d1a512d
u[1]    = 0147856729af23b320284df75969ca47b55680f8928b5883eaed1c
          e336026a781aad78644d7de2be1b34137368a6085e64c9e71a32d4
          42c38eb8af82c4111f719295
Q0.x    = 008ed07850353c8073b54ff1e8c22c5f2b9510980d4f48dc92986b
          755d4de27da9f4722d94d73cd7cbd8b316109c1f994c1b15e48ac3
          e3b69cf0f1162eac19dd124e
Q0.y    = 0020a648c26344f2b211a061b22836b75c6f1c72848e770e184bb8
          2d8ca33b3ccd12f53a44aee4735cfec58d402a8e8ff101802173bd
          d364a4d4f73f58b9917f927b
Q1.x    = 00a3d364b546381d9d78572d9503708789a106e2239f1bbe3ae1bc
          cb089cec454f77e5b1377ee6cfe15811d4f9bdb9db2669c31b80e7
          d8d626c9c53d7d1cd363e07f
Q1.y    = 005371253791be5413f96100d0992d78c2dd93ee632a5194afb654
          32629e12e83601115f11682c44a4fe0f4678ae02385d7bc8d129c7
          99ad5852f7f138afc3d899db

msg     = abc
P.x     = 01f16a46880de6ed1463a7fff66b5f6b46a2ea1bfd43076431c121
          686a6c2bdaaf2a2a206d2671cc592d55e8d95f2506189b86fdf87e
          97f39e78e4350d5f226d6e5a
P.y     = 0022ba064bc0c21ec351a83ea26384a58bb8cbcb99c66bf0fa5429
          2e79647b56f0e026c2837c76c048130dc05a116f517fc2ff7eb798
          427927dfb23e10e140c3975a
u[0]    = 0168970c8a21eace42868abc0ae0b03ba34bd482c6d3cbd04a1e5f
          f070ae4e485430c11be967ea52009a834a4b4c62f3e0467d28f1cb
          4bcd4e334a00ca7b3e28225e
u[1]    = 0047a40abad6f05f0308a4db361b2b95f42f33e88cdcce9924112a
          11449d84fceb4435d4cd4aa61407ec52d340441ae6f276e02ad2ab
          56af9ceaeb94bfa5e88ba0a5
Q0.x    = 01de37bb1d638217ece408c0471be60db9334e95e61f4988be6c9f
          74893594b9247934029ae5f12d1dfe94cfbf7dfa1ceba6008c77b0
          ad775f91fc169a30190fe599
Q0.y    = 01a54e0ae34f9d5c383ff88b8e80280defb0315c06a5662341aa83
          54621c3b77416e80651ef1d3461cd510e83a9ead59a977583a0f9f
          3c3bd5d31f06e1fc76a12742
Q1.x    = 00c8fb9fd6afdda199004b14112d27ca752aa96c74dd43a1a9b5d1
          89e82886d3ee9f81158f751b2324da2fa8cff8bdf4f5d9a08d3a63
          867e6f086fe04ab7a1c81dfd
Q1.y    = 01b708e55bc91733bd71d48373787605d5549c60e15fefb18333fa
          ce9f62283962b29f710a908705c190e05e876a9ecffb8370f94cd1
          8c427c8fd51c3484ec9cd1b9

msg     = abcdef0123456789
P.x     = 0167f634e58518b665eaac1af203a4e1f253ba852b0f804011ac33
          7e38b00a60dfd596da1a215f668261a05b37dacbdb6c6cf38911c3
          7d754d3b6db9418ed299a4ad
P.y     = 011d9f78b09f9f9e9fc44c7a126d8382b5c4b8e4c0574b1ed741f5
          7baf6dd526ad0633ae4d1d74e66ac27ccfae303a0a417a5a6d052e
          f70e017008460f6d57086de4
u[0]    = 00eb3c46e0e35c0f639173c662d2801d5f9f60f153a2e3f9201b4b
          82ae30f096fb4c19bc08f8eff226b438677c039ead58477f231141
          b8b44fb6314a8a1b0d25c3e5
u[1]    = 01d292d46ef9555acdb6d40d04c53473a607d0cd4ca03bdf89a75e
          674358e0303867980c3983b3c27efa56de256ca583cfebf36fdb27
          e2288010ed2c2f6bd966207d
Q0.x    = 01cedfed9764138cadce3ca6e16e9a3500df97c4ab9fb8ca300d9c
          d9189d26320719dc4c62f439aac2432e9455e5da3e15b63e716444
          a47a9ed2d15739e676979794
Q0.y    = 00237a08a24b5ed1acb41884f9a070a5ffc57897637fd338670804
          2cda858bc44e8783470be6e1bb5d8aee7480495d984e815f8bfb5c
          f5fc6d31983e81a113472c61
Q1.x    = 001c337882e754734be69de2d033acef14e98c29d21e555efdf6ca
          1b0ff6d7ea947a9009643690617216a3c71005fde3abdd50c65dfe
          bf31cbddc485d866e5cde741
Q1.y    = 0051b2d3d5269bf2bdf8354c2e6d1bff4925131f687a22d9743d2a
          d916176d45b4428dfd80559bb174797aa5095ca47537f6df35e7c8
          78795e21919acb79137add7b

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 01daad9687dc2eefe9a7481de2525b3f74d999c11f5cc28bce2419
          e886dad6e02d19a06e192cefa62b5a5e00efbf6af1086d7b2609c1
          32f0aee7740ac40d42f136a7
P.y     = 0114c1457b7e20626319d7dd5736f254c8856bfe24792a33d11239
          202c10641d6afdbf8f0153ea9acfdb23abc8135fd32d673d8ace66
          79e6c726ddb4e1a0450d9f6e
u[0]    = 0016ddcb8257fb7d0e944d387f9a6d34a11f096f6198cd1d501935
          3e65126c01c5391ecf03cc778bbfbb928ce6d20873231d821a2188
          3948514b1a1429d80d6affb1
u[1]    = 00a352a7d6cfe124d2fce135833132bad678743e2c4cc6c5a8f226
          76975c84a710187df69f68972dc38f56d13bac5e89e16f32194779
          64c788c3024989fb96a0cbd7
Q0.x    = 00ae516dc1b745156ae636a30e0ddcadbed0d3b2a0bd437722189e
          9b44b3ee90d0a85de43ac1f6bd9e24e9bfeb0e488decb92f1704f2
          261fb54e8f2abfdf1d14cbc8
Q0.y    = 01e7ed25986903f2f320009fd21166d7d6ac15b09472332c4a6e74
          4cc04147f9f3c10111da1352846f7414c40825138523c8f4097c06
          eec23a6086e5a2694725e441
Q1.x    = 01fa0c91cae2541869f981d821b9a58cc7e2a446beedce26e21ae3
          0cbc1b3ecbe9515a1ce7c844f68e6b0ae20f51f15011dca9c96e51
          58f33735b7cb5a1ffff89b56
Q1.y    = 016d9fb7b895257ee32f4ff4b1c22ec36e93d94266aa3abbe08529
          1591f4cdd635ba30cbe841896ecf05da0c1089732c942d55e940bc
          fcf0bfface2ff0015bbf8563

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
P.x     = 0172a9c002575fe2303dd5a1cf8d01eb3544cc66b62fae5eeeab6d
          cdb1e538d4d913f123c61f7901b54b6e178484e504723728479c0e
          4122e07a317626a0c345ef6b
P.y     = 00d9140d5292068d0ed408110927f47dcf85a281dbbc54465cec4a
          ea34e573ef4525704b64d4fae3dfe24958170a8f33b142251cf049
          6fbcceb921c9b65b6adad315
u[0]    = 007bac2ea291a3916bd38011d929fada499bcf51c951a5a2b681af
          ddb0e520356b1ad30eebbf95a3bd9935b3d899c54335ccc684b995
          11ec771b15735c24467e0231
u[1]    = 01b9259a25b3ed8e74ea8376f531e69c6dc5c3eb6a88efc7ebd156
          b043a4a51eeadb280d1a51402fe5c5899cce8d6ae99e6c2ac5b5c5
          ef954424649e3e530c8f9b79
Q0.x    = 00f3147859154a2771615497af4249c74c9e11759d78e08ab2d15a
          259dbfa5280fe1dbc07ea4c5ded6b955725fdb8413d24ae84d4ed3
          afe3fdfa6b5d7e29bada980a
Q0.y    = 012d06d554931b60aeff8ba6c08177ab8dffab280cd9e6753359cc
          55ebbdedd15323218b194f9aef56780d4c49386df11465344432af
          177253e5c7f4a7d983e44989
Q1.x    = 00f39a52683580c4e24858adeb93ce4dd2e18b6be03f75d735aca8
          d429c2a0c3fa59e1f92e67a23a170cdd4d788022dcb3d0898b9c9b
          ed4d2ab5731c9b706ed17194
Q1.y    = 017bd9a89a666841563b5d18e07f366951e91975bc00c96fa34c3a
          473dc51d7bd169577ffdd9ef3b7cb11b43dcffe67cae51697cbae8
          bc3c79514fbe5f8c349e2757
~~~

### P521\_XMD:SHA-512\_SSWU\_NU\_

~~~
suite   = P521_XMD:SHA-512_SSWU_NU_
dst     = QUUX-V01-CS02-with-P521_XMD:SHA-512_SSWU_NU_-

msg     = 
P.x     = 013aac56151c77ec108d1b3cc88c6352b7a1e57c9b67af5ce71a8f
          bc588ccd45badb88024c760c7577a34d39dc6d7ccce3e6c85c9f95
          5e3cb11b457b90d0c7f86462
P.y     = 01886318cba121a6a71fb5a614445c30f0c58d2603e9b59d4d32e3
          7f4c13bcd76a5efd14e594a073261374b341f803d20e2b266a6d9a
          5652302ebb5143a9b12199e9
u[0]    = 012efe8e306112418272a5b45fd2de90878be09a13a532ac3a4a7f
          a19d7920d20699900e2b0ddc0f688f14ed7ac29049b9f9a0552c5d
          542d1558199e32620b1a0ba1
Q.x     = 013aac56151c77ec108d1b3cc88c6352b7a1e57c9b67af5ce71a8f
          bc588ccd45badb88024c760c7577a34d39dc6d7ccce3e6c85c9f95
          5e3cb11b457b90d0c7f86462
Q.y     = 01886318cba121a6a71fb5a614445c30f0c58d2603e9b59d4d32e3
          7f4c13bcd76a5efd14e594a073261374b341f803d20e2b266a6d9a
          5652302ebb5143a9b12199e9

msg     = abc
P.x     = 01f4c472766a7524739d96e75d2a89eba7fc14a8688417c15cd2b1
          eadf6514777082f0520d36c9aeea7109187f4dd948418b857ac379
          d4a0241da78eef4de1bcf54c
P.y     = 0017b2135928a466553dbf93452939d92cb31ff96d0d37c7dc7d50
          852ed953000b26c299db17af377c0f7d865792e173dcf84d9d84ee
          40c0f9073610e71139e265b1
u[0]    = 00663b03b4834a8899563b921895daa0b2790fb951097338eedfb6
          9673cac1cbb13d6dfd826ed63418cc2d19d21a07a6feca16d737d0
          738f0e351b5d65ea333ee047
Q.x     = 01f4c472766a7524739d96e75d2a89eba7fc14a8688417c15cd2b1
          eadf6514777082f0520d36c9aeea7109187f4dd948418b857ac379
          d4a0241da78eef4de1bcf54c
Q.y     = 0017b2135928a466553dbf93452939d92cb31ff96d0d37c7dc7d50
          852ed953000b26c299db17af377c0f7d865792e173dcf84d9d84ee
          40c0f9073610e71139e265b1

msg     = abcdef0123456789
P.x     = 01c5db25346a5cad340f60f8f1d360951d0a3bfcd1485e72e1416f
          9255bcaece40d4e6a6849123bcdf96ac4f2d23b89c65d0a52808c8
          8203f85e0808786bc389de3a
P.y     = 00544b31752a1880c08419d7d4199604dbab4267a1cb8e08765afc
          e7884bd5ec6854ba7e86bfa78f0f2fcf87c4cd6be71057bcb819f1
          de26e38d577aabc1a7b6dae3
u[0]    = 00d58ae62cc094fe16015874f0ce51748f6fe8d12353070ddfbd70
          f47de2b2b08f9a2899655c90d13650bbcea226d412f889af9cf2e5
          5b8ab524664cd5da9d0e8be5
Q.x     = 01c5db25346a5cad340f60f8f1d360951d0a3bfcd1485e72e1416f
          9255bcaece40d4e6a6849123bcdf96ac4f2d23b89c65d0a52808c8
          8203f85e0808786bc389de3a
Q.y     = 00544b31752a1880c08419d7d4199604dbab4267a1cb8e08765afc
          e7884bd5ec6854ba7e86bfa78f0f2fcf87c4cd6be71057bcb819f1
          de26e38d577aabc1a7b6dae3

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 01d70f2b09cdbfb4730d6868e7324702528ef66217d8ae390907ea
          29bfa6953030515fd3a02600cbc945d7fac5c7a6ea04438dd68684
          e2f5ed2e16ddea4d99e7b613
P.y     = 00368ad8e0bc38faac2282d6a326cd475b6e99e56f36c5ad90dcfc
          63bd8a04b27f70b60e1d9bbc8c206d8ddbdae230fc4990cb7b4e07
          ca92f10e8c5b2ec2b46309f5
u[0]    = 0024646823289dd34ea9b00a5909c5ffd7f2dcf79959bf60a33f32
          f223cf898c998a8c865f828179ee94976b7595bf244248c4bdea39
          38d5cab3626df434713e7b0f
Q.x     = 01d70f2b09cdbfb4730d6868e7324702528ef66217d8ae390907ea
          29bfa6953030515fd3a02600cbc945d7fac5c7a6ea04438dd68684
          e2f5ed2e16ddea4d99e7b613
Q.y     = 00368ad8e0bc38faac2282d6a326cd475b6e99e56f36c5ad90dcfc
          63bd8a04b27f70b60e1d9bbc8c206d8ddbdae230fc4990cb7b4e07
          ca92f10e8c5b2ec2b46309f5

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
P.x     = 00b1cd529e6436b890c4c9d136996f057f51a57e434ed05230adf1
          6273a3e844c811418cca11425deb1bcf85d69944649964df959dc3
          62b935091f401be89d5015ac
P.y     = 009f223367007853ebd6aa269cab835d3899269122f4eaba5184f5
          c543e69860a9845bb633bc73aedbb8015a5db1075455c7ba62cc4f
          94af6957e218a3e967348689
u[0]    = 00e7f989878d974507d20811bfda27e5b1924ccdfa2f011580b767
          7690704f1e5e9055c62e24ab9f193bd48b04d589945d1d8e78642d
          91a89e8b0a3cda9c85a9a6b1
Q.x     = 00b1cd529e6436b890c4c9d136996f057f51a57e434ed05230adf1
          6273a3e844c811418cca11425deb1bcf85d69944649964df959dc3
          62b935091f401be89d5015ac
Q.y     = 009f223367007853ebd6aa269cab835d3899269122f4eaba5184f5
          c543e69860a9845bb633bc73aedbb8015a5db1075455c7ba62cc4f
          94af6957e218a3e967348689
~~~

## curve25519

### curve25519\_XMD:SHA-512\_ELL2\_RO\_

~~~
suite   = curve25519_XMD:SHA-512_ELL2_RO_
dst     = QUUX-V01-CS02-with-curve25519_XMD:SHA-512_ELL2_RO_-

msg     = 
P.x     = 730275f8aa1fee8b5e594a6fae87ec32ef2787fe1f67efd2b447ca
          43fadc90da
P.y     = 7e76ee8d3c88270d2d1b8407674fb40ce78d198aad4f32c9d8089e
          226b3d9577
u[0]    = 1764c268432700ae6283797c1ddce602a29e5b1b68314ea8b35061
          5803003c42
u[1]    = 59eaa246c55cf45973716a05202ec333cb910ee14c0c97024ce5aa
          adbd58164d
Q0.x    = 709bda4b56679920394e46e4fb995f1dc5bd562f4db7914ffd56f9
          79f25f7875
Q0.y    = 1b848cf48d5f75fc1f1afa84a82936f927014d8e496997169b0676
          ca30219c5e
Q1.x    = 15cef2c3c7445f53fbf2a328eda661ec7c59f66d360f65907e9d8d
          e1c484a0c8
Q1.y    = 7771c79b95cd7f07e750bd34008a468632653331291ec26f6a73d1
          d980eb695f

msg     = abc
P.x     = 6ab813e8cb0335549c826630258b2296adbd64434549f800e3500c
          a1f19d7f8e
P.y     = 0201e2302592afcf2cef4fb13b53e5d9f59bc8ccf3e07ba49ab508
          676037a17f
u[0]    = 09f2c90974bc6bdad91b82622522ef4a35eee3e9861cab469f2626
          054d55bacb
u[1]    = 3ac716ce2238c1bee372f96acc141baecda4957c382ba0017507e3
          f1c906f09f
Q0.x    = 6c27b377879f95a8fa3021551eb1b470a8dd9495169737701f5726
          1c9c7d7d57
Q0.y    = 3b09cd4dca4351e1ac8c054ddea7d66128a684a8f5ca5f9bb65a5d
          83d4138eb2
Q1.x    = 59017104c1ec1e1e30397ccbb248b2810103dc5081aef1147805b3
          abebb5b589
Q1.y    = 36892005f6b9939055b91dbc3445217680d6d9ca50d72160d25fb5
          f4839c834b

msg     = abcdef0123456789
P.x     = 1e1c4c6d8fbdc9f8006598cd2e905d6b1019701c618750864619c5
          f39585435d
P.y     = 6971c3c54e3230f3bb29bc542d2d695e6ac2087beee6272142d932
          aa929f4652
u[0]    = 5f5de42ce2fbc117ddad88bffa71079c87c12ea1d64972ad734a6b
          7a1aba994d
u[1]    = 414bff5790dd159b686878f24fd801b5529c791f4532531f12c97a
          95ad75f341
Q0.x    = 0b93b1b8ef28a259b4008df7bab2c59b66c428629e33ec72c923ca
          555004aefb
Q0.y    = 45ede471c5e933ea31309261ab645d86cb9f9e0c0db4a82e448523
          7df2b8c3be
Q1.x    = 6b181e9069ca08503752965a4ea7f5e79f046b5ef2b5480b5dc083
          949833969b
Q1.y    = 5a01e20e73ff00fc29aff8647f5f6ce457ec745d3c70ff040bdf10
          1814964286

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 18eb4bc401cd797ef74d9dc9d38ea01407f651bd24553a8b845985
          853e5a487b
P.y     = 49497e5a9f15fce636f93022c603563710f1287885e974a55fb119
          4284f28933
u[0]    = 5ad13e29df26424f8d326061fbdd8bb48a1632108fb8891566003e
          4c77048ff3
u[1]    = 0ef969f4b6f0926e82170acc00c9c7f7a4a49068766f1d7c32a2fc
          f8c52ceae5
Q0.x    = 314b1c98cd5cba9735ffbdfc9888fdae7f1c7ec5950a61cc7a4375
          a50ea710dc
Q0.y    = 59c017c8989af868ada7dfd60cf06664482378b49ae7447b9a64e3
          2702c653c5
Q1.x    = 3f7e72dd42e352e7eba7f95ce7bcb78a7d02cea9d00076971c3613
          72fa951a60
Q1.y    = 5003bb0f9864945bca69755c0fc523a3baeceb8fe4c7e222178c69
          b06c51b6e2

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
P.x     = 4c5bc27f06009a69f3fab9f53556ce0de27ea51c8f16d0455f68eb
          a9a6db7dba
P.y     = 0e43583409d27cd91870317db5ce683a4fb4ce216138254d34eeb7
          77d36090bf
u[0]    = 4497f0ab9e80ddea74682b37a63e4c0a605fee1f9a0c32ec2ca980
          db7d9aff4e
u[1]    = 11698f3699d6b2cf0712b633461e6640dfc9ce9da5cc0b792ee2e0
          7d722b58ad
Q0.x    = 38ff8b77653e7f64a7be6e3c0c56eff6603ee92c261d2dd90b99b0
          b33865f5f5
Q0.y    = 0fb5e4c0753249196b67cc93ac104174f6c127c067b6e7185c02af
          c231fc10f5
Q1.x    = 22076b7c789f4f0684b258fab928e5b7c23bcd7aac2d2c215e9c2b
          c7fc99fb36
Q1.y    = 7922cf0500556c9032fbd4c6eca4797132012a4d7b880528d47347
          2401020713
~~~

### curve25519\_XMD:SHA-512\_ELL2\_NU\_

~~~
suite   = curve25519_XMD:SHA-512_ELL2_NU_
dst     = QUUX-V01-CS02-with-curve25519_XMD:SHA-512_ELL2_NU_-

msg     = 
P.x     = 6ad057b228560df5e9b404c37923824276ef5307bbb93bf45b1a61
          b59fdea2ed
P.y     = 3a3528721b86a25aadcd46653ad094686abc3c68abd2cbb04c2d7e
          5a97d8f818
u[0]    = 7afc2fa7f69b8c1e12119f35513ee42b5a090f070b416cdc3bfa31
          453905b542
Q.x     = 4000086a3ab0b477484fc54b41b01368a3136cb6bb9292e62c4b57
          db7b3e9275
Q.y     = 7b3880b2143dc4bfeb72da57209a8aee5af6d8fd5304722dfe080e
          2b3364ac70

msg     = abc
P.x     = 0e52872a3839664ab48b52188dfbd4998571f83be3fe3b804b4c22
          a960309d46
P.y     = 016624aebf74c289681bf004d1279bcf045610c0ec33b9ea50c334
          5c8bbce49d
u[0]    = 425f8ee4e20f352f14a9c2e7c5cd4d831e8a2f0e7a95497624e8ec
          d122540937
Q.x     = 1d98a1d98aec00edc84726e1073609220fbc9919714837d8aee393
          a1b70a5286
Q.y     = 170b5e0d8e2ac18b0c2e83b4c168f43c5ed84fc7c3a632b3eb027b
          c57b30cc32

msg     = abcdef0123456789
P.x     = 1999276086dbd246af237cad0418f313cc710a835dbdb290056257
          07b8b458db
P.y     = 2dbdf38b7f76a544af0862ccbd8206a04a3a096b151ffbde814dee
          ec213da12f
u[0]    = 70055c6bed7fe614d13427daa27b7548bceccfb730faf5a5bfa891
          64df539e15
Q.x     = 31e430c4ebfac5a229d290c98927f954ba1946ab7dcba971630f1b
          5b994c8d32
Q.y     = 47e4d0105a6b75d8ff695a44a703ba0c281143e605e669f8e8c615
          f9e379a910

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 1a8ea46bedecd5ce6478bc7c9bd23318f812bf5f7358b286b019b2
          4cebf5cdc3
P.y     = 0070a42aa9c61c274cc9cc53a2cd06817d579b7e33347e10abde14
          a1569248b2
u[0]    = 27e271397f5c5d637a8b8cffbf84f84a0f5439a98f64d308f78dfe
          4c320a1d0e
Q.x     = 29d55121a3c7ef74a7fab89d2d8f563addf611911b701a73c23e8e
          1e498b1093
Q.y     = 59552146ba598d7d00ebc3acc19d9148b609e58188a127461724b9
          4348f109cb

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
P.x     = 53911e0c432178832207f2b3c0aaef41ac3eed5cab2b6f32e0e789
          b458491ff1
P.y     = 5836c4da4a65074f394589ed5b88ab49934604ccf80eadc4f28516
          ff2b276747
u[0]    = 3621e07d4aef09f8695fb05d57f22719e5723d2370e46610b77e77
          6eefcc06a9
Q.x     = 44025565d865c04d35e5e812c36fcd81ac4a8e575b157e68d00c15
          c446f368ee
Q.y     = 22b33cdf9062bfa2c65d43a8f86e66c4c6f33e47f4f1747008dfb9
          cac46229f4
~~~

## edwards25519

### edwards25519\_XMD:SHA-512\_ELL2\_RO\_

~~~
suite   = edwards25519_XMD:SHA-512_ELL2_RO_
dst     = QUUX-V01-CS02-with-edwards25519_XMD:SHA-512_ELL2_RO_-

msg     = 
P.x     = 2d6ae3325846f366c2cbe64cff59aeacc545a90eeec5fa4c522bd2
          f92be0a7e2
P.y     = 07b594c0b4eb8fdef3af40d8f27bb8ece427b820eb89c58f9af73b
          ee1d8ff2a8
u[0]    = 1d74cded91838edf239b20dd73388aca4f5b6416d19414de36e89a
          d948993bb0
u[1]    = 38f00c5324f7e65b70cd40b27acf71b30a9ff87b3fdd98eb0c8965
          05b9f16dbd
Q0.x    = 7a6893da9170bd750ca406700aef556158d45e41b49434b3541ab7
          8e5a5da57a
Q0.y    = 6ec63076d82f09e255944162fe374c0ec90c28b66ad63f72b89992
          a32dbb99d9
Q1.x    = 2655e5059dbe2bb11340f8c74325f4357b475812f9f62b409381a7
          c5d048a449
Q1.y    = 2c0d1cdd4b5f4f4bd1930e52f8f3f2d318588acbc3b0c9ba659ba8
          982e9a1aa9

msg     = abc
P.x     = 3765bc67ea5048205a7e5589fb779613b4e208d0adaf367b05c8b1
          9272036706
P.y     = 00b563b5f61e4d3b9d26bfae72b735e0d23972cd4753f0cc1d8fd6
          a5549579bf
u[0]    = 7707d8608369a771da12f7e2ff1e56da39950d2c2fc4d41904ec3d
          d33ef019d6
u[1]    = 6adbc8878a78f2b2c9dd6654788fe3b4d651fafd744d9f99c88228
          bc6e91e490
Q0.x    = 0f14dea0e6f0f9d211ca2861ad4eaa2c5108a9279ebb0e1c531548
          e0d2bea9df
Q0.y    = 7d9d147db232e473bbaca2f53a8cc87f3aafd243a0463af27d7c3b
          528d30b1c4
Q1.x    = 6ed23008d8e1f15a9e8257e89132c8b240be5d2bad6080602cd78a
          e6333b190c
Q1.y    = 0c685b1dc785d4ff941af2685bbe16e4ca657829582b8ded58195a
          ce57a455a0

msg     = abcdef0123456789
P.x     = 185c118e06d80a5905018549992af79e69d9143b4343ca0fc3a5de
          c508b3cbaa
P.y     = 1ea11dd7145cb6133d622de1e125aec498ec4059fd8330b9a27a3b
          756c1be0d7
u[0]    = 6a344c9724eecb0e52390dd43e1b7b15f2d50076af74e2d49c1aaa
          86470ab4e6
u[1]    = 28cc830f979fcaf5cd905829dedb4cf5dba2c8c9178e55781cad44
          be9848b8b5
Q0.x    = 04ee8e8896aa2e5d80dc1a2e774859e9c871ac35e16fa54389f6a0
          ec3a4d8b65
Q0.y    = 07b221182177a525cf06ea92707ce9b43bdb84c50f107d1edff136
          36e316e9ae
Q1.x    = 16fb2f9039a776a862728ae98aead56233343cce28b84962094480
          8e999cd52c
Q1.y    = 63ace6602378341be627454e589580eddc75a1a609213e89c48d09
          e88d1af9e0

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 00ef58735389febe59714161b1e1bc8b5acf0b3b0ccb22cf019e84
          8312aca309
P.y     = 4179546e2e884ae261fa5d1a405d114cb090c39feb7c95dcb27aa3
          b55ab1f047
u[0]    = 08427c4f8a3dab263957fc6bece97123251b18201a32deee968065
          114895c2db
u[1]    = 11d6ce69bf1c4906b5ffa7ac2aa0fe89b3d551f60cd3e069db6e6a
          ed41aa3028
Q0.x    = 599ee010402d627b329f8814fae85bca9643ad10b5d87ec358a59a
          221968c792
Q0.y    = 291a781090c03e5c833adc5c49111355ac4e38d624b59fda36a39c
          428fded865
Q1.x    = 0147b061599551eebb78e449f39204f44e59b30f53117b622946e7
          6f15cc4b68
Q1.y    = 0717139eb6a4b64b13efc8ac44c31fdf8b57d446e43eb9d785b44a
          5b1d71e879

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
P.x     = 1404ce843ddc444d8d4f073b8695e982ca432834f268388984ef78
          6bad0d6ae9
P.y     = 4bb6e416868ef236723523787af69ecbc4ef328777eef226c9e075
          b5ead8e65e
u[0]    = 24516e57fe9f561219f0aea13f8756df14face0b21b8efcd850ad9
          6b5e2c4326
u[1]    = 6879532ab51cdd8364c3a47bd620cdd827b55b2bd459f045b149e9
          3fef8b1163
Q0.x    = 7f1031ca01d3b48a823e68e755e4e140cd518de5414c857d2354e5
          c3c3767cfd
Q0.y    = 73391ef98ef843e9a9a3b026924d277f169c4785a0405fa90788a5
          88abe497b8
Q1.x    = 6201d8a3f2d6925a1a6e59c1f0fece207fe699b23e802ad4d86979
          c5befd2a88
Q1.y    = 2d6594bc8222f5f9622fa8b13fae6ce5f9714b111f77ac3f6915d4
          62d6660167
~~~

### edwards25519\_XMD:SHA-512\_ELL2\_NU\_

~~~
suite   = edwards25519_XMD:SHA-512_ELL2_NU_
dst     = QUUX-V01-CS02-with-edwards25519_XMD:SHA-512_ELL2_NU_-

msg     = 
P.x     = 0c7e7ea5a7ecfd6486fa8356f8c9012052e2438d7ff4cf50137beb
          35a72a2cef
P.y     = 1d713c616380be6f1a990ed030d0c9c71136697553ef541ff2ca5f
          5b668906ed
u[0]    = 769053b265d718de0b6639b50f10c23a83cc8139f0f0ce44e5fa2e
          74291bd085
Q.x     = 40c926e28379e2c608d513dee9d70c35c82adcbb63c6082f08ba10
          ae788df98d
Q.y     = 5e9395c907701dd832669f3655bddd69fcf3b6046e3e6e7dc89a7a
          0428dc2cc3

msg     = abc
P.x     = 268c77ecb826d2489032957999a5dcb7c1b15d73765988f6f484c0
          2dd81ba1d1
P.y     = 0a61c2c7d9c1d741b94e960c16eccfa58e686fda503b7ae545605e
          c3d8d434ca
u[0]    = 59b8e7e5bd464cee402d5c07992d1e11d9c6552980041488288115
          ada68cf1f3
Q.x     = 25586aae8e6f1291eee06f771270d1d05109f0bc1b7ce58ff7751d
          7b62765597
Q.y     = 0da7dbe8df54ffe0b76cf409751479da1c2716386fe8c60867c3f6
          4241da0cb3

msg     = abcdef0123456789
P.x     = 60a2ec79f53715b763914e5db61247d9840ac293d2aa397a3a52e4
          39cb503821
P.y     = 5262d977b23fda6b315e8c5f4b64723f44fe1758307c1beeb49ad8
          fb1dc87c73
u[0]    = 398bedb1cb65b602a0c19ef1d6567431e72db992a4cf1ae271266e
          055833d844
Q.x     = 635553be528e3ca0232fb4f96e402e79d559a1a2c87bbacfb44c9c
          3895192393
Q.y     = 54efa7f6a6c6c8a7753d1e5731e394bc27f1a390153c707bccbfd0
          ea19f9ee8d

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 7e6344ace508ca1d823ab7a8f27afa6ad71ab86500f7ef5a0a6a76
          2db4289374
P.y     = 40799aebb75d5075fe3cca5c0d91a4b28aac46076707cf03b1b91f
          92fd9f844a
u[0]    = 2492b933cc0047ea9bf0d194421696615a54b46ec4221cc6c30ff1
          f3074758ef
Q.x     = 15fc2273b4111e3ba499638d86e5fcefb50eeec65d490ec650c8ec
          af7e952ad1
Q.y     = 6e2f65447a52f2a5cb5d2bebbc5f9bc0737c978b47e6db0306244c
          04915d5922

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
P.x     = 768de119b60ea03f9ca51df714bb1cba0066f95c0a754211668186
          ddf7634009
P.y     = 6de6fa2588c842a067de4d80c6426cb6f01e8bd0b8ab883458b763
          695c302d7d
u[0]    = 3f8077e4de3aee0b09115da2401e759f6382cbd8d93da5c33b36ec
          aa63978fb5
Q.x     = 3b5d39227f4789722a5aba7ee46775f0c470434363fb6518a94392
          00099bb2ac
Q.y     = 512fc887fbb5c1f12c8c350f047e737ffbd1e6f8cdee2447a5860e
          a8bd18a442
~~~

## curve448

### curve448\_XMD:SHA-512\_ELL2\_RO\_

~~~
suite   = curve448_XMD:SHA-512_ELL2_RO_
dst     = QUUX-V01-CS02-with-curve448_XMD:SHA-512_ELL2_RO_-

msg     = 
P.x     = b0a5c76d0b989ec5623d55617b1d1b647acc03c365689f6768fb49
          c1d83803b725b423a75e04827a4ae6973b826b56a9b3397f271601
          2f06
P.y     = 74f7cfa18655fedc72e0fe4f44653991b4150715133f8835fc97bf
          e5192479b2b7d7537411ce4c1969ac22bb3deb7e760728001ce075
          de00
u[0]    = 187d67ceaa6dbb677105015287ed875dac640cc2d666834fcef94a
          662d08cd6068cfa017ae40b69ce08460fdfa345592ca7c337b6046
          7a72
u[1]    = 8e33067d78d595ddef600393a5b442fc09c7c9b652c8dc6adcf212
          e08c609e5955abbc39438276ce7c1cc9e7a3a0c2864a8ae0c6f616
          19a8
Q0.x    = cbbffa562b3aad53c49497a383493b3ea6e0be88e21bc53823a38b
          ddb8b93c578f9c26e0decaa2a1d5e05700ff7a09b1657d2cac339c
          f2aa
Q0.y    = 6840d7c60e804170b2ff7e0395ef4b5a93ea336c0f96445f9de6c0
          03aa3d5daeb05b9b0c88ad89a265e66b3478cc7092ef0e866ff2e8
          fa0b
Q1.x    = e0e392251cae78e7cc000058b15eaa93a91e57b0812d6409c198a7
          412c094373a6363fa7718aa30b8946d73b19f33417731bb19ca23d
          ce6f
Q1.y    = 17ff3c03117eccc378626b96e2ea52db83da5f6eb46a2ed2f47063
          395af6cefea83588c980ebc0c2d1afa628b93c28de2b4f5d64ee20
          ced0

msg     = abc
P.x     = b4cb3f188a43524ff841d90dca9d75e4b302f9e6da6f2ab4335808
          5120220ac85afbb9abd8e89a5c6e65d68cbe40c51ffe50e2d0d6fd
          a2ce
P.y     = 3390ca52db5c5bf16743cc8f31329e8a82cae3d1faa6410da0e766
          07781aec9d47d8151bd60edaa0b6cc3b468dbea95a9882903101be
          73bd
u[0]    = 82d087b837d0842ac305fc6372962455ed4d20441fa5be7e9fc508
          a543572f0249aa718d56e9486284d01de4c9615369c53c396612f3
          4744
u[1]    = 64e74c57305937ca4f3e4ab7337b805596f7486f87948ae9e23cc7
          dab59d4a10934f46f73ddb23a22d824caf8ec519ffe06d1bbeb310
          46b4
Q0.x    = 6d74b2421206ca03af5d9f9f0424ee157f7083185e54a2ae344b37
          e406395a7db618eea5e84f342ef6595907852b1dff3d57aacf346d
          7022
Q0.y    = 66d77278744471620a92ef3045d1a40c034003239853e6c09bbb73
          7236867e59dc45d99a2a9b9f97f1a8919067a9f43a3844774fc67e
          11c3
Q1.x    = f80efb6b6a71776a302673b11db61b68e45bc17f7fc7a34142c25c
          5ce0a1847cfb2ede3297d93c3539e42921da947c6630875b4d0568
          ac1a
Q1.y    = dc4669ebb63d17a5e610d149d9e7479deb7ac811c582388cc40c83
          a8b4f0d3dcee190858fc68d4e280a36f3a0b7e6ad3e957e0d391bf
          8925

msg     = abcdef0123456789
P.x     = 8070238b9f5b4e7c6385c99c35d8d9656a38d9ce676e46e35d3458
          535924dab3a99596e071df4bf1ab6012faf5576096bacb3fd2a99e
          6801
P.y     = 166aea5adf4661a2edb66532d679a4077f1bfd861ce0171162787c
          e57b1ef8175328b47534b29a97cd9c7a7145bd07f48247e6b33003
          3b9b
u[0]    = 48e8e9bb1c4211ab2a3775744cc642b3230ce4c81f067788afda32
          cd1f841e8c8364496138a0bfcbee24a8721e374e09e05e0eb2a9c5
          716c
u[1]    = 99f0c1cca1582758aa86887ff3de2a746f1011a503f3e0e341f13c
          d6000da78703a91cfd5026d83ef37985f582b20a1cc9f4de346203
          e365
Q0.x    = 1568b19188cbf5fd401b72a5c371c7106747cd5de9061659562c6f
          6d8cd26d8da8a211dc9cf8c1d03eb303933d8400ab404c10db3c35
          8393
Q0.y    = fbfbf76f19aee62d5cdb9b98e34f404c0ad397d5f593fb38177096
          8d42ba5b77b9d68bc0516536460fc1a51ec5b8d4fca08dedd3697d
          c65e
Q1.x    = 2c7c4f103380454ae2cc60c8323b831c3cfa74046ea7d3584bef1a
          5c50d29dcd78a92949444c62f8b148ffda2485d371b31d1d7f17e4
          ca9c
Q1.y    = 648bdb2f1c4adfe867e838133f4e54175bea43673605d764704f88
          da7b1d837015244e57c63b0b606f2a97054ebdf49b5b017e7a486a
          3007

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 03354b21b5e5e679df62bc6f3a0cddbbfff30d79f360038f4db1d0
          f7126491902ae6de1bdaf20cddbdbc4b801d822f4439c8b42b4881
          8f87
P.y     = 9825ecc39f3921bbae0abadc852f9b1d5b2a9544722ee4e3a11bda
          c84bc48f51319d576c18e9bd2a6d01c8aa7fdf79c220ba619fa5eb
          df5d
u[0]    = d2455f8fca577acc3b1c768c117269cfa7769b3325322c927ac113
          92889be87a9e7fbd80a42bc90988649396d8c6e9b6517cbe2e20da
          62e6
u[1]    = 4e981eab9bb533553deb50c9a17996356462057e7353700591073d
          bdf0b461ccead8ac2cd2b0c36197c92d7e830a2f9263a5bb80de51
          44eb
Q0.x    = a1dfef681e34c9cf0f6d15e534afc710b25b2fb114f445ac3d07c9
          b0bb17c0d6ad1dbd1abf80fbd4dc68ee029badeeb61db45cba6d96
          ab93
Q0.y    = 180835ff3ba914c395e2cc624a62201674574f8e1636ad34eb1fbf
          a6553ee962b043f3532a3d4ac07c2503db6d57736331d1e6e08383
          db7f
Q1.x    = 89842c6c18c9e5c36862b63512f90fc4ba6add7718bd4e48cbc0a4
          d28f6fa3a3051669ca612e2a45d53f80fcb4a10d01ff63eee0a012
          27f5
Q1.y    = 848ae44f144a954ec876c35df259743fe2efa9d13f0c8b84508427
          fba9d85b1b436c52be789d2fcfe84036d093f9fbf7d00690d6f0d0
          02ed

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
P.x     = a6f3f0a9e1a995c9d9c8de38dd40bff1c523a267fa19fb755800fb
          a09ca3ddbd06ba2bfe407ab5ec32c84ef3ccce346d4cd7f791d671
          1dd3
P.y     = a409293b4d4a62ae093ff5382590b4bd57a9dc07c4f482caae1d22
          7f0792ea4c4724fec8b56e3ddb5a3343b58afbf5a4c079e236835e
          c6f4
u[0]    = 4f95c3522165fb47d4318385854754340d5e188ebd308328f37782
          50bd3f763cf2e889a37fc4f794be47f95695626db4d78a004269a3
          a1c3
u[1]    = 8eda40e32dd060c9f27503a309fb088f777a8c7095df89e66f43b1
          99107d75b7d2e70a35c2a2c43483b08e678263e2e4735db9bc1ba8
          9857
Q0.x    = ede20b3cd608ae1cf43003a4753dc7897783d3ab392e48fe393fe7
          8dd1f3d4aebb5a6266cc7f1e14051c3a8df55a6af98f56373822a9
          df86
Q0.y    = 5794a0afb60ffaecefc56a2d7876b40522ed1a989693e98960d520
          b386302fe01db44bf8d37697f98eb723eab40e31d1ace48d216d07
          91f3
Q1.x    = fc3e160eda84cacd814f9ac67132abb94a6b2ba44e4aa2358439b0
          fe4387d8edc564741de73c3d6afbb3529ad5e27c30b511924cdbba
          30e6
Q1.y    = 5e1b083714e08c636ca3e63b7a935db751ebca7555a308036da7d2
          98a89eee3c202085219e7385d93e0e8c1c25c9f0d4d41259dda4d1
          3fbe
~~~

### curve448\_XMD:SHA-512\_ELL2\_NU\_

~~~
suite   = curve448_XMD:SHA-512_ELL2_NU_
dst     = QUUX-V01-CS02-with-curve448_XMD:SHA-512_ELL2_NU_-

msg     = 
P.x     = 34b5bcf9068bd487be95e15d134fa2c0f32e161bb74db94064c622
          4f2d490eb59dd9afd6285795bfd2b92e6549b486c78a85543d2c86
          37b0
P.y     = 31d0e0147500b899c7c2f855dc29c1e24dc3504446398428422e5f
          58bdd8ad50ecc232570a84aebb02541b960454128a01e0b9b8cb40
          ad87
u[0]    = 27b1544f6b59b551e8e57cbcae77f82aa1e7020b7a82e7b54ce479
          6cf5c0bd0c1571679c15d064cfe67970cadd8cdbe2e4f11a35d392
          8c65
Q.x     = 43062a1c2b8418ba6d299cd7f914aa8d71581ab31ab3e56a94e7a9
          fa6193b83b043dd74e8b09a514a975d8e7a7f8dce5edadc75ab7a5
          630a
Q.y     = d1a9d7b3a222c641e6e34306f4bab5ea904216af5a8ac334fcb2d0
          6d1eedc996e77591bbcc04ec2f8f8b4b4496cc2af60b443c37e164
          f12b

msg     = abc
P.x     = 44af048394e3da73652294cceebd9fea143bd455d1b35371031647
          786646bc91268c69ec712de8abdd74d1f0835641c34d33d4ddb379
          b6ce
P.y     = 31f35344844f3dcd977ba053e3ea8ab71e23e015917efa3d1dfaad
          765ea8d9ba37826475fa21fdaead17db45eb4e0f097f4b3b5c40c2
          8490
u[0]    = 17e15405b86b6230ea78b6f1c137c9b432d447291d60763fb997dd
          082328704222d6651fe711c28469bee354284f2d68682ddec983b0
          dd20
Q.x     = e161099091d2c4d596fc09cf50d991fd9d738a27e1f6effd3d6883
          f52164c3537ed638431942b82a1655a27d2330c7ca19e268397944
          a75d
Q.y     = 794437ac979b200ea1c3365b27d0c69348604e50a8e7dd6ce428c0
          2a2dd32cb274ea41f0c7f323689b287eb1851c56e2492c78a5640d
          b681

msg     = abcdef0123456789
P.x     = 0bedf149b9dde2b22e92990c0006ebc00f28845aed524b828d86aa
          5ad2f5796022167f5c7fbba09c962f7fc3c092f2355e83bcd178ad
          1763
P.y     = 58b5a4d417a53e0709c978a83a51a79f1943add7fb8c9255c32ed8
          952db6a8195f8b17897a82153bb7ff1a396891021c6f6b198d0a25
          47b6
u[0]    = ea6c0fe4da4f579a1ae36b4a81669e039d062e93f7b46cbbdb408c
          85b5c9aabdaec5c44216d57f7cf6e41550fd36d2010d7d23e16d94
          ca71
Q.x     = 269924515e16db1ba641423b0f32648cae4ff115a0aeda751bc2ff
          06e856f5f0aabf424ffedc48e4337ea9de9fd1a30133077a8bcbac
          1d9c
Q.y     = 6d3876fb0c034498c0e6153f5e41c531322496db734f4be42787e2
          55599302becf444ff93ba74849f5d7319930ce4b45331000e50b1c
          750c

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = a23080d6dc244d053f42e67b810d818d110f554f6a6ef44bbe7633
          1cf8d644803e5ca2cf03345dc91e941e80c56ece7dc439920cd4c6
          d1b9
P.y     = 47718a6d279ef33d317945deb7a53299dc3a369d3d7829ddce5e1c
          c85d3ef639a017aa3240e8d2757efb1714748d4a399579eb3cbe1a
          44d3
u[0]    = d384dbeafb8075f319098095f7fe6accd653aab520204cee1c2503
          f75662f47d695ffc8f33146f7beefcc9c5fe82c96e3256284bb6b7
          1fb3
Q.x     = 1d42d3daa2ad4adf2e7ac86d97d2f07513a45a5d5ff2cfb3b35484
          f731acb497da34230794f60ace82137fdcb58f255820480957cdc3
          7900
Q.y     = 71b0545d8d36a18428379745cd14a30e47ddc96d9d808bcc444d64
          283b9512e688f0c2bd779c5fffd97c1cd20879bda80e0adda439be
          9b5a

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
P.x     = a4153c4501cb2fb0ac8a82899ef2c2278e3a9b936621e998222623
          d0842c273e562555d5bd6e144bf4fbabdfe28d011b36c554b5b893
          509d
P.y     = e2812cb0c8bda125ee87422de456fe7560576744e601f28645adfa
          2cf7cef2e0c0bdcd3dcf9674f5b0aa0954bd77495d6c9bf68bf499
          b6ad
u[0]    = 1ecc9b3d527491d8d04e3de5e0e0ce232379e6a5c7778c2b507f5f
          fe5cbaa653147df43ea9c6446bbb901d58368610c036bf04f86e72
          f010
Q.x     = 2277c659fcef0071333693095ec0169e12a47e119838a472eac64f
          fa495cff1456399080687629371d0b112140904453f423c57a1b78
          9208
Q.y     = b8920623f109aff84bbcdbaaa234c7b487e288d51c74ed1e174ecb
          8b6a1f4b7a786de0881292be076227eab297cb84bb3205b176cd2f
          27ac
~~~

## edwards448

### edwards448\_XMD:SHA-512\_ELL2\_RO\_

~~~
suite   = edwards448_XMD:SHA-512_ELL2_RO_
dst     = QUUX-V01-CS02-with-edwards448_XMD:SHA-512_ELL2_RO_-

msg     = 
P.x     = 16d86d6a175b622511e91fc4c361ae5e0fe81642cfc5b7b65a304f
          4ff0c3c84af1a54c91c19dc6ac08e8324e43207d9588be7e611769
          db22
P.y     = 2b34431a65fb5f96b9be2d0c6e6d76666f0bd9ae245e8196092661
          af086df507ccee7cd23384684c644f4a76b932b8073ae4d56673d3
          a5ad
u[0]    = 29ad03f14d72d9a3f2d4498f4fe06b018d9aef5c459d1357bdf3a5
          f50742d19fbb424527d1f1cef17036d9f98a2a89e986ab014c2a06
          03e0
u[1]    = 2ba7cc7b10a5248fe162a4e966ea835b5d84645891f10b1adfb27a
          38634086ac0cf55f0e16bb3a129a33768858c0c4db6dd5bf1e33dd
          aefb
Q0.x    = 28f0f9c1e0ecb8db46afc72e8042e3b2604c9a435c61ff9706e866
          51cfc519a2e3b59e97f37eeafecbf5f02a372237f321520670d473
          b468
Q0.y    = e79472b46e1631bdf1aeb28531d260253ac3f1dd94b13da32b2fec
          3e9ac456ab6e9e911d5a62d911bd39aa6774c5b108cc23f01055bc
          0d05
Q1.x    = da49ca97955dd79aa159af71cb491819dbd34a4ab527d113494b16
          fe0d451e266869fbcd4d19082ab012f9bf28916d80bea6586e913d
          0d3e
Q1.y    = e4553f5621c7a7f5310fabfd8ecac80674b58f870bf3dd7f33e871
          d8991b628ba60b0266a3bbd2b48ac9ba3be762d6ea02efafc8b189
          caf6

msg     = abc
P.x     = c1f51a9f3fe7bfd839e98f1cedc03cdb88ba6aa624fd99dfab8d03
          0ce283b8cf31f77bf2653c95e37d3be43a962a7c4057fa4fcd0d48
          0bbe
P.y     = 698eab6d4d8afc87c26d1375647a69da9c6a4470cff38f90264240
          1ba7da195b755d21e52141142ba6ee72a65050d60ad6c3afe1e826
          8e71
u[0]    = 48d53dd2241bf09be097b2b361206b98a1dc28e24b25f30a032091
          a7da3368b78922b872aa2a368de20df01606172ca24968a04c00f4
          e83e
u[1]    = dd4a2dbd941fe6dd7edb3a70a53416bea306c045ec6733b3eb9d23
          9ab7ba4a7b7a5bef1cc9be79ee5663f941c109ee820f2068e1126f
          8b22
Q0.x    = 52820c9d42b817e6f643b2839bc73af62915dfdf647f7edb5fd7ea
          4a72cbe1c0985f9e10fd1f65e365fa3adffd4f4f012bb74bad275a
          0738
Q0.y    = 8c0bdfe95e8285f6be2169b56a31ff2f97cd7fc2a2d311b1ad676c
          74d00fb338c05ecb44b13b1c640f368a2973152a020b6c9e532e30
          c5b4
Q1.x    = 961c3e434a3ebc33d77ceec0f010782fe8214de04271c1fbdffbac
          50ba74c81bcdf067c022013671bf58647426ef935087293838bb91
          c8b4
Q1.y    = 2ad398f38b912490e25401477a8c49e76952592f27c8e2e92bee50
          c7b8368e5ef15886437bc6e64d2a764890cf21b594cc67ee5a297a
          5d11

msg     = abcdef0123456789
P.x     = e87d1cf59e9975f6a5655cde0c8223959918d282edbabd2d702372
          2a604c1d603342e2bee4e953e8d6ce8fd6f1fbd8ad57c8ca9a237b
          ee5d
P.y     = 5c240deea46ba747be96ca094bfc7afb24af510ee184e0e9cf1378
          4886f1a4b8aad1014e55250ab757bef799250a37ad268673f8bd93
          27bf
u[0]    = e06132a68618dc9219b2c10c99d1e0f6627d3a713c5be42166e957
          a08b0eca7df995d8d1c420e293eb76be4bf4bcf04d0abaa0ed9ecc
          24e0
u[1]    = 5975f85db0f1cb688b76cea0089e50185c5209df64ce4dd4340880
          cf9525a6529d4bb35d2bbf67ba556af2165d04d159d46ef97f19d7
          cd39
Q0.x    = 26f2cdb68ac77b429f0d67e970989e2e54a043c2d522819fbc7cb0
          d7dff1db4add704424bf012d3cdfdcfb79d9015febc24aaf3b1099
          5bae
Q0.y    = f690d3318158eae347523df8493795a798b84137e653027dcdd36a
          cc139d856e7eef2cd099e71301ba796db73a3ab2bad8e63482240c
          fabd
Q1.x    = 4b909e11cb8c1023376d1a46c54a1143f8fd08ec565484f1e0cfa9
          af8e26344e3e4e44b4e9d8d218f0e0a61150d52bc51ab15b0e8339
          0592
Q1.y    = 8aae519166ea6eeb08f64216a5435951d04f139f392ab7ef7942ad
          6f234f25e9d02854733e78d106fe6496ae196c7b0a0e2c3946879a
          eef7

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = a1f80e4576c32c7d2d52510e65ed946e99b3caa37b41a075f4aa85
          f8506bd7eb7300212b8c305184202fb775edea1d76877ed51aecd1
          d67f
P.y     = a4586d2ef9008d20815381d4b3ed7daa0a7aff2749b59faa979607
          eb9dc4fdb03f2987276a90396cb4eee3f2db5ba1ea8e0040c0b50f
          0956
u[0]    = 7d58f41237f82dd4c31f973265e6c3c8758203ee25abe270198931
          e25a29f83edd60b841983f73ef17cd4f8c8d23fc5806ee869b41ed
          837b
u[1]    = a43f76ee9a1374d486fdb9f2add56218cd1585a4163c4484fb8c37
          be842f6c36a6d091c45eafeed19ed9090510ba595ae29255628b96
          c650
Q0.x    = a374523a239cecb353665ba6385aa3297ec26876899254c6de538e
          a205c0692213ba5c4704eec74740b7bc9547b5cfac0d617dcb5a3c
          b6f9
Q0.y    = 34247d66c9a2c86a1c7f24ecf45474195add32e614fcaf6dc7eede
          d8eaf1c7544b68db180c81926bdd715cd5e3b6e13cdb0af120d6d1
          669d
Q1.x    = c55730a269fcb2f0a09c4f7a8af74d54e9d25ff47bc126be353527
          fc636914afe4b39002dc63602cf92f64adae022bbb5d2399b863d7
          b562
Q1.y    = 6704a0f09433a604e80096a3f60a23e1cb05b84664bcc43c45c521
          26ab1359f9f845fe2b3d14b1fa3d6363eb9a8ed488e1bd086ab33b
          14c0

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
P.x     = c9fda9cd4085d6341d69f1ead36252e309d09541a814ddd914fadb
          6cc76ec598ab134e69e67e78fe029598aa06e80d3cec4f0c5f7b8e
          3ccb
P.y     = 6394e49242c45476dad25211f0113ab963f65ce71051249994cb86
          b62542d5a0df42a2c6cc4d0eb633564404aa3589150a584be5472e
          9ee8
u[0]    = c73ad12e1008fc567f03deed01c9fd16086cb1f519a7e850300c6b
          8e3bb362cf9a48d619ae54a129782c844880d2bd583496528b3f72
          281e
u[1]    = ab7b6a69b2c9a16edd4b20b01a9949cc013eaf2f59a43159c698ef
          110ef148d32d2498bab830759a00f7c56c96c62f575fd1a43a993c
          0c8d
Q0.x    = 607b4f9b705d64ceac8bda1dee30b455ba60e1fdf1b429242c148b
          145ddea8011ab686472cc5e8fab0c0129f9a189fbc687a0406aa84
          221e
Q0.y    = fb77723681e6bbadb0b7a2715486613494f1f647dcf1ab193dfe42
          76257f90f327f74536d677f3970c1f238c9d43b6042a93b67564d7
          2905
Q1.x    = 9f7b9c62eeed14bd770224d59cc92091f2877ac115334df2929708
          357350fbdd79007610d25b2f51f66800c914f88185ae3d8e0f9036
          c4d1
Q1.y    = 0a30961074f572eaf27a47e816ecb44ad017acfb43a00319368841
          61aef6912a410bc3d70d22893079d324eca9d3cc16d11e28db2ff9
          f962
~~~

### edwards448\_XMD:SHA-512\_ELL2\_NU\_

~~~
suite   = edwards448_XMD:SHA-512_ELL2_NU_
dst     = QUUX-V01-CS02-with-edwards448_XMD:SHA-512_ELL2_NU_-

msg     = 
P.x     = d726d594b8c2944b316eff22f73ac1a07627b28fa9f1ba8f69a35c
          4d4ebb762c5cf189c06799545e1e1e91dd4550b1ae8d3aab76dcc6
          1107
P.y     = a13ae566dd38bfaac90f7e9cb434778ee516a9c282a3ea7e0c83ba
          8ea36b209bf6024405a1ec5f936dc3650950df29e1b045dbfde620
          1c0a
u[0]    = 8320c9bc7f29ef798e972f14de40086fa70da212b1c378b6af4ee7
          216e749c169d1b02aeac6d495749f5623c991e456aaf8fa4a6c498
          7318
Q.x     = 56528c2fb8a7372313ea2e7cfc62bdab55fb4f4889c7e5c602c7a1
          ca57afc23449cb15e402fbeccda86f56f91d79be7621aef639d813
          7b63
Q.y     = 12322fba7354d05ffa8d8beef053f32616e015973145035b6127e4
          a24094f14aa2cb5447d661d65d6259d20e11778b3bc23de130219d
          1bc8

msg     = abc
P.x     = cdc690ff81000885842dd51ae8a036a3a2eef8307417726f67ec9f
          81c0142ffe75dae14b303d763ef3e843309531ffc39cc54166c607
          fcd8
P.y     = 86402002ea6cee713924f3908eba037e3e8343fe8b2e92aa38b0e8
          41afe8503cb6c206fbda672c561dbb148acc38351376c5269111e8
          c9da
u[0]    = eaad66925da86565fe365368078f02f8065b0bce30f928e619092c
          fa0f7eb42d7bf93bb5c32f65d1ade3d2cd7aa113ebe13370d57bac
          f513
Q.x     = 1ef22002433c9f7ddfae068cc6c6618abbfa765a4cb227ee88658f
          2b31d16dad1ab4678860e9a4a8b9505af919affad94b76a3d65dd0
          6530
Q.y     = 4e3fcf31049fca5b7a8a0776a8722aa97704708332f4a43edf31de
          04e21f1e34d864d4562053f7e425ed0e8891b361b24f573858b780
          4500

msg     = abcdef0123456789
P.x     = 75d981b04886cccb7cc22f787aad6a5e8434e59e9d8f13b5d8f1aa
          12f35e85b974d292105fadd8ba9dbb0f6d319b8f69ced29c8b3c2a
          c23d
P.y     = f3d450c6e87a2d5587587594341d9fb166a18079a2c25d6e9c4e9b
          565410dc32f5c5a90f9e577123c987368f0c7840b23659aa196918
          5e1b
u[0]    = a1fc417b89abaeb2688e47d44bd8d05b663a6095349adaf6c5dc9e
          075a613ccc6bf81519ff07c75f55e4a911144fdee3eddcd428cbfd
          6844
Q.x     = 5e47ea8ad450c464b4d808dfd2c8cf35a89ad9807227c538fefb79
          58e6a16c075f7f4a5836d8b296b4cd6c16d69a6f9aa44cfdd894bb
          e12f
Q.y     = 5daf2ace7b708f33402e689d8b7f0753036f7a0be248f25cc63b82
          164acd9a78d2cb3ee9c7ff13258d8a6426210c597fc01e5099a75d
          903d

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = ae175c0f10c08478eb65b977b0970e483aa1de3fd5ca45d3d3de20
          bdfd4086111cdd428e10f9310db928356982889b54a027d6b79e5b
          2090
P.y     = cf0993c06fe4a611eab5445dcbc2ce3dd1e195f5b97fb09f215332
          f59443b5bf893dbb07589bb554c8921cb24fe3842707e71571bbcd
          b648
u[0]    = 18e34d4c8d32acc0d01d388ca09672df32c92498370bbd64a65a47
          4645e501c8792bffe333450d7da77d7ba66b1f2b207ffdcbc90095
          173c
Q.x     = 2c9e4c87b8730252a5adf021d0b19c904571a40c523d58088a3c10
          e5e680ef0097e433190f3c6acb0fc31e620e584cf0bf92212fec27
          b173
Q.y     = 992f69bae1fc547cd1d95885a38dce8b3addaaa499dfe133037b93
          dfa2cfaf76c0399fe9576851f8b5540fbbcd5fff95ea14e6718278
          58da

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
P.x     = 4f032755df48b4516e990b6c3381cd6d50290c4863ac7f55ccf85c
          b64075f60d787055dd8b8233dc55f61d3d8c16c286af1d030618d7
          85bd
P.y     = fb364d85039cd52ea1e6f7cfe50d0e63754895939db9674d1e5ae8
          dead4e48a02dc4f9e268151ab621a76661ad71fcdf14224847a242
          dd5f
u[0]    = fb0f13a9e710757274116ebfdd2abf47f9f812d5ef4d513bffc47f
          017999f6a3f1426d27c7d9e809ff8b57d1ac872951722877137d09
          5d6a
Q.x     = ed1faaa8427a391cf535b0ffa61f5bc78ac4a324b7374052f926fb
          ad55f38079e30e18d19eae26209a1420f62e47ef546fc771b21f26
          87b6
Q.y     = 5cbd3a8abc51325e77dc427d9d60458342e9e95f8beaa9d109338a
          0f86c0294624b078b84b62cc07cfb6aa2767d772798a3927f36c48
          ea49
~~~

## secp256k1

### secp256k1\_XMD:SHA-256\_SSWU\_RO\_

~~~
suite   = secp256k1_XMD:SHA-256_SSWU_RO_
dst     = QUUX-V01-CS02-with-secp256k1_XMD:SHA-256_SSWU_RO_-

msg     = 
P.x     = 46f41170bc52715625dfe9eb6716fa31c4718de8ff1520437cd174
          bc2b4490c8
P.y     = 74f56ad06f443947b633ecaf4d4588f93b4165de0a2c1f7e2b80dc
          35773e599b
u[0]    = bf029de4961d4b59fd912446a250f26f39bd4d390cd9d4dd323dc3
          4e0c85f6ea
u[1]    = e8e161317da061aab4301414bdb154d2450cea97b42c295a145f3d
          61c2863bdd
Q0.x    = f9d41929ca3eb52a19839720a1acd0277d803906b1603e4cdd2afc
          5d9f1831e9
Q0.y    = 569182c69899b72e004d6b2376be25c33e0ae7623ac52c0f098611
          6f376f3a7f
Q1.x    = f63ec7c4af79bea85309660a9d18c2d5fbe59e1b397ab668e22f79
          2bb5947120
Q1.y    = 31337e44b8fed98fbbb0979f57c1d9254e8f08712d8b8fc6e234b4
          42123d318f

msg     = abc
P.x     = daca0ccea7dc9859c77f6a7fd95609dfaf5ab0950c0807640b590e
          00893db57f
P.y     = 967ad42418084e7e8b8aacdb9c4aa22a53d603c3dbfb464c3e364b
          1a46ec0cf1
u[0]    = 5bfc8d34ade7c16d638adfa2a8ea4341b968d9c3a1227e665f2314
          12b2b88598
u[1]    = 5851fc17f34dbc75f2ed696df8fc2ad26cfd3ba1071f873b74de5c
          edd08c3808
Q0.x    = 82fe5da3df7d3cfabb90150b21f037c831a248439f72ae7a892aa8
          460b406c33
Q0.y    = cb13a870f172c3d895ebd052e85cddaf0e9c7112447d9e9eb56ee5
          5395a3cc4d
Q1.x    = 99ba7ff1b167a9e06a0784aa53e9f751c76ebd46215abe1fd4397c
          06b5c0f4b5
Q1.y    = 21506a9d7963e4c15c9462e1e6fffdfc3b33f67b9fdc0ae3e3308e
          c138516c9b

msg     = abcdef0123456789
P.x     = ed0aa70ccaab11b2612225b90537a34552d337ce2b19cf38c1fe01
          736aa8115a
P.y     = 55c2badd8a74fa2373092f312be4c6c9d344c8e6a8b5d5d0a7eef1
          b0080fa6f5
u[0]    = 81dfb0bd023592615c009d6d7ab376c849f29d978552c189341216
          ceef6fa494
u[1]    = 32037aad4775d45500712a9b903a4c1249e222c52a9e1be39bb1fc
          c72505e3c7
Q0.x    = edeaa468c204527943b2a5fdbad9bd078cc48329de1a094ed78e80
          c920ac652a
Q0.y    = 6b90410a21e01bbce886f91daf2394d5b5a2cd41885c91d9296217
          3291491155
Q1.x    = 1be2eef6d26aad2d558bd1e713923b86dc9927082f9d6cf352d9a4
          52bc886464
Q1.y    = f6debbe94dd06e7891db10a8aaee818f60a488ba61d26ec70894d2
          3c616d7646

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 3f54b7752b493ceab4a0dd618416efabdf66a8f16a8756776f0551
          d8475f9a5d
P.y     = 2c5c1b83d1c4243806743be509066849193d95b29b0e5ef4662b68
          6266b5798b
u[0]    = 326595ffa0ef44b3ca8377cef4712b025dc832a3316da52e745b00
          86626a62db
u[1]    = 99c8501c0ff6045b5db368a516e1ed5ea1168e472a5fedc89e14a4
          206b034116
Q0.x    = 8ff0e7d16063acb651fe89e882ac94e4fbc1f29b08af38a89bc5a5
          8fcb13a696
Q0.y    = 7817d56d318457f1ed81d53edb97c9af303709c1d3e9b2039645d2
          049049517c
Q1.x    = 7fde2b0b54b87d6c918090a070587847ee712e8ae664ae33851d79
          271b871b59
Q1.y    = 54076bd0fe2d5549ff8c75fcda504ae790b444818b87d8fb634c70
          f9dab9b522

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
P.x     = 1a36933381274f5b70abeb9cbd9d1e53d6d6c2a8fd31496e5965eb
          0b7f54c9ed
P.y     = 55d75e68c508770511e97e71e10bb105f7558d4a1af636ad5fec07
          889d73d28f
u[0]    = 244782741d2969f00a2bf5e14b860dd91a1c49389d1b72527816c4
          dfde365724
u[1]    = 5f025ad38f10e632cc3263352b0e0b28237dc8a50b8a616557cb78
          a5636780e9
Q0.x    = 510ad1f6a35d955ab08eed8c5b974a736aae3064dddb6ce8f7b56e
          99acf31f0b
Q0.y    = 7adaa6111c4c70fdaad1005eff6b801d53e341df37a257fb650909
          4d5d486ebb
Q1.x    = 31541268474cff9f9f91f6957a57bf9401f2e314e347cda6e1ca2d
          62f4916546
Q1.y    = f8a065b7f7ecb6323bdda2ba3af6cc8ce0c594c723c4317ab8639a
          032ecafb03
~~~

### secp256k1\_XMD:SHA-256\_SSWU\_NU\_

~~~
suite   = secp256k1_XMD:SHA-256_SSWU_NU_
dst     = QUUX-V01-CS02-with-secp256k1_XMD:SHA-256_SSWU_NU_-

msg     = 
P.x     = cd024e3ff808a56733ade18e710dc1623553ffb1d96741533970f5
          745d86c105
P.y     = c3c28a67790f246f8584412fe4e98b61b1184bbd48f41ae2587893
          8385305c0d
u[0]    = e27de307ad0386b979fdaa719e088de97e84cac0a8ca01a35618df
          be0a95134f
Q.x     = cd024e3ff808a56733ade18e710dc1623553ffb1d96741533970f5
          745d86c105
Q.y     = c3c28a67790f246f8584412fe4e98b61b1184bbd48f41ae2587893
          8385305c0d

msg     = abc
P.x     = 820e271d96afa13b685ff9a3cc4dd3ecd6d74de501b285e62073fe
          75ec6accb8
P.y     = f6e2d5d2d61f9a7d6cc8e49187392dbd9bd39d617be26634694c59
          2659203b77
u[0]    = 663a2a06b05576af0f07dec683e26db0a14a146f846e182b8094e5
          a5b80c2f24
Q.x     = 820e271d96afa13b685ff9a3cc4dd3ecd6d74de501b285e62073fe
          75ec6accb8
Q.y     = f6e2d5d2d61f9a7d6cc8e49187392dbd9bd39d617be26634694c59
          2659203b77

msg     = abcdef0123456789
P.x     = 4f8fb42b0e920be2849203e329439dc6e962a1224f645b52272083
          b32f24cc9c
P.y     = 48e1f38fc7006b1454b531b681091a4f916cc4a0e019adf630bd37
          12ebfa1c59
u[0]    = 2d0563ab5548182a5b6b7bab2afbacfb22e7745ca8ac8365358938
          54f5ffd5c8
Q.x     = 4f8fb42b0e920be2849203e329439dc6e962a1224f645b52272083
          b32f24cc9c
Q.y     = 48e1f38fc7006b1454b531b681091a4f916cc4a0e019adf630bd37
          12ebfa1c59

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 9e651407d8d2140530c2a5164880ed94d529ddb2fd2b8c762f2083
          fe6c14995c
P.y     = 9cac2a636132936cfe5997a8eb8186b63dd785d485a6062cfcf625
          7b010ceaf8
u[0]    = b206fd12fd6dc0d8b11b99fac5378ce9066fa560e6e6f59b25ade4
          195be44900
Q.x     = 9e651407d8d2140530c2a5164880ed94d529ddb2fd2b8c762f2083
          fe6c14995c
Q.y     = 9cac2a636132936cfe5997a8eb8186b63dd785d485a6062cfcf625
          7b010ceaf8

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
P.x     = 0bebc3b7ffdec8f7f26f52bed58861ec669abe59adceca619fc982
          fee54ca44a
P.y     = a44974361087932ff025e70d708cce860e99b451ec162941d4bb5f
          d23345b4f3
u[0]    = f2b51a6e25d4b59f5e010cd7f6f7bc794f687a799da7ea91bf5d1d
          805792bfcb
Q.x     = 0bebc3b7ffdec8f7f26f52bed58861ec669abe59adceca619fc982
          fee54ca44a
Q.y     = a44974361087932ff025e70d708cce860e99b451ec162941d4bb5f
          d23345b4f3
~~~

## BLS12-381 G1

### BLS12381G1\_XMD:SHA-256\_SSWU\_RO\_

~~~
suite   = BLS12381G1_XMD:SHA-256_SSWU_RO_
dst     = QUUX-V01-CS02-with-BLS12381G1_XMD:SHA-256_SSWU_RO_-

msg     = 
P.x     = 08f0d1e28947551ea3a8eee3e6c4bc1dd8a99ec704a1f4772f5038
          7331c7582d81b86242fbd8a6afdf65268b5c9fdbae
P.y     = 1726bd77a427b344430fe47bf619800f3b329a9bfad002bb764d1f
          1e3c6a012c6480c9da5748fbf6151f0a380af1332e
u[0]    = 157db83388727af12ba455889a3bf09c2f827dbcfc79549631ef73
          110d8d87707cd96ed79cb11bebd788e362fb45e859
u[1]    = 120eecd858945bfab51c5d4cdeb9649fad8919c5645d41b0acb83e
          9f47482616eb22cd0ea53f094959c5a77688208f1e
Q0.x    = 0c927a8028472fc8dbce43d8f6eacc66ad60d9a6c43bd971dc76f9
          67ca0734a1ad6c483eb72e3d4bd5e27cbf8d17dd90
Q0.y    = 108fcc7aedc4a5350f4ca6588e3ca8b2c7e6b959ca008a14db5511
          946da7268612c35ef20ffe8399976e7795d24c21f4
Q1.x    = 16e45d55048f3b6c9702671a5093107ab411763c2dfcb2b9c061f8
          028b1fda9d9aaf84656e625eafa5d3245c292fb08a
Q1.y    = 11553fa455d6906cb4e7f4ebd6dce36da5e4b8771485caec8c0564
          843fb153822982e7eb8b7beba46366149f1a3f561c

msg     = abc
P.x     = 05adc4daf80490b38bd37f2e5c6ce2dbc5d2bcc4e1804c53840aae
          aabb1a3730a34a4078549006205accef7c90bb6788
P.y     = 0174d98d294c6ab728187ebfdaaf5ce9ee5bdfabfc77941c6b84c6
          85265f7493e4a6c96900674eb7ff5520450a80ff8e
u[0]    = 00bc29ebc6ebadd1ea21918b1a154652239bbcff080274142e0fe7
          d02963d549aec7f8c91871cb37b2825d2f87999a96
u[1]    = 05207fe2d5a35f26eb89955d9a7dee206be34ce9725d13ec31ab2b
          2afe2c6177bc3d2cffdb82de2d3affddfa00043423
Q0.x    = 04ec8fc9ea891c8a87b32e1659e968b10a5abf2e2b15b096e15e73
          bff52ab270420abc8d47afce8a974bbe3b3013887f
Q0.y    = 102a378db36b760527a11b3a608b3cddeb04ab6a5977207c8f74fe
          88e2052d0ae3b724d20c12e529435df9e0b8584e7d
Q1.x    = 0cf2f8b6ef608227e3d7fcaaccd51d9c3b44ecf9eeb0ef6bfb23c7
          574d060b2748d4dd0fb3198137d4702c6526c18714
Q1.y    = 093164ae11b074f8cc05cf88dcd0477adba6c28ac53389cad10fb6
          d9f021df2015e451fced625a02e7657aaa572e9cc4

msg     = abcdef0123456789
P.x     = 03f2fd50a6530d5b84ecf6995954831396db943bfe0a1a48e5b90a
          f9f5994937c8f98f68456cf98bb3dc9d4a6eef1fe6
P.y     = 0e5783df737537991960f9e3df68a21312b930f1a8b54485d467d0
          c4be7de9bc62195558103b9803621d6726a1d24f56
u[0]    = 16074226f4c99a3d6ef407993335c895a785d4ee9ae094a03d99db
          f9c01ddfa7dec20b81693bdb6602fce4ae12226e9c
u[1]    = 0e0cf253ef2dc647ae61611556c35158f52577d8aff0560ee028b8
          ad98d75d34c6551fdb33ff1639da0c22f3908a6e09
Q0.x    = 15b53b5e6802705b5a1cc32fe0f8b06f96d8c29f5e8548e67a4862
          e2713a876b0b235e921856ef2e98d1d2a355e01099
Q0.y    = 10ebb3f608078822a37317ffcb88aaebd3f84020ce49e6c6312553
          52d16da25ae40e196d2b5826769d27dc7a1a049824
Q1.x    = 06efe2da0ec38f0c3f3f71820a381cf7b7df86d9d4e12a9905d640
          8dd713b53deb70feb78c6151728334fc19a76cca94
Q1.y    = 02ca34a592ee34b23789bb99c38f2c3b97786f10aed04069bd7cf2
          21417eaec5fc23c6e6953ed8068dad0748db00d1d6

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 054f37faf4655a6b2eb914db3953a8d6d5c82782909d542d4e5b57
          d415c530b84cc029d53c3abaa2987db7e6d2f287a2
P.y     = 078580afc5862152e22b1a1ad064fc70d3c00312454e89362deb59
          16022f56a4cc35131fd1d5062903da077a530c2728
u[0]    = 0070f0ab442b532608df664c09cf4e0516fbbb06fcf9d7c6ed43b5
          8ef780f3b507d448e13cdfb6d05f94927cd1298c5b
u[1]    = 0a20f84dea4d3e86ec982db4040d3705cb4d1b775ecdce3e5bdf53
          b6bb575762fd1a135a5baedf41b25b2d72d173e480
Q0.x    = 0568691160998929f2cb6ffd0bf2bbf02ae9922092df3f3118b8a7
          0f7d8498141b7def3c281cbe88e7c1319af1cdb7dd
Q0.y    = 167ed7cce92f43e735ecdacf77d24c395bf70768634a1c03688f87
          337669ca270a89b44bffa56b21cff629a7d6267449
Q1.x    = 0a53987ac4a977be003de9218cf710b928783b895eb00eeec534ea
          5668c26c1e4bf34757c92eeafcea12011ab28545bb
Q1.y    = 002657b24402842c618bb907d7cfdfabdc255f16f23b644fd312b9
          09b760694d71638c15ae4bd37a99c3762b47b26be9

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
P.x     = 00d585aaacaaa09601ddbc4a2f60989a5dd5d8577cda5c50af53ce
          3ac4f5bea0ed1c95e369b90d6f7edbf241225ff8b8
P.y     = 0251c4a66b63d1252e95c1a3e7ec921b49d74fcf5b27f0b4c381d1
          8c74c27423598be362299318a686af9a4650c1122b
u[0]    = 065b667219ff8ea9b6947aa7ac28a5027f42b2ec64d4a6e14f5b0c
          c402fc9968b46644030506ae5d3d4d88e0b2a2ecce
u[1]    = 0209291684617ac0379e0f6f159f8908046efb1e1d120eaf62a5e3
          5070fbaa175481d272430d8b3af13b573383ec7401
Q0.x    = 02a01bd523c3be0b959ba79fe193b18841a95dbdc49dfc0a63224c
          436cad75c6aeb3762d612fc3b0b14a1b478784a18d
Q0.y    = 079f87b229fa2c411e400e54fc3d4496c6e0255f31753c6a8e09e1
          aed289ba657fb8492ba753c2f851c00248aa94ec5d
Q1.x    = 0d9b44d6ba5ae36c0b50cdb8bad65bcb53177a09229170b5ca742f
          9a9218b7fc5e47ecbaaea18749938653beb2d41136
Q1.y    = 0edd1912cf2160894d6d2ee86d091c0cb3cfcb1573465c870583f0
          8ecea21100e86137d11812d5da9e942a5b9a3c3025
~~~

### BLS12381G1\_XMD:SHA-256\_SSWU\_NU\_

~~~
suite   = BLS12381G1_XMD:SHA-256_SSWU_NU_
dst     = QUUX-V01-CS02-with-BLS12381G1_XMD:SHA-256_SSWU_NU_-

msg     = 
P.x     = 0cb2b0b1000040ac4c296c8160b4e06ddbaabc99ad9195a18a2f3d
          7ae5affc202814b53aecf4b4fcdbd9396e210b0f94
P.y     = 19a27596ab6dca00d89f14a56f9dbc48599a21ffc459f046cd860c
          e34e24986392180db980bfcfad98ac07c1927edf9f
u[0]    = 0349cb6d5c9a0cd20afbff0d9a8be9bb760b9c0e2db580508758a9
          ace0023c37a9715598b7a166731fa85500226143a0
Q.x     = 124794fbf52aa0c57855f094e7bc894e9ea5ff6cb76e42f2c8aa76
          ac530e1cd1eb6362d3be3b4d73e29b83d3ef724769
Q.y     = 0411f153d551afd2321ca7743cc62e9beb4d1402be5d144c6627bc
          5d98e243ad76eab8ae329fcea165c89c75057fb3e9

msg     = abc
P.x     = 023b667dcdbd13c2067bdedf638b5884d417ac924edad96b10bb0e
          d3f90bae33c5e0d3bf78714400aa95a4e740620e1c
P.y     = 085a1ec9043224f89e61adaacfc820a86ef6c4651241a1c5b0f902
          89f6947aec97f155b7c06f92b8ebba2dc7864ed637
u[0]    = 03d0b07a91ec3fd4917a7e68710de3d4236c215e87a7eb4e2ff1f8
          c31abd647adba2deeb0be6b8f5a28ec94ed2c4cfd2
Q.x     = 183dc385b1c8b29333a8e655237cd6202afd00215b14014f7f3523
          e566d9f98ec73dbcc3872d17c94741f5431bbae1a3
Q.y     = 04a9cc084d8737eb4f8860bb3c1e269f3da26f4595712ecce1c31b
          adc43bf7f4db20af68149f7c2b6fe2c7ff66fff30f

msg     = abcdef0123456789
P.x     = 111abe1f2678e8b7954560b0f84422d7cd559a405b15dd8c0eb747
          b537e06380652ccbf1e761bf7223a82932ce37e209
P.y     = 0b611d177de55cae909411fc089ed547579b10009f8ac876b0933a
          081631e58a4fba00ada6238e5af14583658b38b453
u[0]    = 11eee7e1dc3be251b8db87705d72812f56736afdf76c068c63807d
          42d743f7277f045e80b40143a3af4b87d80b319d95
Q.x     = 10268f74c8c154c48abad7af060e9aacdf4987be95fc28cab95cbf
          7341e809ddd768e99a429ed8ef0b67a12642a0d2bc
Q.y     = 0ea430a0fd10e1fb14469a5b7e60ed3a084079f3183733cf0411a5
          82c4319f4f9152d383c85b1ade7331842849516ebc

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 1468be47afda1bf2248ac06a47415b61c6a93d69dfcdbc2815b952
          56185bed8321679551964810e48e28ca4809f92c00
P.y     = 17785b196c2ad843c5d585fc4441ead553875f3bf5ed07eb63586b
          703fc59798277af6da51c058e114f0a7350fbc4fd6
u[0]    = 16f099153764ca68d916e1a88e5ea11665f0e1f3c18f47861e3f22
          3e2e5436ac229cabcdac410551d4321b5d1af84451
Q.x     = 171ccadd7dc87d5803772cb34debc793361fb76d4588dbf348e5aa
          7a410631073a8e51df8057eb075fa77e2ffc919fe2
Q.y     = 00e6264bbe6d9effd4656ea6102c789e57f5f7818213c1feecfe5e
          0e4809151805b01762568cbe43f90a5763a69b6124

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
P.x     = 028e595f74b2bc97fae388256109cfccd0e18196524a05f891f73f
          5b80a62a4e4066d1319ce367fcd7ee01cd63ee78ea
P.y     = 0665852896d315921f36e6f4e3fd4312f412fea3264114fc1e3f5b
          e1088c7dbf96d1d2df00fe30fa74cd665eaea03097
u[0]    = 14716831da7bf5847a4b9379a43fb814d48ee98bc7d505360d2aaa
          a40b6de6279ffac4faaa9891ccde6b71672d6b14d5
Q.x     = 0802b63cb2cf326c318d16b82f41731b5e0d17c11c61921156aaeb
          2ece37aefc62e50059934c0fd5f4c31c8afec7fe94
Q.y     = 035a2315d12b6945285cc4261ee456ac610df3de00d570082ba654
          9e047c889fd513875f2c717f8dfe6f4c22dcc75106
~~~

## BLS12-381 G2

### BLS12381G2\_XMD:SHA-256\_SSWU\_RO\_

~~~
suite   = BLS12381G2_XMD:SHA-256_SSWU_RO_
dst     = QUUX-V01-CS02-with-BLS12381G2_XMD:SHA-256_SSWU_RO_-

msg     = 
P.x     = 17af16de691f7ce5fc30f61ea6e30cb578df83168a6578103b9f98
          2b07d9c9d97d0f5b3fd8992a7880b9fef20b1c1210
    + I * 12e1eb03c630dfd8bc8267730b53f250cfd0c6ba81f98e1460890a
          8bcad0ba153828609ae9678f70016fe02be8fb916d
P.y     = 16c897f4ba930c4e07f3dfc3cf14ddb350961714510c69fc250b10
          c57396aa6fb639f80adaa0c2ac5fb97a4bc99e6ad6
    + I * 136c23acc443ad10814a79cbbd90c33bdeb5e9c742fe05dbb25c42
          205c579fcb2e32c97d1184e4505ef70c7058baf6a2
u[0]    = 0cb96d7c003d80758258ce16e54f943a8bd0ce4849e35e5b402448
          621a6a74cfbf9604bbf291558a4d8c0a5043f5e3eb
    + I * 033b06e08fd2b6f25cf33184cefdb1cfd0b848de6ca2bccd451087
          7777c92a570d69e14855c691c50a6988c7dbf2945c
u[1]    = 032c4373517888a22c8cea07a5fd70e34945d823d9546443a343fe
          e40cef21512d99dffd8609433fdde9247554409acc
    + I * 09a7c8a52482ed2ee19686b302cd0cbf86df2cf90a53e460fbc40d
          ad7df44c3d32efe5152da1a2723ea8bd0d7fc51df5
Q0.x    = 0219794a8ac1653b1076f518d4ac84ec1c03fea2131c64e6bbf8d2
          1ae862aeac2063d299e7f62298f8aadec109caa536
    + I * 05257ee4450172e4c5343d83d5f7adf5f727ec1d15e1cb95db08b1
          6755efb32ed1dd4fd2ffff639ccc92a24e9177c6e0
Q0.y    = 0e25ce318bb1b75f775fcb00269981cc2442a6029cdac9acd343e2
          61708fa9895bdcf8b5cbd127513278678699b9a573
    + I * 07cf6f13a6354b52268f92e4875702d248014f70efc8068249e335
          614a82bb6861032be8361f7fef7a373f132b741611
Q1.x    = 1452dd6d4e5d41457be84a0c81c88ab0760146ad3f26e29f44a3f4
          d4fd0ce4d664a9a6f3a093bea9de315cfe08da902b
    + I * 1254f71bb2a7e7d7adb9e03906161917853c911f0bdb73d836ca79
          851da7a89dd1541eb85cf68bf35dd00f3d23230a2b
Q1.y    = 1755bed8bac3e6c44bcc3e126b4acb5cc872e81da9abbf8b24e095
          8420d224f05fe98c389db7ac57a70c0e49f2715ea3
    + I * 1369cbc90cb53f53fd2a2efdf46fd67b02224affc2295088bd7723
          16f22b13ab64b65e9d9a6a39378121e804fe875a00

msg     = abc
P.x     = 0545feb3ee54ae649cf9edd8afbcca518163e2ba2f63add42fae8f
          b198d6e6fa2381d1e9baae202c0cebe09647c49b6e
    + I * 0c01bad00291a8be83aa4ce4e1d7a4179dc4c3a674ae7f010a8a14
          9b5216c1add1738cdcdeea43dcb347a1d58f7b7425
P.y     = 19ec2c811d41442cc185fed82188314c8b779443dfb63dbc1a2321
          1d27a886382d56af27d57549a0987e50aaff5a2743
    + I * 0055eb054aec5263921e3f79c5503bff16c151a85d93b43ae42109
          e4ba0ba82581afd5a3a14266e8b53289d9a0c85c4d
u[0]    = 1544ce4bbd13bf4f80164d9626171a66dd2dc56e014d5f24dd06b6
          cb528e0101803f70e04b9c6b2e67bde816e3de5742
    + I * 0388d06f72885ed7b3b2596e386de4eb7afff97c389635bf03d555
          22e58c72017309525c85a6997cc989abb329f22251
u[1]    = 16e02f54d2ed9fb8b1dbd92715771dc8d6762669bc6ae32d5076bf
          17cd8f7857ec62caf9efd397da45762e06dddff7b5
    + I * 0d826e4ee87924a21634d3039f64f08a23792d0224061269e3b135
          c650d703ea4d96020f61ab7496f0eef5be2437164c
Q0.x    = 1026fabaeb28bfb47b3628f0c219e09c06235fe4b524ef997e4533
          b068dcdc48b2cc702e4c0f9afb54bccb0e22b7d547
    + I * 03405edc90c63117994092296b1b054ef3aef552086ce0177b27b7
          0b00c9694f5d93ec3e06379bdb42323d7faba5fc4a
Q0.y    = 189a04d93373e85d39066f6418fb04e1c40cc3ddffe13d8e9135ea
          d5acb33b929561a236edde8150e4744b84e413c4a5
    + I * 0fcd0fc78e1c910a8f0a640a2dfdd12ec3a8c1a34aa530876c1680
          c4f95f13aa5a99730fee69dea62545e5d7e03fd269
Q1.x    = 176029e3c61e995191deda70816609ff79b15b25a42a9249fd4087
          80280e495830c8b74320ac7c762c4af86c1d725b38
    + I * 033f3bcb174bd863e476a43bd37ca0b2c2daba6ffdf1821d4f9a8e
          4a331c5c34cd62dc0588b2c968fad6ac672fecdcbb
Q1.y    = 0616a892e649575b0ccb1740c84b5705bc7502c8fd83add945b3aa
          cbfe7781cbcea109f1f095482a0de7a1d618272a18
    + I * 14ef57b6ec128c24286d42f0a123740fe0a1188104eb2e90b2300a
          5edcf4fdf3c6bd7253de93b6c569c1c6514816afeb

msg     = abcdef0123456789
P.x     = 100b9285d8adc2be59e4d56252400da38b17b71164a6a8248fba75
          1442b2e7e8d031c5d1c4f92ce2567fa9b1604fd72a
    + I * 0332c2c6db2156799b407c75f23b844dabab1a0f4145e78b278542
          0b38388d2536843458b3601010017db2bf4ce1db2c
P.y     = 14ac90e9a264f745043935bebb362a842ea88b2db9c1f64b14e67a
          1143414991a20eac984db4459612d7c32fca8c4a0c
    + I * 02efbeb0bf0786eb5d6e125dcfad98e56f4d38365d898326fd4a93
          e3e1b4c051d74768e03e8fa0487f4a1f0859db4d76
u[0]    = 18377f071a8ba20222d3914816b930123e077d5a3c03c0d572d1b9
          9a823b722e1049458223bc18b56c8649b11cc1d7c8
    + I * 0200f656138f619e764dfad540bc0ad23572da98de1877c02f0a43
          0142c8d13c6008aba527774a2ee186127d5d8072f8
u[1]    = 0e335947ceff11052e3a0f7c0cc9f386fb2a363904f76aa281a136
          5bee7a4690b0d7b0adc82acbcd2df8adc07c7afa5e
    + I * 19dc371bdf0284de052963f049401c918e9814ec15ff5c103077f1
          65d7dba9bc678e27d9f598b2c81f78649ff2665ded
Q0.x    = 102accb03048595e80d60383751da8f91cb42d0f45cc5f9f741350
          d9548bdabeba730b08b7bde6532f4288893c2678c4
    + I * 0804f826f8d6da2baa8fd1f754c2396aef40d3d0a9ad8f777dba50
          e8bea11fa60e3b4b028721bb81ccfc2f108d392919
Q0.y    = 08092c838747e1e474e413d86587bb00855693546295c1141c1051
          79c532e1598adef3e187026e611f2e1219f4a9ff5f
    + I * 0b6b72757c23959427631347afc58f76e323acf6db56aa57838bd9
          b62c3aba9b03abf1dfa02392291307d0c9687a5323
Q1.x    = 0a9ac307405abeba5a7d72019c0d0dd527d2ed68ce9ac599bbeb04
          82f8b4c5fb3b0a3a54ea06bd75ff4447944829f36b
    + I * 18cb72f0913ec99c27c95d571503ef2cfa3ec68b1dcc3d37aa3e55
          30efe796fd5e10e375808f85b15aed365db2ac76ab
Q1.y    = 049aff9ada374ed431ca7fc358d576b026e5f4eaac104e892b0c12
          14be8831ae7f9354e2fdb35c40227bdffe410bd46c
    + I * 0f5393fd9be5ea8b91d9afc84ac044a78c36b6e91c60e32fb3aed5
          95285fb359c3fd1731b8fee49b6dcd52a71ac494e0

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 088f865cc85dff4b09a00afac911f60e8eb2a1c775a4ce9a66a717
          daacfc3efeba97315658b1f54101feafcca66c0375
    + I * 03dbf8fc21af6f8a8328a9884ed73bf5f71060b7e29cc6a66d0867
          3eeaa930b22b7a3a83c9ebe56a564cbbf430b4af4e
P.y     = 19d6614a452c3e232aa2c5ce0d8e8122dc32175df788d7cf8bdebe
          2de4d6a33385fde5a053103dbf7dd4a69be6123231
    + I * 031c4e9ab608c43df37e118b8f72931b55cdc7121bc2ab98062b1d
          448bc58542eb977eaa0b87c02cd404c0781ffe2086
u[0]    = 0a49c2c8100874711b8d2c819300b0055448d72920d291ca5821ff
          4afdba07a543a650d6a5605c171f37b0a6930c538b
    + I * 19ca776cfc4c6a9152b6194024f03fb28fb599ce4593118674b8e2
          bf9774051c8c191db555fcae959728aa3e01e5337c
u[1]    = 029274763be90deccba31b6999efba43d21ae3bda4d7c905cf8232
          00e32a0031425bf618db713ed2d798c6742d0e6ac2
    + I * 0e33ace579dbfcbb765739f5cad318ec6fec1d8ab0f520ee7ea85b
          026504f4eb56ace4ae218e0581e78f9acb8089e03e
Q0.x    = 0e798e23965c530aadb447d364b299504148b6829f4c0107a6541f
          0f31a8898b16172ba5c53a41c19590c2faa7d4bea2
    + I * 04a5df85a727ae2024f6da34715bfcfe8755c7f8cce9538bba8e5f
          ca03386525368605a5ed8e38f4c8f8ab70b2a39f17
Q0.y    = 18f549ed83d7eade108732dca07f299793b1ffaa5a40c59ae726b7
          5b6b15a913b9f6ed73bcc9fea178fe0128e0178304
    + I * 14c74876e51b440125f66fbb0ae3f21be7dfb336d092aba216bba0
          ab178fe0f59bd8939889832cd2d3e9c10e5fb84fd2
Q1.x    = 165dea6dc8f84a5da6ed8d4b7fc9dfbd72934aad4199a0bcbdf1f6
          87e14d477073de29aaa3c4d033763b2ae020358655
    + I * 0cca44bacbb83f31dea52a9bbd940b8d97f44e3f59d25c34bae719
          710ac13ed91eded4a1a5060d826e793b6b578e56a6
Q1.y    = 0ef5075620ed5593c420df283165a6e23bd37aeaf31ac53f3c2805
          e64b878eabccdc690d3be2ba6c2bf193bacb99d9eb
    + I * 1968e7a881c25e22018f696222a877a9892a0bbeb9dbab07595227
          8bd734e1d288b19bcdc2a1e785fa644c94e68adbd5

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
P.x     = 03b3ff67ea84ea5d26d2ddb517e68ae0216c51abc76b6b70573ce2
          ac2992a253023243b230fba263ad0bf50ec8fd776e
    + I * 0372c50b3be44faf901495933aee0082aa789acece0b334f40e32f
          367dbdc09c6fd947e12d4f19d0e17435ebd6b8f680
P.y     = 00ce0156949b01fee26847bb19188a2db529f9380bd94be5451cdf
          89a7fb9203a22746d652bff2869e9bd432ec2d755f
    + I * 1166d88ed498d67cc5c1e0b18372a6c4c12962453d8fa7c3941744
          0e7368373928cca84835b5cb3a966adc17d0e9d9df
u[0]    = 191c347a70abd4d1eec349a6eb57f50138b8dbf46fa1d6a42d6fcf
          6e99a909a8a4aff9786530d72841cde8e5e9180739
    + I * 03c9aadba3d271f08dfe34016f36abbaa3df5105104375793f2e8d
          811994efd5e343114472d967865515cff65a215fd5
u[1]    = 0f5fc73145b7ff60901749cc20bed1ef1e654fd9acaf7941c6c79a
          217b472cebbb6b71d20c33e80db5a48fcae81e2b84
    + I * 071ed4895524104aa3bcbc72cab331bb5bb4894f4123d75d0b13e6
          c33d368a32104f6e8d3681da78430f658e5731ed71
Q0.x    = 128d1cac94a038775f2191359005ccc0d7a0070643c5b93eb971ea
          2277a2dc06a05e9d6a03b4c79ce482871b9587040b
    + I * 0f3798f462a2ab0457128fd6eb52c01906888bef30d8297db4da46
          8df299b01d1fb46f8090af4c3a620267893371ecf1
Q0.y    = 0293f02f2e97498707e87f3cff06ab8303b07913d55b4cffc60f5c
          4a17ca9cd62a82e6054642b5baf207d50bb0605638
    + I * 18ac4e0df187e7ce99cc00c3f94edc5250076c8c81d222fc82bc47
          5f00d2aa454be746dd66a3f3159a84fb43e4092546
Q1.x    = 01a3ed8c4baa12a31a942198b6f64585037ba205cbaa9497cd58e2
          54db3bcf6f00574c812782d9652f68fa8a2be7e9ac
    + I * 110273490acb058732b771c952a90ffa3875e12662e1192450f450
          9ec82aac6ee615470d9e0117c740ec128c1080dec7
Q1.y    = 04300ecfbc515113ab50f623dd5b0d3f37180f754cb4b2086e8974
          bf79c365d8969d02fbaf6c87dc3775d75c08eeef43
    + I * 14aa5d5d46de4d3993c55ff85fdcf9b146c39c95ee0c2a67a2eb85
          693a1e5dd7dfec420940761c05b3f8c790c60aea15
~~~

### BLS12381G2\_XMD:SHA-256\_SSWU\_NU\_

~~~
suite   = BLS12381G2_XMD:SHA-256_SSWU_NU_
dst     = QUUX-V01-CS02-with-BLS12381G2_XMD:SHA-256_SSWU_NU_-

msg     = 
P.x     = 0f4eba32a50b3057d2eb955d0bc68df96227b159317acf8cb08b8d
          7ffac1fabc65b793766cb10e11bf56865bb1b592e1
    + I * 122b37abff469203ed1c8ded8085c5b5898e66908f92eb8a0e7f8c
          74e3a16a94a6916baa7cedda363d91e5a1681556bc
P.y     = 0eaaea2153ca30cc94e9edb610dac6392292c726f7f680e5431602
          254584f52d39b15804137835f814f3c7e3d7c1e239
    + I * 020a4802bb3db570c41048a56748d4dcdcf05ce4bda2527b7c4315
          91769af13529d57a9d3d8293bc824193903b018c97
u[0]    = 081e73ab992fb36ee985e4588464681cea787177a6a220f1287672
          6f39ba509a8fac910a59e53c4e572d3566b9a287a3
    + I * 144093ec92569a32c37d6c78eb7641af7615f64828522f8ed91177
          32d161aa2aa2ee54788a3a325b7d412b556eb24699
Q.x     = 1665e45a4ce6c950dad2a7824aa6505022e3e5a4d2c58a664cdd0b
          ddc34a99fdda0ae071d35bc0c00eb4357061414f03
    + I * 12ac1d15c88c4021b473356e5755b91be93978b5341163f0e8f6fe
          b28a97040c930301789d04988d1f3240468bfb7a3e
Q.y     = 093194f38c8a3aa2811e17b462f0f08d5e47055a62b7318f3438f1
          fc9fda2196aa5aeed727a9f14c9fc749b0c9b460b7
    + I * 1587a001856787cd5c6c88380852a53654b5456cc89662ee6076db
          e629fba237dfc406346720431c0c215d8344cf5361

msg     = abc
P.x     = 037b12a4ba0e780daf0d8fa9db59333643f55ed6ee89ede483ea4d
          8ff5336343233087ce38b5f3194fb0d345244dc34e
    + I * 18879982416f757804ce263f40a0dd9ba6d93258e1af4a48687252
          5a31aacb10a40cf56e5f097d5bdf90f7a28099a717
P.y     = 13012f4ddcae42dd010235dd79efceae7e13b5015a1a7d96fe6f6f
          b4329566fb8e6fa93c82521901bcea06f0b30b65bf
    + I * 060d5822d34a8c933065fafa07e642acf430bfea86d17c959a319d
          7e137c128e410c88c31e05b088d588378b84731734
u[0]    = 137c4f136e38dca064b2bf1de4bc0414a5d1b45b4a61a5377cecd2
          df80d8ca34c30396432dfe7d1c1205085efd3d6a03
    + I * 122f9e1a96489954718446e6a7b63b7ee34dd557166b0b82b0c07e
          7ea40cdfc7d98bd3468b7bfdd37d86a09adcd6c07c
Q.x     = 138325f40ab0086ee63b6bf483457eb548aec9346f53fc7074dab3
          280bc352d5d1784b9e570ad75fbe3ba462b93d1dc1
    + I * 0c280384422e3ab0ab54124ab1112713289d41c9b56791053dbc66
          b95c3e22974fc9097008f462943a9b3ac37ba7351a
Q.y     = 1835c71fbea459ab78d1f11868e6ee97793279c21191c16768ce04
          73cf402458d7d143ecc6cb188a73b03e81910c27c1
    + I * 137da1b40adb00fa7e89c82a61f4ed9c26cd3438453e5c3f2eebf2
          c6c7e5fdafeed35d1ecd05ecd3509cba2dea3ceae2

msg     = abcdef0123456789
P.x     = 10b8398606443e73d10727a3075fc8a8198dcecf71b6e819e8d91f
          4cc0f8895387ba205e0028215a1f1545be0a595459
    + I * 0a3d1859ee0c6f43c77c3301531b96e9f874a7e50aa135ddd0c0ac
          6243f22769b22a5ff4c4ef807764b4c6ce1322f4af
P.y     = 04905091da72ac70988ad6270c9462f5d422ff29d58d4c2f98ae97
          c07a6def99154a4b3e788f26099805eb76b4418e32
    + I * 1986174ee877755c4792504b93b4469493b997c540587fa7f4e752
          f13ebefd74c8a7597a93735142ad9796cc77be55d4
u[0]    = 147c6c40d067a26dceb08ad6cf4aacb159f18addb9284562072277
          e9d684c90ffb9f17892fbf9138dbc59b3eaa61f326
    + I * 0b63f2a30b37cab4a827a7afc80d696eb252fcc35e50a119e9e18e
          fa1596408b68e15ca37a8d96a26aee62ae3115857d
Q.x     = 0fd5048041fc78cff38d7554233ae4dc9a870525c31433668109ad
          0bc739dc9d41237ffd65b91567fc9419463a4069ed
    + I * 0b62ea5c66c0f7e27b55e065c5355e0cdc9cb34e3a297916c7d615
          13c6acd3096b94a3760e2ed67a440a810ec797abfe
Q.y     = 008475eb95b9d157a75a85b560fbb2a6f08fafae6048ad07f58fac
          b2612387c1316e424df56b386d02f87555de63f1d9
    + I * 1569403fafcfb95e610d8ff604949e5221d3a489b6a9da1bdfe741
          5a5820d117e3a3b18532448dfb57418f8fd5d5dd33

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
P.x     = 06837d8746452cae08cd676d6a2a37c478ffd56dbcf898ca46c09b
          eb8f33a8fb6cde5418cf8d0578f43f7fb7af2f08ea
    + I * 0a63855d94773321feea13a80ab4924e9f0b7b46dad868c3931b84
          d43ed6d8f81b8495b935e09c5896f6bf3b6a288e89
P.y     = 088da2255e68a92cdd4c415d7494089f42a2708f1479f247b5b391
          49165b3595a964ea6da723aa431d56942fac75d6cd
    + I * 094686c31b3499a895c6d9d98b241acaf287d7257546180d7958fd
          fb8e228ffce17c4210d926077f50f6af0cce994d1e
u[0]    = 1201dc53fab55621e487e2a7cb787509c1dbe8b7985588f2d06c91
          cb05e9aa819cd10614622fab022f14f119d4f8bb06
    + I * 15153c1c52ab57e23cb5ab0a2741fd19ca3a5fc0c7893b55a3bf21
          32769b3afd04c84a66400e7b118afedfbc76ad780c
Q.x     = 06aeac753ac4c407b579bcb68cf40a923d866c444152b4e833baef
          02659639ed44313d0c57267da7be2468f65bf04418
    + I * 19bc904e4ed9ca1167e2dc93a0ede40c0c16169fefc7ee8e2ad9f7
          4f1fc211765430819273d925697667df8b724ca54e
Q.y     = 11ba6f29a600f5c10eebffbd5b56a7f7452b075a94eef90378f264
          88ea9fe074e71de7744058fd9db784162976afd0ab
    + I * 18d85e7a81bb28e95c7594ec887d54534b52aecb36ec6077547045
          72e35c2410d9f50e8827b403946e14d5451cfe23ce

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
P.x     = 072c331b2bc6ee80f160bc8e4aac8e5af62238ef0f874e57683167
          949997a89027920b13d05e7867fa54e0f6377a77e0
    + I * 0b6a9c3b4ae1172c4c02d211fc20e52cb0ec59ba69746a5855db34
          b1224e1f842d27e276842711e568a2a7dd7d5e04c2
P.y     = 0056b431e631678746c165e3fa7fc1d4138504331fb46e36957fa8
          2fd4a58e7763fdd1e45e70659c8fe6df19de3afe90
    + I * 15b6dd247bd336978a48ce03cf7655fab80dabf700bff3b38da022
          d6d54eefa04a406bfb62b21015984abe45da388e27
u[0]    = 136b0f496ff94c40031a43076ca4374b0a9c1f376b945ca7a57bd5
          b6123009f5daed47d5cd1184d23fc6c49d79c3a0dd
    + I * 05ce6290e7bb3e6aaa320090ba9df4f36cbd412f43cf6d58542f81
          aa301b47f94319a4ca97ec62829a9c7d7607477e48
Q.x     = 0cd569388529a6318bf957cad42e04e8524c7cda3ebe8054feee72
          3abbbeb19e50ff5abc5585326443484976e7ed6478
    + I * 06f4454a98d1417257f373cda4e45234f00772997b937df382dc94
          c948b2e186a39908f7a2bcde8e3aa3f11cd25153f5
Q.y     = 040ffd953fcb9a66ad10897782ff0a4140dc74f0ba8f44e6d3e908
          0ea846f619700c9fb9448eae50d5c785b0aab3d85c
    + I * 19500b93f40f169636c8d72aadd49cea60ac33cd73039c294fc1db
          382c673c75b5f6cf451edc60e2eb034589b52e52d3
~~~


# Expand test vectors {#expand-testvectors}

This section gives test vectors for expand_message variants specified in {{hashtofield-expand}}.
The test vectors in this section were generated using code that is
available from {{hash2curve-repo}}.

Each test vector in this section lists the expand_message name, hash function, and DST,
along with a series of tuples of the function inputs (msg and len_in_bytes),
output (uniform_bytes), and intermediate values (dst_prime and msg_prime).
DST and msg are represented as ASCII strings.
Intermediate and output values are represented as byte strings in hexadecimal.

## expand_message_xmd(SHA-256)

~~~

name    = expand_message_xmd
DST     = QUUX-V01-CS02-with-expander-SHA256-128-
hash    = SHA256

msg     = 
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3132382d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000002000515555582d5630312d43533032
          2d776974682d657870616e6465722d5348413235362d3132382d27
uniform_bytes = fda306898248a5b8a68fc8bee21e5aeb68a8d1f8f8e07f50
          23f20bb85edd0ee3

msg     = abc
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3132382d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000616263002000515555582d5630312d43
          5330322d776974682d657870616e6465722d5348413235362d3132
          382d27
uniform_bytes = d1d1278bf5517702c1e33a4005511cba0e1adebf1288df8c
          e3ccbd89f5e27e5f

msg     = abcdef0123456789
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3132382d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000061626364656630313233343536373839
          002000515555582d5630312d435330322d776974682d657870616e
          6465722d5348413235362d3132382d27
uniform_bytes = 92324ac379344186b189e6ff468a4ec4416602f21a102b3c
          d0fc540d477a8ac2

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3132382d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000713132385f7171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171002000515555582d5630312d435330322d77
          6974682d657870616e6465722d5348413235362d3132382d27
uniform_bytes = 0d79b128e49bd81159fbc9235861c492dc5e6333ac974b98
          90142c518768a236

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
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3132382d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000613531325f6161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161002000515555582d5630312d
          435330322d776974682d657870616e6465722d5348413235362d31
          32382d27
uniform_bytes = 82efedf8182ddf547c19a0093b5442cc54f151edeae73c8d
          4bd835afcd18deb0

msg     = 
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3132382d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000008000515555582d5630312d43533032
          2d776974682d657870616e6465722d5348413235362d3132382d27
uniform_bytes = 3dbe2d20f72cd68d6dc45d8b5b7ce713a508420ee5b91c04
          fd754031092e70365f12ab8607233edff692a85d0cf61a7946e90c
          e200bffc9461fbf4930f6d62f157952ca6b6831a278a40cca86c92
          ecc28fd0601685150ddffa915499b61f5fdc4642660ff9043a9cfd
          ab4ca6a007302b14f468c94e5b47c0e4bfa4a1a57abcd2

msg     = abc
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3132382d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000616263008000515555582d5630312d43
          5330322d776974682d657870616e6465722d5348413235362d3132
          382d27
uniform_bytes = 8cc14cef49b8adb2adc43fac4aed3d5a08fa7a839c98a1a9
          76ab60310de1240be2700965bf2f85ae133401947ece90a5d94121
          a4d3b1616d700898cb9cb7c4c14bc1a829fc0d5a4836e499283efc
          db940244aab75ab2b6acc68fdc6b51d01a4e090940e80f23fa95a6
          f7c74994162bcb0eb07857ff134b678beda1c0948db1fb

msg     = abcdef0123456789
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3132382d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000061626364656630313233343536373839
          008000515555582d5630312d435330322d776974682d657870616e
          6465722d5348413235362d3132382d27
uniform_bytes = 09745ad35d0cf6d271a3b21f70b82ab32c8af0323d9f7caa
          0c906ae167f6e77ec85b690094fec067ff76443634cc3bd2c8912f
          a99e24f6ba900d1200786128cd74534844b4ae6b9e467b4436e752
          a607591dde6b03f53db7cda4624329a17bdb05df1288e1b8f5aad0
          4162f508d617e23350e2ccd3861992e1d6f80ab63a95e3

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3132382d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000713132385f7171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171008000515555582d5630312d435330322d77
          6974682d657870616e6465722d5348413235362d3132382d27
uniform_bytes = 07b37b618647cb8e8e3938aef3d35523f1260c504bb19dd3
          3602fa45176884211e4182040195cf32975e9213388326fc2ab1b9
          78713c597afaeb81d6f0d08d7d9931eda5dc831d7b20fc16439553
          8134a58ea5f527d1258cd649b5563f963bb2564b4cf4bab43d7b27
          aa0e1de4df218d496d050371e3422b93c1b425e36949e5

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
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3132382d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000613531325f6161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161008000515555582d5630312d
          435330322d776974682d657870616e6465722d5348413235362d31
          32382d27
uniform_bytes = 785ec5525fa5e0a1384f6c8e7e5e1bd2a59728693be8a59a
          5475cff446eee1914f8503bc5d26dc91f5c7a346b9c74a44c525d1
          2a2fc1768415961716932758521d134cf428eae879c84430da94d8
          26a2301e75d1c6576e2de9e5ba7bf04ea9a9d441bda825ad82c241
          e52129fda6b177127278d772f2e4bd20282a6eedf34ac9

~~~

## expand_message_xmd(SHA-256) (long DST)

~~~

name    = expand_message_xmd
DST     = QUUX-V01-CS02-with-expander-SHA256-128-long-DST-111111
          111111111111111111111111111111111111111111111111111111
          111111111111111111111111111111111111111111111111111111
          111111111111111111111111111111111111111111111111111111
          1111111111111111111111111111111111111111
hash    = SHA256

msg     = 
len_in_bytes = 0x20
DST_prime = 412717974da474d0f8c420f320ff81e8432adb7c927d9bd082b4
          fb4d16c0a23620
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000002000412717974da474d0f8c420f320
          ff81e8432adb7c927d9bd082b4fb4d16c0a23620
uniform_bytes = e8dc0c8b686b7ef2074086fbdd2f30e3f8bfbd3bdf177f73
          f04b97ce618a3ed3

msg     = abc
len_in_bytes = 0x20
DST_prime = 412717974da474d0f8c420f320ff81e8432adb7c927d9bd082b4
          fb4d16c0a23620
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000616263002000412717974da474d0f8c4
          20f320ff81e8432adb7c927d9bd082b4fb4d16c0a23620
uniform_bytes = 52dbf4f36cf560fca57dedec2ad924ee9c266341d8f3d6af
          e5171733b16bbb12

msg     = abcdef0123456789
len_in_bytes = 0x20
DST_prime = 412717974da474d0f8c420f320ff81e8432adb7c927d9bd082b4
          fb4d16c0a23620
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000061626364656630313233343536373839
          002000412717974da474d0f8c420f320ff81e8432adb7c927d9bd0
          82b4fb4d16c0a23620
uniform_bytes = 35387dcf22618f3728e6c686490f8b431f76550b0b2c61cb
          c1ce7001536f4521

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
len_in_bytes = 0x20
DST_prime = 412717974da474d0f8c420f320ff81e8432adb7c927d9bd082b4
          fb4d16c0a23620
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000713132385f7171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171002000412717974da474d0f8c420f320ff81
          e8432adb7c927d9bd082b4fb4d16c0a23620
uniform_bytes = 01b637612bb18e840028be900a833a74414140dde0c4754c
          198532c3a0ba42bc

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
len_in_bytes = 0x20
DST_prime = 412717974da474d0f8c420f320ff81e8432adb7c927d9bd082b4
          fb4d16c0a23620
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000613531325f6161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161002000412717974da474d0f8
          c420f320ff81e8432adb7c927d9bd082b4fb4d16c0a23620
uniform_bytes = 20cce7033cabc5460743180be6fa8aac5a103f56d481cf36
          9a8accc0c374431b

msg     = 
len_in_bytes = 0x80
DST_prime = 412717974da474d0f8c420f320ff81e8432adb7c927d9bd082b4
          fb4d16c0a23620
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000008000412717974da474d0f8c420f320
          ff81e8432adb7c927d9bd082b4fb4d16c0a23620
uniform_bytes = 14604d85432c68b757e485c8894db3117992fc57e0e136f7
          1ad987f789a0abc287c47876978e2388a02af86b1e8d1342e5ce4f
          7aaa07a87321e691f6fba7e0072eecc1218aebb89fb14a0662322d
          5edbd873f0eb35260145cd4e64f748c5dfe60567e126604bcab1a3
          ee2dc0778102ae8a5cfd1429ebc0fa6bf1a53c36f55dfc

msg     = abc
len_in_bytes = 0x80
DST_prime = 412717974da474d0f8c420f320ff81e8432adb7c927d9bd082b4
          fb4d16c0a23620
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000616263008000412717974da474d0f8c4
          20f320ff81e8432adb7c927d9bd082b4fb4d16c0a23620
uniform_bytes = 1a30a5e36fbdb87077552b9d18b9f0aee16e80181d5b951d
          0471d55b66684914aef87dbb3626eaabf5ded8cd0686567e503853
          e5c84c259ba0efc37f71c839da2129fe81afdaec7fbdc0ccd4c794
          727a17c0d20ff0ea55e1389d6982d1241cb8d165762dbc39fb0cee
          4474d2cbbd468a835ae5b2f20e4f959f56ab24cd6fe267

msg     = abcdef0123456789
len_in_bytes = 0x80
DST_prime = 412717974da474d0f8c420f320ff81e8432adb7c927d9bd082b4
          fb4d16c0a23620
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000061626364656630313233343536373839
          008000412717974da474d0f8c420f320ff81e8432adb7c927d9bd0
          82b4fb4d16c0a23620
uniform_bytes = d2ecef3635d2397f34a9f86438d772db19ffe9924e28a1ca
          f6f1c8f15603d4028f40891044e5c7e39ebb9b31339979ff33a424
          9206f67d4a1e7c765410bcd249ad78d407e303675918f20f26ce6d
          7027ed3774512ef5b00d816e51bfcc96c3539601fa48ef1c07e494
          bdc37054ba96ecb9dbd666417e3de289d4f424f502a982

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
len_in_bytes = 0x80
DST_prime = 412717974da474d0f8c420f320ff81e8432adb7c927d9bd082b4
          fb4d16c0a23620
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000713132385f7171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171008000412717974da474d0f8c420f320ff81
          e8432adb7c927d9bd082b4fb4d16c0a23620
uniform_bytes = ed6e8c036df90111410431431a232d41a32c86e296c05d42
          6e5f44e75b9a50d335b2412bc6c91e0a6dc131de09c43110d9180d
          0a70f0d6289cb4e43b05f7ee5e9b3f42a1fad0f31bac6a625b3b5c
          50e3a83316783b649e5ecc9d3b1d9471cb5024b7ccf40d41d1751a
          04ca0356548bc6e703fca02ab521b505e8e45600508d32

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
len_in_bytes = 0x80
DST_prime = 412717974da474d0f8c420f320ff81e8432adb7c927d9bd082b4
          fb4d16c0a23620
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          0000000000000000000000613531325f6161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161008000412717974da474d0f8
          c420f320ff81e8432adb7c927d9bd082b4fb4d16c0a23620
uniform_bytes = 78b53f2413f3c688f07732c10e5ced29a17c6a16f717179f
          fbe38d92d6c9ec296502eb9889af83a1928cd162e845b0d3c5424e
          83280fed3d10cffb2f8431f14e7a23f4c68819d40617589e4c4116
          9d0b56e0e3535be1fd71fbb08bb70c5b5ffed953d6c14bf7618b35
          fc1f4c4b30538236b4b08c9fbf90462447a8ada60be495

~~~

## expand_message_xmd(SHA-512)

~~~

name    = expand_message_xmd
DST     = QUUX-V01-CS02-with-expander-SHA256-256-
hash    = SHA512

msg     = 
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3235362d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000002000515555
          582d5630312d435330322d776974682d657870616e6465722d5348
          413235362d3235362d27
uniform_bytes = 32d8f9080a25c95dd3ac9fe073607a1f7eebea5c275a1f66
          6792412f7969d735

msg     = abc
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3235362d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000616263002000
          515555582d5630312d435330322d776974682d657870616e646572
          2d5348413235362d3235362d27
uniform_bytes = 86cad34f4096891c7badcf34861d8152f8db87c957feb4f9
          a87c05e20d5f573d

msg     = abcdef0123456789
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3235362d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000616263646566
          30313233343536373839002000515555582d5630312d435330322d
          776974682d657870616e6465722d5348413235362d3235362d27
uniform_bytes = 573d81f8ec279ada9fc9652480d1f2de318cde0d89da021f
          4ec2589ec3c0656c

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3235362d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000713132385f71
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          71717171717171717171717171717171717171002000515555582d
          5630312d435330322d776974682d657870616e6465722d53484132
          35362d3235362d27
uniform_bytes = 0ccab23b161e9f85acf4b3ad072e755b046caa844107d27e
          42725b26efcfeda5

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
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3235362d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000613531325f61
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161610020
          00515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3235362d27
uniform_bytes = 798593d106206cac352a8600d5c6f0bc881a7362f64552e0
          3bde4404a68ebb59

msg     = 
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3235362d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000008000515555
          582d5630312d435330322d776974682d657870616e6465722d5348
          413235362d3235362d27
uniform_bytes = b77bbdb97760875d37e1a1a309ee1158e9d7acd47cf6ce57
          f57161775a77878ea63377c5de779d586633a0031b46ae3808e5f2
          8d8cc1d16cba7113b1b6607fa6785190c66f50719ca81bc7dbb751
          67c10356828feb1c4058c76504aabc3ed03cb087008abf7be3dfb2
          d400a12c182bd6dcfa8b5e4435e1bdcc31f4d449bf8a06

msg     = abc
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3235362d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000616263008000
          515555582d5630312d435330322d776974682d657870616e646572
          2d5348413235362d3235362d27
uniform_bytes = 5d494a74c643bfec7388f5dfb42790fa18889efe96be523e
          2abea96d27f34e011d87a88fbbbf44eac0770ab50e1a314c530a59
          db486f098b07b4b4fa7874daa25d20a53730307429be74842d87ee
          4556b5749570eb9d67b97b390a9eb659cddd8d254f33f37d74ce50
          ef39601772b76955db168363a16f60b662e29fbfbeb88e

msg     = abcdef0123456789
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3235362d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000616263646566
          30313233343536373839008000515555582d5630312d435330322d
          776974682d657870616e6465722d5348413235362d3235362d27
uniform_bytes = 37aaea73c203cde13ffd39ba06f4449a81e2cb3bfde98a81
          9f2aa201260149074fc84b20cb01ec0f097945b11253de78994987
          2bf6527f7a35d28d070cad6204bcd1bebea7136adec1d6040b6200
          fe40632cebcf9fb9589f13b3dc1eea741af6acf0484bac58e0a529
          ef36f46f1f659c51231981f69578fd69ac195a2fa9a445

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3235362d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000713132385f71
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          71717171717171717171717171717171717171008000515555582d
          5630312d435330322d776974682d657870616e6465722d53484132
          35362d3235362d27
uniform_bytes = ce6910fffe5af13a83139e2c1d0115c0595904fe4d904c04
          e0b2cd36bde7912af140373ecb4eca0eac8f95284ef49c24a9732c
          1fa4326ce745511a0b91fc1e4bd623dc01aa1acb32c54af57f55b1
          0d2dfc325369887c42b8a1184d92744d29d1bc9f7af72d2eb91ed3
          5c7dee9bda508700095ca94ad8bdee348f6339cc212c6b

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
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3235362d27
msg_prime = 0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000613531325f61
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161610080
          00515555582d5630312d435330322d776974682d657870616e6465
          722d5348413235362d3235362d27
uniform_bytes = f0cdf54f60e6af30db843651aeabf82a0c972dbcb298c076
          8096c153a8606d1372ba0a39f3574769e8ac9813a11f6068c4c291
          729c662bb8b54671085a776e4c36436153285dd3aaf49d00e1c28e
          21d04852c3235068f69a417af8086b75f1e02fe16ee0291a508d1a
          698460670382a0076a5f601ac692e0cc1eb51faaafbaa8

~~~

## expand_message_xof(SHAKE128)

~~~

name    = expand_message_xof
DST     = QUUX-V01-CS02-with-expander-SHAKE128-
hash    = SHAKE128

msg     = 
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453132382d25
msg_prime = 0020515555582d5630312d435330322d776974682d657870616e
          6465722d5348414b453132382d25
uniform_bytes = 09bfdcc4a43ef052d764281d5be5cdf21987ae806157014e
          af51b39e489009cd

msg     = abc
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453132382d25
msg_prime = 6162630020515555582d5630312d435330322d776974682d6578
          70616e6465722d5348414b453132382d25
uniform_bytes = 53df53b24d9fb418bbe5f8bd614a40d44ae43fb1e22e8adc
          49b670d072b8f367

msg     = abcdef0123456789
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453132382d25
msg_prime = 616263646566303132333435363738390020515555582d563031
          2d435330322d776974682d657870616e6465722d5348414b453132
          382d25
uniform_bytes = bdf1a65e4430ac18615195dacef05233f4449e1e0fc4849e
          5598f3e3f74176fa

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453132382d25
msg_prime = 713132385f717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717100
          20515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453132382d25
uniform_bytes = 9a05a60764ba2dbac081d3766e3b5622028d07f2ea8aa9d6
          ddc1321f15cb0d80

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
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453132382d25
msg_prime = 613531325f616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          61616161610020515555582d5630312d435330322d776974682d65
          7870616e6465722d5348414b453132382d25
uniform_bytes = d9a06a67b87767ef74ad85282d2e23ffbcce6230f4e3d03d
          98e08af92c538f04

msg     = 
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453132382d25
msg_prime = 0080515555582d5630312d435330322d776974682d657870616e
          6465722d5348414b453132382d25
uniform_bytes = b5b21182e341bf4c132cd203a23a5310fc86b7b98c90c682
          c5d652607176d9259c54550479910a9a0c33ec9d671572607f4a17
          284139221b218e464973523c7224dcd4c671fedfe63b4a0c89e49a
          f1166a5cdb88c8591cea6493d64cf6b21c167c380a463e2990422d
          45de66c5a49723dcc3c56a607424e86748faec5081406d

msg     = abc
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453132382d25
msg_prime = 6162630080515555582d5630312d435330322d776974682d6578
          70616e6465722d5348414b453132382d25
uniform_bytes = 614bc683ed8cf3edae31a949299995253aa9db7b32792929
          55305bd1cc4c1f7a64b33614e3e2873d184e4d2ac517f7fdddab37
          ff391824ada9d41293c6cd5dec7e3b34071212317f9f1fe3ce1090
          b33135f4fd7b66c125a24eddf6ef5ba6a5ce42ed599d1dd656a532
          5154c18cb74ed6d3552267b95fffb2cac17a1ea61dbbc0

msg     = abcdef0123456789
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453132382d25
msg_prime = 616263646566303132333435363738390080515555582d563031
          2d435330322d776974682d657870616e6465722d5348414b453132
          382d25
uniform_bytes = cb9e515ce360e979f5275443dfb4991930b167824df7dfeb
          3cdb98b2e8da88cd1c2357d9f640d9718f46fde767cdde9ab297a5
          6c2d631f6ac171fc4c47c71c5a9a9d20a73db1c38579cca0ffa201
          3787e3fbda8999c19ece300770ebe05929b44ec9288a613927a01a
          a99b360e551b1e555afef0a6aea685c6aecbe6d479dc09

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453132382d25
msg_prime = 713132385f717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717100
          80515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453132382d25
uniform_bytes = 8a56379bca40541f1df7f6b64d21198d83cbf2beeac3b688
          c6ea18370cc754c04c5b6a861d49284636589c6f5f29321efc2a89
          a6b32b8cec84275932b74d96e675ea55834f8e4e5bcc60173ca1a4
          251bcb43401a4f5750ab936c135a5131b23cdc230393e3b016e9a5
          f136ee99f56c39916f72d660ccf8c0069cc28d9d3981d8

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
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453132382d25
msg_prime = 613531325f616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          61616161610080515555582d5630312d435330322d776974682d65
          7870616e6465722d5348414b453132382d25
uniform_bytes = e37455b4339b7fe6116850260d1bc12d87d1a54bc0d8151f
          9029463f358dca0acd65a7a7658385014a88f7c9cda8c71d86c769
          db6d12097a523f5dbfa99d0edae13054061c4c0e6280425e9542f1
          70d2f7f05c38d533c1d80e9e7ca700c1f3b0d4008159cef2d259a0
          ffc71a6a86dd6a9f273d6b36521d2ae746159a011d2afe

~~~

## expand_message_xof(SHAKE128) (long DST)

~~~

name    = expand_message_xof
DST     = QUUX-V01-CS02-with-expander-SHAKE128-long-DST-11111111
          111111111111111111111111111111111111111111111111111111
          111111111111111111111111111111111111111111111111111111
          111111111111111111111111111111111111111111111111111111
          1111111111111111111111111111111111111111
hash    = SHAKE128

msg     = 
len_in_bytes = 0x20
DST_prime = acb9736c0867fdfbd6385519b90fc8c034b5af04a95897321295
          0132d035792f20
msg_prime = 0020acb9736c0867fdfbd6385519b90fc8c034b5af04a9589732
          12950132d035792f20
uniform_bytes = 827c6216330a122352312bccc0c8d6e7a146c5257a776dbd
          9ad9d75cd880fc53

msg     = abc
len_in_bytes = 0x20
DST_prime = acb9736c0867fdfbd6385519b90fc8c034b5af04a95897321295
          0132d035792f20
msg_prime = 6162630020acb9736c0867fdfbd6385519b90fc8c034b5af04a9
          58973212950132d035792f20
uniform_bytes = 690c8d82c7213b4282c6cb41c00e31ea1d3e2005f93ad19b
          bf6da40f15790c5c

msg     = abcdef0123456789
len_in_bytes = 0x20
DST_prime = acb9736c0867fdfbd6385519b90fc8c034b5af04a95897321295
          0132d035792f20
msg_prime = 616263646566303132333435363738390020acb9736c0867fdfb
          d6385519b90fc8c034b5af04a958973212950132d035792f20
uniform_bytes = 979e3a15064afbbcf99f62cc09fa9c85028afcf3f825eb07
          11894dcfc2f57057

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
len_in_bytes = 0x20
DST_prime = acb9736c0867fdfbd6385519b90fc8c034b5af04a95897321295
          0132d035792f20
msg_prime = 713132385f717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717100
          20acb9736c0867fdfbd6385519b90fc8c034b5af04a95897321295
          0132d035792f20
uniform_bytes = c5a9220962d9edc212c063f4f65b609755a1ed96e62f9db5
          d1fd6adb5a8dc52b

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
len_in_bytes = 0x20
DST_prime = acb9736c0867fdfbd6385519b90fc8c034b5af04a95897321295
          0132d035792f20
msg_prime = 613531325f616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          61616161610020acb9736c0867fdfbd6385519b90fc8c034b5af04
          a958973212950132d035792f20
uniform_bytes = f7b96a5901af5d78ce1d071d9c383cac66a1dfadb508300e
          c6aeaea0d62d5d62

msg     = 
len_in_bytes = 0x80
DST_prime = acb9736c0867fdfbd6385519b90fc8c034b5af04a95897321295
          0132d035792f20
msg_prime = 0080acb9736c0867fdfbd6385519b90fc8c034b5af04a9589732
          12950132d035792f20
uniform_bytes = 3890dbab00a2830be398524b71c2713bbef5f4884ac2e6f0
          70b092effdb19208c7df943dc5dcbaee3094a78c267ef276632ee2
          c8ea0c05363c94b6348500fae4208345dd3475fe0c834c2beac7fa
          7bc181692fb728c0a53d809fc8111495222ce0f38468b11becb15b
          32060218e285c57a60162c2c8bb5b6bded13973cd41819

msg     = abc
len_in_bytes = 0x80
DST_prime = acb9736c0867fdfbd6385519b90fc8c034b5af04a95897321295
          0132d035792f20
msg_prime = 6162630080acb9736c0867fdfbd6385519b90fc8c034b5af04a9
          58973212950132d035792f20
uniform_bytes = 41b7ffa7a301b5c1441495ebb9774e2a53dbbf4e54b9a1af
          6a20fd41eafd69ef7b9418599c5545b1ee422f363642b01d4a5344
          9313f68da3e49dddb9cd25b97465170537d45dcbdf92391b5bdff3
          44db4bd06311a05bca7dcd360b6caec849c299133e5c9194f4e15e
          3e23cfaab4003fab776f6ac0bfae9144c6e2e1c62e7d57

msg     = abcdef0123456789
len_in_bytes = 0x80
DST_prime = acb9736c0867fdfbd6385519b90fc8c034b5af04a95897321295
          0132d035792f20
msg_prime = 616263646566303132333435363738390080acb9736c0867fdfb
          d6385519b90fc8c034b5af04a958973212950132d035792f20
uniform_bytes = 55317e4a21318472cd2290c3082957e1242241d9e0d04f47
          026f03401643131401071f01aa03038b2783e795bdfa8a3541c194
          ad5de7cb9c225133e24af6c86e748deb52e560569bd54ef4dac034
          65111a3a44b0ea490fb36777ff8ea9f1a8a3e8e0de3cf0880b4b2f
          8dd37d3a85a8b82375aee4fa0e909f9763319b55778e71

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
len_in_bytes = 0x80
DST_prime = acb9736c0867fdfbd6385519b90fc8c034b5af04a95897321295
          0132d035792f20
msg_prime = 713132385f717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717100
          80acb9736c0867fdfbd6385519b90fc8c034b5af04a95897321295
          0132d035792f20
uniform_bytes = 19fdd2639f082e31c77717ac9bb032a22ff0958382b2dbb3
          9020cdc78f0da43305414806abf9a561cb2d0067eb2f7bc544482f
          75623438ed4b4e39dd9e6e2909dd858bd8f1d57cd0fce2d3150d90
          aa67b4498bdf2df98c0100dd1a173436ba5d0df6be1defb0b2ce55
          ccd2f4fc05eb7cb2c019c35d5398b85adc676da4238bc7

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
len_in_bytes = 0x80
DST_prime = acb9736c0867fdfbd6385519b90fc8c034b5af04a95897321295
          0132d035792f20
msg_prime = 613531325f616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          61616161610080acb9736c0867fdfbd6385519b90fc8c034b5af04
          a958973212950132d035792f20
uniform_bytes = 945373f0b3431a103333ba6a0a34f1efab2702efde41754c
          4cb1d5216d5b0a92a67458d968562bde7fa6310a83f53dda138368
          0a276a283438d58ceebfa7ab7ba72499d4a3eddc860595f63c93b1
          c5e823ea41fc490d938398a26db28f61857698553e93f0574eb8c5
          017bfed6249491f9976aaa8d23d9485339cc85ca329308

~~~

## expand_message_xof(SHAKE256)

~~~

name    = expand_message_xof
DST     = QUUX-V01-CS02-with-expander-SHAKE256-
hash    = SHAKE256

msg     = 
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453235362d25
msg_prime = 0020515555582d5630312d435330322d776974682d657870616e
          6465722d5348414b453235362d25
uniform_bytes = 1869f14f12a2ddb429dac9633dbf0df53093c39d05599e0a
          4e5af6d439d0f19c

msg     = abc
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453235362d25
msg_prime = 6162630020515555582d5630312d435330322d776974682d6578
          70616e6465722d5348414b453235362d25
uniform_bytes = 03dd73852f7d7ab3146c9676103b5c9c36441411249f5558
          a0d675f2b7cb25c7

msg     = abcdef0123456789
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453235362d25
msg_prime = 616263646566303132333435363738390020515555582d563031
          2d435330322d776974682d657870616e6465722d5348414b453235
          362d25
uniform_bytes = b832d5f8ba2d196a9648ceca1dfd4b067a8bc2d2e949ef25
          78056555170aa7b4

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453235362d25
msg_prime = 713132385f717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717100
          20515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453235362d25
uniform_bytes = d6a574f26f26d8084ea38be37303680d504751a9e9abc4b3
          5af88957d9e79669

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
len_in_bytes = 0x20
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453235362d25
msg_prime = 613531325f616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          61616161610020515555582d5630312d435330322d776974682d65
          7870616e6465722d5348414b453235362d25
uniform_bytes = b0c3ad571c74f896af8a7beb4c88ad2064135b87118a4ca6
          fe380e768101ee27

msg     = 
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453235362d25
msg_prime = 0080515555582d5630312d435330322d776974682d657870616e
          6465722d5348414b453235362d25
uniform_bytes = 4ee6c1926313b9ff71ca38fcebc7f26028174d659eb3a43d
          c5cb7548fd8ed0fe31602b3211a346351eaf22f3fee739220a3fe8
          4007b58cc8d44b247c0544d7e744f3737b1929aac7a5ce6ca30c95
          a5e3a1362ba0a18f44077fa8b4c3351915c311d34d8c636cd434dd
          a76daf7b22508fbc042a170aa242ef8c92d4d513d85787

msg     = abc
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453235362d25
msg_prime = 6162630080515555582d5630312d435330322d776974682d6578
          70616e6465722d5348414b453235362d25
uniform_bytes = 0baffa6a0cbeea9ff50aa4df09f336c5aebb8a10cd524261
          14e68d73484bc08fa0d9182248fbf0d5476f9d0944d3ca890e1d89
          b2798c33b9c983c6a52251ec45aab7812c6f44d1f93f7185c5cc55
          9c9341d725e8e9c6b596b7f1699a7b888530ee2f76b7efedf19578
          d6f9ece342aded8b811f683c4ea65cf96516f695e62e64

msg     = abcdef0123456789
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453235362d25
msg_prime = 616263646566303132333435363738390080515555582d563031
          2d435330322d776974682d657870616e6465722d5348414b453235
          362d25
uniform_bytes = 85e7acceaccfd004590aad86df98aaf7bd277fcb51eb6efd
          bb726c0331ef7125bb912d61dfb9dc651a6d97cfa99ed06e2a254b
          cd377a4f3fafaa8e7e86c5d174226e817cd8f5e2d310bea2cd0d6c
          7d22fa78dbe01f3130299fb05582ee1db13bad29d3cf13c86443da
          e972f6374bfa1bf54f40194da24ec83d6698d09745d8a3

msg     = q128_qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
          qqqqqqqqqqqqqqqqqqqqqqqqq
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453235362d25
msg_prime = 713132385f717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717171
          717171717171717171717171717171717171717171717171717100
          80515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453235362d25
uniform_bytes = f9fcd53d8bb08a74b66bfdd4406d5fd2732dc1d8d918d0e7
          cefed88d7be446755e066b6f9e9f4046a91110a6e5d376c22b5346
          b0fccb36dea7625112877429b1f167fcb8cc1d83e00318ab2ca7f8
          7ab9a187e60b82f61994ddb178feb900c953579e85ba3098280641
          d2361182459353e3d2e89c8e4cede84bd0153332c1a752

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
len_in_bytes = 0x80
DST_prime = 515555582d5630312d435330322d776974682d657870616e6465
          722d5348414b453235362d25
msg_prime = 613531325f616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          616161616161616161616161616161616161616161616161616161
          61616161610080515555582d5630312d435330322d776974682d65
          7870616e6465722d5348414b453235362d25
uniform_bytes = d697628d23b93693d32c7efbea577a67cb84e2d7632f7880
          04f524517b279f3db3a507bf4c1d2480d169510d773b7707efba5f
          b10997967931c066f1b5f4ac6067bb502e6913333c231b8897dfd6
          0f07d68393f1eb7e109b3e5b5a36fc4763a17e3518a7686df8525a
          9647e6f00934d7aab3260a77806a03c3260ce9d35bfe21

~~~
