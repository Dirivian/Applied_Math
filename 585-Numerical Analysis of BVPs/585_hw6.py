# -*- coding: utf-8 -*-
"""
Created on Tue Feb 27 14:16:17 2018

@author: amath
"""

import numpy as np
from scipy import sparse
from scipy.sparse import linalg
import matplotlib.pyplot as plt
np.set_printoptions(threshold=np.nan)
np.set_printoptions(precision=5)
import scipy
import scipy.sparse as sp

def tridiag(a, b, c, k1=-1, k2=0, k3=1):
    return np.diag(a, k1) + np.diag(b, k2) + np.diag(c, k3)
N = 255
h = 1/(N+1)
a = np.ones(N)
b = np.ones(N-1)
A = ((N+1)**2)*tridiag(b,-2*a,b)
def u_init(x):
    return 1+2*x
xout = np.linspace(0,1,N+2)
x = xout[1:-1]
def u_true(x):
    return 1+12*x-10*x**2+0.5*np.sin(p(x))
def p(x):
    return 20*np.pi*x**3
def make_f(x):
    return -20 + 0.5* 120*np.pi*x*np.cos(p(x))-0.5*((60*np.pi*x**2)**2)*np.sin(p(x))
def GS_step(u,A,f):
    M  = np.tril(A)
    #invM = np.diag(1/p)
    N = M - A
    G = scipy.linalg.solve(M,N)
    c = scipy.linalg.solve(M,f)
    return np.dot(G,u)+c
def make_b(f):
    b = f
    b[0] = b[0] - (N+1)**2
    b[-1] = b[-1]-3*(N+1)**2
    return b
f = make_f(x)
b = make_b(f)
#u = np.linalg.solve(A,b)
def res(u,A,f):
    return np.linalg.norm(f-A.dot(u), np.inf)/np.linalg.norm(f, np.inf) 
def steps(A,b):
    u_n = u_init(x)
    u_t = u_true(x)
    resn = []
    u_nw=[]
    for i in range(20):
        u_n = GS_step(u_n,A,b)
        u_nw = u_nw +[u_n]
        resn = resn + [[abs(u_n-u_t)]]
    return u_nw,resn
#plt.plot(u)
u,resn = steps(A,b)
def green(u):
    global Aw
    global resy
    Aw = Aw + [u]
    resy = resy +[[abs(u-u_t)]]
    
def CGsteps(A,b):
    
    global f,Aw,resy, u_t
    f =np.ones(N)
    
    u_i = u_init(x)
    resCG = []
    u_t = u_true(x)
    
    uw = []
    Aw = [u_i]
    resy =[]
    u_CG = scipy.sparse.linalg.cg(A,b,x0=u_i,maxiter=20, callback = green)[0]
    return uw,resCG
uw,resw = CGsteps(A,b)
#plt.semilogy(resn)