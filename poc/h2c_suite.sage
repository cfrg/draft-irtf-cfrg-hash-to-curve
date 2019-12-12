#!/usr/bin/sage
# vim: syntax=python

from collections import namedtuple
import sys

from hash_to_base import hash_to_base

try:
    from sagelib.curves import EdwardsCurve, MontgomeryCurve
    from sagelib.ell2_generic import GenericEll2
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

BasicH2CSuiteDef = namedtuple("BasicH2CSuiteDef", "E F Aa Bd sgn0 H L MapT h_eff is_ro dst")
IsoH2CSuiteDef = namedtuple("IsoH2CSuiteDef", "base Ap Bp iso_map")
EdwH2CSuiteDef = namedtuple("EdwH2CSuiteDef", "base Ap Bp rational_map")

class BasicH2CSuite(object):
    def __init__(self, name, sdef):
        assert isinstance(sdef, BasicH2CSuiteDef)

        # basics: details of the base field
        F = sdef.F
        self.suite_name = name
        self.curve_name = sdef.E
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

    def __dict__(self):
        return {
            "ciphersuite": self.suite_name,
            "field":{
                "p" :  '0x{0}'.format(ZZ(self.p).hex()),
                "m" :  '0x{0}'.format(ZZ(self.m).hex()),
            },
            "curve": self.curve_name,
            "dst": self.dst,
            "hash": (self.H()).name,
            "map": self.m2c.__dict__(),
            "randomOracle": bool(self.is_ro),
        }

    @staticmethod
    def to_self(x):
        # in descendents, overridden to convert points from map_to_curve repr to output repr
        return x

    def __call__(self, msg):
        return self.hash(msg)

    def _hash_to_base(self, msg, ctr):
        xi = hash_to_base(msg, ctr, self.dst, self.p, self.m, self.L, self.H)
        return sum( a * b for (a, b) in zip(xi, self.field_gens) )

    def map_to_curve(self, u):
        return self.to_self(self.m2c.map_to_curve(u))

    def _hash(self, msg):
        if self.is_ro:
            return self._hash_to_curve(msg)
        return self._encode_to_curve(msg)

    def _clear_cofactor(self, P):
        return P * self.h_eff

    def _encode_to_curve(self, msg, hash_to_base=None, map_to_curve=None, clear_cofactor=None):
        if hash_to_base is None:
            hash_to_base = self._hash_to_base
        if map_to_curve is None:
            map_to_curve = self.m2c.map_to_curve
        if clear_cofactor is None:
            clear_cofactor = self._clear_cofactor

        u = hash_to_base(msg, 2)
        Q = map_to_curve(u)
        P = clear_cofactor(Q)
        return P

    def _hash_to_curve(self, msg, hash_to_base=None, map_to_curve=None, clear_cofactor=None):
        if hash_to_base is None:
            hash_to_base = self._hash_to_base
        if map_to_curve is None:
            map_to_curve = self.m2c.map_to_curve
        if clear_cofactor is None:
            clear_cofactor = self._clear_cofactor

        u0 = hash_to_base(msg, 0)
        u1 = hash_to_base(msg, 1)
        Q0 = map_to_curve(u0)
        Q1 = map_to_curve(u1)
        R = Q0 + Q1
        P = clear_cofactor(R)
        return P

    # in descendents, test direct vs indirect hash to curve
    def hash(self, msg):
        res = self.to_self(self._hash(msg))
        # double check correctness
        if self.is_ro:
            res2 = self.hash_to_curve(msg)
        else:
            res2 = self.encode_to_curve(msg)
        assert res == res2
        return res

    # may be overridden in descendents
    hash_to_base = _hash_to_base

    # may be overridden in descendents
    clear_cofactor = _clear_cofactor

    # in descendents, automatically overrides with overridden hash_to_base, map_to_curve, clear_cofactor methods
    def encode_to_curve(self, msg):
        return self._encode_to_curve(msg, self.hash_to_base, self.map_to_curve, self.clear_cofactor)

    # in descendents, automatically overrides with overridden hash_to_base, map_to_curve, clear_cofactor methods
    def hash_to_curve(self, msg):
        return self._hash_to_curve(msg, self.hash_to_base, self.map_to_curve, self.clear_cofactor)

class IsoH2CSuite(BasicH2CSuite):
    def __init__(self, name, sdef):
        assert isinstance(sdef, IsoH2CSuiteDef)
        assert isinstance(sdef.base, BasicH2CSuiteDef)
        super(IsoH2CSuite, self).__init__(name, sdef.base._replace(Aa=sdef.Ap, Bd=sdef.Bp))

        # check that we got a reasonable isogeny map
        self.iso_map = sdef.iso_map
        assert self.iso_map.domain() == EllipticCurve(self.F, [sdef.Ap, sdef.Bp]), "isogeny map domain mismatch"
        assert self.iso_map.codomain() == EllipticCurve(self.F, [sdef.base.Aa, sdef.base.Bd]), "isogeny map codomain mismatch"
        self.to_self = self.iso_map

class MontyH2CSuite(BasicH2CSuite):
    def __init__(self, name, sdef):
        assert isinstance(sdef, BasicH2CSuiteDef)

        # figure out mapping to required Weierstrass form and init base class
        F = sdef.F
        Ap = F(sdef.Aa)
        Bp = F(sdef.Bd)
        A = Ap / Bp
        B = 1 / Bp^2
        self.Bp = Bp
        super(MontyH2CSuite, self).__init__(name, sdef._replace(Aa=A, Bd=B, MapT=GenericEll2))

        # helper: do point ops directly on the Monty repr
        self.monty = MontgomeryCurve(F, Ap, Bp)
        self.to_self = self.monty.to_self

class EdwH2CSuite(MontyH2CSuite):
    def __init__(self, name, sdef):
        assert isinstance(sdef, EdwH2CSuiteDef)
        super(EdwH2CSuite, self).__init__(name, sdef.base._replace(Aa=sdef.Ap, Bd=sdef.Bp))

        # helper: do 'native' point ops directly on the Edwards repr
        self.edwards = EdwardsCurve(sdef.base.F, sdef.base.Aa, sdef.base.Bd)
        self.rational_map = sdef.rational_map
        self.to_self = lambda P: self.edwards(*sdef.rational_map(self.monty.to_self(P)))
