# -*- coding: utf-8 -*-
"""
Created on Sun May  7 16:07:26 2017

@author: user
"""
import numpy as np
from scipy import integrate
import matplotlib as mpl
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
def Goodwin(X,t):
    return X[1], -0.75*((X[0]**2-1)/(X[0]**2+1))*X[1]+0.5*X[0]-0.5*X[0]**3 +14*np.sin(t)
fig = plt.figure()
ax = fig.gca(projection='3d')
circa =np.linspace(0,2*np.pi,1000)
index=0
plotspace1= np.zeros((1000,2))
for i in circa:
    a_t = np.arange(0, 4*np.pi, 0.01)
    asol = integrate.odeint(Goodwin, [np.cos(i),np.sin(i)], a_t)
    plotspace1[index,:]=asol[-1,:]
    index +=1    
    ax.plot(a_t,asol[:,0],asol[:,1])
plt.show