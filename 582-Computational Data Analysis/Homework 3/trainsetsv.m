function [xtrain,xtest]= trainsetsv(v,sizeA,sizeB,sizeC)
if nargin==3
A= v(1:sizeA,:);
B=v(sizeA+1:end,:);

sizeT=sizeA+sizeB;
permA= randperm(sizeA);
permB= randperm(sizeB);
w1= floor(0.5*sizeA);
w2= floor(0.5*sizeB);
xtrain = zeros(w1+w2,sizeT);
xtrain(1:w1,:) =A(permA(1:w1),:); 
xtrain(w1+1:end,:) =B(permB(1:w2),:); 
xtest = zeros(sizeA+sizeB-w1-w2,sizeT);
xtest(1:sizeA-w1,:) =A(permA(1+w1:end),:); 
xtest(sizeA-w1+1:end,:) =B(permB(w2+1:end),:); 
elseif nargin==4
A= v(1:sizeA,:);
B=v(sizeA+1:sizeA+sizeB,:);
C=v(sizeA+sizeB+1:end,:);
sizeT=size(v,2);
permA= randperm(sizeA);
permB= randperm(sizeB);
permC= randperm(sizeC);
w1= floor(0.5*sizeA);
w2= floor(0.5*sizeB);
w3= floor(0.5*sizeC);
xtrain = zeros(w1+w2+w3,sizeT);
xtrain(1:w1,:) =A(permA(1:w1),:); 
xtrain(w1+1:w1+w2,:) =B(permB(1:w2),:); 
xtrain(w1+w2+1:end,:) =C(permC(1:w3),:); 
xtdim2=sizeA+sizeB+sizeC-w1-w2-w3;
xtest = zeros(xtdim2,sizeT);
xtest(1:sizeA-w1,:) =A(permA(1+w1:end),:); 
xtest(sizeA-w1+1:sizeA+sizeB-w1-w2,:) =B(permB(w2+1:end),:); 
xtest(sizeA+sizeB-w1-w2+1:end,:) =C(permC(w3+1:end),:); 
end

end