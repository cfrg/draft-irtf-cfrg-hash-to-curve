#!/usr/bin/sage
# vim: syntax=python

from collections import namedtuple
import sys

from hash_to_base import hash_to_base

try:
    from sagelib.curves import MontgomeryCurve
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

BasicH2CSuiteDef = namedtuple("BasicH2CSuiteDef", "F Aa Bd sgn0 H L MapT h_eff is_ro dst")
IsoH2CSuiteDef = namedtuple("IsoH2CSuiteDef", "base Ap Bp iso_map")
MontyH2CSuiteDef = namedtuple("EdwH2CSuiteDef", "base rational_map")

class BasicH2CSuite(object):
    def __init__(self, sdef):
        assert isinstance(sdef, BasicH2CSuiteDef)

        # basics: details of the base field
        F = sdef.F
        self.F = F
        self.p = F.characteristic()
        self.m = F.degree()

        # set up the map-to-curve instance
        self.m2c = sdef.MapT(F, sdef.Aa, sdef.Bd)
        self.m2c.set_sgn0(sdef.sgn0)

        # precompute vector basis for field, used by hash_to_base
        self.field_gens = tuple( F.gen()^k for k in range(0, self.m) )

        # save other params
        self.H = sdef.H
        self.L = sdef.L
        self.h_eff = sdef.h_eff
        self.is_ro = sdef.is_ro
        self.dst = sdef.dst

    def hash_to_base(self, msg, ctr):
        xi = hash_to_base(msg, ctr, self.dst, self.p, self.m, self.L, self.H)
        return sum( a * b for (a, b) in zip(xi, self.field_gens) )

    def hash(self, msg):
        if self.is_ro:
            return self.hash_to_curve(msg)
        return self.encode_to_curve(msg)

    def clear_cofactor(self, P):
        return P * self.h_eff

    def encode_to_curve(self, msg):
        hash_to_base = self.hash_to_base
        map_to_curve = self.m2c.map_to_curve
        clear_cofactor = self.clear_cofactor

        u = hash_to_base(msg, 2)
        Q = map_to_curve(u)
        P = clear_cofactor(Q)
        return P

    def hash_to_curve(self, msg):
        hash_to_base = self.hash_to_base
        map_to_curve = self.m2c.map_to_curve
        clear_cofactor = self.clear_cofactor

        u0 = hash_to_base(msg, 0)
        u1 = hash_to_base(msg, 1)
        Q0 = map_to_curve(u0)
        Q1 = map_to_curve(u1)
        R = Q0 + Q1
        P = clear_cofactor(R)
        return P

class IsoH2CSuite(BasicH2CSuite):
    def __init__(self, sdef):
        assert isinstance(sdef, IsoH2CSuiteDef)
        assert isinstance(sdef.base, BasicH2CSuiteDef)

        # initialize base class
        self.super = super(IsoH2CSuite, self)
        self.super.__init__(sdef.base._replace(Aa=sdef.Ap, Bd=sdef.Bp))

        # check that we got a reasonable isogeny map
        self.iso_map = sdef.iso_map
        assert self.iso_map.domain() == EllipticCurve(self.F, [sdef.Ap, sdef.Bp]), "isogeny map domain mismatch"
        assert self.iso_map.codomain() == EllipticCurve(self.F, [sdef.base.Aa, sdef.base.Bd]), "isogeny map codomain mismatch"

    def hash(self, msg):
        res = self.iso_map(self.super.hash(msg))
        # double check correctness
        if self.is_ro:
            res2 = self.hash_to_curve(msg)
        else:
            res2 = self.encode_to_curve(msg)
        assert res == res2
        return res

    def map_to_curve(self, u):
        return self.iso_map(self.m2c.map_to_curve(u))

    def encode_to_curve(self, msg):
        hash_to_base = self.hash_to_base
        map_to_curve = self.map_to_curve
        clear_cofactor = self.clear_cofactor

        u = hash_to_base(msg, 2)
        Q = map_to_curve(u)
        P = clear_cofactor(Q)
        return P

    def hash_to_curve(self, msg):
        hash_to_base = self.hash_to_base
        map_to_curve = self.map_to_curve
        clear_cofactor = self.clear_cofactor

        u0 = hash_to_base(msg, 0)
        u1 = hash_to_base(msg, 1)
        Q0 = map_to_curve(u0)
        Q1 = map_to_curve(u1)
        R = Q0 + Q1
        P = clear_cofactor(R)
        return P

class MontyH2CSuite(BasicH2CSuite):
    def __init__(self, sdef):
        assert isinstance(sdef, MontyH2CSuiteDef)
        assert isinstance(sdef.base, BasicH2CSuiteDef)

        # figure out mapping to required Weierstrass form and init base class
        F = sdef.base.F
        Ap = F(sdef.base.Aa)
        Bp = F(sdef.base.Bd)
        A = Ap / Bp
        B = 1 / Bp^2
        self.Bp = Bp
        self.super = super(MontyH2CSuite, self)
        self.super.__init__(sdef.base._replace(Aa=A, Bd=B))

        # set up the helper class to do point ops directly on the Monty repr
        self.monty = MontgomeryCurve(F, Ap, Bp)

    def hash(self, msg):
        res = self.monty.to_self(self.super.hash(msg))
        # double check correctness
        if self.is_ro:
            res2 = self.hash_to_curve(msg)
        else:
            res2 = self.encode_to_curve(msg)
        assert res == res2
        return res

    def map_to_curve(self, u):
        return self.monty.to_self(self.m2c.map_to_curve(u))

    def encode_to_curve(self, msg):
        hash_to_base = self.hash_to_base
        map_to_curve = self.map_to_curve
        clear_cofactor = self.clear_cofactor

        u = hash_to_base(msg, 2)
        Q = map_to_curve(u)
        P = clear_cofactor(Q)
        return P

    def hash_to_curve(self, msg):
        hash_to_base = self.hash_to_base
        map_to_curve = self.map_to_curve
        clear_cofactor = self.clear_cofactor

        u0 = hash_to_base(msg, 0)
        u1 = hash_to_base(msg, 1)
        Q0 = map_to_curve(u0)
        Q1 = map_to_curve(u1)
        R = Q0 + Q1
        P = clear_cofactor(R)
        return P
