from OneEuroFilter import OneEuroFilter
import numpy as np

config = {
    'freq': 120,
    'mincutoff': 1.0,
    'beta': 0.01,
    'dcutoff': 1.0
}

f = OneEuroFilter(**config)


T = np.linspace(0,1,100)

print(T[0], 0)
print(T[1], 1)
