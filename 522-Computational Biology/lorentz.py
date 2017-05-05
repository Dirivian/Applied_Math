# -*- coding: utf-8 -*-
"""
Created on Sat Nov 26 19:07:22 2016

@author: user
"""
import scipy.integrate as si
import numpy as np
import matplotlib.pyplot as plt
 	
def ode(y, t):
    yprime = y
    return yprime
          
 	
 	#lrun    ODE solving example: .
 	
t = np.arange(0, 10.01, .01)  #x time points on which to solve
yzero = np.array([1.])
 	
y = si.odeint(ode, yzero, t)
print (y)
plt.plot(t, y)
plt.xlabel('t',fontsize=24)
plt.ylabel('y',fontsize=24)
plt.title('The ode',fontsize=24)
plt.show()