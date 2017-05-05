%% Exercise 2.6 -Biennial Plant
L = [ 0 1 5; 0.5 0 0 ; 0 0.25 0];
N(:,1)= [0; 1; 0];
for i=1:50
    N(:,i+1)=L*N(:,i);
end;
k=sum(N);
t=1:51;
figure;
plot(t,log(k));
hold on;
N1= N(1,:)./k;
N2= N(2,:)./k;
N3= N(3,:)./k;
Neach = [N1;N2;N3];
plot(t,Neach);

%% Problem Set 1 - Euler Lotkerra
clc; clear all;
L = [ 0 1 5 0.5; 0.5 0 0 0; 0 0.9 0 0;0 0 0.95 0 ];
N(:,1)= [100; 100; 100; 100;];
for i=1:50
    N(:,i+1)=L*N(:,i);
end;
k=sum(N);
t=1:51;
figure;
plot(t,log(k));
%title('Log of the total population size against time');
xlabel('Time','FontSize',18) % x-axis label
ylabel('Log of the total population size','FontSize',18) % y-axis label
%legend('y = sin(x)')
N0= N(1,:)./k;
N1= N(2,:)./k;
N2= N(3,:)./k;
N3= N(4,:)./k;
%Neach = [N1;N2;N3;N4];
figure;
plot(t,N0,t,N1,t,N2,t,N3);
xlabel('Time' ,'FontSize',18) % x-axis label
ylabel('Fractional population size of different ages','FontSize',18) % y-axis label
legend('Age 0', 'Age 1', 'Age 2', 'Age 3');
legend('show')
lamdase= polyfit(t,log(k),1);
lamda= lamdase(1,1);
F = [ 0 1 5 0.5];
I = [1 0.5  0.45 0.45*0.95];
guess_min=0.0001; guess_max=10;
lambdabar = fzero(@(lambda) eulot(lambda,I,F),[guess_min,guess_max]);

%% Problem Set 1 - Owls
clc; clear all;
Lo = zeros(49);
v=0.942.*ones(1,48);
Lo=diag(v,-1);
Lo(1,2:49)=0.24;
Lo(2,1)=0.0722;
No(:,1)= 100*ones(49,1);
for i=1:49
    No(:,i+1)=Lo*No(:,i);
end;
k=sum(No);
t=1:50;
figure;
plot(t,log(k));
lam = polyfit(t,log(k),1);
lamda =exp(lam(1,1));

%Elasticity Matrix
[Ri,BS]  = eigs(Lo);
[Li,BS]  = eigs(transpose(Lo));
Li=Li(:,1);%dominant left eigenvector
Ri=Ri(:,1);%dominant right eigenvector
es = sum(Li.*Ri);
Elas =zeros(49);
for i=1:49
    for j=1:49
        Elas(i,j) = (Lo(i,j)/BS(1,1))*(Li(i,1)*Ri(j,1)/es);
    end;
end;
%% Problem Set 1 - Killer Whales
clc; clear all;
A=[ 0 0.0043 0.1132 0; 0.9775 0.9111 0 0 ; 0 0.0736 0.9534 0; 0 0 0.0452 0.9804];
[L,B] =eigs(A);
L =L(:,1);
B=B(1,1);
s = sum(L);
x = 250/s;

% Adults
N=zeros(4,1000);
N(:,1)=x.*L;
hold on;
t =1:1000;
hi=0;
for ha= 1:0.001:10
    hi=hi+1;
    for i=1:999
        N(:,i+1)=A*N(:,i);
        Int=N(3,i+1)-ha;
        if Int<0
            N(3,i+1) =0;
        else
        N(3,i+1)=Int;
        end;
        sub = sum(N(:,i+1));
        if sub<1
            disp(i);
            break;
        end
    end
    sk=sum(N(:,1:i));
    if sub<1
            break;
    end ;
end
    plot(1:i,sk); 
    xlabel('Time','FontSize',18) % x-axis label
ylabel('Adult population with extinction harvesting','FontSize',18) % y-axis label

%Juveniles
N=zeros(4,1000);
N(:,1)=x.*L;
figure;
hold on;
t =1:1000;
hi=0;
for hj= 1:0.001:10
    hi=hi+1;    
    for i=1:999
        N(:,i+1)=A*N(:,i);
        Int=N(2,i+1)-hj;
        if Int<0
            N(2,i+1) =0;
        else
        N(2,i+1)=Int;
        end;
        sub = sum(N(:,i+1));
        if sub<1
            disp(i);
            break;
        end
    end
    sj=sum(N(:,1:i));
    if sub<1
            break;
    end ;
end

    plot(1:i,sj); 
    xlabel('Time','FontSize',18) % x-axis label
ylabel('Juvenile population with extinction harvesting','FontSize',18) % y-axis label