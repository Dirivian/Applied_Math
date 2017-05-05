function rhs= stream(w, A,B,C)
psi = A\w;
%[L,U] = lu(A);
%psi = U\L\w;
w= reshape(w,64,64);
surf(w);
pause(0.5);

%l= -1/(2*(10^-12));
%psi = ifft2(l*fft2(w)) ;
w=reshape(w,[],1);
psi= reshape(psi,[],1);
rhs = (C*psi).*(B*w)-(B*psi).*(C*w) +0.001*A*w;

end
