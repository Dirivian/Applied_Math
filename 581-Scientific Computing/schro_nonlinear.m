function rhs= schro_nonlinear(x,Y,E, gamma)
rhs =[Y(2) ;(gamma*abs(Y(1)^2)+x^2-E)*Y(1)];
end