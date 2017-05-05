close all; clear all; clc;
wi=1;
for l = 1:9
l=num2str(l);
t=strcat('yaleB0',l);
cd(t);
for i=5:68
   
    t=dir;
    y=t(i);
    x=y.name;
    A = imread(x);
    Z(:,wi)= reshape(A,[],1);
    wi=wi+1;
end
cd ..
end
disp(wi)
for l = 10:39
    
    if l==14
        continue
    end
l=num2str(l);
t=strcat('yaleB',l);
cd(t);
for i=5:68
    disp(wi)
    t=dir;
    y=t(i);
    x=y.name;
    A = imread(x);
    Z(:,wi)= reshape(A,[],1); 
    wi=wi+1;
end
cd ..
end
Z= double(Z);
[U,S,V]= svd(Z,'econ'); 
