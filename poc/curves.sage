#!/usr/bin/sage
# vim: syntax=python

class PointBase(object):
    normalize = None
    E = None
    x = None
    y = None
    z = None

    def __eq__(self, other):
        self.normalize()
        other.normalize()
        return (self.E, self.x, self.y, self.z) == (other.E, other.x, other.y, other.z)

    def __add__(self, other):
        return self.E.add(self, other)

    def __sub__(self, other):
        return self.E.add(self, -other)

    def __mul__(self, scalar):
        return self.E.mul(self, scalar)

    def __rmul__(self, scalar):
        return self.E.mul(self, scalar)

    def __iter__(self):
        yield self.x
        yield self.y
        yield self.z

    def __repr__(self):
        return "(%d : %d : %d)" % (self.x, self.y, self.z)

    def __getitem__(self, idx):
        return (self.x, self.y, self.z)[idx]

    def curve(self):
        return self.E

class CurveBase(object):
    _add = None
    _dbl = None
    E = None
    F = None
    PointT = None
    get_random = None
    to_self = None
    to_weierstrass = None

    def __call__(self, x, y, z=1):
        return self.PointT(self, x, y, z)

    def base_field(self):
        return self.F

    def order(self):
        return self.E.order()

    def random_point(self):
        return self.to_self(self.E.random_point())

    def add(self, p, q):
        ret = self._add(p, q)
        assert self.to_weierstrass(ret) == self.to_weierstrass(p) + self.to_weierstrass(q)
        return ret

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

    @classmethod
    def test(cls):
        EllM = cls.get_random()
        Ell = EllM.E

        points_W = []
        points_M = []
        for _ in range(0, 1024):
            # test that random points are on the curve as expected
            P = Ell.random_point()
            PP = EllM.to_self(P)
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
        assert sumM == EllM.to_self(sumW)
        assert sumW == EllM.to_weierstrass(sumM)

        assert sumW * Ell.order() == Ell(0, 1, 0)
        assert sumM * EllM.order() == EllM(0, 1, 0)

        for _ in range(0, 128):
            P = Ell.random_point()
            PP = EllM.to_self(P)
            r = getrandbits(256)
            Q = P * r
            QQ = PP * r
            assert EllM.to_weierstrass(QQ) == Q
            assert EllM.to_self(Q) == QQ

class MontgomeryPoint(PointBase):
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

    def __neg__(self):
        return self.E(self.x, -self.y, self.z)

class MontgomeryCurve(CurveBase):
    PointT = MontgomeryPoint

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

    def to_self(self, P):
        (x, y, z) = P
        return self(x * self.B, y * self.B, z)

    def __str__(self):
        return "Montgomery Curve %d * y^2 = x^3 + %d * x^2 + x over %s" % (self.B, self.A, str(self.F))

    def _add(self, p, q):
        assert p.E is self and q.E is self
        if p == q:  # normalizes p and q, too
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
        return self(x3, y3)

    def _dbl(self, p):
        assert p.E is self
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
        return self(x3, y3)

    @classmethod
    def get_random(cls):
        p = random_prime(1 << 255)
        F = GF(p)
        Ap = Bp = None
        while Ap is None:
            Ap = F.random_element()
            Bp = F.random_element()
            if Ap^2 == F(4) or Bp == F(0):
                Ap = None
        return cls(F, Ap, Bp)

class EdwardsPoint(PointBase):
    def __init__(self, E, x, y, z):
        F = E.F
        x = F(x)
        y = F(y)
        z = F(z)
        if z == 0:
            x = F(0)
            y = F(1)
            z = F(1)
        else:
            x = x / z
            y = y / z
            z = F(1)
            a = F(E.a)
            d = F(E.d)
            assert a * x^2 + y^2 == 1 + d * x^2 * y^2, "point (%d, %d) is not on %s" % (x, y, str(E))
        self.E = E
        self.x = x
        self.y = y
        self.z = z

    def is_zero(self):
        return self.z == 0 or (self.x, self.y / self.z) == (0, 1)

    def normalize(self):
        if self.is_zero():
            self.x = self.E.F(0)
            self.y = self.E.F(1)
            self.z = self.E.F(1)
        elif self.z != 1:
            self.x = self.x / self.z
            self.y = self.y / self.z
            self.z = self.E.F(1)

    def __neg__(self):
        return self.E(-self.x, self.y, self.z)

class EdwardsCurve(CurveBase):
    PointT = EdwardsPoint
    force_complete = False

    def __init__(self, F, a, d):
        self.F = F
        a = F(a)
        d = F(d)
        self.a = a
        self.d = d

        self.A = (a + d) / F(2)
        self.Bp = F(4) / (a - d)
        self.B = 1 / self.Bp^2
        self.E = EllipticCurve(F, [0, self.A, 0, self.B, 0])

    def to_weierstrass(self, P):
        # conversion per BBJLP08, Section 2
        if P.is_zero():
            return self.E(0, 1, 0)
        (v, w, z) = P
        if (v, w / z) == (0, -1):
            return self.E(0, 0)
        v = v / z
        w = w / z
        x = (1 + w) / (self.Bp * (1 - w))
        y = (1 + w) / (self.Bp * v * (1 - w))
        return self.E(x, y)

    def to_self(self, P):
        # conversion per BBJLP08, Section 3
        if P.is_zero():
            return self(0, 1, 0)
        (x, y, z) = P
        x = x / z
        y = y / z
        if (x, y) == (0, 0):
            return self(0, -1)
        if y == 0 or self.Bp * x == -1:
            return self(0, 1, 0)
        v = x / y
        w = (self.Bp * x - 1) / (self.Bp * x + 1)
        return self(v, w)

    def __str__(self):
        return "Edwards Curve %d * v^2 + w^2 = 1 + %d * v^2 * w^2 over %s" % (self.a, self.d, str(self.F))

    def _add(self, p, q):
        assert p.E is self and q.E is self
        if p == -q:
            return self(0, 1, 0)
        q.normalize()   # p is normalized in == call above
        if p.is_zero():
            return q
        if q.is_zero():
            return p
        (x1, y1) = (p.x, p.y)
        (x2, y2) = (q.x, q.y)
        a = self.a
        d = self.d
        xnum = x1 * y2 + y1 * x2
        ynum = y1 * y2 - a * x1 * x2
        denTerm = d * x1 * x2 * y1 * y2
        # handle exceptional cases --- only guaranteed to be exception-free if a is square and d is nonsquare
        if denTerm == 1:
            if ynum == 0:
                x3 = xnum / (1 + denTerm)
                y3 = 0
            else:
                return self(0, 1, 0)
        elif denTerm == -1:
            if xnum == 0:
                x3 = 0
                y3 = ynum / (1 - denTerm)
            else:
                return self(0, 1, 0)
        else:
            x3 = xnum / (1 + denTerm)
            y3 = ynum / (1 - denTerm)
        return self(x3, y3)

    def _dbl(self, p):
        return self._add(p, p)

    @classmethod
    def get_random(cls):
        p = random_prime(1 << 255)
        F = GF(p)
        a = d = None
        while a is None:
            a = F.random_element()
            d = F.random_element()
            if a == d or a == 0 or d == 0:
                a = None
            elif cls.force_complete and (not a.is_square() or d.is_square()):
                a = None
        return cls(F, a, d)

if __name__ == "__main__":
    MontgomeryCurve.test()
    EdwardsCurve.test()
