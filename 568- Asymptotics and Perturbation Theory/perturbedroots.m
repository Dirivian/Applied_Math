clear all; close all; clc;
r=[];
j=[];
rl=1;
for e = -rl:0.1:rl
p=[1,0,-1,e];
t=roots(p)';
r= horzcat(r,t(1:3));
j=horzcat(j,e,e,e);
end;
hold on;
figure(1); plot(j,r,'ro');
i=0;
for e = -rl:0.1:rl
i=i+1;
p1(i)= e+e^3;
p2(i)= 1- 0.5*e-1.5*0.25*e^2;
p3(i)=-1-0.5*e+1.5*0.25*e^2;
end;
figure(1); plot(-rl:0.1:rl,p1,'-b*');
figure(1); plot(-rl:0.1:rl,p2,'--g');
figure(1); plot(-rl:0.1:rl,p3,'y');
figure(2); plot(j,r,'bo');