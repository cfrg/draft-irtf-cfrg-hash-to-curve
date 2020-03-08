#!/usr/bin/sage
# vim: syntax=python

import json
import sys

print("Importing modules...")

try:
    from printer import Printer
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
        edw25519_sha256_ro,   \
        edw25519_sha256_nu,   \
        monty25519_sha256_ro, \
        monty25519_sha256_nu, \
        edw25519_sha512_ro,   \
        edw25519_sha512_nu,   \
        monty25519_sha512_ro, \
        monty25519_sha512_nu
    from sagelib.suite_448 import \
        edw448_hash_ro,   \
        edw448_hash_nu,   \
        monty448_hash_ro, \
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

except ImportError:
    sys.exit("Error loading preprocessed sage files. Try running `make clean pyfiles`")


def file_json(h2c, _vectors, path="vectors"):
    with open(path + "/" + h2c.suite_name + ".json", 'wt') as f:
        out = h2c.__dict__()
        all_vec = [{
            "msg": vec["msg"],
            "P": Printer.math.point(vec["P"]), } for vec in _vectors]
        out.update({"vectors": all_vec})
        json.dump(out, f, sort_keys=True, indent=2)


def file_ascii(h2c, _vectors, path="ascii"):
    with open(path + "/" + h2c.suite_name + ".txt", 'wt') as f:
        f.write(Printer.tv.text("suite", h2c.suite_name)+"\n")
        f.write(Printer.tv.text("dst", h2c.dst)+"\n")
        for vec in _vectors:
            f.write(Printer.tv.text("msg", vec["msg"])+"\n")
            f.write(Printer.tv.point(vec["P"])+"\n")


def create_files(suite):
    print("Generating: " + suite.suite_name)
    vectors = [suite(msg) for msg in INPUTS]
    file_json(suite, vectors)
    file_ascii(suite, vectors)


INPUTS = ["", "abc", "abcdef0123456789", "a512_"+"a"*512]

ALL_SUITES = [
    p256_sswu_ro, p384_sswu_ro, p521_sswu_ro, secp256k1_sswu_ro,
    p256_sswu_nu, p384_sswu_nu, p521_sswu_nu, secp256k1_sswu_nu,
    p256_svdw_ro, p384_svdw_ro, p521_svdw_ro, secp256k1_svdw_ro,
    p256_svdw_nu, p384_svdw_nu, p521_svdw_nu, secp256k1_svdw_nu,
    edw25519_sha256_ro, edw25519_sha512_ro, edw448_hash_ro,
    edw25519_sha256_nu, edw25519_sha512_nu, edw448_hash_nu,
    monty25519_sha256_ro, monty25519_sha512_ro, monty448_hash_ro,
    monty25519_sha256_nu, monty25519_sha512_nu, monty448_hash_nu,
    bls12381g1_svdw_ro, bls12381g2_svdw_ro,
    bls12381g1_sswu_ro, bls12381g2_sswu_ro,
    bls12381g1_svdw_nu, bls12381g2_svdw_nu,
    bls12381g1_sswu_nu, bls12381g2_sswu_nu,
]

if __name__ == '__main__':
    list(map(create_files, ALL_SUITES))
