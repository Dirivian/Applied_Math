%% Part 1
clc; clear all; close all;
a =1;
n=0;
while 1==1
    
    a = a+(9/10)^n;
    %disp(a);
    if abs(a-10)<1e-6
        disp(n);
        break;
    end;
    n=n+1;
    disp(n);
    
end
z=n;
%% Part 2
j=0;
for n= 0:152
   a=0; 
for k=n:152
    a=a+ (nchoosek(k,n))*(((1/2))^(n-k));
end
j=j+a*(((9/10))^n);
end
%% Part 3
w=0;
for n= 0:152
   a=0; 
for k=n:152
    a=a+ nchoosek(k,n)*((1/2)^(n-k));
end
w=w+a*((-11/10)^n);
end