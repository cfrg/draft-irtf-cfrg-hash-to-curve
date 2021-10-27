# Hashing to Elliptic Curves

This is the working area for the individual Internet-Draft, "Hashing to Elliptic Curves".

* [Editor's Copy](https://cfrg.github.io/draft-irtf-cfrg-hash-to-curve/#go.draft-irtf-cfrg-hash-to-curve.html)
* [Individual Draft](https://tools.ietf.org/html/draft-irtf-cfrg-hash-to-curve)
* [Compare Editor's Copy to Individual Draft](https://cfrg.github.io/draft-irtf-cfrg-hash-to-curve/#go.draft-irtf-cfrg-hash-to-curve.diff)

## Building the Draft

Formatted text and HTML versions of the draft can be built using `make`.

```sh
$ make
```

This requires that you have the necessary software installed.  See
[the instructions](https://github.com/martinthomson/i-d-template/blob/master/doc/SETUP.md).

### Reference Implementations

The purpose of these implementations is for generating test vectors and enabling cross compatibility with other implementations.

These implementations are for reference only. They MUST NOT be used in production systems.

 - [Sage](https://github.com/cfrg/draft-irtf-cfrg-hash-to-curve/tree/master/poc)
 - [Go](https://github.com/armfazh/h2c-go-ref): 
     [v05](https://github.com/armfazh/h2c-go-ref/tree/v5.0.0), 
     [v06](https://github.com/armfazh/h2c-go-ref/tree/v6.0.0), 
     [v07](https://github.com/armfazh/h2c-go-ref/tree/v7.0.0), 
     [v08](https://github.com/armfazh/h2c-go-ref/tree/v8.0.0),
     **[v12](https://github.com/armfazh/h2c-go-ref/tree/v12.0.0)**.
 - [Rust](https://github.com/armfazh/h2c-rust-ref):
     [v05](https://github.com/armfazh/h2c-rust-ref/tree/v5.0.0),
     [v06](https://github.com/armfazh/h2c-rust-ref/tree/v6.0.0),
     [v07](https://github.com/armfazh/h2c-rust-ref/tree/v7.0.0),
     [v08](https://github.com/armfazh/h2c-rust-ref/tree/v8.0.0),
     **[v12](https://github.com/armfazh/h2c-rust-ref/tree/v12.0.0)**.

### Other Implementations

This is a (likely incomplete) list of other libraries that have implemented hash-to-curve per the standard.

 - [libsodium](https://github.com/jedisct1/libsodium)
 - [MIRACL Core](https://github.com/miracl/core)
 - [pairing-plus](https://github.com/algorand/pairing-plus)
 - [RELIC](https://github.com/relic-toolkit/relic)
 - [Apache Milagro Crypto Library - Rust](https://github.com/apache/incubator-milagro-crypto-rust)
 - [Zig's standard library](https://ziglang.org)
 - [CIRCL](https://github.com/cloudflare/circl/)

If you know of another library that supports a compliant hash-to-curve implementation and would like us to list it here, please open a PR.

## Contributing

See the
[guidelines for contributions](https://github.com/cfrg/draft-irtf-cfrg-hash-to-curve/blob/master/CONTRIBUTING.md).

## Diagram

Hashing an arbitrary string into a point on an elliptic curve.

High resolution [PDF](./drawings/diag.pdf)

Sources: [XML draw.io](./drawings/diag.xml)


![Alt text](drawings/diag.png)
