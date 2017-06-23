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
from matplotlib.patches import Rectangle
def hmap1(x):
    return [5-0.3*x[1]-x[0]**2,x[0]]
def hmap2(x):
    return [x[1],(5-x[0]-x[1]**2)/0.3] 

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
    return marray[1:,:]
    
def plotstuff():
    thetaspace = np.linspace(0,2*np.pi,200)
    rspace = np.linspace(0,0.04,40)
    for r in rspace:
        for theta in thetaspace:
            q=mapstandard([0.5+ r*np.cos(theta),1+ r*np.sin(theta)],7,1)
            t=mapstandard([0.5+ r*np.cos(theta),1+ r*np.sin(theta)],7,-1)
            lo=plt.scatter(q[:,0],q[:,1],s=5,color='b')
            ll= plt.scatter(t[:,0],t[:,1],s=5,color='r')
            plt.xlim([0.4,0.6])
            plt.ylim([0.9,1.1])
    plt.legend((lo, ll),('Forward iterates', 'Backward Iterates'),loc='lower left',           fontsize=8)
    currentAxis = plt.gca()
    currentAxis.add_patch(Rectangle((0.42,1.00),0.05,0.05, fill=False ))

    plt.show
        
plotstuff()    
    