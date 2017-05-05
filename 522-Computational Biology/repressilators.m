clc; clear all; close all;
init = rand(12,1);
tspan=[0 200];

alpha=50;

alpha0=0;
beta=0.2;
n=2;
p = [alpha,alpha0,beta,n];

%Uncoupled Oscillations

[t,Y] = ode45('coup_osc',tspan,init,[],0,p);

figure(1)
set(gca,'FontSize',16)
plot3(Y(:,1),Y(:,3),Y(:,5),'g',Y(:,7),Y(:,9),Y(:,11),'LineWidth',3) ; 
legend('m lalcl','m2 lalcl')


figure(2)
set(gca,'FontSize',16)
plot(t,Y(:,1:3),'LineWidth',3) ; hold on;
plot(t,Y(:,4:6),:,'LineWidth',3) ; hold on;
plot(t,Y(:,7:9),'LineWidth',3) ; hold on;
plot(t,Y(:,10:12),:,'LineWidth',3) ; hold off;
legend('m lalcl','p lacl','m tetR','p tetR','m cl','p cl','m2 lalcl','p2 lacl','m2 tetR','p2 tetR','m2 cl','p2 cl')

figure(3)
set(gca,'FontSize',16)
plot(t,Y(:,1),'LineWidth',3) ; hold on;
plot(t,Y(:,7),'g','LineWidth',3) ; hold off;
legend('m lalcl','m2 lalcl')
xlabel('t') ; 

%Coupled Oscillations

[t,Y] = ode45('coup_osc',tspan,init,[],10,p);

figure(4)
set(gca,'FontSize',16)
plot3(Y(:,1),Y(:,3),Y(:,5),'g',Y(:,7),Y(:,9),Y(:,11),'LineWidth',3) ; 
legend('m lalcl','m2 lalcl')


figure(5)
set(gca,'FontSize',16)
plot(t,Y(:,1:3),'LineWidth',3) ; hold on;
plot(t,Y(:,4:6),:,'LineWidth',3) ; hold on;
plot(t,Y(:,7:9),'LineWidth',3) ; hold on;
plot(t,Y(:,10:12),:,'LineWidth',3) ; hold off;
legend('m lalcl','p lacl','m tetR','p tetR','m cl','p cl','m2 lalcl','p2 lacl','m2 tetR','p2 tetR','m2 cl','p2 cl')


figure(6)
set(gca,'FontSize',16)
plot(t,Y(:,1),'LineWidth',3) ; hold on;
plot(t,Y(:,7),'g','LineWidth',3) ; hold off;
legend('m lalcl','m2 lalcl')
xlabel('t') ; 