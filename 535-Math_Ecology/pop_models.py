# -*- coding: utf-8 -*-
"""
Created on Tue Apr  4 22:16:27 2017

@author: user
"""

from pylab import *

x = linspace(-1,1, 1000)
t= linspace(0,100,10000)

def plot_sys(v,x,t):
    for w in x:
        plot(t,v(w,t))
        xlabel('Time')
        ylabel('Population Growth')
        
def plot_eq(v,x,param=[1,1]):

    plot(x,v(x,param))
    xlabel('Parameter')
    ylabel('Equilibrium')

def plot_bif(v,xspace,param=[1,1]):
    for x in xspace:
        j= v(x)
        l= size(j)
        w = np.ones(l)
        plot(x*w,j,'ko')
        xlabel('Parameter')
        ylabel('Equilibrium')
        
def plot_steps(v,xspace,r,dt=0.005, limy = [-1,1]):
    for x_0 in xspace:
        t=zeros(r)
        x=np.zeros(r+1)
        x[0]= x_0
        for i in range(r):
            t[i]=i*dt
            x[i+1]=x[i]+dt*v(x[i])
        plot(t,x[:-1])
        ylim(limy)
    xlabel('t')
    ylabel('x(t)')

    
def logistic(x,t, k=10,r=0.06):
    return k/(1+((k/x) -1)*exp(-r*t))
    
def gompertz(x,t,r=1,a=1):
    return x*exp((r/a)-(r/a)*exp(-a*t))
    
def Foxz(x,param =[1,1]):
    return param[0]*exp(-x/param[1])
    
def bif_1(x):
    if x <-0.25:
        return [0]
    elif x ==-0.25:
        return [0,np.sqrt(0.5), -np.sqrt(0.5)]
    elif x >0:
        return [0,np.sqrt(0.5 + 0.5*np.sqrt(1+4*x)), - np.sqrt(0.5 + 0.5*np.sqrt(1+4*x))]
    else:
        return [0,np.sqrt(0.5 + 0.5*np.sqrt(1+4*x)), - np.sqrt(0.5 + 0.5*np.sqrt(1+4*x)), np.sqrt(0.5 - 0.5*np.sqrt(1+4*x)), - np.sqrt(0.5 - 0.5*np.sqrt(1+4*x))]

def bif_2(x):
    return -0.1*x+x**3-x**5
    
def log_map(x):
    return x*(1-x)
#plot_sys(logistic,x,t)    
#plot_sys(gompertz,x,t)      
#plot_eq(Foxz,x)
#plot_bif(bif_1,x)
#plot_steps(bif_2,arange(-2, 2, 0.01),1500,0.05, [-2,2])
#plot_steps(log_map,[3],10,1, [-5,5])
    
    