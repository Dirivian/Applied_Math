%%Get Movie out
for k=1:226
    mov(k).cdata = vidFrames1_4(:,:,:,k);mov(k).colormap = [];
end
%% Play movie
numFrames=226;
for j=1:numFrames
X=frame2im(mov(j));
imshow(X); drawnow
end


%%
X=frame2im(mov(1));
X=rgb2gray(X);
X=double(X);
x1=frame2im(mov(1));
for j= 2:226
    A=frame2im(mov(j));
    A=rgb2gray(A);
    A=double(A);
    X=X+A;
end
X3=X/226;
%Y=rgb2gray(X3);
%%
X4= frame2im(mov(1));
X4=rgb2gray(X4);
X4=double(X4);
disp(1);
l1=[];
l2=[];
disp(2);
for j=2:226
    x1=frame2im(mov(j));
    
x=rgb2gray(x1);
x=double(x);
Y2=x-X4;
%Y2(Y2>120)=0;
Y2(:,1:300)=0;
Y2(:,400:640)=0;
ma=0.8*max(max(Y2));
%Y2(Y2<120)=0;
Y2(Y2<ma)=0;

y2bw=im2bw(Y2);

stats = regionprops(y2bw,'Centroid');

di=stats.Centroid;

l1=[l1,di(1)];
l2=[l2,di(2)];

imagesc(Y2); colorbar; drawnow;
end