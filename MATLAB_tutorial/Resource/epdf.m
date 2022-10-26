function [xo,px]=epdf(x,Nbins);
[nx,xo]=hist(x,Nbins);
dx=xo(3)-xo(2);
px=nx/(dx*length(x)); 