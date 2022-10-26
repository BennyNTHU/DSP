function [Hr,w,a,L] = Hr_Type1(h,w)
% Computes Amplitude response Hr(w) of a Type-1 LP FIR filter
% -----------------------------------------------------------
% [Hr,w,a,L] = Hr_Type1(h)
% Hr = Amplitude Response
%  w = 500 frequencies between [0 pi] over which Hr is computed
%  a = Type-1 LP filter coefficients
%  L = Order of Hr
%  h = Type-1 LP filter impulse response
%
 M = length(h);
 L = (M-1)/2;
 a = [h(L+1) 2*h(L:-1:1)]; % 1x(L+1) row vector
 n = [0:1:L];              % (L+1)x1 column vector
%  w = [0:1:500]'*pi/500;
if nargin == 1
    w = [0:1:500]'*pi/500;
else
    w = w(:);
end
Hr = cos(w*n)*a';