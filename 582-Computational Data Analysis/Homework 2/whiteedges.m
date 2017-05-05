function [a1,a2,t]= whiteedges(mov,l,r,u,d,dimr)
  if nargin < 6
    dimr =   1;
  end
a1= zeros(226,1);
a2= zeros(226,1);
for j=1:226
y=[];
X=frame2im(mov(j));
X=double(X);
X(:,1:l)=0;
X(:,r:640)=0;
X(1:u,:)=0;
X(d:480,:)=0;
w=0.988;
s= find(X(:,:,1)>w*max(max(X(:,:,1))) &X(:,:,2)>w*max(max(X(:,:,2)))& X(:,:,3)>w*max(max(X(:,:,3))) );
while isempty(s)
    w=0.988*w;
    s= find(X(:,:,1)>w*max(max(X(:,:,1))) &X(:,:,2)>w*max(max(X(:,:,2)))& X(:,:,3)>w*max(max(X(:,:,3))) );
end
t= indexmat(s);
%t=t(t(:,1)>200,:);
m=mode(t(:,dimr));
if dimr==1
    diml=2;
else
    diml=1;
end
y= t( t(:,dimr)==m,diml);
a1(j)=mean(y);
a2(j)=mean(m);
end