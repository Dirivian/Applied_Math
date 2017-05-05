
v=v1;
test=v(501:end,1:40);
v=v(1:500,:);


figure(1);
sizeA=200;
sizeB=150;
sizeC=150;
plot3(v(1:sizeA,1),v(1:sizeA,2),v(1:sizeA,3),'go');
hold on;
plot3(v(sizeA+1:sizeA+sizeB,1),v(sizeA+1:sizeA+sizeB,2),v(sizeA+1:sizeA+sizeB,3),'ro');
plot3(v(sizeA+sizeB+1:sizeA+sizeB+sizeC,1),v(sizeA+sizeB+1:sizeA+sizeB+sizeC,2),v(sizeA+sizeB+1:sizeA+sizeB+sizeC,3),'bo');
t=sizeA+sizeB+sizeC;
A= v(1:sizeA,1:t);
B=v(sizeA+1:sizeA+sizeB,1:t);
C=v(sizeA+sizeB+1:sizeA+sizeB+sizeC,1:t);
l=0.5;
w1= floor(l*sizeA);
w2= floor(l*sizeB);
w3= floor(l*sizeC);
permA= randperm(sizeA);
permB= randperm(sizeB);
permC= randperm(sizeC);
Q1=A(permA(1:w1),:);
Q2=B(permB(1:w2),:);
Q3=C(permC(1:w3),:);
N1=A(permA(1+w1:end),:);
N2=B(permB(1+w2:end),:);
N3=C(permC(1+w3:end),:);
xtrain=[Q1;Q2;Q3;];

xtest=[N1;N2;N3;];
ctester= [ ones(sizeA-w1,1);2*ones(sizeB-w2,1); 3*ones(sizeC-w3,1);];
figure(2);
k=40;
ctrain = [ ones(w1,1);2*ones(w2,1); 3*ones(w3,1);];
xtrain=xtrain(:,1:k);
xtest=xtest(:,1:k);
nb=NaiveBayes.fit(xtrain,ctrain);
pred=nb.predict(xtest);
bar(pred);
k= pred-ctester;
disp((1-nnz(k)/size(ctester,1))*100);
f=20;
xlabel('Sample index','FontSize', f) % x-axis label
ylabel('Class index','FontSize', f) % y-axis label
title(' \bf Naive Bayes Classification','FontSize', f)
figure(3);
md1=ClassificationKNN.fit(xtrain,ctrain);
pred1=predict(md1,xtest);
bar(pred1);
k1= pred1-ctester;
disp((1-nnz(k1)/size(ctester,1))*100);
xlabel('Sample index','FontSize', f) % x-axis label
ylabel('Class index','FontSize', f) % y-axis label
title(' \bf kNN Classification','FontSize', f)


%%
% figure(5);
% ctest=[ ones(40,1);2*ones(46,1); 3*ones(50,1);];
% predt1=nb.predict(test);
% bar(predt1);
% k= predt1-ctest;
% disp((1-nnz(k)/size(ctest,1))*100);
% f=20;
% xlabel('Sample index','FontSize', f) % x-axis label
% ylabel('Class index','FontSize', f) % y-axis label
% title(' \bf Naive Bayes Classification','FontSize', f)
% 
% figure(6);
% predt2=predict(md1,test);
% bar(predt2);
% k1= predt2-ctest;
% disp((1-nnz(k1)/size(ctest,1))*100);
% xlabel('Sample index','FontSize', f) % x-axis label
% ylabel('Class index','FontSize', f) % y-axis label
% title(' \bf kNN Classification','FontSize', f)