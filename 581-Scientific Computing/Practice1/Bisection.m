
equat = @(x)x*sin(3*x)-exp(x);

h=-0.4;
l=-0.7;
while(abs(j-((h+l)/2))>0.000001)
j= (h+l)/2
if equat(j)*equat(h)<0
    l=j
elseif equat(j)==0
    disp('broke')
    break;
else
    h=j
end
end
