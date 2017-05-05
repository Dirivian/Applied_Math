clc; clear all;
A=[ 0 0.0043 0.1132 0; 0.9775 0.9111 0 0 ; 0 0.0736 0.9534 0; 0 0 0.0452 0.9804];
[L,B] =eigs(A);
L =L(:,1);
B=B(1,1);
s = sum(L);
x = 250/s;
N=zeros(4,1000);
N(:,1)=x.*L;
hold on;
t =1:1000;
for h= 1:1:100
    k = [0;0;h;0;];
    for i=1:999
        Int=A*N(:,i)-k;
        Int(Int<0)=0;
        N(:,i+1)=Int;
        
    end
    sk=sum(N);
    plot(t,sk);
    
end