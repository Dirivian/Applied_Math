figure(1);
subplot(1,3,1);
f=20;
A1= reshape(Y(:,6),[dim1,dim2]);
A1g=mat2gray(abs(A1)); 
imshow(A1g);
title('\bf Time = 0','FontSize', f)
subplot(1,3,2);
A2= reshape(Y(:,20),[dim1,dim2]);
A2g=mat2gray(abs(A2)); 
imshow(A2g);
title('\bf Time = 2 s','FontSize', f)
subplot(1,3,3);
A3= reshape(Y(:,55),[dim1,dim2]);
A3g=mat2gray(abs(A3)); 
imshow(A3g);
title('\bf Time = 4 s','FontSize', f)

figure(2);
subplot(2,3,1);
f=20;
A1= reshape(Xback(:,6),[dim1,dim2]);
A1g=mat2gray(abs(A1)); 
imshow(A1g);
title('\bf Time = 0','FontSize', f)
subplot(2,3,2);
A2= reshape(Xback(:,20),[dim1,dim2]);
A2g=mat2gray(abs(A2)); 
imshow(A2g);
title('\bf Time = 2 s','FontSize', f)
subplot(2,3,3);
A3= reshape(Xback(:,55),[dim1,dim2]);
A3g=mat2gray(abs(A3)); 
imshow(A3g);
title('\bf Time = 4 s','FontSize', f)
% 
subplot(2,3,4);
f=20;
A1= reshape(Xsparse(:,6),[dim1,dim2]);
A1g=mat2gray(abs(A1)); 
imshow(A1g);
title('\bf Time = 0','FontSize', f)
subplot(2,3,5);
A2= reshape(Xsparse(:,20),[dim1,dim2]);
A2g=mat2gray(abs(A2)); 
imshow(A2g);
title('\bf Time = 2 s','FontSize', f)
subplot(2,3,6);
A3= reshape(Xsparse(:,55),[dim1,dim2]);
A3g=mat2gray(abs(A3)); 
imshow(A3g);
title('\bf Time = 4 s','FontSize', f)