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

def hmap1(x):
    return [5-0.3*x[1]-x[0]**2,x[0]]
def hmap2(x):
    return [x[1],(5-x[0]-x[1]**2)/0.3] 
    
def plotstuff():
    xspace = np.linspace(-3,3,100)
    yspace = np.linspace(-3,3,100)
    for x in xspace:
        for y in yspace:
            [xnew,ynew]=hmap1([x,y])
            [xnew2,ynew2]=hmap2([x,y])
            plt.scatter(xnew,ynew,s=5,color='r')
            plt.scatter(xnew2,ynew2,s=5,color='b')
    plt.show
        
plotstuff()    
    