function [gd,omega]=grpdelay0(b,a)
% Computation of group delay
K=1024;
h=impz(b,a,K);
n=(0:K-1)';
Hn=fft(n.*h,K);
H=fft(h,K);
ind0=find(abs(H)<10*eps);
gd=real(Hn./H);
gd(ind0)=NaN;
omega=2*pi*(0:K-1)/K;
% gd=gd(1:K/2+1); % 0 <= omega <= pi
% omega=2*pi*(0:K/2)/K;
% k=[K/2+1:K 1:K/2]; 
% gd=gd(k); % -pi < omega <= pi
% omega=2*pi*(-K/2+1:K/2)/K;
