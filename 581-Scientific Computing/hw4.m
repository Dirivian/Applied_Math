clear all;
n=64;
x = linspace(-10,10,n); 
y = linspace(-10,10,n); 
[X,Y] = meshgrid(x);
F = exp((-X.^2-Y.^2)/20);
%surf(abs(Y));
dx = 20/n;
k=n^2;
phi=zeros(k,k) ;
A= spdiags((-4)*ones(k,1),0,k,k)+spdiags((1)*ones(k,1),-1,k,k)+spdiags((1)*ones(k,1),1,k,k)+spdiags((1)*ones(k,1),n,k,k)+spdiags((1)*ones(k,1),-n,k,k)+spdiags((1)*ones(k,1),k-n,k,k)+spdiags((1)*ones(k,1),n-k,k,k);
C= spdiags((1)*ones(k,1),1,k,k)+spdiags((-1)*ones(k,1),-1,k,k);
for i=1:n
    C((i-1)*n+1,i*n) = -1;
    C(i*n,n*(i-1)+1) = 1;
    if i==n
        break;
    end
    C(i*n,i*n+1) = 0; 
    C(i*n+1,i*n)=0;
end
for i=1:n
    A((i-1)*n+1,i*n) = 1;
    A(i*n,n*(i-1)+1) = 1;
    if i==n
        break;
    end
    A(i*n,i*n+1) = 0; 
    A(i*n+1,i*n)=0;
end
A= (1/(dx^2))*A;
C =(1/(2*dx))*C;
B= spdiags((1)*ones(k,1),n,k,k)+spdiags((-1)*ones(k,1),-n,k,k)+spdiags((-1)*ones(k,1),k-n,k,k)+spdiags((1)*ones(k,1),n-k,k,k);
B =(1/(2*dx))*B;
tspan= 0:0.5:4;
winit=reshape(F,[],1);
[t,w] = ode45(@(t,w) stream(w,A,B,C),tspan,F);
