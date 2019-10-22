#!/usr/bin/sage
# vim: syntax=python

def find_z_sswu(F, A, B):
    R.<xx> = F[]                        # polynomial ring over F
    g = xx ** 3 + F(A) * xx + F(B)      # y^2 = g(x) = x^3 + A x + B
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

def find_z_ell2(F):
    ctr = F.gen()
    while True:
        for Z_cand in (F(ctr), F(-ctr)):
            if Z_cand.is_square():
                # Z must be a non-square in F.
                continue
            return Z_cand
        ctr += 1

