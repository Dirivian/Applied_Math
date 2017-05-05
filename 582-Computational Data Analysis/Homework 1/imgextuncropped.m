close all; clear all; clc;
t= dir( '**.pgm');
wi=1;
for i=1:585
    y=t(i);
    x=y.name;
    A = imread(x);
    Z(:,wi)= reshape(A,[],1);
    wi=wi+1;
end;
Z= double(Z);
[U,S,V]= svd(Z,'econ'); 