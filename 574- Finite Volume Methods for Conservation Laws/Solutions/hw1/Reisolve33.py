# -*- coding: utf-8 -*-
"""
Created on Mon Jan 16 15:50:15 2017

@author: user
"""

from pylab import *

clf()  # clear figure

plot([-4,4],[0,0],'k') # x-axis  'k' means black line
plot([-4,-4],[0,6],'k') # t-axis
plot([4,4],[0,6],'k') # right boundary

def plot_rightgoing(x1,t1,s):
    """
    plot right-going wave of slope s starting at (x1,t1) to right boundary
    """
    t2 = t1 + s*(4-x1)
    plot([x1,4], [t1,t2], 'k')

def plot_leftgoing(x1,t1,s):
    """
    plot left-going wave of slope s starting at (x1,t1) to left boundary
    """
    t2 = t1 + s*(-4-x1)
    plot([x1,-4], [t1,t2], 'k')

plot_rightgoing(0,0,1)
plot_rightgoing(0,0,1)
def Reisolve(A,ql,qr):
    lam,R = linalg.eig(A)
    T= qr-ql
    Rinv = linalg.inv(R)
    alpha =dot(Rinv,T)
    return alpha,lam ,R
def qsolve(xcol,t,lamda,R,alpha):
    i=0
    q=np.zeros((2,len(xcol)))
    for x in xcol:
        if x/t <lamda[0]: #Naturally, there is a bug at t=0
            q[:,i]=ql
        elif x/t <lamda[1]:
            q[:,i] = ql + alpha[0]*R[:,0]
        else:
            q[:,i]=qr
        i+=1
    return q
A = np.array([[0,0,4],[0,1,0],[1,0,0]])
ql = np.array([1,2,0])
qr = np.array([1,5,1])
al, lamda, R1= Reisolve(A,ql,qr)
ind = np.argsort(lamda)
lamda=lamda[ind]
al=al[ind]
R= R1[:,ind] 
for l in lamda:
    if l>0:
        plot_rightgoing(0,0,l)
    else:
        plot_leftgoing(0,0,l)
text(-3, 4, 'q_l')
text(2.5, 7, 'q_l*')
text(3.0, 4, 'q_r*')
text(3, 1, 'q_r')