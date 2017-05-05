[xtrain,xtest]= trainsetsv(v,240,176,198);
k=500;
ctrain = [ ones(120,1);2*ones(88,1); 3*ones(99,1);];
xtrain=xtrain(:,1:k);
xtest=xtest(:,1:k);
nb=NaiveBayes.fit(xtrain,ctrain);
pred=nb.predict(xtest);
bar(pred);