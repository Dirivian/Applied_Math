function [xtrain,xtest]= trainsets1(A,t)
st= size(t);
if st==2
 sizeA=t(1);
sizeB=t(2);

permA= randperm(1:sizeA);
permB= randperm(1:sizeB);
xtrain 
elseif st==3
 sizeA=t(1);
sizeB=t(2);
sizeC=t(3);
permA= randperm(1:sizeA);
permB= randperm(1:sizeB);
permC= randperm(1:sizeC);
xtrain 
end

end