#!/usr/bin/sage
# vim: syntax=python

import json
import sys
import hashlib
from hash_to_field import XMDExpander, XOFExpander
if sys.version_info[0] == 3:
    _as_bytes = lambda x: x if isinstance(x, bytes) else bytes(x, "utf-8")
else:
    _as_bytes = lambda x: x

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
    with open(path + "/" + h2c.suite_name + ".txt", 'wt') as f:
        f.write(Printer.tv.text("suite", h2c.suite_name) + "\n")
        f.write(Printer.tv.text("dst", h2c.dst) + "\n")
        for vec in vectors:
            f.write("\n" + Printer.tv.text("msg", vec["msg"]) + "\n")
            f.write(Printer.tv.point("P", vec["P"]) + "\n")
            for idx in range(0, len(vec["u"])):
                f.write(Printer.tv.gf("u[%d]" % idx, vec["u"][idx]) + "\n")
            if h2c.is_ro:
                f.write(Printer.tv.point("Q0", vec["Q0"]) + "\n")
                f.write(Printer.tv.point("Q1", vec["Q1"]) + "\n")
            else:
                f.write(Printer.tv.point("Q", vec["Q"]) + "\n")



def create_suite_files(suite):
    print("Generating: " + suite.suite_name)
    vectors = [suite(msg, output_test_vector=True) for msg in INPUTS]
    suite_to_ascii_file(suite, vectors)
    suite_to_json_file(suite, vectors)


def expander_to_json_file(expander, path="vectors"):
    with open(path + "/" + expander.name + "_" + expander.hash_name() + "_" + str(len(expander.dst)) + ".json", 'wt') as f:
        vector = {}
        vector["name"] = expander.name
        vector["DST"] = expander.dst
        vector["hash"] = expander.hash_name()
        vector["k"] = int(expander.security_param)
        vector["tests"] = []
        for vec in expander.test_vectors:
            test = {}
            test["msg"] = vec["msg"]
            test["len_in_bytes"] = vec["len_in_bytes"]
            test["DST_prime"] = vec["DST_prime"]
            test["msg_prime"] = vec["msg_prime"]
            test["uniform_bytes"] = vec["uniform_bytes"]
            vector["tests"].append(test)
        json.dump(vector, f, sort_keys=True, indent=2)
        f.write("\n")


def expander_to_ascii_file(expander, path="ascii"):
    with open(path + "/" + expander.name + "_" + expander.hash_name() + "_" + str(len(expander.dst)) + ".txt", 'wt') as f:
        f.write(Printer.tv.text("name", expander.name) + "\n")
        f.write(Printer.tv.text("DST", expander.dst) + "\n")
        f.write(Printer.tv.text("hash", expander.hash_name()) + "\n")
        f.write(Printer.tv.text("k", str(expander.security_param)) + "\n")
        f.write("\n")
        for vec in expander.test_vectors:
            f.write(Printer.tv.text("msg", vec["msg"]) + "\n")
            f.write(Printer.tv.text("len_in_bytes", vec["len_in_bytes"]) + "\n")
            f.write(Printer.tv.text("DST_prime", vec["DST_prime"]) + "\n")
            f.write(Printer.tv.text("msg_prime", vec["msg_prime"]) + "\n")
            f.write(Printer.tv.text("uniform_bytes", vec["uniform_bytes"]) + "\n")
            f.write("\n")

def create_expander_files(expander):
    print("Generating: " + expander.name)
    for expand_length in EXPAND_LENGTHS:
        [expander.expand_message(msg, int(expand_length)) for msg in INPUTS]
    expander_to_ascii_file(expander)
    expander_to_json_file(expander)


EXPAND_LENGTHS = [32, 128]

INPUTS = ["", "abc", "abcdef0123456789", "q128_" + "q"*128, "a512_" + "a"*512]

ALL_SUITES = [
    p256_sswu_ro, p384_sswu_ro, p521_sswu_ro, secp256k1_sswu_ro,
    p256_sswu_nu, p384_sswu_nu, p521_sswu_nu, secp256k1_sswu_nu,
    edw25519_sha512_ro, edw448_hash_ro,
    edw25519_sha512_nu, edw448_hash_nu,
    monty25519_sha512_ro, monty448_hash_ro,
    monty25519_sha512_nu, monty448_hash_nu,
    bls12381g1_sswu_ro, bls12381g2_sswu_ro,
    bls12381g1_sswu_nu, bls12381g2_sswu_nu,
]

ALL_EXPANDERS = [
    XMDExpander(test_dst("expander-SHA512-256"), hashlib.sha512, 256),
    XMDExpander(test_dst("expander-SHA256-128"), hashlib.sha256, 128),
    XMDExpander(test_dst("expander-SHA256-128-long-DST", 256), hashlib.sha256, 128),
    XOFExpander(test_dst("expander-SHAKE256"), hashlib.shake_256, 256),
    XOFExpander(test_dst("expander-SHAKE128"), hashlib.shake_128, 128),
    XOFExpander(test_dst("expander-SHAKE128-long-DST", 256), hashlib.shake_128, 128),
]

if __name__ == '__main__':
    list(map(lambda s: create_suite_files(s), ALL_SUITES))
    list(map(lambda e: create_expander_files(e), ALL_EXPANDERS))
