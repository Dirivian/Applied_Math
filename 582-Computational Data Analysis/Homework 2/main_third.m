%% Third Case
%% First Cam
load('cam1_3.mat');
mov1_3=getmovout(vidFrames1_3);
%playmov(mov1_3);
[a11_3,a21_3]=whiteedges(mov1_3,270,400,200,450);

%% Second Cam
load('cam2_3.mat');
mov2_3=getmovout(vidFrames2_3);

%playmov(mov2_3);
[a12_3,a22_3]=whiteedges(mov2_3,220,450,150,400);

%% Third Cam
load('cam3_3.mat');
mov3_3=getmovout(vidFrames3_3);

%playmov(mov3_3);

[a13_3,a23_3]=whiteedges(mov3_3,300,500,150,350,2);