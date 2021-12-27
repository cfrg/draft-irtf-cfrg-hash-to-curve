#!/usr/bin/sage
# vim: syntax=python

from collections import namedtuple
import sys

from hash_to_field import hash_to_field, XOFExpander

try:
    from sagelib.curves import EdwardsCurve, MontgomeryCurve
    from sagelib.ell2_generic import GenericEll2
except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")

BasicH2CSuiteDef = namedtuple("BasicH2CSuiteDef", "E F Aa Bd expand H L MapT h_eff k is_ro dst")
IsoH2CSuiteDef = namedtuple("IsoH2CSuiteDef", "base Ap Bp iso_map")
EdwH2CSuiteDef = namedtuple("EdwH2CSuiteDef", "base Ap Bp rational_map")

class BasicH2CSuite(object):
    def __init__(self, name, sdef):
        assert isinstance(sdef, BasicH2CSuiteDef)

        # this dict will hold test vectors, if any
        self.test_vector = {}

        # basics: details of the base field
        F = sdef.F
        self.suite_name = name
        self.curve_name = sdef.E
        self.F = F
        self.p = F.characteristic()
        self.m = F.degree()

        # set up the map-to-curve instance
        self.m2c = sdef.MapT(F, sdef.Aa, sdef.Bd)

        # precompute vector basis for field, used by hash_to_field
        self.field_gens = tuple( F.gen()^k for k in range(0, self.m) )

        # save other params
        self.expand = sdef.expand
        self.H = sdef.H
        self.L = sdef.L
        self.h_eff = sdef.h_eff
        self.k = sdef.k
        self.is_ro = sdef.is_ro
        self.dst = sdef.dst

    def __dict__(self):
        return {
            "ciphersuite": self.suite_name,
            "field":{
                "p" :  '0x%x' % ZZ(self.p),
                "m" :  '0x%x' % ZZ(self.m),
            },
            "curve": self.curve_name,
            "dst": self.dst,
            "hash": (self.H()).name,
            "map": self.m2c.__dict__(),
            "k": '0x%x' % ZZ(self.k),
            "expand": "XOF" if type(self.expand) == XOFExpander else "XMD",
            "randomOracle": bool(self.is_ro),
            "L": '0x%x' % ZZ(self.L),
            "Z": ','.join( '0x%x' % ZZ(z) for z in self.m2c.Z.polynomial() ),
        }

    @staticmethod
    def to_self(x):
        # in descendents, overridden to convert points from map_to_curve repr to output repr
        return x

    def __call__(self, msg, output_test_vector=False):
        self.test_vector = {}
        self.test_vector["msg"] = msg
        self.test_vector["P"] = self.hash(msg)
        if output_test_vector:
            return self.test_vector
        return self.test_vector["P"]

    def hash_to_field(self, msg, count):
        xi_vals = hash_to_field(msg, count, self.p, self.m, self.L, self.expand)
        return [ sum( a * b for (a, b) in zip(xi, self.field_gens) ) for xi in xi_vals ]

    def map_to_curve(self, u):
        return self.to_self(self.m2c.map_to_curve(u))

    def clear_cofactor(self, P):
        return P * self.h_eff

    def encode_to_curve(self, msg):
        u = self.hash_to_field(msg, 1)
        self.test_vector["u"] = u
        Q = self.map_to_curve(u[0])
        self.test_vector["Q"] = Q
        P = self.clear_cofactor(Q)
        return P

    def hash_to_curve(self, msg):
        u = self.hash_to_field(msg, 2)
        self.test_vector["u"] = u
        Q0 = self.map_to_curve(u[0])
        self.test_vector["Q0"] = Q0
        Q1 = self.map_to_curve(u[1])
        self.test_vector["Q1"] = Q1
        R = Q0 + Q1
        P = self.clear_cofactor(R)
        return P

    # in descendents, test direct vs indirect hash to curve
    def hash(self, msg):
        if self.is_ro:
            res = self.hash_to_curve(msg)
        else:
            res = self.encode_to_curve(msg)
        return res

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
        super(MontyH2CSuite, self).__init__(name, sdef._replace(MapT=GenericEll2))

        # helper: do point ops directly on the Monty repr
        self.monty = MontgomeryCurve(sdef.F, sdef.Aa, sdef.Bd)
        self.to_self = self.monty.to_self

class EdwH2CSuite(MontyH2CSuite):
    def __init__(self, name, sdef):
        assert isinstance(sdef, EdwH2CSuiteDef)
        super(EdwH2CSuite, self).__init__(name, sdef.base._replace(Aa=sdef.Ap, Bd=sdef.Bp))

        # helper: do 'native' point ops directly on the Edwards repr
        self.edwards = EdwardsCurve(sdef.base.F, sdef.base.Aa, sdef.base.Bd)
        self.rational_map = sdef.rational_map
        self.to_self = lambda P: self.edwards(*sdef.rational_map(self.monty.to_self(P)))
