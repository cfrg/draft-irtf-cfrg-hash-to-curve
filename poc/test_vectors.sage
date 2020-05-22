#!/usr/bin/sage
# vim: syntax=python

import json
import sys
import hashlib
from hash_to_field import XMDExpander, XOFExpander

print("Importing modules...")

try:
    from printer import Printer
    from sagelib.common import test_dst
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


def suite_to_json_file(h2c, vectors, path="vectors"):
    with open(path + "/" + h2c.suite_name + ".json", 'wt') as f:
        out = h2c.__dict__()
        for vec in vectors:
            vec["P"] = Printer.math.point(vec["P"])
            vec["u"] = [ Printer.math.gf(val) for val in vec["u"] ]
            if h2c.is_ro:
                vec["Q0"] = Printer.math.point(vec["Q0"])
                vec["Q1"] = Printer.math.point(vec["Q1"])
            else:
                vec["Q"] = Printer.math.point(vec["Q"])
        out["vectors"] = vectors
        json.dump(out, f, sort_keys=True, indent=2)
        f.write("\n")


def suite_to_ascii_file(h2c, vectors, path="ascii"):
    data = ""
    with open(path + "/" + h2c.suite_name + ".txt", 'wt') as f:
        data = data + Printer.tv.text("suite", h2c.suite_name) + "\n"
        data = data + Printer.tv.text("dst", h2c.dst) + "\n"
        for vec in vectors:
            data = data + "\n" + Printer.tv.text("msg", vec["msg"]) + "\n"
            data = data + Printer.tv.point("P", vec["P"]) + "\n"
            for idx in range(0, len(vec["u"])):
                data = data + Printer.tv.gf("u[%d]" % idx, vec["u"][idx]) + "\n"
            if h2c.is_ro:
                data = data + Printer.tv.point("Q0", vec["Q0"]) + "\n"
                data = data + Printer.tv.point("Q1", vec["Q1"]) + "\n"
            else:
                data = data + Printer.tv.point("Q", vec["Q"]) + "\n"
        f.write(data)
    return data


def create_suite_files(suite, result_map):
    print("Generating: " + suite.suite_name)
    vectors = [suite(msg, output_test_vector=True) for msg in INPUTS]
    vector_data = suite_to_ascii_file(suite, vectors)
    suite_to_json_file(suite, vectors)
    vector_name = suite.suite_name.replace("_", "\\_")
    vector_curve = suite.curve_name
    if vector_curve not in result_map:
        result_map[vector_curve] = []
    result_map[vector_curve].append((vector_name, vector_data))


def expander_to_json_file(expander, path="vectors"):
    with open(path + "/" + expander.name + ".json", 'wt') as f:
        out = expander.__dict__()
        json.dump(out, f, sort_keys=True, indent=2)
        f.write("\n")


def expander_to_ascii_file(expander, vectors, path="vectors"):
    data = ""
    with open(path + "/" + expander.name + ".txt", 'wt') as f:
        data = data + Printer.tv.text("name", expander.name) + "\n"
        data = data + Printer.tv.text("dst", expander.dst) + "\n"
        data = data + Printer.tv.text("hash", expander.hash_name()) + "\n"
        data = data + Printer.tv.text("security_param", str(expander.security_param)) + "\n"
        data = data + "\n"
        for vec in expander.test_vectors:
            data = data + Printer.tv.text("dst_prime", vec["dst_prime"]) + "\n"
            data = data + Printer.tv.text("msg_prime", vec["msg_prime"]) + "\n"
            data = data + Printer.tv.text("pseudo_random_bytes", vec["pseudo_random_bytes"]) + "\n"
            data = data + "\n"
        f.write(data)
    return data

def create_expander_files(expander, result_map):
    print("Generating: " + expander.name)
    for expand_length in EXPAND_LENGTHS:
        [expander.expand_message(msg, expand_length) for msg in INPUTS]
    vector_data = expander_to_ascii_file(expander, result_map)
    expander_to_json_file(expander)
    vector_name = expander.name
    vector_hash = expander.hash_name()
    if vector_name not in result_map:
        result_map[vector_name] = []
    result_map[vector_name].append((vector_hash, vector_data))


def combined_ascii(results, prefix, path="ascii"):
    with open(path + "/" + prefix + "_combined.txt", 'wt') as f:
        for curve in results:
            f.write("## %s\n" % curve)
            f.write("\n")
            for (vector_name, vector_data) in results[curve]:
                f.write("### %s\n" % vector_name)
                f.write("\n")
                f.write("~~~\n")
                f.write(vector_data)
                f.write("~~~\n")
                f.write("\n")


EXPAND_LENGTHS = [32, 128]

INPUTS = ["", "abc", "abcdef0123456789", "a512_" + "a"*512]

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

ALL_EXPANDERS = [
    XMDExpander(test_dst("expander"), hashlib.sha512, 256),
    XMDExpander(test_dst("expander"), hashlib.sha256, 128),
    #XOFExpander(test_dst("expander"), hashlib.shake_128),
]

if __name__ == '__main__':
    suite_vectors = {}
    list(map(lambda s: create_suite_files(s, suite_vectors), ALL_SUITES))
    combined_ascii(suite_vectors, "suites")

    expand_vectors = {}
    list(map(lambda e: create_expander_files(e, expand_vectors), ALL_EXPANDERS))
    combined_ascii(expand_vectors, "expand")

