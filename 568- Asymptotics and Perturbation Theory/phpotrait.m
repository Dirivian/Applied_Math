clear all; close all; clc;
a=0.5;
b=1.5;
[x,y]=meshgrid(-0.5+a:0.25:a+0.5,-0.5+b:0.25:0.5+b);
xdot=x.*(2-x)-x.*y;
ydot= y.*(1-(y./(1+x)));
quiver(x,y,xdot,ydot);
ylim([1 2])
%xlim([-2 5])
% [x1, x2] = meshgrid(-5:0.5:5, -5:.5:5);
% x1dot = -x1 - 2 *x2 .*x1.^2+x2; %Note the use of .* and .^
% x2dot = -x1-x2;
% quiver(x1,x2,x1dot, x2dot)