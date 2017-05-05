# -*- coding: utf-8 -*-
"""
MapStepper:

Steps through maps forward and backward in time
Created on Sun Apr 23 17:09:22 2017

@author: user
"""
import numpy as np
import matplotlib.pyplot as plt
import decimal
decimal.getcontext().prec = 50

def mapsteps(f,u, steps =19,dt =1):
    marray = np.zeros((steps+1,len(f)))
    for i in len(f):
        marray[0,i-1]= u[i-1]
    for i in range(1,steps+1):
        for k in len(f):            
            marray[i,k-1]= marray[i-1,k-1] + dt*f[i](marray[i-1,:])
    return marray

def mapstandard(u, steps =19,dt =1):
    marray = np.zeros((steps+1,2))
    for i in [0,1]:
        marray[0,i]= u[i]
    for i in range(1,steps+1):            
            marray[i,1]= marray[i-1,1] -dt*(1/(2*np.pi))*np.sin(2*np.pi*marray[i-1,0])
            if dt ==1:
                marray[i,0]= (marray[i-1,0] + marray[i-1,1] -(1/(2*np.pi))*np.sin(2*np.pi*marray[i-1,0]))%1
                marray[i,1]= marray[i-1,1] -dt*(1/(2*np.pi))*np.sin(2*np.pi*marray[i-1,0])
            else:
                marray[i,0]= (marray[i-1,0] - marray[i-1,1] )%1
                marray[i,1]= marray[i-1,1] -dt*(1/(2*np.pi))*np.sin(2*np.pi*marray[i,0])
    return marray

def plot_maps(marray):
    x= marray[:,0]
    y= marray[:,1]
    plt.plot(x,y)
    
def standard_map(x):
    f= x[1]-(1/(2*np.pi))*np.sin(2*np.pi*x[0])
    g= x[1]-(1/(2*np.pi))*np.sin(2*np.pi*x[0])
    return [f,g]

 
def poltt(dx):
    a= 0.5+ 0.500000000000000000000000*(1+np.sqrt(5))*dx
    b= 1+dx*1
    c= 0.5+ 0.5*(1-np.sqrt(5))*dx
    d= 1+dx*1
    return [a,b],[c,d]
    
def plotline():
    a = np.linspace(-0.0000001,0.0000001,100)
    for dx in a:
        w1,w2 =poltt(dx)
        q2= mapstandard(w2,20,-1)
        lo =plt.scatter(q2[:,0],q2[:,1],s=5,color='r')
    a = np.linspace(-0.0000001,0.0000001,100)
    for dx in a:
        w1,w2 =poltt(dx)
        q= mapstandard(w1,20)
        ll=plt.scatter(q[:,0],q[:,1],s=5)
        
    dx=0.00000000001
    w1,w2 =poltt(dx)
    q3= mapstandard(w1,150,1)
    lw =plt.plot(q3[:,0],q3[:,1],'g', label='The orbit')
    plt.legend((lo, ll,lw),('The stable manifold', 'The unstable manifold','The orbit'),loc='lower left',           fontsize=8)
    plt.show
        
plotline()    
    