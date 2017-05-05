%Dynamic Models in Biology, Stephen Ellner and John Guckenheimer
%Illustrates m-files defining matlab functions with several inputs
% lambda is a positive scalar, la and fa are vectors of the smae length
%f is the Euler-Lotka sum 

function f=eulot(lambda,Ia,fa);
    age=0:(length(Ia)-1);
    y=lambda.^(-(age+1));
    f=sum(y.*Ia.*fa)-1;
return;