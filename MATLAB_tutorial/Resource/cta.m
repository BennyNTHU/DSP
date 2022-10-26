function [X,w] = cta(x,M,wL,wH)
% Chirp Transform Algorithm (CTA)
%   Given x[n] CTA computes M equispaced DTFT values X[k]
%   on the unit circle over wL <= w <= wH 
% [X,w] = cta(x,M,wL,wH)
Dw = wH-wL; dw = Dw/(M-1); W = exp(-1j*dw);
N = length(x); nx = 0:N-1;
K = max(M,N); n = 0:K; Wn2 = W.^(n.*n/2);
g = x.*exp(-1j*wL*nx).*Wn2(1:N);
nh = -(N-1):M-1; h = W.^(-nh.*nh/2);
y = conv(g,h); 
X = y(N:N+M-1).*Wn2(1:M); w = wL:dw:wH;