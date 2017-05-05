from pylab import *

def plot_rightgoing(x1,t1,s):
    """
    plot right-going wave of slope s starting at (x1,t1) to right boundary
    """
    t2 = t1 + (1.0/s)*(4-x1)
    plot([x1,4], [t1,t2], 'k')

def plot_leftgoing(x1,t1,s):
    """
    plot left-going wave of slope s starting at (x1,t1) to left boundary
    """
    t2 = t1 + (1.0/s)*(-4-x1)
    plot([x1,-4], [t1,t2], 'k')
    
plot([-4,4],[0,0],'k') # x-axis  'k' means black line
plot([-4,-4],[0,6],'k') # t-axis
plot([4,4],[0,6],'k') # right boundary

def plot_char(x,v):
    for w in x:
        s=v(w)
        if s >0:
            plot_rightgoing(w,0,s)
        elif s==0:
            plot([w,w],[0,6],'k')
        else:
        
            plot_leftgoing(w,0,s)
            
        ylim([0, 6])
        xlabel('Spatial Domain')
        ylabel('Time')
            
x = linspace(-4,4,99)

def same(x):
    
    return  1-x**2


def plot_nchar(x, v, t = linspace(0,20,1000)):
    for w in x:

        plot(v(w,t),t)
        ylim([0, 6])
        xlim([-4, 4])
        xlabel('Spatial Domain')
        ylabel('Time')
        
def q_2(x,t):
    return x+ cos(x)*t**2

def q_4(x,t):
    return x*exp(t)
        
#plot_nchar(x,q_4)    
#plot_nchar(x,q_4) 
plot_char(x,same)
            
        

