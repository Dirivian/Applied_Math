#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import numpy as np
from scipy import sparse
from scipy.sparse import linalg
import matplotlib.pyplot as plt
np.set_printoptions(threshold=np.nan)
np.set_printoptions(precision=5)
import scipy
import scipy.sparse as sp

#  Solves the steady-state heat equation in a square with conductivity
#  c(x,y) = 1 + x^2 + y^2:
#
#     -d/dx( (1+x^2+y^2) du/dx ) - d/dy( (1+x^2+y^2) du/dy ) = f(x),   
#                                                       0 < x,y < 1
#     u(x,0) = u(x,1) = u(0,y) = u(1,y) = 0
#
#  Uses a centered finite difference method.

#  Set up grid.
n = 20#int(input(' Enter number of subintervals in each direction: '));
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
    p = A.diagonal()
    M  = sp.diags(p)
    invM = sp.diags(1/p)
    N = M - A
    G = invM.dot(N)# np.dot(invM,N)
    c = invM.dot(f) #np.dot(invM,f)
    return G.dot(u)+c

def GS_step(u,A,f):
    M  = sp.tril(A)
    #invM = np.diag(1/p)
    N = M - A
    G = sparse.linalg.spsolve(M,N)
    c = sparse.linalg.spsolve(M,f)
    return G.dot(u)+c

def SOR_step(u,A,f,w):
    u_n = GS_step(u,A,f) 
    return (1-w)*u+w*u_n
def res(u,A,f):
    return np.linalg.norm(f-A.dot(u), np.inf)/np.linalg.norm(f, np.inf) 
def steps(A):
    global bvecJ, bvecGS,bvecSOR
    f =np.ones(N)
    u_GS = f
    u_J = f
    u_SOR = f
    resGS = []
    resJ = []
    resSOR = []
    u_CG = f
    resCG = []
    w = 1.36
    p1=0
    p2=0
    for i in range(900):
        #u_GS = GS_step(u_GS,A,f)
        #resGS = resGS + [res(u_GS,A,f)]
        u_J = jacobi_step(u_J,A,f)
        #resJ = resJ + [res(u_J,A,f)]
        #u_SOR = SOR_step(u_SOR,A,f,w)
        #resSOR = resSOR + [res(u_SOR,A,f)]
        #u_CG = scipy.sparse.linalg.cg(A,f,x0=u_CG,maxiter=1)[0]
        #resCG = resCG + [res(u_CG,A,f)]
        
        if res(u_J,A,f) < 1e-3:
            bvecJ += [i]
            print(i)
            break
        if res(u_GS,A,f)< 1e-3  and p1 ==0:
            #bvecGS += [i]
            p1 = 1
        if res(u_SOR,A,f) < 1e-3  and p2 ==0 :
            #bvecSOR += [i]
            p2=1
    return resJ,resGS,resSOR,resCG

def green(u):
    global Aw
    global resy
    Aw = Aw + [u]
    resy = resy +[res(u,A,f)]
def precond(A):
    
    w = scipy.sparse.linalg.spilu(A)
    #print(len(w.perm_r))
    Pr = scipy.sparse.csc_matrix((N, N)) 
    Pr[w.perm_r, np.arange(N)] = 1
    Pc = scipy.sparse.csc_matrix((N, N))
    Pc[np.arange(N), w.perm_c] = 1
    L = scipy.sparse.linalg.inv(w.L)
    U = scipy.sparse.linalg.inv(w.U)
    return Pc*U*L*Pr
    
    
def CGsteps(A):
    
    global f,Aw,resy
    f =np.ones(N)
    u_CG = f
    resCG = []
    uw = []
    Aw = []
    resy =[]
    M = precond(A)
    u_CG = scipy.sparse.linalg.cg(A,f,x0=u_CG,maxiter=100,tol = 1e-5,callback = green)[0]
    return uw,resCG
a,b,c,d = steps(A)
#u_n,resn = CGsteps(A)
#print(len(resy))
#bvec =bvec+[len(resy)]
#resy = np.r_[resy,np.zeros(200-len(resy))]
x = np.linspace(1,200,200)

#plt.semilogy(x,a, label='Jacobi')
#plt.semilogy(x,b ,label='Gauss-Seidel')
#plt.semilogy(x,c ,label='SOR')
#plt.semilogy(x,resy ,label='CG')
#plt.semilogy(x,resy2 ,label='Preconditioned CG')
#plt.legend()

# Solve linear system.
#u_comp = sparse.linalg.spsolve(A,b)