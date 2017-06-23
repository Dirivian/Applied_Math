# -*- coding: utf-8 -*-
"""
Created on Thu May 11 21:08:59 2017

@author: user
"""

# import necessary libraries
import matplotlib.pyplot as plt
import numpy as np
# show plots in notebook


# define system in terms of separated differential equations
def f(x,y):
    return 2*x - x**2 - x*y
def g(x,y):
    return - y + x*y

# initialize lists containing values
x = []
y = []

#iv1, iv2 = initial values, dt = timestep, time = range
def Refuge(X, r=1,c=1,b=1,m=1,s=1):
    # here X[0] = x and x[1] = y    
    return np.array([ r*X[0] - c*(X[0]-s)*X[1] , b*(X[0]-s)*X[1] -m*X[1] ])
    
def Competition(X, r=1,c=1,b=1,m=1,s=1):
    # here X[0] = x and x[1] = y    
    return np.array([ r*X[0]*( 1- c*X[0]-s*X[1]) , r*X[1]*( 0.5- c*X[0]) ])

#plot
fig2 = plt.figure(figsize=(8,6))
ax4 = fig2.add_subplot(1,1,1)





ax4.set_title("Quiverplot")
ax4.legend(loc='best')

# quiverplot
# define a grid and compute direction at each point
x = np.linspace(0, 2, 20)
y = np.linspace(0, 2, 20)

X1 , Y1  = np.meshgrid(x, y)                    # create a grid
DX1, DY1 = Competition([X1, Y1])                        # compute growth rate on the grid
M = (np.hypot(DX1, DY1))                        # norm growth rate 
M[ M == 0] = 1.                                 # avoid zero division errors 
DX1 /= M                                        # normalize each arrows
DY1 /= M

ax4.quiver(X1, Y1, DX1, DY1, M, pivot='mid')
ax4.grid()