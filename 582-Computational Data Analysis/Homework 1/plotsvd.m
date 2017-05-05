%% Mode statistics
p= diag(S);
close all;
figure;
subplot(2,1,1);
semilogy(p,'ko');
f=20;
xlabel('Mode index','FontSize', f) % x-axis label
ylabel('Singular Values','FontSize', f) % y-axis label
title('\bfLog scale plot of singular values','FontSize', f)
subplot(2,1,2);
plot((1-cumsum(p)/sum(p))*100, 'bo');
xlabel('Mode index','FontSize', f) % x-axis label
ylabel('Percentage of singular values','FontSize', f) % y-axis label
title(' \bf Percentage of singular values captured by each mode','FontSize', f)

%% First three modes
figure;
m= 480;
n=640;
U1= reshape(U(:,1),m,n);
subplot(1,3,1);
colormap('gray'); imagesc(U1);
xlabel('Intensity') % x-axis label
ylabel('Intensity') % y-axis label
title(' \bf The first mode','FontSize', f)
subplot(1,3,2);
U2= reshape(U(:,2),m,n);
colormap('gray'); imagesc(U2);
xlabel('Intensity') % x-axis label
ylabel('Intensity') % y-axis label
title(' \bf The second mode','FontSize', f)
subplot(1,3,3);
U3= reshape(U(:,3),m,n);
colormap('gray'); imagesc(U3);
xlabel('Intensity') % x-axis label
ylabel('Intensity') % y-axis label
title(' \bf The third mode','FontSize', f)

%%
figure;
m= 480;
n=640;
U1= reshape(U(:,1),m,n);
figure;
colormap('gray'); imagesc(U1);
xlabel('Intensity') % x-axis label
ylabel('Intensity') % y-axis label
title(' \bf The first mode','FontSize', f)
figure;
U2= reshape(U(:,2),m,n);
colormap('gray'); imagesc(U2);
xlabel('Intensity') % x-axis label
ylabel('Intensity') % y-axis label
title(' \bf The second mode','FontSize', f)
figure;
U3= reshape(U(:,3),m,n);
colormap('gray'); imagesc(U3);
xlabel('Intensity') % x-axis label
ylabel('Intensity') % y-axis label
title(' \bf The third mode','FontSize', f)

%% Reconstruction
j=300;
R= U(:,1:j)*S(1:j,1:j)*V(:,1:j)';


R1= reshape(R(:,1),m,n);
figure;
subplot(1,2,2);
colormap('gray'); imagesc(R1);
xlabel('Intensity','FontSize', f) % x-axis label
ylabel('Intensity','FontSize', f) % y-axis label
title(' \bf Reconstructed image','FontSize', f)

subplot(1,2,1);
Z1= reshape(Z(:,1),m,n);
colormap('gray'); imagesc(Z1);
xlabel('Intensity','FontSize', f) % x-axis label
ylabel('Intensity','FontSize', f) % y-axis label
title(' \bf Original image','FontSize', f)