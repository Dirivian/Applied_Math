# -*- coding: utf-8 -*-
"""
Created on Sun Apr 30 17:09:08 2017

@author: user
"""

import numpy as np
import matplotlib.pyplot as plt
r = np.linspace(0,20,1000)
b= 1/(1-1/r)
plt.plot(r,b,'b')
c= 2/(1-1/r)
plt.plot(r,c,'g')
plt.ylim([0,10])
plt.show()

ra = np.linspace(0,20,100)
ba = np.linspace(0,20,100)
for re in ra:
    for be in ba:
        f = 1- be*(1-1/re)
        if 0<f <1:
            plt.plot(re,be,'bo')
        elif -1<f <0:
            plt.plot(re,be,'go')
            
        else:
                
            plt.plot(re,be,'ro')
plt.show