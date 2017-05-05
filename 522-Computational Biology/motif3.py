# -*- coding: utf-8 -*-
"""
Created on Mon Nov 28 15:39:02 2016

@author: user
"""

# -*- coding: utf-8 -*-
"""
Created on Sun Nov 27 17:19:01 2016

@author: user
"""

import scipy.integrate as si
import numpy as np
import matplotlib.pyplot as plt
def sigm(t):
    if 2<t <6 :
        f=1
    else:
        f=0  
    return f
def sigm2(t):
    if 0.0<t  :
        f=1
    else:
        f=0  
    return f 	
def ode(y, t):
    #return [sigm2(y[1]),sigm2(y[0])*sigm(t)]

    return [-1*sigm2(y[1])*sigm(t)+1*sigm(t)-y[0]*sigm(t),-0.15*sigm2(y[0])*sigm(t)-0.15*sigm(t)-0.15*y[1]*sigm(t)]
    #return [1*sigm2(y[1])+sigm(t)-0.1*y[0],1*sigm2(y[0])+sigm(t)-0.1*y[1]]
t  = np.linspace(0, 10, 1000) 

yzero = np.array([0.,1.])
y = si.odeint(ode, yzero, t)
print(y[601],y[606])
fig = plt.figure()
ax = fig.add_subplot(111)

plt.plot(t, y[:,0], label='x')
plt.plot(t, y[:,1], label='y')
handles, labels = ax.get_legend_handles_labels()
#ax.set_ylim([-0.1,1.1])
ax.legend(handles, labels)
plt.show() 