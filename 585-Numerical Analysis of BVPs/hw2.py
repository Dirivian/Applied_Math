#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jan  7 08:18:15 2018

@author: jithin

HW2 for 585
"""
import numpy as np
import matplotlib.pyplot as plt

def tridiag(a, b, c, k1=-1, k2=0, k3=1):
    return np.diag(a, k1) + np.diag(b, k2) + np.diag(c, k3)
N = 4
h = 0.25
A = tridiag(h*np.ones(N),-2*h*np.ones(N+1),h*np.ones(N))
A[0,:]=0
A[-1,:]=0
A[-0,-0]=1
A[-1,-1]=1
F=np.array([0, 0.25, 0.5,0.75,1])
def bmatrix(a):
    """Returns a LaTeX bmatrix

    :a: numpy array
    :returns: LaTeX bmatrix as a string
    """
    if len(a.shape) > 2:
        raise ValueError('bmatrix can at most display two dimensions')
    lines = str(a).replace('[', '').replace(']', '').splitlines()
    rv = [r'\begin{bmatrix}']
    rv += ['  ' + ' & '.join(l.split()) + r'\\' for l in lines]
    rv +=  [r'\end{bmatrix}']
    return '\n'.join(rv)

def matrix(N):
    h=1/N
    for i in range(N):
        print(i)
B=np.linalg.inv(A)
#plt.plot(np.dot(B,F))
a=[0,0,0,0,0]
for i in range(5):
    plt.plot(F[i]*B[:,i])
    a+=F[i]*B[:,i]
    print(a)
for i in range(5):
    plt.plot(B[:,i],label="G"+str(i))
    plt.legend()
     
def G_0(x):
    return x-1
A=np.zeros((5,5))
for i in range(5):
    for j in range(5):
        if i>j:
            A[i,j]=i*h-1
        else:
            A[i,j]=j*h-1
A[:,0]=[-1,-0.75,-0.5,-.25,0]
A[:,-1]=[1,1,1,1,1]
B[:,-1]=[1,1,1,1,1]
B[:,0]=[-1,-0.75,-0.5,-0.25,0]
A=np.zeros((5,5))
for i in range(5):
    for j in range(5):
        if i>j:
            A[i,j]=(i*h-1)*j*h*h
        else:
            A[i,j]=(j*h-1)*i*h*h
A[:,0]=[1,0.75,0.5,.25,0]
A[:,-1]=[0,0.25,.5,.75,1]