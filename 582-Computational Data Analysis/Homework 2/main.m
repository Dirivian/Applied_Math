%clc; clear all; close all;
n=226;
f=18;
main_regular;
figure(1);
subplot(3,2,1);
plot(a11_1);
xlabel('Time','FontSize', f-3) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 1: X direction','FontSize', f)
subplot(3,2,2);
plot(a21_1);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 1: Y direction','FontSize', f)
subplot(3,2,3);
plot(a12_1);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 2: X direction','FontSize', f-3)
subplot(3,2,4);
plot(a22_1);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 2: Y direction','FontSize', f)
subplot(3,2,5);
plot(a13_1);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 3: X direction','FontSize', f)
subplot(3,2,6);
plot(a23_1);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 3: Y direction','FontSize', f)

X1=[a11_1/max(a11_1),a21_1/max(a21_1),a12_1/max(a12_1),a22_1/max(a22_1),a13_1/max(a13_1),a23_1/max(a23_1)];
mn =mean(X1,1);
X1=X1-repmat(mn,n,1);
[u1,s1,v1]=svd(X1/sqrt(n-1),'econ');
lambda1=diag(s1).^2;
percent1= lambda1*100/sum(lambda1);
figure(2);
plot(percent1, 'ro');
xlabel('Mode index','FontSize', f) % x-axis label
ylabel('Percentage of singular values','FontSize', f) % y-axis label
title(' \bf Percentage of variation captured by each mode','FontSize', f)

T1=u1*s1;
figure(3);
plot(T1(:,1), 'b');
xlabel('Time','FontSize', f) % x-axis label
ylabel('Principal mode','FontSize', f) % y-axis label
title(' \bf The Principal Component','FontSize', f)
disp(1);

main_second;
figure(4);
subplot(3,2,1);
plot(a11_2);
xlabel('Time','FontSize', f-3) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 1: X direction','FontSize', f)
subplot(3,2,2);
plot(a21_2);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 1: Y direction','FontSize', f)
subplot(3,2,3);
plot(a12_2);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 2: X direction','FontSize', f-3)
subplot(3,2,4);
plot(a22_2);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 2: Y direction','FontSize', f)
subplot(3,2,5);
plot(a13_2);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 3: X direction','FontSize', f)
subplot(3,2,6);
plot(a23_2);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 3: Y direction','FontSize', f)
X2=[a11_2/max(a11_2),a21_2/max(a21_2),a12_2/max(a12_2),a22_2/max(a22_2),a13_2/max(a13_2),a23_2/max(a23_2)];
mn =mean(X2,1);
X2=X2-repmat(mn,n,1);
[u2,s2,v2]=svd(X2/sqrt(n-1),'econ');
lambda2=diag(s2).^2;
percent2= lambda2*100/sum(lambda2);
figure(5);
plot(percent2, 'ro');
xlabel('Mode index','FontSize', f) % x-axis label
ylabel('Percentage of singular values','FontSize', f) % y-axis label
title(' \bf Percentage of variation captured by each mode','FontSize', f)
T2=u2*s2;
figure(6);
plot(T2(:,1), 'b');
xlabel('Time','FontSize', f) % x-axis label
ylabel('Principal mode','FontSize', f) % y-axis label
title(' \bf The Principal Component','FontSize', f)
disp(2);


main_third;
figure(7);
subplot(3,2,1);
plot(a11_3);
xlabel('Time','FontSize', f-3) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 1: X direction','FontSize', f)
subplot(3,2,2);
plot(a21_3);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 1: Y direction','FontSize', f)
subplot(3,2,3);
plot(a12_3);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 2: X direction','FontSize', f-3)
subplot(3,2,4);
plot(a22_3);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 2: Y direction','FontSize', f)
subplot(3,2,5);
plot(a13_3);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 3: X direction','FontSize', f)
subplot(3,2,6);
plot(a23_3);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 3: Y direction','FontSize', f)
X3=[a11_3/max(a11_3),a21_3/max(a21_3),a12_3/max(a12_3),a22_3/max(a22_3),a13_3/max(a13_3),a23_3/max(a23_3)];
mn =mean(X3,1);
X3=X3-repmat(mn,n,1);
[u3,s3,v3]=svd(X3/sqrt(n-1),'econ');
lambda3=diag(s3).^2;
percent3= lambda3*100/sum(lambda3);
figure(8);
plot(percent3, 'ro');
xlabel('Mode index','FontSize', f) % x-axis label
ylabel('Percentage of singular values','FontSize', f) % y-axis label
title(' \bf Percentage of variation captured by each mode','FontSize', f)
T3=u3*s3;
figure(9);
subplot(1,2,1);
plot(T3(:,1), 'b');
xlabel('Time','FontSize', f) % x-axis label
ylabel('Principal mode','FontSize', f) % y-axis label
title(' \bf First Principal Component','FontSize', f)
subplot(1,2,2);
plot(T3(:,2), 'b');
xlabel('Time','FontSize', f) % x-axis label
ylabel('Principal mode','FontSize', f) % y-axis label
title(' \bf Second Principal Component','FontSize', f)
disp(3);


main_fourth;
figure(10);
subplot(3,2,1);
plot(a11_4);
xlabel('Time','FontSize', f-3) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 1: X direction','FontSize', f)
subplot(3,2,2);
plot(a21_4);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 1: Y direction','FontSize', f)
subplot(3,2,3);
plot(a12_4);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 2: X direction','FontSize', f-3)
subplot(3,2,4);
plot(a22_4);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 2: Y direction','FontSize', f)
subplot(3,2,5);
plot(a13_4);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 3: X direction','FontSize', f)
subplot(3,2,6);
plot(a23_4);
xlabel('Time','FontSize', f) % x-axis label
ylabel('Displacement','FontSize', f) % y-axis label
title(' \bf Cam 3: Y direction','FontSize', f)
X4=[a11_4/max(a11_4),a21_4/max(a21_4),a12_4/max(a12_4),a22_4/max(a22_4),a13_4/max(a13_4),a23_4/max(a23_4)];
mn =mean(X4,1);
X4=X4-repmat(mn,n,1);
[u4,s4,v4]=svd(X4/sqrt(n-1),'econ');
lambda4=diag(s4).^2;
percent4= lambda4*100/sum(lambda4);
figure(11);
plot(percent4, 'ro');
xlabel('Mode index','FontSize', f) % x-axis label
ylabel('Percentage of singular values','FontSize', f) % y-axis label
title(' \bf Percentage of variation captured by each mode','FontSize', f)
T4=u4*s4;
figure(12);
subplot(1,2,1);
plot(T4(:,1), 'b');
xlabel('Time','FontSize', f) % x-axis label
ylabel('Principal mode','FontSize', f) % y-axis label
title(' \bf First Principal Component','FontSize', f)
subplot(1,2,2);
plot(T4(:,2), 'b');
xlabel('Time','FontSize', f) % x-axis label
ylabel('Principal mode','FontSize', f) % y-axis label
title(' \bf Second Principal Component','FontSize', f)
disp(4);