# -*- coding: utf-8 -*-
"""
Created on Tue Mar  6 17:50:05 2018

@author: amath
"""
import numpy as np
import scipy 
import matplotlib.pyplot as plt

def pmatrix(n):
    #n internal points to n/2
    L = np.zeros((int(n/2),n))
    for i in range(int(n/2)):
        p = int(2*(i+1)-1)
        L[i,p]=1
    return L
def imatrix(n):
    #n/2 to n internal points
    L = np.zeros((n,int(n/2)))
    L[0,0] = 0.5
    for i in range(1,int(n/2)):
        a = 2*i-1
        b = i-1
        L[a,b]=1
        L[a+1,b]=0.5
        L[a+1,b+1]=0.5
    L[-1,-1]=1
    return L
n = 10

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

def weighted_step(u,A,f,w=2/3):
    u_n = jacobi_step(u,A,f) 
    return (1-w)*u+w*u_n
def tridiag(a, b, c, k1=-1, k2=0, k3=1):
    return np.diag(a, k1) + np.diag(b, k2) + np.diag(c, k3)   
def multigrid(f,x_0,smoother):
    n = len(f)
    h = 1/(n+1)
    A = makeA(n)
    A_c = makeA(int(n/2))
    pmat = pmatrix(n)
    imat = imatrix(n)
    x = x_0
    for i in range(100):
        #print(len(x))
        x = smoother(x,A,f)
        r = f - np.dot(A,x)
        r_c = np.dot(pmat,r)
        e_c = np.linalg.solve(A_c,r_c)
        e = np.dot(imat,e_c)
        x = x+e
        if np.linalg.norm(e, np.inf) < 0.001:
            #print(i)
            return x,i
    return x
n=70        
x_0 = 2*np.ones(n)
x1 = np.linspace(0,1,n+2)

f = np.sin(np.pi*x1[1:-1])

def makeA(N):
    a = np.ones(N)
    b = np.ones(N-1)
    A = ((N+1)**2)*tridiag(b,-2*a,b)
    return A
g = []    
for n in range(10,300,2):       
        x_0 = 2*np.ones(n)
        x1 = np.linspace(0,1,n+2)        
        f = np.sin(np.pi*x1[1:-1])
        g+= [multigrid(f,x_0,GS_step)[1]]
        
s = []    
for n in range(10,300,2):       
        x_0 = 2*np.ones(n)
        x1 = np.linspace(0,1,n+2)        
        f = np.sin(np.pi*x1[1:-1])
        s+= [multigrid(f,x_0,weighted_step)[1]]

    
x = np.linspace(10,300,145)  
plt.plot(x,g,label = 'Gauss Seidel') 
plt.plot(x,s,label = 'Weighted Jacobi')
plt.legend() 
    
    