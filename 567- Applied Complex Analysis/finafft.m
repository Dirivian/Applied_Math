function ans =finafft(tspan ,w,dummy, Kxy,n, sinx,siny,sinz)


Uf = reshape(w(1:n^3,1),16,16,16);


 U= real(ifft2(Uf));

T = (1-sinx).*(1-siny).*(1-sinz);
 Unew = fftn(1i*(T.*U-((abs(U).^2).*U)+0.5*real(ifftn(Kxyz.*Uf))));


Uhh1= reshape(Unew,16^3,1);
  
 wnew = Uhh1;
 ans= wnew; 