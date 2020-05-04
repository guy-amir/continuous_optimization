import numpy as np
from numpy.random import rand,seed

seed(314)
m=10
n=20
A=rand(m,n)
b=A.dot(rand(n,1))

def dual_projected_subgradient(lambda0,iter):
    for k in range(iter):
        