% obj=VideoReader('vid1.mpg');
% vidFrames = read(obj);
% numFrames = get(obj,'numberOfFrames');
% X=frame2im(mov(50));
% A=rgb2gray(X);
% mask = zeros(size(A));
% mask(400:450,320:400) = 1;
t=dir;
numFrames = 63;
dt = 3/numFrames;
Y=zeros(288*352,63);
for j=3:numFrames+2
    p= t(j);
    s=p.name;
X=imread(s);
X= rgb2gray(X);
imshow(X); drawnow
Y(:,j-2)= reshape(X,[288*352,1]);
end

Y2= Y(:,2:end);
Y1= Y(:,1:numFrames-1);
[Phi,omega,lambda,b,Xdmd] = DMD(Y1,Y2,15,dt);



%% DMD reconstruction
mm1 = size(Y1, 2)+10; % mm1 = m - 1
time_dynamics11 = zeros(1, mm1);
b11=b(11,1);
t = (0:mm1-1)*dt; % time vector
for iter = 1:mm1,
time_dynamics11(:,iter)=(b11.*exp(omega(11,1)*t(iter)));
end;
Phi11= Phi(:,11);
Xdmd11 = Phi11 * time_dynamics11;
ab= Xdmd11(:,20);
abr = reshape(ab,288,352);

abr = mat2gray(real(abr));

Xsparse = Xdmd-abs(Xdmd11);
R= zeros(size(Xsparse));
R(Xsparse<0)= Xsparse(Xsparse<0);
Xback = R+ abs(Xdmd11);
Xsparse = Xsparse- R;
for j = 1:70
ab= Xsparse(:,j);
abr = reshape(ab,288,352);
abr = mat2gray(abs(abr));
imshow(abr);drawnow
end
