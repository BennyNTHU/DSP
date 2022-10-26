function [X,w] = zfa(x,M,wL,wH)
% Zoom-FFT Algorithm (ZFA): 
%   Given x[n] ZFA computes M equispaced DTFT values X[k]
%   on the unit circle over wL <= w <= wH 
% [X,w] = zfa(x,M,wL,wH)
% Cautions: 
%     1. M must be a power of 2
%     2. (2*pi)/(wH-wL)*M must be larger than length(x)
%
M = 2^(ceil(log2(M))); Nx = length(x);
L = ceil(2*pi/(wH-wL)*(M-1)/M); l = 0:L-1;
N = L*M; dw = 2*pi/N; k0 = floor(wL/dw);
k = k0:1:k0+(M-1); w = k*dw;
x = [reshape(x,1,Nx),zeros(1,N-Nx)];
x = (reshape(x,L,M))'; X = fft(x);
WN = exp(-1j*2*pi*k'*l/N); 
k = mod(k,M); X = X(k+1,:); X = sum(X.*WN,2);