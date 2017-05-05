function []= playmov(mov)
numFrames=numel(mov);
for j=1:numFrames
X=frame2im(mov(j));
imagesc(X); drawnow
end