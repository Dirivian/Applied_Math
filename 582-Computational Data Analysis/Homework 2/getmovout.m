function [mov]= getmovout(vidFrames,numFrames)
for k=1:numFrames
    mov(k).cdata = vidFrames(:,:,:,k);mov(k).colormap = [];
end