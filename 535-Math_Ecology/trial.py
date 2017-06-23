# -*- coding: utf-8 -*-
"""
Created on Sun Apr 30 17:09:08 2017

@author: user
"""

import numpy as np
import matplotlib.pyplot as plt


ra = np.linspace(0,20,100)
ba = np.linspace(0,20,100)
for re in ra:
    for be in ba:
        f = 1-be +be/re**(1/be)
        if -1<f <1:
            plt.plot(be,re,'bo')
        else:
                
            plt.plot(be,re,'ro')
plt.show