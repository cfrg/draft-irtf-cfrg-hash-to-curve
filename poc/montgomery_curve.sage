#!/usr/bin/sage
# vim: syntax=python

class MontgomeryPoint(object):
    def __init__(self, E, x, y, z):
        F = E.F
        x = F(x)
        y = F(y)
        z = F(z)
        if z == 0:
            x = F(0)
            y = F(1)
            z = F(0)
        else:
            x = x / z
            y = y / z
            z = F(1)
            A = F(E.A)
            B = F(E.B)
            assert B * y^2 == x^3 + A * x^2 + x, "point (%d, %d) is not on %s" % (x, y, str(E))
        self.E = E
        self.x = x
        self.y = y
        self.z = z

    def is_zero(self):
        return self.z == 0

    def normalize(self):
        if self.is_zero():
            self.x = self.E.F(0)
            self.y = self.E.F(1)
            self.z = self.E.F(0)
        elif self.z != 1:
            self.x = self.x / self.z
            self.y = self.y / self.z
            self.z = self.E.F(1)

    def __eq__(self, other):
        self.normalize()
        other.normalize()
        return (self.E, self.x, self.y, self.z) == (other.E, other.x, other.y, other.z)

    def __add__(self, other):
        return self.E.add(self, other)

    def __neg__(self):
        return self.E(self.x, -self.y, self.z)

    def __sub__(self, other):
        return self.E.add(self, -other)

    def __mul__(self, scalar):
        return self.E.mul(self, scalar)

    def __iter__(self):
        yield self.x
        yield self.y
        yield self.z

    def __repr__(self):
        return "(%d : %d : %d)" % (self.x, self.y, self.z)

class MontgomeryCurve(object):
    def __init__(self, F, A, B):
        self.F = F
        self.A = F(A)
        self.B = F(B)

        self.AA = self.A / self.B
        self.BB = 1 / self.B^2
        self.E = EllipticCurve(F, [0, self.AA, 0, self.BB, 0])

    def to_weierstrass(self, P):
        (x, y, z) = P
        return self.E(x / self.B, y / self.B, z)

    def to_montgomery(self, P):
        (x, y, z) = P
        return self(x * self.B, y * self.B, z)

    def random_point(self):
        return self.to_montgomery(self.E.random_point())

    def __call__(self, x, y, z=1):
        return MontgomeryPoint(self, x, y, z)

    def __str__(self):
        return "Montgomery Curve %d * y^2 = x^3 + %d * x^2 + x over %s" % (self.B, self.A, str(self.F))

    def _add(self, p, q):
        assert p.E is self and q.E is self
        if p == q:
            return self.dbl(p)
        if p == -q:
            return self(0, 1, 0)
        if p.is_zero():
            return q
        if q.is_zero():
            return p
        (x1, y1) = (p.x, p.y)
        (x2, y2) = (q.x, q.y)
        B = self.B
        A = self.A
        x3 = B * (y2 - y1)^2 / (x2 - x1)^2 - A - x1 - x2
        y3 = (2 * x1 + x2 + A) * (y2 - y1) / (x2 - x1) - B * (y2 - y1)^3 / (x2 - x1)^3 - y1
        return self(x3, y3, 1)

    def add(self, p, q):
        ret = self._add(p, q)
        assert self.to_weierstrass(ret) == self.to_weierstrass(p) + self.to_weierstrass(q)
        return ret

    def _dbl(self, p):
        if p.is_zero():
            return p
        p.normalize()
        (x1, y1) = (p.x, p.y)
        if y1 == 0:
            return self(0, 1, 0)
        B = self.B
        A = self.A
        l = (3 * x1^2 + 2 * A * x1 + 1) / (2 * B * y1)
        x3 = B * l^2 - A - x1 - x1
        y3 = (2 * x1 + x1 + A) * l - B * l^3 - y1
        return self(x3, y3, 1)

    def dbl(self, p):
        ret = self._dbl(p)
        assert self.to_weierstrass(ret) == self.to_weierstrass(p) * 2
        return ret

    def _mul(self, p, r):
        if r == 0 or p.is_zero():
            return self(0, 1, 0)
        if r < 0:
            r = -r
            p = -p

        acc = self(0, 1, 0)
        for digit in bin(int(r))[2:]:
            acc = self._dbl(acc)
            if digit == '1':
                acc = self._add(acc, p)

        return acc

    def mul(self, p, r):
        ret = self._mul(p, r)
        assert self.to_weierstrass(ret) == self.to_weierstrass(p) * r
        return ret

def test():
    p = random_prime(1 << 255)
    F = GF(p)
    Ap = Bp = None
    while Ap is None:
        Ap = F.random_element()
        Bp = F.random_element()
        if Ap^2 == F(4) or Bp == F(0):
            Ap = None

    EllM = MontgomeryCurve(F, Ap, Bp)
    Ell = EllM.E

    points_W = []
    points_M = []
    for _ in range(0, 1024):
        # test that random points are on the curve as expected
        P = Ell.random_point()
        PP = EllM.to_montgomery(P)
        points_W.append(P)
        points_M.append(PP)

    for _ in range(0, 1024):
        # test random points coming from the other direction
        PP = EllM.random_point()
        P = EllM.to_weierstrass(PP)
        points_W.append(P)
        points_M.append(PP)

    sumW = sum( points_W[1:], points_W[0] )
    sumM = sum( points_M[1:], points_M[0] )
    assert sumM == EllM.to_montgomery(sumW)
    assert sumW == EllM.to_weierstrass(sumM)

    for _ in range(0, 128):
        P = Ell.random_point()
        PP = EllM.to_montgomery(P)
        r = getrandbits(256)
        Q = P * r
        QQ = PP * r
        assert EllM.to_weierstrass(QQ) == Q
        assert EllM.to_montgomery(Q) == QQ
