function [y]= songs2vectors(x,sampler)
t= dir;
L=0;

for i=3:x+2
   
    p=t(i);
    [k,w]=audioread(p.name);
    disp(i);
    disp(w);
    dim2 = size(k,2);
    for ijk =1:1
    kdash = k(:,ijk);   
    s=floor(size(k,1)/(5*w));
    rans=randperm(s);
    for j =rans(1:sampler)
        new= kdash((j-1)*5*w+1:j*5*w);
        newfft = real(fftshift(fft(new)));
        L=L+1;
        b(:,L)=newfft; 
    end
   end
end
y=b;
end