%% Second Case
%% First Cam
load('cam1_2.mat');
mov1_2=getmovout(vidFrames1_2);
%%%playmov(mov1_2);
[a11_2,a21_2]=whiteedges(mov1_2,300,420,220,420);

%% Second Cam
load('cam2_2.mat');
mov2_2=getmovout(vidFrames2_2);


%playmov(mov2_2);
[a12_2,a22_2]=whiteedges(mov2_2,200,400,150,400);

%% Third Cam
load('cam3_2.mat');
mov3_2=getmovout(vidFrames3_2);
%%
%playmov(mov3_2);

[a13_2,a23_2]=whiteedges(mov3_2,300,500,200,350,2);