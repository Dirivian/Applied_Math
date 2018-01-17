#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jan  7 08:18:15 2018

@author: jithin

HW1 for 585
"""
import numpy as np
from tabulate import tabulate

def central_diff(f,x,h):
    return (f(x+h)+f(x-h)-2*f(x))/h**2
j=[]
hlist =[]
for i in range(1,17):
    hlist.append(10**-i)
for h in hlist:
    j.append([h,central_diff(np.sin,np.pi/6,h),central_diff(np.sin,np.pi/6,h)+np.sin(np.pi/6)])

print(tabulate(j,headers=['h', 'Computed Value', 'Error'],tablefmt="latex"))

r=[]
s=[]
def richardson(A,f,x,h,step):
    k=2
    if step ==1:
        return (2**k *A(f,x,h/2)-A(f,x,h))/(2**k -1)
    else:
        step-=1
        k+=2
        return (2**k *richardson(A,f,x,h/2,step)-richardson(A,f,x,h,step))/(2**k -1)
for h in [0.2,0.1]:
    r.append([h,richardson(central_diff,np.sin,np.pi/6,h,1),richardson(central_diff,np.sin,np.pi/6,h,1)+np.sin(np.pi/6)])

for h in [0.2,0.1]:
    s.append([h,richardson(central_diff,np.sin,np.pi/6,h,2),richardson(central_diff,np.sin,np.pi/6,h,2)+np.sin(np.pi/6)])
print(tabulate(r,headers=['h', 'Computed Value', 'Error'],tablefmt="latex"))
print(tabulate(s,headers=['h', 'Computed Value', 'Error'],tablefmt="latex"))
