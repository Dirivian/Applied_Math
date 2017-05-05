%%
load Avrilav.mat;
load Owl.mat;
load Dream.mat
[xtrain,xtest] =trainsets(Avrilav,Owl,Dream);
%%
load xtrain.mat;
[~,~,vxtrain]=svd(xtrain,'econ');
ctrain = [ ones(120,1);2*ones(45,1); 3*ones(100,1);];
ctest= [ ones(120,1); 2*ones(45,1); 3*ones(100,1);];
%%
nb=NaiveBayes.fit(vxtrain,ctrain);
pred=nb.predict(vxtest);
%%
v=v';
plot3(v(1:240,1),v(1:240,2),v(1:240,3),'ko');hold on;
plot3(v(241:330,1),v(241:330,2),v(241:330,3),'ro');
hold on;
plot3(v(331:end,1),v(331:end,2),v(331:end,3),'bo');
%%
md1=ClassificationKNN.fit(vxtrain,ctrain);
pred1=predict(md1,vxtest);
%%
[xtrain,xtest]= trainsetsv(v,240,90,200);
k=500;
ctrain = [ ones(120,1);2*ones(45,1); 3*ones(100,1);];
xtrain=xtrain(:,1:k);
xtest=xtest(:,1:k);
nb=NaiveBayes.fit(xtrain,ctrain);
figure(1);
pred=nb.predict(xtest);
k= pred-ctrain;
disp((1-nnz(k)/265)*100);
bar(pred);
figure(2);
md1=ClassificationKNN.fit(xtrain,ctrain);
pred1=predict(md1,xtest);
k1= pred1-ctrain;
disp((1-nnz(k1)/265)*100);
bar(pred1);
figure(3);
pred3=classify(xtrain,xtest,ctrain);
k3= pred3-ctrain;
disp((1-nnz(k3)/265)*100);
bar(pred3);