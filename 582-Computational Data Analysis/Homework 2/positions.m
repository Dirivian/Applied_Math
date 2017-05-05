%%
a1= zeros(113,1);
a2= zeros(113,1);
for j=1:226
y=[];
X=frame2im(mov(j));
s= find(X(:,:,1)==255 &X(:,:,2)==255 & X(:,:,3)==255 );
t= indexmat(s);
t=t(t(:,1)>200,:);
m=mode(t(:,1));
y= t( t(:,1)==mean(m),2);
a1(j)=mean(y);
a2(j)=mean(m);
end
%%
a1= zeros(226,1);
a2= zeros(226,1);
for j=1:226
y=[];
X=frame2im(mov(j));
w1=max(max(X(:,:,1)));
w2=max(max(X(:,:,2)));
w3=max(max(X(:,:,3)));
w=min([w1,w2,w3]);
s= find(X(:,:,1)>252 &X(:,:,2)>252& X(:,:,3)>252 );
t= indexmat(s);
%t=t(t(:,1)>200,:);
m=mode(t(:,1));
y= t( t(:,1)==mean(m),2);
a1(j)=mean(y);
a2(j)=mean(m);
end