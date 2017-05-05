# -*- coding: utf-8 -*-
"""
Created on Sun Jan 15 22:55:55 2017

@author: user
"""

#Solving a Riemann problem

import numpy as np
import pylab as pl
A = np.array([[2,0],[0 , 2]])
ql = np.array([0,1])
qr = np.array([1,0])
def Reisolve(A,ql,qr):
    lam,R = np.linalg.eig(A)
    T= qr-ql
    Rinv = np.linalg.inv(R)
    alpha =np.dot(Rinv,T)
    return alpha,lam ,R

def phaseplot(ql,qr,R,qm):
    k1= -3
    k2= 3
    r1 = R[:,0]
    r2 = R[:,1]
    u1 = ql+k1*r1
    u2 = ql + k2*r1
    u = np.vstack((u1,u2))
    v1 = qr+k1*r2
    v2 = qr + k2*r2
    v = np.vstack((v1,v2))
    pl.plot(ql[0],ql[1], 'ro', label="ql") #ql
    pl.plot(qr[0],qr[1], 'bo',label="qr") #qr
    pl.plot(qm[0],qm[1], 'ko', label="qm") #qm
    pl.plot(u[:,0],u[:,1],label='r1') #First eigenvector
    pl.plot(v[:,0],v[:,1],label='r2') #Second Eigenvector
    pl.legend()
    pl.xlabel("q1")
    pl.ylabel("q2")

def qsolve(xcol,t,lamda,R,alpha,ql,qr):
    i=0
    q=np.zeros((2,len(xcol)))
    for x in xcol:
        print(x/t)
        if x/t <lamda[0]: #Naturally, there is a bug at t=0
            q[:,i]=ql
            
        elif x/t <lamda[1]:
            q[:,i] = ql + alpha[0]*R[:,0]
            
        else:
            q[:,i]=qr
        i+=1
    return q
    
def qmsolve(R,alpha,ql):
    i=0
    qm=np.zeros((2,1))
    qm[:,i] = ql + alpha[0]*R[:,0]
    return qm    
al, lamda, R1= Reisolve(A,ql,qr)
ind = np.argsort(lamda)
lamda=lamda[ind]
R= R1[:,ind]
al= al[ind] 
x=np.linspace(-4,4,100)
t=1
qm=qmsolve(R,al,ql) 
q=qsolve(x,t,lamda,R,al,ql,qr)
pl.figure(3)
phaseplot(ql,qr,R,qm)
pl.figure(1) 
pl.ylim([-0.1, 1.1])
pl.xlim([x[0],x[-1]])
pl.plot(x,q[0,:])
pl.xlabel("x")
pl.ylabel("Pressure")

pl.figure(2)
pl.ylim([-0.1, 1.1])
#pl.ylim([-1, 0.1])
pl.xlim([x[0],x[-1]])
pl.plot(x,q[1,:])
pl.xlabel("x")
pl.ylabel("Velocity")