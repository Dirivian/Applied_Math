lambda_min=-0.4 ;
lambda_max=5 ;

lambdalist=linspace(lambda_min,lambda_max,1000) ;
Glist=zeros(1,length(lambdalist));

Ialist=[1.0000    0.5000    0.1250];
falist=[0     1     50];

for j=1:length(lambdalist)
    Glist(j)=eulot(lambdalist(j),Ialist,falist) ;
end

figure
plot(lambdalist,Glist);
xlabel('lambda','FontSize',20)
ylabel('G(lambda)','FontSize',20)
set(gca,'FontSize',20)

guess_min=0.0001; guess_max=10;

lambdabar = fzero(@(lambda) eulot(lambda,Ialist,falist),[guess_min,guess_max]);