# -*- coding: utf-8 -*-
"""
Created on Sun Nov 27 19:37:18 2016

@author: user
"""

import scipy.integrate as si
import numpy as np
import matplotlib.pyplot as plt

#The forcing (X)
def sigm(t):
	if 2<t <6 :
		f=1
	else:
		f=0  
	return f
	
#The function F	
def sigm2(t):
	if 0.5<t  :
		f=1
	else:
		f=0  
	return f 
	
#The derivative		
def ode(y, t):
	return [sigm(t)-y[0],sigm2(y[0])*sigm(t)-y[1]]
	
t  = np.linspace(0, 10, 1000) 
yzero = np.array([0.,0.])
y = si.odeint(ode, yzero, t)

#Plots
fig = plt.figure()
ax = fig.add_subplot(111)
plt.plot(t, y[:,0], label='y')
plt.plot(t, y[:,1], label='z')
handles, labels = ax.get_legend_handles_labels()
ax.legend(handles, labels)
plt.show()