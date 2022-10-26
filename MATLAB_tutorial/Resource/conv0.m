function [y,ny]=conv0(h,nh,x,nx)

ny=[nh(1)+nx(1):nh(length(h))+nx(length(x))];
y=conv(h,x);