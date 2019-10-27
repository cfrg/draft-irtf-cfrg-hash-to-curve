#!/usr/bin/sage
# vim: syntax=python

load("sswu_generic.sage")
load("svdw_generic.sage")

if __name__ == "__main__":
    for _ in range(0, 32):
        GenericSSWU.test_random()
        GenericSvdW.test_random()
