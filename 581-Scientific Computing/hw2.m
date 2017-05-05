
clc; clear all; close all;
xspan =-4:0.1: 4;
tol =10^-4;
A=1;
E=0.4;
dE=0.5;
i=0;
A1 = zeros(81,5);
A2 = zeros(1,5);


for mode =1:5
    jw=0;
    dE=0.5;
while jw==0
 Y0 =[1, sqrt(16-E)];
 [x,Y]=ode45(@(x,Y) schro(x,Y, E),xspan,Y0);
 geq = Y(end,2)+sqrt(16-E)*Y(end,1);
if abs(geq)<tol
    jw=1;
elseif ((-1)^(mode))*geq>0
    E = E-dE;
        dE=dE/2;
elseif ((-1)^(mode))*geq< 0

    E= E+dE;   
end
end
A2(1,mode)= E;
disp(E);

GY = abs(Y(:,1)).^2;
norm = trapz(x,GY);

E= E+0.1;
plot(x,Y(:,1)); hold on;
Y(:,1)= abs(Y(:,1)./(sqrt(norm)));
A1(:,mode)=Y(:,1);
end
save A1.dat A1 -ascii;
save A2.dat A2 -ascii;