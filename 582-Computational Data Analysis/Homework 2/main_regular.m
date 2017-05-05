%% Regular Case
%% First Cam
load('cam1_1.mat');
mov1_1=getmovout(vidFrames1_1);
%playmov(mov1_1);
[a11_1,a21_1]=whiteedges(mov1_1,300,400,170,480);

%% Second Cam
load('cam2_1.mat');
mov2_1=getmovout(vidFrames2_1);
%playmov(mov2_1);
[a12_1,a22_1]=whiteedges(mov2_1,220,370,100,400);

%% Third Cam
load('cam3_1.mat');
mov3_1=getmovout(vidFrames3_1);
%playmov(mov3_1);
[a13_1,a23_1]=whiteedges(mov3_1,250,500,150,350,2);