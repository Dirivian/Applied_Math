%% Fourth Case
%% First Cam
load('cam1_4.mat');
mov1_4=getmovout(vidFrames1_4);
%playmov(mov1_4);
[a11_4,a21_4]=whiteedges(mov1_4,300,450,220,450);

%% Second Cam
load('cam2_4.mat');
mov2_4=getmovout(vidFrames2_4);
%playmov(mov2_4);
[a12_4,a22_4]=whiteedges(mov2_4,200,420,150,350);

%% Third Cam
load('cam3_4.mat');
mov3_4=getmovout(vidFrames3_4);
%playmov(mov3_4);
[a13_4,a23_4]=whiteedges(mov3_4,320,480,150,250,2);