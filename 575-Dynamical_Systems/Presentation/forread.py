# -*- coding: utf-8 -*-
"""
Created on Tue May 30 22:22:06 2017

@author: user
"""
import numpy as np
import matplotlib.pyplot as plt
f=open("b56.txt")
e485=[]
for line in f:
    e485.append(float(line))
a=20000/len(e485)
b=20000-a*15000
x=np.linspace(int(b),20000,15000)
l1=6000
x2=np.linspace(0,a*l1,l1)
fig = plt.figure()
ax = fig.add_subplot(111)
plt.plot(x,e485[-15000:])
#plt.plot(x2,e485[:l1])
ax.set_xlim([b,15000])
#ax.set_xlim([0,a*l1])
ax.set_xlabel('time',fontsize=16); ax.set_ylabel('$u_s$',fontsize=20)

