# -*- coding: utf-8 -*-
"""
Created on Tue May 30 21:20:25 2017

@author: user
"""

import numpy as np
from scipy.special import erf
import matplotlib.pyplot as plt
x = np.linspace(-5, 0, 10000)
def starter(x,beta=0.1):
    w=np.where(x>0,1,0.5*(1+np.sqrt((1+erf((x+1)/(2*np.sqrt(beta))))/(1+erf(1/(2*np.sqrt(beta)))))))
    return w
def defender(x,ind=1,beta=0.1,alpha=2):
    aone = 1/(4*np.sqrt(4*np.pi*beta)*(1+erf(1/(2*np.sqrt(beta)))))
    src= aone*np.exp(-((x+(ind)**(-alpha))**2)/(4*beta))
    return src
fig = plt.figure()
ax = fig.add_subplot(111)
y=starter(x,0.1)
i=0
for ind in [1,1.2,0.8]:
    z=defender(x,ind)
    plt.plot(x,z, label=str(ind))
    i+=1
    ax.set_xlabel('x'); ax.set_ylabel('u')
plt.legend(loc='lower left',           fontsize=8)
#ax.set_ylim([0.4, 1.1])