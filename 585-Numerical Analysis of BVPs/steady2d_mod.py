10#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import numpy as np
from scipy import sparse
from scipy.sparse import linalg
import matplotlib.pyplot as plt
np.set_printoptions(threshold=np.nan)
np.set_printoptions(precision=5)
import scipy

#  Solves the steady-state heat equation in a square with conductivity
#  c(x,y) = 1 + x^2 + y^2:
#
#     -d/dx( (1+x^2+y^2) du/dx ) - d/dy( (1+x^2+y^2) du/dy ) = f(x),   
#                                                       0 < x,y < 1
#     u(x,0) = u(x,1) = u(0,y) = u(1,y) = 0
#
#  Uses a centered finite difference method.

#  Set up grid.
n = int(input(' Enter number of subintervals in each direction: '));
h = 1/n;
N = (n-1)**2;

# Form block tridiagonal finite difference matrix A and right-hand side 
# vector b.
A = sparse.csr_matrix((N,N));
b = np.ones((N,1));         # Use right-hand side vector of all 1's.

# Loop over grid points in y direction.
for j in range (n-1):
    yj = (j+1)*h;
    yjph = yj+h/2;  yjmh = yj-h/2;

    # Loop over grid points in x direction.
    for i in range(n-1):
        xi = (i+1)*h;
        xiph = xi+h/2;  ximh = xi-h/2;
        aiphj = 1 + xiph**2 + yj**2;
        aimhj = 1 + ximh**2 + yj**2;
        aijph = 1 + xi**2 + yjph**2;
        aijmh = 1 + xi**2 + yjmh**2;
        k = (j)*(n-1) + i;
        A[k,k] = aiphj+aimhj+aijph+aijmh;
        if i > 0: A[k,k-1] = -aimhj; 
        if i < n-2: A[k,k+1] = -aiphj; 
        if j > 0: A[k,k-(n-1)] = -aijmh; 
        if j < n-2: A[k,k+(n-1)] = -aijph; 

A = (1/h**2)*A;   # Remember to multiply A by (1/h^2).
def jacobi_step(u,A,f):
    p = np.diag(A)
    M  = np.diag(p)
    invM = np.diag(1/p)
    N = M - A
    G = np.dot(invM,N)
    c = np.dot(invM,f)
    return np.dot(G,u)+c

def GS_step(u,A,f):
    M  = np.tril(A)
    #invM = np.diag(1/p)
    N = M - A
    G = scipy.linalg.solve(M,N)
    c = scipy.linalg.solve(M,f)
    return np.dot(G,u)+c

def SOR_step(u,A,f,w):
    u_n = GS_step(u,A,f) 
    return (1-w)*u+w*u_n
# Solve linear system.
u_comp = sparse.linalg.spsolve(A,b)