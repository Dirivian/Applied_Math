function [xtrain,xtest]= trainsets(A,B,C)
if nargin==2


 sizeA=size(A,2);
sizeB=size(B,2);

permA= randperm(sizeA);
permB= randperm(sizeB);
w1= floor(0.5*sizeA);
w2= floor(0.5*sizeB);
xtrain = zeros(44100*5,w1+w2);
xtrain(:,1:w1) =A(:,permA(1:w1)); 
xtrain(:,w1+1:end) =B(:,permB(1:w2)); 
xtest = zeros(44100*5,sizeA+sizeB-w1-w2);
xtest(:,1:sizeA-w1) =A(:,permA(1+w1:end)); 
xtest(:,sizeA-w1+1:end) =B(:,permB(w2+1:end)); 
elseif nargin==3

sizeA=size(A,2);
sizeB=size(B,2);
sizeC=size(C,2);
permA= randperm(sizeA);
permB= randperm(sizeB);
permC= randperm(sizeC);
w1= floor(0.5*sizeA);
w2= floor(0.5*sizeB);
w3= floor(0.5*sizeC);
xtrain = zeros(44100*5,w1+w2+w3);
xtrain(:,1:w1) =A(:,permA(1:w1)); 
xtrain(:,w1+1:w1+w2) =B(:,permB(1:w2)); 
xtrain(:,w1+w2+1:end) =C(:,permC(1:w3)); 
xtdim2=sizeA+sizeB+sizeC-w1-w2-w3;
xtest = zeros(44100*5,xtdim2);
disp(w1);
disp(sizeA);
xtest(:,1:sizeA-w1) =A(:,permA(1+w1:end)); 
xtest(:,sizeA-w1+1:sizeA+sizeB-w1-w2) =B(:,permB(w2+1:end)); 
xtest(:,sizeA+sizeB-w1-w2+1:end) =C(:,permC(w3+1:end)); 
end

end