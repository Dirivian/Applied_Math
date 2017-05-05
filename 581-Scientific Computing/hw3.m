n=8;
dx = 20/n;
k=n^2;
phi=zeros(k,k) ;
A= spdiags((-4)*ones(k,1),0,k,k)+spdiags((1)*ones(k,1),-1,k,k)+spdiags((1)*ones(k,1),1,k,k)+spdiags((1)*ones(k,1),n,k,k)+spdiags((1)*ones(k,1),-n,k,k)+spdiags((1)*ones(k,1),k-n,k,k)+spdiags((1)*ones(k,1),n-k,k,k);
B= spdiags((1)*ones(k,1),1,k,k)+spdiags((-1)*ones(k,1),-1,k,k);
for i=1:n
    B((i-1)*n+1,i*n) = -1;
    B(i*n,n*(i-1)+1) = 1;
    if i==n
        break;
    end
    B(i*n,i*n+1) = 0; 
    B(i*n+1,i*n)=0;
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
B =(1/(2*dx))*B;
C= spdiags((1)*ones(k,1),n,k,k)+spdiags((-1)*ones(k,1),-n,k,k)+spdiags((-1)*ones(k,1),k-n,k,k)+spdiags((1)*ones(k,1),n-k,k,k);
C =(1/(2*dx))*C;
A= full(A);
B= full(B);
C= full(C);
save A1.dat A -ascii;
save A2.dat C -ascii;
save A3.dat B -ascii;
