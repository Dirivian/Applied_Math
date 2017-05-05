% obj=VideoReader('vid1.mpg');
% vidFrames = read(obj);
% numFrames = get(obj,'numberOfFrames');
% X=frame2im(mov(50));
% A=rgb2gray(X);
% mask = zeros(size(A));
% mask(400:450,320:400) = 1;
t=dir;
numFrames = 150;
dt = 3/60;
dim1=480;
dim2=640;
Y=zeros(dim1*dim2,numFrames);
for j=3:numFrames+2
    p= t(j);
    s=p.name;
 X=imread(s);
 X= rgb2gray(X);
 imshow(X); drawnow
 Y(:,j-2)= reshape(X,[dim1*dim2,1]);
end

Y2= Y(:,2:end);
Y1= Y(:,1:numFrames-1);
[Phi,omega,lambda,b,Xdmd] = DMD(Y1,Y2,15,dt);



%% DMD reconstruction
mm1 = size(Y1, 2)+10; % mm1 = m - 1

t = (0:mm1-1)*dt; % time vector
[~,ind]=min(omega);
b11= b(ind,1);
for iter = 1:mm1,
time_dynamics11(:,iter)=(b11.*exp(omega(ind,1)*t(iter)));
end;
Phind = Phi(:,ind);
Xdmd11 = Phind * time_dynamics11;


Xsparse = Xdmd-abs(Xdmd11);
R= zeros(size(Xsparse));
R(Xsparse<0)= Xsparse(Xsparse<0);
Xback = R+ abs(Xdmd11);
Xsparse = Xsparse- R;
for j = 1:70
ab= Xsparse(:,j);
abr = reshape(ab,dim1,dim2);
abr = mat2gray(abs(abr));
imshow(abr);drawnow
end
