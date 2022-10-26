function [H, omega]=freqz0(b,a);
% Computation of frequency response function
K=1024;
H=fft(b,K)./fft(a,K); % 0 <= omega < 2*pi
omega=2*pi*(0:K-1)/K;
% H=H(1:K/2+1); % 0 <= omega <= pi
% omega=2*pi*(0:K/2)/K;
% k=[K/2+1:K 1:K/2]; 
% H=H(k); % -pi < omega <= pi
% omega=2*pi*(-K/2+1:K/2)/K;