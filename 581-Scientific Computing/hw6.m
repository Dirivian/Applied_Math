  %%
clear all; clc;
n=16;
dx = 2*pi/n;
x = linspace(-pi,pi-dx,n);
y = linspace(-pi,pi-dx,n);
z = linspace(-pi,pi-dx,n);
x1= -pi:dx:pi-dx;
[X,Y,Z]=meshgrid(x1);
sinx = sin(X).^2;
siny = sin(Y).^2;
sinz = sin(Z).^2;
u1=cos(X).*cos(Y).*cos(Z);
Uhh= fftn(u1);

%winit = [fft2(u);fft2(v)];
Uhh= reshape(Uhh,16^3,1);


winit = Uhh;
kx=[0:(n/2-1) (-n/2):-1];
kx(1)=10^(-6);
ky=[0:(n/2-1) (-n/2):-1];
ky(1)=10^(-6);
kz=[0:(n/2-1) (-n/2):-1];
kz(1)=10^(-6);
[KX,KY,KZ] = meshgrid(kx,ky,kz);
Kxyz =-1*( KX.^2+KY.^2+KZ.^2);
T = (1-sinx).*(1-siny).*(1-sinz);
tspan = 0:0.5:4;
[t,wsol] = ode45('finafft',tspan,winit,[],Kxyz,n,T);
wsol23= real(wsol);
save A1.dat wsol23 -ascii
wsol1 = wsol23(1,:);

u=sin(X).*sin(Y).*sin(Z);
Uhh= (fftn(u));
%winit = [fft2(u);fft2(v)];
Uhh= reshape(Uhh,16^3,1);

%   winit = [Uhh;Vhh];
%      Uhh= reshape(u,64^2,1);
%    Vhh= reshape(v,64^2,1);
winit1 = Uhh;
[t,wsol2] = ode45('finafft',tspan,winit1,[],Kxyz,n,T);
wsol2= real(wsol2);
save A2.dat wsol2 -ascii