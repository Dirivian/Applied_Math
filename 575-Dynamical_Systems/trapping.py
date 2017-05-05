# -*- coding: utf-8 -*-
"""
Created on Wed Apr 26 12:41:38 2017

@author: user
"""


import numpy as np
import matplotlib.pyplot as plt

asp = np.linspace(0,1/8,1000)

for a in asp:
    j = np.sqrt(0.5*(1-2*a-np.sqrt(1-8*a)))
    plt.plot(a,j,'bo')
    w = np.sqrt(0.5*(1-2*a+np.sqrt(1-8*a)))
    plt.plot(a,w,'bo')
    
plt.show

