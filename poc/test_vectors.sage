#!/usr/bin/sage
# vim: syntax=python

import json

print "Importing modules..."

from sagelib.suite_p256 import \
    p256_sswu_ro, \
    p256_sswu_nu, \
    p256_svdw_ro, \
    p256_svdw_nu
from sagelib.suite_p384 import \
    p384_sswu_ro, \
    p384_sswu_nu, \
    p384_svdw_ro, \
    p384_svdw_nu
from sagelib.suite_p521 import \
    p521_sswu_ro, \
    p521_sswu_nu, \
    p521_svdw_ro, \
    p521_svdw_nu
from sagelib.suite_secp256k1 import \
    secp256k1_sswu_ro, \
    secp256k1_sswu_nu, \
    secp256k1_svdw_ro, \
    secp256k1_svdw_nu
from sagelib.suite_25519 import \
    edw25519_hash_ro,   \
    monty25519_hash_ro, \
    edw25519_hash_nu,   \
    monty25519_hash_nu
from sagelib.suite_448 import \
    edw448_hash_ro,   \
    monty448_hash_ro, \
    edw448_hash_nu,   \
    monty448_hash_nu
from sagelib.suite_bls12381g1 import \
    bls12381g1_svdw_ro, \
    bls12381g1_sswu_ro, \
    bls12381g1_svdw_nu, \
    bls12381g1_sswu_nu
from sagelib.suite_bls12381g2 import \
    bls12381g2_svdw_ro, \
    bls12381g2_sswu_ro, \
    bls12381g2_svdw_nu, \
    bls12381g2_sswu_nu

def print_gf(num):
    return ','.join(["{0:#x}".format(ZZ(ni)) for ni in list(num.polynomial())])


def print_point(point):
    if point.is_zero():
        return {"inf": True}
    else:
        x,y,z = point
        return {"x": print_gf(x), "y": print_gf(y)}

def create_vectors(h2c):
    vectors = []
    for msg in INPUTS:
        point = h2c(msg)
        vectors += [{"msg": msg, "P": print_point(point)}]
    return {"vectors": vectors}


def json_vectors(h2c, vectors_path="vectors"):
    print("Generating: " + h2c.suite_name)
    file = open(vectors_path + "/" + h2c.suite_name + ".json", 'w')
    out = h2c.__dict__()
    out.update(create_vectors(h2c))
    json.dump(out, file, sort_keys=True, indent=2)
    file.close()


INPUTS = ["", "abc", "abcdef0123456789", "a512_"+"a"*512]

ALL_SUITES = [
    p256_sswu_ro, p384_sswu_ro, p521_sswu_ro, secp256k1_sswu_ro,
    p256_sswu_nu, p384_sswu_nu, p521_sswu_nu, secp256k1_sswu_nu,
    p256_svdw_ro, p384_svdw_ro, p521_svdw_ro, secp256k1_svdw_ro,
    p256_svdw_nu, p384_svdw_nu, p521_svdw_nu, secp256k1_svdw_nu,
    edw25519_hash_ro, edw448_hash_ro,
    edw25519_hash_nu, edw448_hash_nu,
    monty25519_hash_ro, monty448_hash_ro,
    monty25519_hash_nu, monty448_hash_nu,
    bls12381g1_svdw_ro, bls12381g2_svdw_ro,
    bls12381g1_sswu_ro, bls12381g2_sswu_ro,
    bls12381g1_svdw_nu, bls12381g2_svdw_nu,
    bls12381g1_sswu_nu, bls12381g2_sswu_nu,
    ]

for suite in ALL_SUITES:
    json_vectors(suite)
