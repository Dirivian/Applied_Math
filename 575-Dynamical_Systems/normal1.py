from sympy import *
x= Symbol('x')
y= Symbol('y')
a= Symbol('a') #lambda1
b= Symbol('b')
J= Matrix([[a,0], [0,b]])
#H=Matrix([[x*y], [0]])
#Dh=Matrix([[y,x], [0,0]])
#L1=J*H-Dh*J*Matrix([[x], [y]])
H=Matrix([[0], [x**2]])
Dh=Matrix([[0,0], [2*x,0]])
L2=J*H-Dh*J*Matrix([[x], [y]])
print(L2)
