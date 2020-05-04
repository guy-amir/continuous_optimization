import numpy.random as npr
import numpy as np

m=30
n=100
k=5

npr.seed(317)

A = npr.randn(m,n)
P = npr.permutation(n)

x_real = np.zeros([n,1])
x_real[P[0:k]] = npr.randn(k,1)

b = A.dot(x_real)
