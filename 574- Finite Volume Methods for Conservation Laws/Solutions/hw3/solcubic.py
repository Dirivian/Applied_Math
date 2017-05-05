# -*- coding: utf-8 -*-
"""
Created on Fri Feb 10 22:52:31 2017

@author: user
"""

import numpy as np
import matplotlib.pyplot as plt

x= np.linspace(-10,10, 10000)
l=0
q=np.zeros(10000)
for i in x:
    if i < -7.0/3.0:
        q[l]=4.0/3.0
    elif i >6:
        q[l]=3
    else:
        q[l]= 4.0/3.0 + np.sqrt(7.0/9.0 + i/3.0)

    l+=1
 
plt.ylim(1, 3.5)       
plt.plot(x,q)        