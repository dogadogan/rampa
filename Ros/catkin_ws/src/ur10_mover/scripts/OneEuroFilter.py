# -*- coding: utf-8 -*-
import math


def smoothing_factor(t_e, cutoff):
    r = 2 * math.pi * cutoff * t_e
    return r / (r + 1)


def exponential_smoothing(a, x, x_prev):
    return a * x + (1 - a) * x_prev


class OneEuroFilter:
    def __init__(self, t0=0.0, x0=0.0, dx0=0.0, min_cutoff=1.0, beta=0.0,
                 d_cutoff=1.0, freq=None, mincutoff=None, dcutoff=None):
        if mincutoff is not None:
            min_cutoff = mincutoff
        if dcutoff is not None:
            d_cutoff = dcutoff

        self.min_cutoff = float(min_cutoff)
        self.beta = float(beta)
        self.d_cutoff = float(d_cutoff)

        self.x_prev = float(x0)
        self.dx_prev = float(dx0)
        self.t_prev = float(t0)

        self.default_dt = (1.0 / float(freq)) if freq else 1.0 / 120.0

        self._initialized = False

    def reset(self):
        self._initialized = False

    def __call__(self, x, t=None):
        x = float(x)

        if t is None:
            t = self.t_prev + self.default_dt

        if not self._initialized:
            self.x_prev = x
            self.dx_prev = 0.0
            self.t_prev = t
            self._initialized = True
            return x

        t_e = t - self.t_prev
        if t_e <= 0:
            t_e = self.default_dt

        a_d = smoothing_factor(t_e, self.d_cutoff)
        dx = (x - self.x_prev) / t_e
        dx_hat = exponential_smoothing(a_d, dx, self.dx_prev)

        cutoff = self.min_cutoff + self.beta * abs(dx_hat)
        a = smoothing_factor(t_e, cutoff)
        x_hat = exponential_smoothing(a, x, self.x_prev)

        self.x_prev = x_hat
        self.dx_prev = dx_hat
        self.t_prev = t

        return x_hat
