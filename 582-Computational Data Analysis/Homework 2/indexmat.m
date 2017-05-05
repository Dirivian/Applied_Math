function [w]= indexmat(a)
i= ceil(a/480);
j=a- 480*(i-1);
w=[i,j];
end