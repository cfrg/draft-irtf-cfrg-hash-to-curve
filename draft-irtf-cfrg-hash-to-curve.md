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
informative:
  RFC7748:
  SECG1:
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
  FIPS186-4:
    title: "FIPS Publication 186-4: Digital Signature Standard"
    target: https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.186-4.pdf
    date: Jul, 2013
    author:
      -
        org: National Institute of Standards and Technology (NIST)
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
  M87:
    title: Speeding the Pollard and clliptic curve methods of factorization
    seriesinfo:
        "In": Mathematics of Computation, vol 48
        "pages": 243-264
        DOI: 10.1090/S0025-5718-1987-0866113-7
    target: https://doi.org/10.1090/S0025-5718-1987-0866113-7
    date: 1987
    author:
      -
        ins: P. L. Montgomery
        name: Peter L. Montgomery
        org: System Development Corporation, Santa Monica, CA
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
        ins: P. Fouque
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
        ins: P. Fouque
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
        ins: P. Fouque
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
  KSS08:
    title: Constructing Brezing-Weng Pairing-Friendly Elliptic Curves Using Elements in the Cyclotomic Field
    seriesinfo:
        "In": Pairing-Based Cryptography - Pairing 2008
        "pages": 126-135
        DOI: 10.1007/978-3-540-85538-5_9
    target: https://doi.org/10.1007/978-3-540-85538-5_9
    date: 2008
    author:
      -
        ins: E. J. Kachisa
        name: Ezekiel J. Kachisa
        org: School of Computing, Dublin City University, Ireland
      -
        ins: E. F. Schaefer
        name: Edward F. Schaefer
        org: Department of Mathematics and Computer Science of Santa Clara University, USA
      -
        ins: M. Scott
        name: Michael Scott
        org: School of Computing, Dublin City University, Ireland
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
  L13:
    title: Implementing Elligator for Curve25519
    target: https://www.imperialviolet.org/2013/12/25/elligator.html
    date: 2013
    author:
      -
        ins: A. Langley
        name: Adam Langley
  SBCDBK09:
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
        ins: N. Benger
        name: Naomi Benger
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
  BP18:
    title: Hashing to G2 on BLS pairing-friendly curves
    seriesinfo:
        "In": ACM Communications in Computer Algebra
        "pages": 63-66
        DOI: 10.1145/3313880.3313884
    target: https://doi.org/10.1145/3313880.3313884
    date: Sep, 2018
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
        ins: J. S. Coron
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
        "Technical report": ePrint 2019/403
    target: https://eprint.iacr.org/2019/403
    date: 2019
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

--- abstract

This document specifies a number of algorithms that may be used to encode or hash an
arbitrary string to a point on an Elliptic Curve.

--- middle

# Introduction {#introduction}

Many cryptographic protocols require a procedure which encodes arbitrary input,
e.g., a password, to a point on an elliptic curve. This procedure is known
as hashing to an elliptic curve. Prominent examples of cryptosystems that
hash to elliptic curves include Simple Password Exponential Key Exchange
{{J96}}, Password Authenticated Key Exchange {{BMP00}}, Identity-Based
Encryption {{BF01}} and Boneh-Lynn-Shacham signatures {{BLS01}}.

Unfortunately for implementors, the precise encoding which is suitable for a
given scheme is not necessarily included in the description of the protocol.
Compounding this problem is the need to pick a suitable curve for the specific
protocol.

This document aims to bridge this gap by providing a thorough set of
recommended algorithms for a range of curve types. We provide
implementation and performance details for each algorithm, describe
the security rationale behind each recommendation, and give guidance for
elliptic curves that are not explicitly covered.

Each algorithm conforms to a common interface: it encodes an arbitrary-length bit string
to a point on an elliptic curve.
Sample code for each algorithm is presented in {{samplecode}}.

## Requirements

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in {{RFC2119}}.

# Background {#background}

## Elliptic curves {#bg-curves}

The following is a brief definition of elliptic curves, with an emphasis on
important parameters and their relation to hashing to curves.
For further reference, consult {{CFADLNV05}} or {{W08}}.

Let F be the finite field GF(q) of prime characteristic p. In most cases F
is a prime field, so q=p. Otherwise, F is a field extension, so q=p^m for
an integer m > 1. This document assumes that elements of field extensions
are written in a primitive element or polynomial basis, i.e., as
of m elements of GF(p) written in ascending order
by degree. For example, if q=p^2 and the primitive element basis is {1, i},
then the vector (a, b) corresponds to the element a + b * i.

An elliptic curve E is specified by a cubic equation in two variables and a
finite field F. An elliptic curve equation takes one of several standard forms,
including (but not limited to) Weierstrass, Montgomery, and Edwards.

The curve E forms an algebraic group whose elements are the
points (x, y) satisfying the curve equation, where x and y are elements of F.
This group has order n, meaning that there are n distinct points.

For security reasons, groups of prime order MUST be used. Elliptic curves
induce subgroups of prime order. Let G be a subgroup of the curve of prime
order r, where n = h * r.
In this equation, h is an integer called the cofactor.
The process of mapping an elliptic curve point to a point in G is
called clearing the cofactor. This operation is described in {{cofactor-clearing}}.

Certain hash-to-curve algorithms restrict the form of the curve equation, the
characteristic of the field, and/or the parameters of the curve. For each
algorithm presented, this document lists the relevant restrictions.

Summary of quantities:

| Symbol | Meaning | Relevance |
|:------:|---------|-----------|
| F,q,p | Finite field F of characteristic p and #F=q=p^m. | For prime fields, q=p; otherwise, q=p^m and m>1. |
| E | Elliptic curve. | E is specified by an equation and a field F. |
| n | Number of points on the elliptic curve E. | n = h * r, for h and r defined below. |
| G | A subgroup of the elliptic curve. | Destination group to which bit strings are mapped. |
| r | Order of G. | This number MUST be prime.  |
| h | Cofactor, h >= 1. | An integer satisfying n = h * r.  |

## Terminology

In this section, we define terms used in the rest of this document.

### Encoding {#term-encoding}

Encoding is the process of computing an elliptic curve point from an input bit string.
An encoding may be deterministic or probabilistic.
Deterministic procedures are generally preferred for security,
because probabilistic encodings can leak information through side channels.

In general, the set of points output by a deterministic encoding procedure
may not be the full set of points on an elliptic curve E
(i.e., it may not be surjective).
Moreover, an encoding procedure may map distinct inputs to the same output
(i.e., it may not be injective).
For example, suppose that the input of an encoding is a bit string of fixed length L.
If 2^L (the number of possible inputs) is not equal to n (the number of points
on the curve) then such an encoding cannot be deterministic, injective, and surjective.
If 2^L < n, however, such an encoding may be bijective (i.e., both injective and surjective)
over a subset of the points on E.

Encodings may be invertible, meaning that there is an efficient method of recovering
a bit string msg from any point P produced by the encoding, such that applying the
encoding to x yields P.
This document does not discuss inversion algorithms; the encodings herein
are designed to be difficult to invert, since this is a standard security
requirement for cryptographic hash functions.

### Random Oracle {#term-rom}

In practice, two types of encodings are possible: nonuniform encodings,
whose output distribution is not uniformly random, and random-oracle encodings,
whose output distribution is indistinguishable from uniformly random.
Some protocols require a random oracle for security, while others can
be securely instantiated with a nonuniform encoding.
When the required encoding is not clear, applications SHOULD use a random oracle.

Care is required when constructing a random oracle from an encoding function.
A simple but insecure approach is to use the output of a cryptographically
secure hash function H as the input to the encoding function.
Because H is cryptographically secure, such a construction is infeasible to invert.
But because in general the encoding function maps only to a subset of points on the
curve, the output of this construction is easily distinguished from uniformly
random, i.e., it does not behave like a random oracle.

Brier et al. {{BCIMRT10}} describe two generic constructions whose outputs are
indistinguishable from a random oracle. Farashahi et al. {{FFSTV13}}
and Tibouchi and Kim {{TK17}} refine the analysis of one of these constructions.
That construction is described in {{roadmap}}.

### Serialization {#term-serialization}

A related task is the conversion of an elliptic curve point to a bit string,
called serialization, which is typically used for compactly
storing and transporting points.
For example, {{SECG1}} gives a standard method for serializing points.
The reverse operation, deserialization, converts a bit string to an elliptic
curve point.

Deserialization is different from encoding in that only certain strings, i.e.,
those output by the serialization procedure, can be deserialized.
In contrast, this document is concerned with encodings from arbitrary bit strings
to elliptic curve points.
This document does not cover serialization or deserialization.

# Roadmap {#roadmap}

This section presents a general framework for mapping bit strings into points
on an elliptic curve. To construct these mappings, we rely on three basic
functions:

-   The function hash\_to\_base, {0, 1}^\* -> F, maps arbitrary-length bit strings
    to elements of a finite field; its implementation is defined in
    {{hashtobase}}.

-   The function map\_to\_curve, F -> E, calculates a point on the elliptic curve E
    from an element of the finite field F over which E is defined.
    {{encodings}} describes mappings for a range of curve families.

-   The function clear\_cofactor, E -> G, maps any point on the curve E to a
    subgroup G of the curve. {{cofactor-clearing}} describes methods to perform
    this operation.

We describe two high-level encoding functions that map from bit strings to points on
an elliptic curve. Although these functions have the same interface, the
distributions of the points they produce are different.

-   Nonuniform encoding (encode\_to\_curve). This function maps bit strings to points in G.
    The distribution of the output is not uniformly random in G.

~~~
encode_to_curve(alpha)

Input: alpha, an arbitrary-length bit string.
Output: P, a point in G.

Steps:
1. u = hash_to_base(alpha, 0)
2. Q = map_to_curve(u)
3. P = clear_cofactor(Q)
4. return P
~~~

-   Random oracle (hash\_to\_curve). This function maps bit strings to points in G.
    The distribution of the output is indistinguishable from uniformly random in G.

~~~
hash_to_curve(alpha)

Input: alpha, an arbitrary-length bit string.
Output: P, a point in G.

Steps:
1. u0 = hash_to_base(alpha, 0)
2. u1 = hash_to_base(alpha, 1)
3. Q0 = map_to_curve(u0)
4. Q1 = map_to_curve(u1)
5. R = Q0 + Q1
6. P = clear_cofactor(R)
7. return P
~~~

Instances of these functions are given in {{suites}}, which defines a list of
suites that specify a full set of parameters matching elliptic curves and
algorithms.

# Utility Functions {#utility}

Algorithms in this document make use of utility functions described below.

-   CMOV(a, b, c): If c=0, CMOV returns a, otherwise returns b. To prevent
    against timing attacks, this operation must run in constant time without
    revealing the value of c. Commonly, implementations assume that the selector
    is c=1 or c=0. In this case, given a bit string C, the desired selector c can
    be computed by OR-ing all bits of C together. The resulting selector will be
    either 0 if all bits of C are zero, or 1 if at least one bit of C is 1.

-   is\_square(x, q): This function returns True whenever the value x is a
    square in GF(q). Due to Euler's criterion, this function can be calculated
    in constant time as

~~~
is_square(x, q) := { True,  if x^((q - 1) / 2) is 0 or 1;
                   { False, otherwise.
~~~

-   sqrt(x, q): The sqrt operation is a multi-valued function, i.e. there exist
    two roots of x whenever x is square.
    To maintain compatibility across implementations while allowing implementors
    leeway for optimizations, this document does not require sqrt() to return a
    particular value. Instead, as explained in {{point-sign}}, any higher-level
    function that computes square roots also specifies how to determine the sign
    of the result.

    The preferred way of computing square roots is to fix a deterministic
    algorithm particular to q. We give algorithms for the three most common
    cases immediately below; other cases are analogous.

    Note that Case 3 below applies to GF(p^2) when p = 3 mod 8.
    {{AR13}} and {{S85}} describe methods that work for other field extensions.
    Regardless of the method chosen, the sqrt function MUST be performed in
    constant time.

~~~
s = sqrt(x, q)

Input: x, an element of F.
Output: s, an element of F such that s * s = x.

======

Case 1: q = 3 (mod 4)

Procedure:
1. return x^((q + 1) / 4)

======

Case 2: q = 5 (mod 8)

Constants:
1. c1 = sqrt(-1) in F, i.e., c1 * c1 = -1 mod q.

Procedure:
1. t1 = x^((q + 3) / 8)
2. e  = t1 * t1 == x
3. s  = CMOV(t1 * c1, t1, e)
3. return s

======

Case 3: q = 9 (mod 16)

Constants:
1. c1 = sqrt(-1) in F, i.e., c1 * c1 = -1 mod q.
2. c2 = sqrt(sqrt(-1)) in F, i.e., c2 * c2 = c1 mod q.
3. c3 = sqrt(-sqrt(-1)) in F, i.e., c3 * c3 = -c1 mod q.

Procedure:
1.  t1 = x^((q + 7) / 16)
2.  t2 = c1 * t1
3.  t3 = c2 * t1
4.  t4 = c3 * t1
5.  e1 = t2 * t2 == x
6.  e2 = t3 * t3 == x
7.  t1 = CMOV(t1, t2, e1)  // select t2 if t2 * t2 == x
8.  t2 = CMOV(t4, t3, e2)  // select t3 if t3 * t3 == x
9.  e3 = t2 * t2 == x
10. s  = CMOV(t1, t2, e3)  // select the sqrt from t1 and t2
11. return s
~~~

-   sgn0(x): This function returns either +1 or -1, indicating the sign of x.
    This function considers 0 to be positive.
    The following procedure implements sgn0(x) in constant time.
    See {{bg-curves}} for a discussion of representing x as a vector.

~~~
sgn0(x)

Parameters:
  1. F, a finite field of characteristic p and order q = p^m, m >= 1.
Input: x, an element of F.
Output: -1 or 1.

Notation: x_i is the i^th element of the vector representation of x.

Steps:
1. sign = 0
2. for i in (m, m - 1, ..., 1):
3.   sign_i = CMOV(1, -1, x_i > (p - 1) / 2)
4.   sign_i = CMOV(sign_i, 0, x_i == 0)
5.   sign = CMOV(sign, sign_i, sign == 0)
6. return CMOV(sign, 1, sign == 0)    # regard x = 0 as positive
~~~

-   inv0(x, q): This function returns the multiplicative inverse of x mod q,
    extended to all of F by fixing inv0(0) == 0.
    To implement inv0 in constant time, compute alpha = x^(q - 2) mod q.
    Notice on input 0, the output is 0 as required.

-   I2OSP and OS2IP: These functions are used to convert an octet string to
    and from a non-negative integer as described in {{RFC8017}}.

-   a \|\| b: denotes the concatenation of bit strings a and b.

# Hashing to a Finite Field {#hashtobase}

The hash\_to\_base(msg) function maps a string msg of any length into an element of a
field F. This function is parametrized by the field F ({{bg-curves}}) and by H,
a cryptographic hash function that outputs b bits.

## Security considerations {#hashtobase-sec}

For security, hash\_to\_base should be collision resistant, and should map its
input to a uniformly random element of F. To this end, hash\_to\_base requires
a cryptographic hash function H which satisfies the following properties:

1. The number of bits output by H should be b >= 2 * k for sufficient collision
resistance, where k is the target security level in bits. (This is needed for a
birthday bound of approximately 2^(-k).)
2. H is modeled as a random oracle, so its output must be indistinguishable
from a uniformly random bit string.

For example, for 128-bit security, b >= 256 bits; in this case, SHA256 would
be an appropriate choice for H.

Ensuring that the hash\_to\_base output is a uniform random element of F requires
care, even when H outputs a uniformly random string. For example,
if H=SHA256 and F is a field of characteristic p = 2^255 - 19, then the
result of reducing H(msg) (a 256-bit integer) modulo p is slightly more likely
to be in \[0, 38\] than if the value were selected uniformly at random.
In this example the bias is negligible, but in general it can be significant.

To control bias, the input msg should be hashed to an integer comprising at
least ceil(log2(p)) + k bits; reducing this integer modulo p gives bias at
most 2^-k, which is a safe choice for a cryptosystem with k-bit security.
To obtain such an integer, hash H with b-bit output should be evaluated W =
ceil((ceil(log2(p)) + k) / b) times and the results concatenated to produce a
(W * b)-bit integer. For example, for H=SHA256, k=128-bit security, and p
a 256-bit prime, W = ceil((256 + 128) / 256) = 2.

{{hashtobase-impl}} details the hash\_to\_base procedure.

Note that implementors SHOULD NOT use rejection sampling to generate a uniformly
random element of F.
The reason is that these procedures are difficult to implement in constant time,
and later well-meaning "optimizations" may silently render an implementation
non-constant-time.

## Performance considerations {#hashtobase-perf}

Since hash\_to\_base may invoke H multiple times ({{hashtobase-sec}}), its
performance may be limited by the length of the input msg.
To address this, hash\_to\_base first computes H(msg) and then derives the
required bits from this value via further invocations of H.
For short messages this entails one extra invocation of H, which is a
negligible overhead in the context of hashing to elliptic curves.

A related issue is that the random oracle construction of {{term-rom}} requires
evaluating two independent hash functions H0 and H1 on msg.
A standard way to instantiate independent hashes is to append a counter to
the value being hashed, e.g., H(msg || 0) and H(msg || 1).
If msg is long, however, this is either inefficient (because it entails hashing
msg twice) or requires non-black-box use of H (e.g., partial evaluation).

To sidestep both of these issues, hash\_to\_base takes a second argument, ctr,
which it appends to H(msg) rather than to msg.
This means that two invocations of hash\_to\_base on the same msg with different
ctr values both start by computing the value H(msg).
This is an improvement because it allows sharing one evaluation of H(msg) among
multiple invocations of hash\_to\_base, by factoring out the common computation.

## Implementation {#hashtobase-impl}

The following procedure implements hash\_to\_base.

~~~
hash_to_base(msg, ctr)

Parameters:
- H, a cryptographic hash function producing b bits.
- F, a finite field of characteristic p and order q=p^m.
- W = ceil((ceil(log2(p)) + k) / b), where k is the security
  parameter of the cryptosystem (e.g., k = 128).

Inputs:
- msg is the message to hash.
- ctr is either 0 or 1.
  This is used to efficiently create independent
  instances of hash_to_base (see discussion above).

Output: u, an element in F.

Steps:
1. m' = H(msg) || I2OSP(ctr, 1)
2. for i in (1, ..., m):
3.   t = ""     // initialize t to the empty string
4.   for j in (1, ..., W):
5.     t = t || H( m' || I2OSP(i, 1) || I2OSP(j, 1) )
6.   e_i = OS2IP(t) mod p
7. return u = ( e_1, ..., e_m )
~~~

# Deterministic Encodings  {#encodings}

## Interface

The generic interface shared by all encodings in this section is as follows:

~~~
(x, y) = map_to_curve(u)
~~~

The output (x, y) specifies a point on an elliptic curve defined over base field F;
x and y are elements of F.
Note that the output (x, y) is not a uniformly random point. If uniformity
is required for security, the random oracle construction of {{roadmap}} MUST be
used instead.

## Notation

As a rough style guide the following convention is used:

- All arithmetic operations are performed over a field F, unless
  explicitly stated otherwise.

- u: the input to the encoding function.
  This is an element of F produced by the hash\_to\_base function.

- (x, y): are the affine coordinates of a point obtained by the encoding method.
  Indexed values are used when the algorithm calculates some candidate values.

- t1, t2, ...: are reusable temporary variables. For notable variables,
    distinct names are used easing the debugging process when correlating with
    test vectors.

- c1, c2, ...: are constant values, which can be computed in advance.


## Sign of the resulting point {#point-sign}

In general, elliptic curves have equations of the form y^2 = g(x).
Most of the encodings in this section first identify an x such that
g(x) is square, then take a square root to find y. Since there
are two square roots when g(x) != 0, this results in an ambiguity
regarding the sign of y.

To resolve this ambiguity, the encodings in this section specify
the sign of the y-coordinate in terms of the input to the encoding function.
Two main reasons support this approach. First, this covers elliptic curves over
any field in a uniform way, and second, it gives implementors leeway to optimize
their square-root implementations.

## Exceptional cases {#map-exceptions}

Encodings may have have exceptional cases, i.e., inputs u
on which the encoding is undefined. These cases must be handled
carefully, especially for constant-time implementations.

For each encoding in this section, we discuss the exceptional cases and show
how to handle them in constant time. Note that all implementations SHOULD use
inv0 ({{utility}}) to compute multiplicative inverses, to avoid exceptional
cases that result from attempting to compute the inverse of 0.

## Encodings for Weierstrass curves

The following encodings apply to elliptic curves defined by the equation
E: y^2 = g(x) = x^3 + A * x + B, where 4 * A^3 + 27 * B^2 != 0.

### Icart Method {#icart}

The function map\_to\_curve\_icart(alpha) implements the Icart encoding method from {{Icart09}}.

Preconditions: An elliptic curve over F, such that p>3 and q=p^m=2 (mod 3), or
p=2 (mod 3) and odd m.

Constants: A and B, the parameters of the Weierstrass curve.

Sign of y: this encoding does not compute a square root, so there
is no ambiguity regarding the sign of y.

Exceptions: The only exceptional case is u == 0.
Implementations must detect this case by testing whether u == 0
and setting u = 1 if so.

Operations:

~~~
1. If u == 0, set u = 1
2. v = (3 * A - u^4) / (6 * u)
3. x = (v^2 - B - (u^6 / 27))^((2 * p - 1) / 3) + (u^2 / 3)
4. y = u * x + v
5. return (x, y)
~~~

#### Implementation

The following procedure implements Icart's algorithm in a straight-line fashion.

~~~
map_to_curve_icart(u)
Input: u, an element of F.
Output: (x, y), a point on E.

Constants:
1. c1 = (2 * p - 1) / 3   // Integer arithmetic
2. c2 = 1 / 3
3. c3 = c2^3
4. c4 = 3 * A

Steps:
1.   e = u == 0
2.   u = CMOV(u, 1, e)  // handle exceptional case u == 0
3.  u2 = u^2            // u^2
4.  u4 = u2^2           // u^4
5.   v = c4 - u4        // 3 * A - u^4
6.  t1 = 6 * u          // 6 * u
7.  t1 = inv0(t1)       // 1 / (6 * u)
8.   v = v * t1         // v = (3 * A - u^4) / (6 * u)
9.  x1 = v^2            // v^2
10. x1 = x1 - B         // v^2 - B
11. u6 = u4 * c3        // u^4 / 27
12. u6 = u6 * u2        // u^6 / 27
13. x1 = x1 - u6        // v^2 - B - u^6 / 27
14. x1 = x^c1           // (v^2 - B - u^6 / 27)^(1 / 3)
15. t1 = u2 * c2        // u^2 / 3
16.  x = x + t1         // x = (v^2 - B - u^6 / 27)^(1 / 3) + (u^2 / 3)
17.  y = u * x          // u * x
18.  y = y + v          // y = u * x + v
19. return (x, y)
~~~

### Simplified Shallue-van de Woestijne-Ulas Method {#simple-swu}

The function map\_to\_curve\_simple\_swu(alpha) implements a simplification
of the Shallue-van de Woestijne-Ulas encoding {{U07}} described by Brier et
al. {{BCIMRT10}}, which they call the "simplified SWU" map. Wahby and Boneh
{{WB19}} generalize this encoding to curves over fields of odd characteristic p > 3.

Preconditions: A Weierstrass curve over F such that A!=0 and B!=0.

Constants:

- A and B, the parameters of the Weierstrass curve.

- Z, the smallest (in absolute value) non-square in F such that g(B / (Z *
  A)) is square in F, breaking ties by choosing the positive value.

Sign of y: Inputs u and -u give the same x-coordinate.
Thus, we set sgn0(y) == sgn0(u).

Exceptions: The exceptional cases are values of u such that
Z^2 * u^4 + Z * u^2 == 0. This includes u == 0, and may include
other values depending on Z. Implementations must detect
this case and set x1 = B / (Z * A), which guarantees that g(x1)
is square by the condition on Z given above.

Operations:

~~~
1. den = inv0(Z^2 * u^4 + Z * u^2)
2.  x1 = (-B / A) * (1 + den)
3.  If den == 0, set x1 = B / (Z * A)
4. gx1 = x1^3 + A * x1 + B
5.  x2 = Z * u^2 * x1
6. gx2 = x2^3 + A * x2 + B
7.  If gx1 is square, set x = x1 and y = sqrt(gx1)
8.  If gx2 is square, set x = x2 and y = sqrt(gx2)
9.  If sgn0(u) != sgn0(y), set y = -y
10. return (x, y)
~~~

#### Implementation

The following procedure implements the simplified SWU algorithm in a
straight-line fashion. This implementation is optimized for the case
that q = 3 (mod 4), which applies to P-256.
For discussion of how to generalize to q = 1 (mod 4), see
{{WB19}} (Section 4) or the example code found at {{hash2curve-repo}}.

~~~
map_to_curve_simple_swu(u)
Input: u, an element of F.
Output: (x, y), a point on E.

Precondition: q = 3 (mod 4)

Constants:
1.  c1 = -B / A
2.  c2 = -1 / Z
3.  c3 = sqrt(-Z^3)

Steps:
1.   t1 = Z * u^2
2.   t2 = t1^2
3.   x1 = t1 + t2
4.   x1 = inv0(x1)
5.   e1 = x1 == 0
6.   x1 = x1 + 1
7.   x1 = CMOV(x1, c2, e1)   // if (t1 + t2) == 0, set x1 = -1 / Z
8.   x1 = x1 * c1      // x1 = (-B / A) * (1 + (1 / (Z^2 * u^4 + Z * u^2)))
9.  gx1 = x1^2
10. gx1 = gx1 + A
11. gx1 = gx1 * x1
12. gx1 = gx1 + B            // gx1 = g(x1) = x1^3 + A * x1 + B
13.  x2 = t1 * x1            // x2 = Z * u^2 * x1
14.  t3 = gx1^((p + 1) / 4)  // if gx1 is square, this is sqrt(g(x1))
15.  t4 = t3 * c3
16.  t4 = t4 * u^3           // if gx1 is not square, this is sqrt(g(x2))
17.  e3 = t3^2 == gx1
18.   x = CMOV(x2, x1, e3)   // if e2 == True, x = x1, else x = x2
19.   y = CMOV(t4, t3, e3)   // if e2 == True, y = t3, else y = t4
20.  e4 = sgn0(u) == sgn0(y)
21.   y = CMOV(-y, y, e4)
22. return (x, y)
~~~

## Encodings for Montgomery curves

### Elligator 2 Method {#elligator2}

The function map\_to\_curve\_elligator2(alpha) implements Elligator 2 {{BHKL13}} for
curves defined by y^2 = x^3 + A * x^2 + B * x such that A * B * (A^2 - 4 * B) != 0
and A^2 - 4 * B is non-square in F.

Preconditions: A Montgomery curve where A != 0, B != 0, and A^2 - 4 is non-square in F.

Constants:

- A and B, the parameters of the curve

- Z, the smallest (in absolute value) non-square in F, breaking ties by choosing
  the positive value.

Sign of y: Inputs u and -u give the same x-coordinate.
Thus, we set sgn0(y) == sgn0(u).

Exceptions: The exceptional case is Z * u^2 == -1, i.e., 1 + Z * u^2 == 0.
Implementations must detect this case and set x1 = -A.
Note that this can only happen when q = 3 (mod 4).

Operations:

~~~
1.  x1 = -A * inv0(1 + Z * u^2)
2.  If x1 == 0, set x1 = -A.
3. gx1 = x1^3 + A * x1^2 + B * x1
4.  x2 = -x1 - A
5. gx2 = x2^3 + A * x2^2 + B * x2
6.  If is_square(gx1), set x = x1 and y = sqrt(gx1)
7.  If is_square(gx2), set x = x2 and y = sqrt(gx2)
8.  If sgn0(u) != sgn0(y), set y = -y
9.  return (x, y)
~~~

#### Implementation, q=3 (mod 4)

The following procedure implements Elligator 2 in a straight-line
fashion for curves where q=3 (mod 4), including Curve448.

~~~
map_to_curve_elligator2_3mod4(u)
Input: u, an element of F.
Output: (x, y), a point on E.

Constants:
1. c1 is Z^((q + 1) / 4) in F.

Steps:
1.   x1 = u^2
2.   x1 = Z * x1
3.   x1 = x1 + 1
4.   x1 = inv0(x1)
5.   e1 = x1 == 0
6.   x1 = CMOV(x1, 1, e1)     // if x1 == 0, set x1 == 1
7.   x1 = -A * x1             // x1 = -A / (1 + Z * u^2)
8.  gx1 = x1 + A
9.  gx1 = gx1 * x1
10. gx1 = gx1 + B
11. gx1 = gx1 * x1            // gx1 = x1^3 + A * x1^2 + B * x1
12.  y1 = gx1^((q + 1) / 4)
13.  x2 = -x1 - A
14.  y2 = y1 * u
15.  y2 = y2 * c1
16.  e2 = y1^2 == gx1
17.   x = CMOV(x2, x1, e2)    // If e == True, x=x1, else x=x2
18.   y = CMOV(y2, y1, e2)    // If e == True, y=y1, else y=y2
19.  e3 = sgn0(u) == sgn0(y)  // fix sign of y
20.   y = CMOV(-y, y, e3)
21. return (x, y)
~~~

#### Implementation, q=5 (mod 8)

The following is a straight-line implementation of Elligator 2
for curves where q=5 (mod 8), including Curve25519.

~~~
map_to_curve_elligator2_5mod8(u)
Input: u, an element of F.
Output: (x, y), a point on E.

Constants:
1. c1 is Z^((q + 3) / 8) in F.
2. c2 is sqrt(-1) in F.

Steps:
1.   t1 = u^2
2.   t1 = Z * t1
3.   x1 = t1 + 1
4.   x1 = inv0(x1)            // cannot be 0 because q=5 mod 8
5.   x1 = -A * x1             // x1 = -A / (1 + Z * u^2)
6.  gx1 = x1 + A
7.  gx1 = gx1 * x1
8.  gx1 = gx1 + B
9.  gx1 = gx1 * x1            // gx1 = x1^3 + A * x1^2 + B * x1
10. y11 = gx1^((q + 3) / 8)
11. y12 = c2 * y11
12.  e1 = y12^2 == gx1
13.  y1 = CMOV(y11, y12, e1)  // if gx1 is square, this is its sqrt
14.  x2 = -x1 - A
15. y21 = y11 * u
16. y21 = y21 * c1
17. y22 = c2 * y21
18. gx2 = t1 * gx1
19.  e2 = y22^2 == gx2
20.  y2 = CMOV(y21, y22, e2)  // if gx2 is square, this is its sqrt
21.  e3 = y1^2 == gx1
22.   x = CMOV(x2, x1, e3)    // if e == True, x=x1, else x=x2
23.   y = CMOV(y2, y1, e3)    // if e == True, y=y1, else y=y2
24.  e4 = sgn0(u) == sgn0(y)  // fix sign of y
25.   y = CMOV(-y, y, e4)
26. return (x, y)
~~~

## Encodings for twisted Edwards curves

### Elligator 2 Method {#ell2edwards}

Twisted Edwards curves and Montgomery curves are closely related: every
twisted Edwards curve is birationally equivalent to a Montgomery curve
({{BBJLP08}}, Theorem 3.2). To hash to a twisted Edwards curve, hash
to the equivalent Montgomery curve and evaluate the rational map to
obtain a point on the twisted Edwards curve.

For a twisted Edwards curve given by a * x^2 + y^2 = 1 + d * x^2 * y^2,
first compute A and B, the parameters of the equivalent Montgomery curve,
as follows:

- A = (a + 2) / 2
- B = (a - d)^2 / 16

Next, use A and B as the curve parameters in the Elligator 2 method of
{{elligator2}} to obtain a point (x', y') on the Montgomery curve.
Finally, convert (x', y') to a point (x, y) on the target curve.
Letting B' = 4 / (a - d), compute

- x = x' / y'
- y = (B' * x' - 1) / (B' * x' + 1)

This can be done in one inversion using Montgomery's trick {{M87}}:
invert the product y' * (B' * x' + 1), then multiply by y' to obtain
1 / (B' * x' + 1), and likewise for 1 / y'.

Preconditions: A twisted Edwards curve.

Constants:

- A and B, the parameters of the equivalent Montgomery curve, and B' = 1 / sqrt(B).

- Z, the smallest (in absolute value) non-square in F, breaking ties by choosing
  the positive value.

Sign of y: for this map, the sign is determined by map\_to\_curve_elligator2.
No further sign adjustments are required.

Exceptions: The exceptions for the Elligator 2 encoding are as given in
{{elligator2}}. When converting to a point on the twisted Edwards curve, the remaining exceptions
are y' == 0 or B' * x' == -1. Implementors must detect these cases and return (x, y) = (0, 1).

The following straight-line implementation handles the exceptional cases:

~~~
1. (x', y') = map_to_curve_elligator2(u)   // a Montgomery point
2.       x' = x' * B'
3.       y' = y' * B'
4.       t1 = x' + 1
5.       t2 = y' * t1
6.       t2 = inv0(t2)
7.        x = t1 * t2
8.        x = x * x'
9.        y = x' - 1
10.       y = y * t2
11.       y = y * y'
12.       e = y == 0
13.       y = CMOV(y, 1, e)
14. return (x, y)
~~~

## Encodings for Supersingular curves

### Boneh-Franklin Method {#supersingular}

The function map\_to\_curve\_bf(alpha) implements the Boneh-Franklin method {{BF01}} which
covers the supersingular curves defined by y^2 = x^3 + B over a field F such
that q=2 (mod 3).

Preconditions: A supersingular curve over F such that q=2 (mod 3).

Constants: B, the parameter of the supersingular curve.

Sign of y: determined by sign of u. No adjustments are necessary.

Exceptions: none.

Operations:

~~~
1. x = (u^2 - B)^((2 * q - 1) / 3)
2. y = u
3. return (x, y)
~~~

#### Implementation

The following procedure implements the Boneh-Franklin's algorithm in a
straight-line fashion.

~~~
map_to_curve_bf(u)
Input: u, an element of F.
Output: (x, y), a point on E.

Constants:
1. c1 = (2 * q - 1) / 3   // Integer arithmetic

Steps:
1. t1 = u^2
2. t1 = t1 - B
3.  x = t1^c1             // x = (u^2 - B)^((2 * q - 1) / 3)
4.  y = u
5. return (x, y)
~~~

### Elligator 2, A=0 Method

The function map\_to\_curve\_ell2A0(alpha) implements an adaptation of Elligator 2
{{BLMP19}} targeting curves given by y^2 = x^3 + B * x over F such that q=3 (mod 4).

Preconditions: A supersingular curve over F such that q=3 (mod 4).

Constants: B, the parameter of the supersingular curve.

Sign of y: Inputs u and -u give the same x-coordinate.
Thus, we set sgn0(y) == sgn0(u).

Exceptions: none.

Operations:

~~~
1.  x1 = u
2. gx1 = x1^3 + B * x1
3.  x2 = -x1
4. gx2 = x2^3 + B * x2
5. If gx1 is square, x = x1 and y = sqrt(gx1)
6. If gx2 is square, x = x2 and y = sqrt(gx2)
7. If sgn0(u) != sgn0(y), set y = -y.
8. return (x, y)
~~~

#### Implementation

The following procedure implements the Elligator 2 algorithm for supersingular
curves in a straight-line fashion.

~~~
map_to_curve_ell2A0(u)
Input: u, an element of F.
Output: (x, y), a point on E.

Steps:
1.  x1 = u
2.  x2 = -x1
3. gx1 = x1^2
4. gx1 = gx1 + B
5. gx1 = gx1 * x1           // gx1 = x1^3 + B * x1
6.   y = gx1^((p + 1) / 4)  // this is either sqrt(gx1) or sqrt(gx2)
7.  e1 = y^2 == gx1
8.   x = CMOV(x2, x1, e1)
9.  e2 = sgn0(u) == sgn0(y)
10.  y = CMOV(-y, y, e2)
11. return (x, y)
~~~

## Encodings for Pairing-Friendly curves

### Shallue-van de Woestijne Method {#swpairing}

Shallue and van de Woestijne {{SW06}} describe an encoding that applies to
essentially any elliptic curve. Fouque and Tibouchi {{FT12}} give a concrete
set of parameters for this encoding geared toward Barreto-Naehrig pairing-friendly curves
{{BN05}}, i.e., curves y^2 = x^3 + B over fields of characteristic q=1 (mod 3).
Wahby and Boneh {{WB19}} suggest a small generalization of the Fouque-Tibouchi
parameters that results in a uniform method for handling exceptional cases.

This encoding method covers curves not handled by other methods, e.g.,
SECP256K1 {{SEC2}}. It also covers pairing-friendly curves in the BN {{BN05}},
KSS {{KSS08}}, and BLS {{BLS03}} families. (Note that the encoding
described in {{simple-swu-pairing-friendly}} is faster, when it applies.)

Preconditions: An elliptic curve y^2 = g(x) = x^3 + B over F such that q=1 (mod 3) and B != 0.

Constants:

- B, the parameter of the Weierstrass curve
- Z, the smallest (in absolute value) element of F such that
  g((sqrt(-3 * Z^2) - Z) / 2) is square, breaking ties by choosing
  the positive value.

Sign of y: Inputs u and -u give the same x-coordinate.
Thus, we set sgn0(y) == sgn0(u).

Exceptions: The exceptional cases for u occur when
u^2 * (u^2 + g(Z)) == 0. The restriction on Z given above ensures that
implementations that use inv0 to invert this product are exception free.

Operations:

~~~
1. t1 = u^2 + g(Z)
2. t2 = inv0(u^2 * t1)
3. t3 = u^4 * t2 * sqrt(-3 * Z^2)
4. x1 = ((sqrt(-3 * Z^2) - Z) / 2) - t3
5. x2 = t3 - ((sqrt(-3 * Z^2) + Z) / 2)
6. x3 = Z - (t1^3 * t2 / (3 * Z^2))
7.  If g(x1) is square, set x = x1 and y = sqrt(g(x1))
8.  If g(x2) is square, set x = x2 and y = sqrt(g(x2))
9.  If g(x3) is square, set x = x3 and y = sqrt(g(x3))
10. If sgn0(u) != sgn0(y), set y = -y
11. return (x, y)
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
2. c2 = sqrt(-3 * Z^2)
3. c3 = (sqrt(-3 * Z^2) - Z) / 2
4. c4 = (sqrt(-3 * Z^2) + Z) / 2
5. c5 = 1 / (3 * Z^2)

Steps:
1.   t1 = u^2
2.   t2 = t1 + c1           // t2 = u^2 + g(Z)
3.   t3 = t1 * t2
4.   t4 = inv0(t3)          // t4 = 1 / (u^2 * (u^2 + g(Z)))
5.   t3 = t1^2
6.   t3 = t3 * t4
7.   t3 = t3 * c2           // t3 = u^2 * sqrt(-3 * Z^2) / (u^2 + g(Z))
8.   x1 = c3 - t3
9.  gx1 = x1^2
10. gx1 = gx1 * x1
11. gx1 = gx1 + B           // gx1 = x1^3 + B
12.  e1 = is_square(gx1)
13.  x2 = t3 - c4
14. gx2 = x2^2
15. gx2 = gx2 * x2
16. gx2 = gx2 + B           // gx2 = x2^3 + B
17.  e2 = is_square(gx2)
18.  e3 = e1 OR e2          // logical OR
19.  x3 = t2^2
20.  x3 = x3 * t2
21.  x3 = x3 * t4
22.  x3 = x3 * c5
23.  x3 = Z - x3            // Z - (u^2 + g(Z))^2 / (3 Z^2 u^2)
24. gx3 = x3^2
25. gx3 = gx3 * x3
26. gx3 = gx3 + B           // gx3 = x3^3 + B
27.   x = CMOV(x2, x1, e1)  // select x1 if gx1 is square
28.  gx = CMOV(gx2, gx1, e1)
29.   x = CMOV(x3, x, e3)   // select x3 if gx1 and gx2 are not square
30.  gx = CMOV(gx3, gx, e3)
31.   y = sqrt(gx, q)
32.  e4 = sgn0(u) == sgn0(y)
33.   y = CMOV(-y, y, e4)   // select correct sign of y
34. return (x, y)
~~~

### Simplified SWU for Pairing-Friendly Curves {#simple-swu-pairing-friendly}

Wahby and Boneh {{WB19}} show how to adapt the simplified SWU encoding to
certain Weierstrass curves having either A = 0 or B = 0, one of which is
almost always true for pairing-friendly curves. Note that neither case is
supported by the encoding of {{simple-swu}}.

This method requires finding another elliptic curve

~~~
E': y^2 = g'(x) = x^3 + A' * x + B'
~~~

that is isogenous to E and has A' != 0 and B' != 0.
(One might do this, for example, using {{SAGE}}; details are beyond the scope of this document.)
This isogeny defines a map iso\_map(x', y') that takes as input a point
on E' and produces as output a point on E.

Once E' and iso\_map are identified, this encoding is straightforward: on input
alpha, first apply the simplified SWU encoding to get a point on E', then apply
the isogeny map to that point to get a point on E.

Preconditions: An elliptic curve E' with A' != 0 and B' != 0 that is
isogenous to the target curve E with isogeny map iso\_map(x, y) from
E' to E.

Helper functions:

- map\_to\_curve\_simple\_swu is the encoding of {{simple-swu}} to E'
- iso\_map is the isogeny map from E' to E

Sign of y: for this map, the sign is determined by map\_to\_curve_elligator2.
No further sign adjustments are necessary.

Exceptions: map\_to\_curve\_simple\_swu handles its exceptional cases.
Exceptional cases of iso\_map should return the identity point on E.

Operations:

~~~
1. (x', y') = map_to_curve_simple_swu(u)    // (x', y') is on E'
8. (x, y)   = iso_map(x', y')            // (x, y) is on E
8. return (x, y)
~~~

We do not repeat the sample implementation of {{simple-swu}} here.
See {{hash2curve-repo}} or {{WB19}} for details on implementing the isogeny map.

# Clearing the cofactor {#cofactor-clearing}

The encodings of {{encodings}} always output a point on the elliptic curve,
i.e., a point in a group of order h * r ({{bg-curves}}). Obtaining a point in G
may require a final operation commonly called "clearing the cofactor," which
takes as input any point on the curve.

This operation can always be implemented as a scalar multiplication by h.
For elliptic curves where h = 1, i.e., the curves with a prime number of points,
no operation is required. This applies to, for example, the NIST curves P-256,
P-384, and P-521 {{FIPS186-4}}.

In some cases, it is possible to clear the cofactor via a faster method than
scalar multiplication.
For pairing-friendly curves having subgroup G2 over an extension
field, Scott et al. {{SBCDBK09}} describe a method for faster cofactor clearing
that exploits an efficiently-computable endomorphism. Fuentes-Castaneda
et al. {{FKR11}} propose an alternative method that is sometimes more efficient.
Budroni and Pintore {{BP18}} give concrete instantiations of these methods
for Barreto-Lynn-Scott pairing-friendly curves {{BLS03}}.

Wahby and Boneh ({{WB19}}, Section 5) describe a trick due to Scott for
faster cofactor clearing on any elliptic curve for which the prime
factorization of h and the number of points on the curve meet certain
conditions.

# Suites for Hashing {#suites}

The following table lists recommended algorithms for different curves and
encodings. To select a suitable algorithm, choose the encoding associated with
the target curve. For example, Elligator 2 is the recommended encoding for
Curve25519, whereas simplified SWU is the recommended encoding for P-256.
When the hash function is to be used in a protocol whose security is proven in the
random oracle model, applications SHOULD use the Random Oracle construction
given in {{roadmap}}.

A suite is a bundle of algorithms that provides concrete recommendations for
hashing bit strings into points of specific elliptic curve groups. Each suite is
a tuple (E, H, f, ROM) such that

-   E, is the elliptic curve group.
-   H, is the cryptographic hash function used by hash\_to\_base.
-   f, is an encoding function compatible with E.
-   ROM, is a boolean flag indicating whether or not to use the random oracle construction.

This document describes the following set of ciphersuites

| Suite ID | E | H | f | ROM |
|----------|---|---|---|-----|
| H2C-0001 | P256         | SHA256 | Simplified SWU           | True |
| H2C-0002 | P384         | SHA512 | Icart                    | True |
| H2C-0003 | curve25519   | SHA512 | Elligator 2              | True |
| H2C-0004 | curve448     | SHA512 | Elligator 2              | True |
| H2C-0005 | edwards25519 | SHA512 | Elligator 2              | True |
| H2C-0006 | edwards448   | SHA512 | Elligator 2              | True |
| H2C-0007 | SECP256K1    | SHA512 | Shallue-van de Woestijne | True |
| H2C-0008 | BLS12381     | SHA512 | Simplified SWU           | True |


# IANA Considerations

This document has no IANA actions.

# Security Considerations

Each encoding function variant accepts arbitrary input and maps it to a pseudorandom
point on the curve.
Directly evaluating the encodings of {{encodings}} produces an output that is
distinguishable from random.
{{roadmap}} shows how to use these encodings to construct a function approximating a
random oracle.

{{hashtobase}} describes considerations for uniformly hashing to field elements.

# Acknowledgements

The authors would like to thank Adam Langley for his detailed writeup up Elligator 2 with
Curve25519 {{L13}}. We also thank Sean Devlin and Thomas Icart for feedback on
earlier versions of this document.

# Contributors

*   Sharon Goldberg \\
    Boston University \\
    goldbe@cs.bu.edu
*   Ela Lee \\
    Royal Holloway, University of London \\
    Ela.Lee.2010@live.rhul.ac.uk

--- back


# Related Work {#related}

The problem of mapping arbitrary bit strings to elliptic curve points
has been the subject of both practical and theoretical research.
This section briefly describes the background and research results
that underly the recommendations in this document.
This section is provided for informational purposes only.

A naive but generally insecure method of mapping a string alpha to
a point on an elliptic curve E having n points is to first fix a point P that
generates the elliptic curve group, and a hash function Hn from bit strings
to integers less than n; then compute Hn(alpha) * P, where the * operator
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

Schinzel and Skalba {{SS04}} introduce the first method of constructing
elliptic curve points deterministically, for a restricted class of curves
and a very small number of points.
Skalba {{S05}} generalizes this construction to more curves and more points
on those curves.
Shallue and van de Woestijne {{SW06}} further generalize and simplify
Skalba's construction, yielding concretely efficient maps to a constant
fraction of the points on almost any curve.
Ulas {{U07}} describes a simpler version of this map, and Brier et
al. {{BCIMRT10}} give a further simplification, which the authors call the
"simplified SWU" map.
The simplified map applies only to fields of characteristic p = 3 mod 4;
Wahby and Boneh {{WB19}} generalize to fields of any characteristic.

Icart gives another deterministic algorithm which maps to any curve
over a field of characteristic p = 2 mod 3 {{Icart09}}.
Several extensions and generalizations follow this work, including
{{FSV09}}, {{FT10}}, {{KLR10}}, {{F11}}, and {{CK11}}.

Following the work of Farashahi {{F11}}, Fouque et al. {{FJT13}} describe an
encoding to curves of characteristic p = 3 mod 4 having a number of points
divisible by 4.  Bernstein et al. {{BHKL13}} optimize this encoding, and
describe a related encoding that they call "Elligator 2," which applies to
any curve over a field of odd characteristic having a point of order 2.
This includes Curve25519 and Curve448, both of which are CFRG-recommended
curves {{RFC7748}}.

An important caveat regarding all of the above deterministic encoding
functions is that none of them map to the entire curve, but rather to some
fraction of the points. This means that they cannot be used directly to
construct a random oracle that outputs points on the curve.

Brier et al. {{BCIMRT10}} give two solutions to this problem.
The first, which applies only to Icart's method (above), computes F(H0(msg))
+ F(H1(msg)) for two distinct hash functions H0, H1.
The second, which applies to essentially all deterministic encodings but
is more costly, computes F(H0(msg)) + H1(msg) * P, for P a generator of the
elliptic curve group.
Farashahi et al. {{FFSTV13}} improve the analysis of the first method,
showing that this method applies to essentially all deterministic encodings.
Tibouchi and Kim {{TK17}} further refine the analysis and describe additional
optimizations.

Complementary to the problem of mapping from bit strings to elliptic curve
points, Bernstein et al. {{BHKL13}} study the problem of mapping from elliptic
curve points to uniformly random bit strings, giving solutions for a class of
curves including Montgomery and Edwards curves.
Tibouchi {{T14}} and Aranha et al. {{AFQTZ14}} generalize these results.
This document does not deal with this complementary problem.

# Sample Code {#samplecode}

Sample Sage {{SAGE}} code for each algorithm can be found in the draft
repository {{hash2curve-repo}}.

# Test Vectors

This section contains test vectors, generated from reference Sage code, for
each map\_to\_curve variant and the hash\_to\_base function described in {{hashtobase}}.

## Elligator 2 to Curve25519

~~~
Input:

  alpha =

Intermediate values:

      u = 140876c725e59a161990918755b3eff6a9d5e75d69ea20f9a4ebcf
          94e69ff013
      v = 6a262de4dba3a094ceb2d307fd985a018f55d1c7dafa3416423b46
          2c8aaff893
     gv = 5dc09f578dca7bfffeac3ec4ad2792c9822cd1d881839e823d26cd
          338f6ddc3e

Output:

      x = 15d9d21b245c5f6b314d2cf80267a5fe70aa2e382505cbe9bdc4b9
          d375489a54
      y = 1f132cbbfbb17d3f80eba862a6fb437650775de0b86624f5a40d3e
          17739a07ff
~~~

~~~
Input:

  alpha = 00

Intermediate values:

      u = 10a97c83decb52945a72fe18511ac9741234de3fb62fa0fec399df
          5f390a6a21
      v = 6ff5b9893b26c0c8b68adb3d653b335a8e810b4abbdbc13348e828
          f74814f4c4
     gv = 2d1599d36275c36cabf334c07c62934e940c3248a9d275041f3724
          819d7e8b22

Output:

      x = 6ff5b9893b26c0c8b68adb3d653b335a8e810b4abbdbc13348e828
          f74814f4c4
      y = 55345d1e10a5fc1c56434494c47dcfa9c7983c07fcb908f7a38717
          ba869a2469
~~~

~~~
Input:

  alpha = ff

Intermediate values:

      u = 59c48eefc872abc09321ca7231ecd6c754c65244a86e6315e9e230
          716ed674d3
      v = 20392de0e96030c4a37cd6f650a86c6bc390bcec21919d9c544f35
          f2a2534b2b
     gv = 0951a0c55b92e231494695cb775a0653a23f41635e11f97168e231
          095dd5c30c

Output:

      x = 5fc6d21f169fcf3b5c832909af5793943c6f4313de6e6263abb0ca
          0d5da547bc
      y = 2b6bf1b3322717ed5640d04659757c8db6615c0dee954fbd695e8a
          c9d97e24d1
~~~

~~~
Input:

  alpha = ff0011223344112233441122334411223344556677885566778855
          66778855667788

Intermediate values:

      u = 380619de15c80fe3668bac96be51b0fd17129f6cf084a250cfaa76
          7ff92b6cba
      v = 2f3d9063e573c522d8f20c752f15b114f810b53d880154e2f30cde
          fdf82bbe26
     gv = 4ce282b7cfdca2db63cec91a08b947f10fcf03bc69bafcd1c60b7d
          dfc305baaf

Output:

      x = 2f3d9063e573c522d8f20c752f15b114f810b53d880154e2f30cde
          fdf82bbe26
      y = 5e43ab6a0590c11547b910d06d37c96e4cc3fc91adf8a54494d74b
          12de6ae45d
~~~

## Icart to P-384

~~~
Input:

  alpha =

Intermediate values:

     u  = 287d7ef77451ecd3c1c0428092a70b5ed870ca22681c81ac52037d
          a7e22a3657d3538fa5ce30488b8e5fb95eb58dda86
     u4 = 56aee47e1e72dbae15bd0d5a8462d0228a5db9093268639e1cd015
          4aa3e63d81eea72c2d5fa4998f7ca971bb50b44df6
     v  = eaa16e82d5a88ebb9ff1866640c34693d4de32fdca72921ed2fe4d
          cfce3b163dea8ec9e528f7e3b5ca3e27cba5c97db9
     x1 = cbc52f2bf7f194a47fd88e3fa4f68fc41cddeea8c47f79c225ad80
          455c4db0e5db47209754764929327edf339c19203b
     u6 = 5af8bcb067c1fc0bf3c7115481f3bd78afd70e035a9d067060c6e2
          164620d477e3247a55e514d0a790a7ddf58e7482fa
     x1 = 871a993757d3aa90b7261aa76fc1d74b8b4dcfbc8505f1170e3707
          1ab59c9c3a88caa9d6331730503d2b4f94a592b147

Output:

      x = b4e57fc7f87adbdc52ab843635313cdf5fb356550b6fbde5741f6b
          51b12b33a104bfe2c68bef24139332c7e213f145d5
      y = bd3980b713d51ac0f719b6cc045e2168717b74157f6fd0e36d4501
          3e2b5c7e0d70dacbb2fb826ad12d3f8a0dc5dc801f
~~~

~~~
Input:

  alpha = 00

Intermediate values:

     u  = 5584733e5ee080c9dbfa4a91c5c8da5552cce17c74fae9d28380e6
          623493df985a7827f02538929373de483477b23521
     u4 = 3f8451733c017a3e5acd8a310f5594ae539c74b009fc75aecda7f1
          abd42b3a47b1bd8b2b29eb3dd01db0a1bf67f5c15e
     v  = a20ff29b0a3d0067cb8a53e132753a46f598aa568efe00f9e286a5
          e4300c9010f58e3ed97b4b7b356347048f122ca2b8
     x1 = d8fcadbc05829f3d7d12493f8720514e2f125751f0dcf91ba8ee5d
          4e3456528c1e155cc93ac525562d9c3fcb3e49d3e3
     u6 = 35340edd3abbe78fe33fd955e9126d67c6352db6ecbcbcf3abbaa5
          30ffa37724d3a51d9d046057d0fa76278f916fa10c
     x1 = 382b470b52fbe5de86ed48a824ae3827a738b8cada54c9473d1eee
          18b548b8f12389dcea7c47893e18aafad06ab8ff52

Output:

      x = a15fe3979721e717f173c54d38882c011be02499d26a070a3bed82
          5fcac5a251a1297a9593254a50f8aa243c6191976a
      y = 641d1cb53087208240a935769ca1b99c3a97a492526e5b3cfae8c2
          0bebde9345c4dd549e2d01d5417918ce039451f4d7
~~~

~~~
Input:

  alpha = ff

Intermediate values:

     u  = d25e7c84dcdf5b32e8ff5ae510026628d7427b2341c9d885f753a9
          72b21e3c82881ab0a2845ec645dd9d6fd4f3c74cb3
     u4 = 60cbd41d32d7588ff3634655bd5e5ef6ab9077b7629bb648669cf8
          bef00c87b3c7c59bed55d6db75a59fc988ee84db41
     v  = f3e63b1b10195a28833f391d480df124be3c1cbbaa0c7b5b0252db
          405ba97a10d19a6afd134f1c829fd8fba36a3ea5a5
     x1 = 9d4c43b595deb99138eb0f7688695abe8a7145d4b8f1f911b8384b
          0205c873cfcb6a6092e71b887e0a56e8633987fa7e
     u6 = bb44318a26c920aa39270421eb8ff73aac89637d01e6b32697fbd2
          c6097d3143fbe8e192372a25be723a0008bcf64326
     x1 = aa283d625fdb4d127611e359d6bd6a2d1e63f036a2d9d1373c11d9
          1a557ffe24ec208f0408763c524112147fd78fd15e

Output:

      x = 26536b1be6480de4e8d3232e17312085d2fc5b4ad18aae3edfe1f6
          2c192ebcbed4711aba15be7af83ef691e09aded56c
      y = 7533cf819fa713699f4919f79fc0f01c9b632f2e08a5ae34de7d9e
          1069b18b256924b9acb7db85c707fb40ef893e4b9e
~~~

~~~
Input:

  alpha = ff0011223344112233441122334411223344556677885566778855
          66778855667788

Intermediate values:

     u  = e1a5025e8e9b6776263767613cd90b685a46fe462c914aaf7dab3b
          2ac7b7f6479e6de0790858fae8471beda1d93117c2
     u4 = be47baa8671fb710a0cf58c85d95ea9cef2a7d6a6d859f3dbc52be
          fde3ad898851a83e166b87eeb7870ce1d3427a56b5
     v  = 24ed8cb050c045f6401a6221b85c37d482197f54a7340303449c13
          52717394450495f4bfa8c0bc12181496db59113671
     x1 = a1e180da2f619774632fccb74133963606ffaec0545dcdf225e180
          3f04d7bd9fb612bf57145004905142a35a5d1b47f0
     u6 = e806b407afd7874ad4ded43a46bc002e0dda1a39a5754cf09dfcb9
          9cfc8d19750a4a7e825e06ac256166b91ee3f5e28d
     x1 = 41d5d81708d776d643b75fd29658c14fddaf009d8f47a9ec18b9d3
          bee961f1544dd7339e6115bffbe638a17658cea94a

Output:

      x = 810096c7dec85367fa04f706c2e456334325202b9fcbc34970d9fd
          f545c507debc328246489e3c9a8d576b97e6e104d8
      y = ddde061cec66efc0cfcdabdc0241fdb00ab2ad28bf8e00dc0d45f8
          845c00b6e5c803b133c8deb31b4922d83649c4c249
~~~

## SWU to P-256

~~~
Input:

  alpha =

Intermediate values:

      u = d8e1655d6562677a74be47c33ce9edcbefd5596653650e5758c8aa
          ab65a99db3
      v = 7764572395df002912b7cbb93c9c287f325b57afa1e7e82618ba57
          9b796e6ad1
     x1 = 7764572395df002912b7cbb93c9c287f325b57afa1e7e82618ba57
          9b796e6ad1
     gv = 0d8af0935d993caaefca7ef912e06415cbe7e00a93cca295237c66
          7f0cc2f941
    gx1 = 0d8af0935d993caaefca7ef912e06415cbe7e00a93cca295237c66
          7f0cc2f941
     n1 = ef66b409fa309a99e4dd4a1922711dea3899259d4a5947b3a0e3fe
          34efdfc0cf
     x2 = 2848af84de537f96c3629d93a78b37413a8b07c72248be8eac61fa
          a058cedf96
    gx2 = 3aeb1a6a81f78b9176847f84ab7987f361cb486846d4dbf3e45af2
          d9354fb36a
     x3 = 4331afd86e99e4fc7a3e5f0ca7b8a62c3c9f0146dac5f75b6990fe
          60b8293e8e
    gx3 = 1d78aa2bd9ff7c11c53807622c4d476ed67ab3c93206225ae437f0
          86ebaa2982
     y1 = 574e9564a28b9104b9dfb104a976f5f6a07c5c5b69e901e596df26
          e4f571e369

Output:

      x = 7764572395df002912b7cbb93c9c287f325b57afa1e7e82618ba57
          9b796e6ad1
      y = 574e9564a28b9104b9dfb104a976f5f6a07c5c5b69e901e596df26
          e4f571e369
~~~

~~~
Input:

  alpha = 00

Intermediate values:

      u = c4188ee0e554dae7aea559d04d45982d6b184eff86c4a910a43247
          44d6fb3c62
      v = 0e82c0c07eb17c24c84f4a83fdd6195c23f76d455ba7a8d5bc3f62
          0cee20caf9
     x1 = 0e82c0c07eb17c24c84f4a83fdd6195c23f76d455ba7a8d5bc3f62
          0cee20caf9
     gv = 4914f49c40cb5c561bfeded5762d4bbf652e236f890ae752ea1046
          0be2939c3a
    gx1 = 4914f49c40cb5c561bfeded5762d4bbf652e236f890ae752ea1046
          0be2939c3a
     n1 = ae5000e861347ff29e3368597174b1a0a04b9b08019f59936aa65f
          7e3176cf03
     x2 = 331a4d8dead257f3d36e239e9cfaeaaf6804354a5897da421db73a
          795c3f9af7
    gx2 = b3dda8702e046be4e2bd42e2c9f09fddbc98a3fe04bd91ca8a1904
          5684be9d81
     x3 = 1133498ac9e96b683271586be695ca43a946aa320eb32e79662476
          6ac7d1cc60
    gx3 = 7cd39b42a3b487dc6c2782a5aebd123502b9fecc849be21766c8a0
          0ca16c318f
     y2 = 6c6fa249077e13be24cf2cfab67dfcc8407a299e69c817785b8b9a
          23eecfe734

Output:

      x = 331a4d8dead257f3d36e239e9cfaeaaf6804354a5897da421db73a
          795c3f9af7
      y = 6c6fa249077e13be24cf2cfab67dfcc8407a299e69c817785b8b9a
          23eecfe734
~~~

~~~
Input:

  alpha = ff

Intermediate values:

      u = 777b56233c4bdb9fe7de8b046189d39e0b2c2add660221e7c4a2d4
          58c3034df2
      v = 51a60aedc0ade7769bd04a4a3241130e00c7adaa9a1f76f1e115f1
          d082902b02
     x1 = 51a60aedc0ade7769bd04a4a3241130e00c7adaa9a1f76f1e115f1
          d082902b02
     gv = f7ba284fd26c0cb7b678f71caecbd9bf88890ddba48b596927c70b
          f805ef5eba
    gx1 = f7ba284fd26c0cb7b678f71caecbd9bf88890ddba48b596927c70b
          f805ef5eba
     n1 = a437e699818d87069a6e4d5298f26f19fd301835eb33b0a3936e3b
          bd1507d680
     x2 = 7236d245e18dfd43dd756a2d048c6e491bb9ebfc2caa627e315d49
          b1e02957fc
    gx2 = 9d6ebf27637ca38ee894e5052b989021b7d76fa2b01053ce054295
          54a205c047
     x3 = 90553fadf8a170464497621e7f2ffcc35d17af4107b79dab6d2a12
          6ea692c9db
    gx3 = d7d141749e2e8e4b2253d4ef22e3ba7c7970e604e03b59277aed10
          32f02c1a11
     y1 = 4115534ea22d3b46a9c541a25e72b3f37a2ac7635a6bebb16ff504
          c3170fb69a

Output:

      x = 51a60aedc0ade7769bd04a4a3241130e00c7adaa9a1f76f1e115f1
          d082902b02
      y = 4115534ea22d3b46a9c541a25e72b3f37a2ac7635a6bebb16ff504
          c3170fb69a
~~~

~~~
Input:

  alpha = ff0011223344112233441122334411223344556677885566778855
          66778855667788

Intermediate values:

      u = 87541ffa2efec46a38875330f66a6a53b99edce4e407e06cd0ccaf
          39f8208aa6
      v = 3dbb1902335f823df0d4fe0797456bfee25d0a2016ae6e357197c4
          122bf7e310
     x1 = 3dbb1902335f823df0d4fe0797456bfee25d0a2016ae6e357197c4
          122bf7e310
     gv = 2704056d76b889ce788ab5cc68fd932f3d7cb125d0dbe0afba9dd7
          655d0651ed
    gx1 = 2704056d76b889ce788ab5cc68fd932f3d7cb125d0dbe0afba9dd7
          655d0651ed
     n1 = 43b52359e2739c205b2e4c8a0b3cd6842feb2ed131ec37fc0788eb
          264dc1999b
     x2 = 39150bdb341015403c27154093cd0382d61d27dafe1dbe70836832
          23bc3e1b2a
    gx2 = 0985d428671b570b3c94dbaa2c4f160095db00a3d79b738ce488ca
          8b45971d03
     x3 = 30cf2e681176c3e50b36842e3ee7623ba0577f6a1a0572448ab5ba
          4bcf9c3d71
    gx3 = ea7c1f13e2ab39240d1d74e884f0878d21020fd73b7f4f84c7d9ad
          72d0d09ae0
     y2 = 71b6dea4bc8dcae3dab695b69f25a7dbdc4e00f4926407bad89a80
          ab12655340

Output:

      x = 39150bdb341015403c27154093cd0382d61d27dafe1dbe70836832
          23bc3e1b2a
      y = 71b6dea4bc8dcae3dab695b69f25a7dbdc4e00f4926407bad89a80
          ab12655340
~~~

## Simplified SWU to P-256

~~~
Input:

  alpha =

Intermediate values:

      u = 650354c1367c575b44d039f35a05f2201b3b3d2a93bf4ad6e5535b
          bb5838c24e
     n1 = 88d14bad9d79058c1427aa778892529b513234976ce84015c795f3
          b3c1860963
     x1 = c55836cadcb8cdfd9b9e345c88aa0af67db2d32e6e527de7a5b7a8
          59a3f6a2d3
    gx1 = 9104bf247de931541fedfd4a483ced90fd3ac32f4bbbb0de021a21
          f770fcc7ae
     x2 = 0243b55837314f184ed8eca38b733945ec124ffd079850de608c9d
          175aed9d29
    gx2 = 0f522f68139c6a8ff028c5c24536069441c3eae8a68d49939b2019
          0a87e2f170
     y2 = 29b59b5c656bfd740b3ea8efad626a01f072eb384f2db56903f67f
          e4fbb6ff82

Output:

      x = 0243b55837314f184ed8eca38b733945ec124ffd079850de608c9d
          175aed9d29
      y = 29b59b5c656bfd740b3ea8efad626a01f072eb384f2db56903f67f
          e4fbb6ff82
~~~

~~~
Input:

  alpha = 00

Intermediate values:

      u = 54acd0c1b3527a157432500fc3403b6f8a0aa0103d6966b783614a
          8e41c9c5b1
     n1 = bb27567ea0729adc2b7af65a85b7f599559b107ce0d2495c4d26d8
          a1ce842372
     x1 = 6ae899e0232f040f8a82934f462e1ccedac76ad8549ae581f17c82
          1a5944244f
    gx1 = 8a78bbf9c2156533fa0d9d37533752508a061b90108675ad705009
          7adabff9cb
     x2 = 498c0e2faee29adf4e6aed9120eb8c69cd3bb7206bcd47a746fb5e
          d4ed5529a5
    gx2 = 63adfce3aaa4d56b70cc3e8e7475154b5963855e275ffc26858cbf
          2456ea5f52
     y1 = 3b81976ce93e79d2ba13394a6b5deb34602d6829f4625d987fc98c
          a79d5d5c98

Output:

      x = 6ae899e0232f040f8a82934f462e1ccedac76ad8549ae581f17c82
          1a5944244f
      y = 3b81976ce93e79d2ba13394a6b5deb34602d6829f4625d987fc98c
          a79d5d5c98
~~~

~~~
Input:

  alpha = ff

Intermediate values:

      u = 86855e4bc3905ae04f6b284820856db6809633c5046ed92816a4e9
          976e994818
     n1 = 5ec1cf436c1a2e84b53674bcf2470a0aeeda9550c474b06da4bda8
          3bda56f2e3
     x1 = 04e73147d10de271f7d77a9a3d6dd761d5b892ab39224b9dab93a2
          50139b124a
    gx1 = 9d26bdc1b5afe7ccf9a7963a099e3c0b98070525b7ed08e8f32f44
          aef918b15f
     x2 = 28566b4d673bf59f00d42771968bd69b1a54e8b557857ba231cbdd
          feb18b38b5
    gx2 = 3b7edb432f00509ed44a4e6a2cbdbc69321215097953dac5bab8a9
          01a1d0d998
     y2 = 6644bab658f2915f2129791db0eb29eaeb34036db1bced721b161e
          06caaef008

Output:

      x = 28566b4d673bf59f00d42771968bd69b1a54e8b557857ba231cbdd
          feb18b38b5
      y = 6644bab658f2915f2129791db0eb29eaeb34036db1bced721b161e
          06caaef008
~~~

~~~
Input:

  alpha = ff0011223344112233441122334411223344556677885566778855
          66778855667788

Intermediate values:

      u = 34a8fc904e2d40dabb826b914917a6feea97ec3c0828f41c8716b2
          6f8f4b7aaf
     n1 = 3b14efe9953378860e667b9051f9e412811e71b489ad8b72a8856f
          e57a5473d9
     x1 = 8ac342ff43931be5b1a9de4f602994853fa9ec943eacc5e39760df
          73fb4d9799
    gx1 = b45e916f6478943e1baf89e559c38f95457f2cadc1aaa8d54b0cac
          9507ebc6ba
     x2 = f9e15f7507632859104da82a28882021608b2c41f2fce3b1a82e43
          2841284ec7
    gx2 = 1940c3ff4cd98e41cdc5e863eb355168b5d794af03ca374244c7ac
          94c5e2f7b0
     y2 = 180369d261ec6086346e6b2d36990a3aaa803558f1398b6816c3c6
          18d41ff73e

Output:

      x = f9e15f7507632859104da82a28882021608b2c41f2fce3b1a82e43
          2841284ec7
      y = 180369d261ec6086346e6b2d36990a3aaa803558f1398b6816c3c6
          18d41ff73e
~~~

## Boneh-Franklin to P-503

The P-503 curve is a supersingular curve defined as `y^2 = x^3 + 1`
over `GF(p)`, where `p = 2^250 * 3^159 - 1`.

~~~
Input:

  alpha =

Intermediate values:

     u  = 198008fe3da9ee741c2ff07b9d4732df88a3cb98e8227b2cf49d55
          57aec1e61d1d29f460c6e4572b2baa21d2444d64d59cdcd2c0dfa2
          0144dfab7e92a83e00
     t0 = 1f6bb1854a1ff7db82b43c235727d998fe28889152ec4efa533994
          fc6d0e77cd9f3ddb8c46226de8e5de75f705370944b809fe0ca092
          8587addb9c54ae1a05
     t1 = 1f6bb1854a1ff7db82b43c235727d998fe28889152ec4efa533994
          fc6d0e77cd9f3ddb8c46226de8e5de75f705370944b809fe0ca092
          8587addb9c54ae1a04
      x = 04671bff33e7f9f7905848cd4c0fc652bd22200eedf29ef8e13ccb
          5536e4aa11db4366d2f346070d63c994bf0a4b1a4e555d6b3d021a
          eba340b641ada82054

Output:

      x = 04671bff33e7f9f7905848cd4c0fc652bd22200eedf29ef8e13ccb
          5536e4aa11db4366d2f346070d63c994bf0a4b1a4e555d6b3d021a
          eba340b641ada82054
      y = 198008fe3da9ee741c2ff07b9d4732df88a3cb98e8227b2cf49d55
          57aec1e61d1d29f460c6e4572b2baa21d2444d64d59cdcd2c0dfa2
          0144dfab7e92a83e00
~~~

~~~
Input:

  alpha = 00

Intermediate values:

     u  = 30e30a56d82cdca830f08d729ce909fc1ffec68df49ba75f9a1af7
          2ca242e92742f34b474a299bb452c6a71b69bdc9ee2403eaac7c84
          120a160737d667e29e
     t0 = 0a64d9f288a0881bb6addebc0db89f146b282b05570efa3419f5d3
          2f11ec7bb449a1da8b33817642f01db039f838ad0bd459ec03e76d
          8eec3a1e79d6c63f79
     t1 = 0a64d9f288a0881bb6addebc0db89f146b282b05570efa3419f5d3
          2f11ec7bb449a1da8b33817642f01db039f838ad0bd459ec03e76d
          8eec3a1e79d6c63f78
      x = 0970ff4bb9237704cc30f5b0d80a9d97001064ab4cdb98de74f8d7
          283b922726406393c07ad01de0499e46ebc0ed1cd116112cf8965f
          b8f918205adb13d3da

Output:

      x = 0970ff4bb9237704cc30f5b0d80a9d97001064ab4cdb98de74f8d7
          283b922726406393c07ad01de0499e46ebc0ed1cd116112cf8965f
          b8f918205adb13d3da
      y = 30e30a56d82cdca830f08d729ce909fc1ffec68df49ba75f9a1af7
          2ca242e92742f34b474a299bb452c6a71b69bdc9ee2403eaac7c84
          120a160737d667e29e
~~~

~~~
Input:

  alpha = ff

Intermediate values:

     u  = 3808ae24b17af9147bd16077e3e83aff5c579784c8a1443d90e5ff
          e2451bfabacba73ee8b8f652b991290f5c64b34b1a4c9a498e21d4
          3d000dae7f8860200a
     t0 = 2282d37dce4761dad69d1fe012c8580ba4e23158a0621fb3f51813
          10e7275e95573c89a8f0cda7ad98ca9e0a9e04ef94a1a79685d069
          6ac6ad423a0de96b7d
     t1 = 2282d37dce4761dad69d1fe012c8580ba4e23158a0621fb3f51813
          10e7275e95573c89a8f0cda7ad98ca9e0a9e04ef94a1a79685d069
          6ac6ad423a0de96b7c
      x = 173dc6d853d9024f367e24a283768e11ce559473e788f3c0ed0281
          6b48403fc6e100d4935b3f6197799bfbd4fbd94b3656596252f12b
          27fa46602c76ae1370

Output:

      x = 173dc6d853d9024f367e24a283768e11ce559473e788f3c0ed0281
          6b48403fc6e100d4935b3f6197799bfbd4fbd94b3656596252f12b
          27fa46602c76ae1370
      y = 3808ae24b17af9147bd16077e3e83aff5c579784c8a1443d90e5ff
          e2451bfabacba73ee8b8f652b991290f5c64b34b1a4c9a498e21d4
          3d000dae7f8860200a
~~~

~~~
Input:

  alpha = ff0011223344112233441122334411223344556677885566778855
          66778855667788

Intermediate values:

     u  = 3ebdfccb07ddc61d9f81be2b9f5a7a8733581f1a8d531d78229d7b
          0be50f30887f085ef393422ef96e06ff1df4b608b05c53320a9012
          09b8df48b68ab338ec
     t0 = 27958e69b08a9fd2d1765ce3e8dbaf8645c28e5ce033b9d0a7875c
          e7e73d6583e62ff3a06a2b55de1cb8c26819d0cd4aed2dc7cb65fa
          d5eb3c149db9e8381b
     t1 = 27958e69b08a9fd2d1765ce3e8dbaf8645c28e5ce033b9d0a7875c
          e7e73d6583e62ff3a06a2b55de1cb8c26819d0cd4aed2dc7cb65fa
          d5eb3c149db9e8381a
      x = 3fe94cd4d2be061834d1a5020ca181562fdb7e9787f71965ca55cd
          dbf069b68ddd5e2b05a5696a061723093914e69b0540402baa0db3
          fddc517df4211daea1

Output:

      x = 3fe94cd4d2be061834d1a5020ca181562fdb7e9787f71965ca55cd
          dbf069b68ddd5e2b05a5696a061723093914e69b0540402baa0db3
          fddc517df4211daea1
      y = 3ebdfccb07ddc61d9f81be2b9f5a7a8733581f1a8d531d78229d7b
          0be50f30887f085ef393422ef96e06ff1df4b608b05c53320a9012
          09b8df48b68ab338ec
~~~

## Fouque-Tibouchi to BN256

An instance of a BN curve is defined as `BN256: y^2=x^3 + 1` over
`GF(p(t))` such that

~~~
t = -(2^62 + 2^55 + 1).
p = 0x2523648240000001ba344d80000000086121000000000013a700000000000013
~~~


~~~
Input:

  alpha =

Intermediate values:

     u  = 1f6f2aceae3d9323ea64e9be00566f863cc1583385eaff6b01aed7
          a762b11122
     t0 = 1e9c884ab8d2015985a3e3d2764798b183ff5982b0fd9034f27456
          0f19d06ed0
     x1 = 0843eb0f5ed559e940a453f257b2a2e297895ecc2375a070168117
          b5127ec2ae
     x2 = 1cdf7972e12aa618798ff98da84d5d25c997a133dc8a5fa3907ee8
          4aed813d64
     x3 = 042f756fe42e2ed4c58990da3b2567a7b16252c0e17b2da55b8f68
          be71ebd432
      e = 2523648240000001ba344d80000000086121000000000013a70000
          0000000012
    fx1 = 0a8442855e93541a104052273e2bba930338d392d71f70efe83c77
          ae95471a4e
     y1 = 135a017a32abc542796e55d0b68840546c3b2498963773635e27c2
          5aa3737199

Output:

      x = 0843eb0f5ed559e940a453f257b2a2e297895ecc2375a070168117
          b5127ec2ae
      y = 135a017a32abc542796e55d0b68840546c3b2498963773635e27c2
          5aa3737199
~~~

~~~
Input:

  alpha = 00

Intermediate values:

     u  = 053c7251b0e5e5c9acde43c6abd44ffeb13109f61ec27ba0a8191f
          1165435065
     t0 = 0377baf027b80854661187280a98ae1320d7fd8cb0a65fd7077270
          6c38cb71d8
     x1 = 0f5173cd2eb8d4352497a9cb56ebf40b623d9dabb7dcc3f626b1f3
          89e49b9356
     x2 = 15d1f0b511472bcc959ca3b4a9140bfcfee3625448233c1d804e0c
          761b646cbc
     x3 = 100fb33cea2b98b99ca5a279e1b4e5b0cf6927ded3cb729a822483
          809e486dc7
      e = 2523648240000001ba344d80000000086121000000000013a70000
          0000000012
    fx1 = 044c88525cbf81408b9bac1c83bdc49e3f31ec5a7b68495b5d03e5
          18448a7f09
     y1 = 18e4bd91f687e110fb5f57411fccf34b4b1d16d3d978a75d988c38
          d338522d7c

Output:

      x = 0f5173cd2eb8d4352497a9cb56ebf40b623d9dabb7dcc3f626b1f3
          89e49b9356
      y = 18e4bd91f687e110fb5f57411fccf34b4b1d16d3d978a75d988c38
          d338522d7c
~~~

~~~
Input:

  alpha = ff

Intermediate values:

     u  = 077033c69096f00eb76446a64be88c7ae5f1921b977381a6f2e9a8
          336191e783
     t0 = 1716fb7790dd8e2e5a3ef94d63ca31682dd8b92ce13b93e0977943
          bf4c364c72
     x1 = 187ca1d0f0dec664467d49b4a4a661602faac5453fbd4ad9e3f15d
          a35627459e
     x2 = 0ca6c2b14f21399d73b703cb5b599ea831763abac042b539c30ea2
          5ca9d8ba74
     x3 = 0f694914de2533b1fbab6495b1de12cde6965bba0b505b527c1cb0
          69a5fdfd03
      e = 000000000000000000000000000000000000000000000000000000
          0000000001
    fx1 = 067a294268373f0123d95357d7d46c730277e67e68daf3a2c605bf
          035f680a7b
     y1 = 0de5f5d8ecfc19580a882c53c08b47791edf4499965df86263c525
          afd4fe0769

Output:

      x = 187ca1d0f0dec664467d49b4a4a661602faac5453fbd4ad9e3f15d
          a35627459e
      y = 0de5f5d8ecfc19580a882c53c08b47791edf4499965df86263c525
          afd4fe0769
~~~

~~~
Input:

  alpha = ff0011223344112233441122334411223344556677885566778855
          66778855667788

Intermediate values:

     u  = 1dd9ec37d5abeed0f289daddd685d45a395a90f2730a9adead62bf
          1ae2fe958b
     t0 = 23d0adbb23709a3732948019e038c13f498b33812149fe503b68da
          76831a7aca
     x1 = 00e2d073931bc2f38a069df42afbfc9e6f04155e52cf6211be3d40
          f4f4a3dc70
     x2 = 2440940eace43d0e302daf8bd5040369f21ceaa1ad309e01e8c2bf
          0b0b5c23a2
     x3 = 09c1ba4259e59a54221b5761cf9438a60e6cd644996e7c8a11be96
          88718e0261
      e = 2523648240000001ba344d80000000086121000000000013a70000
          0000000012
    fx1 = 080e2aef1644070acf09d6563db6805684572eb33f457d9d75ed5c
          f96e35c9c5
    fx2 = 0c2937174e6a4a89c1574ed4fa96d83a64fb09670c49a8b492321a
          edac6617f6
    fx3 = 118bcb595ca0eac3ae6e56595267670caf75d34386dadc99284bf8
          4ae4ff4804
     y3 = 190e8d47070240ff3c78a03d07123334e67b207fe555c31d0900fe
          71ab33035e

Output:

      x = 09c1ba4259e59a54221b5761cf9438a60e6cd644996e7c8a11be96
          88718e0261
      y = 190e8d47070240ff3c78a03d07123334e67b207fe555c31d0900fe
          71ab33035e
~~~



## Sample hash\_to\_base

~~~
hash_to_base("H2C-Curve25519-SHA256-Elligator-Clear", 1234)
  = 1e10b542835e7b227c727bd0a7b2790f39ca1e09fc8538b3c70ef736cb1c298f

hash_to_base("H2C-P256-SHA512-SWU-", 1234)
  = 4fabef095423c97566bd28b70ee70fb4dd95acfeec076862f4e40981a6c9dd85

hash_to_base("H2C-P256-SHA512-SSWU-", 1234)
  = d6f685079d692e24ae13ab154684ae46c5311b78a704c6e11b2f44f4db4c6e47
~~~
