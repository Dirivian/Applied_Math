
import matplotlib
matplotlib.rc('text', usetex = True)

from pylab import *


figure(3)
clf()

plot([-1,1.5],[0,0],'k')
plot([-1,1.5],[0.5,0.5],'k')
plot([-1,-1],[0,.5],'k')
plot([1.5,1.5],[0,.5],'k')

plot([0,-1],[0,0.5],'b')
plot([0,1.5],[0,0.5],'b')

text(-0.7,0.1,'$q_\ell$',fontsize=30)
text(1.,0.1,'$q_r$',fontsize=30)
text(0.15,0.3,'$q_m$',fontsize=30)

text(-1.1,-0.05,'$x = s^1T$',fontsize=15)
text(1.3,-0.05,'$x = s^2T$',fontsize=15)
text(-0.1,-0.05,'$x = 0$',fontsize=15)

text(-1.3,0,'$t = 0$',fontsize=15)
text(-1.3,0.5,'$t = T$',fontsize=15)
xlim(-1.32, 1.6)
ylim(-0.2,0.6)

axis('off')
savefig('qbox.png', bbound_inches='tight')
