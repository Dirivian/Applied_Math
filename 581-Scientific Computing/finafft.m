function ans =finafft(tspan ,w,dummy, Kxyz,n, T)


Uf = reshape(w(1:n^3,1),16,16,16);


 U= real(ifftn(Uf));

 Unew =fftn(1i*T.*U-1i*U.*(abs(U).^2))+0.5*1i*Kxyz.*Uf;


Uhh1= reshape(Unew,16^3,1);
  
 wnew = Uhh1;
 ans= wnew; 