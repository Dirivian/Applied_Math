x=0.5;
y=-1.6;
while abs(y-x)>0.000001
   x=y; 
   y= x- ((x*sin(3*x)-exp(x))/(sin(3*x)+3*x*cos(x)-exp(x)));
end