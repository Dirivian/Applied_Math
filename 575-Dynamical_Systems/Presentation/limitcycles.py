# -*- coding: utf-8 -*-
"""
Created on Thu Jun  1 03:10:21 2017

@author: user
"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
from mpl_toolkits.mplot3d import Axes3D
f=open("51.txt")
e4851=[]
for line in f:
    e4851.append(float(line))
e485=np.asarray(e4851)
j1=e485[:-1]
j2=e485[1:]
g1= e485[1:-1]-e485[:-2]
g2= e485[2:]-e485[1:-1]
diff2=e485[2:]+e485[:-2]-2*e485[1:-1]
diff=j2-j1
deriv2=diff2/(20000/(len(e485)*2))
deriv=diff/(20000/len(e485))
fig = plt.figure()
ax = fig.add_subplot(111)
plt.plot(e485[2:],deriv[1:])
ax.set_xlabel('$u_s$',fontsize=16); ax.set_ylabel('$\dot{u_s}$',fontsize=16)
fig2 = plt.figure()
ax2 = fig2.gca(projection='3d')
ax2.plot(e485[2:],deriv[1:],deriv2[:])
plt.show()