function [Hr,w,c,L] = Hr_Type3(h,w)
% Computes Amplitude response Hr(w) of a Type-3 LP FIR filter
% -----------------------------------------------------------
% [Hr,w,c,L] = Hr_Type3(h)
% Hr = Amplitude Response
%  w = frequencies between [0 pi] over which Hr is computed
%  c = Type-3 LP filter coefficients
%  L = Order of Hr
%  h = Type-3 LP impulse response
%
 M = length(h);
 L = (M-1)/2;
 c = [2*h(L+1:-1:1)];
 n = [0:1:L];
%  w = [0:1:500]'*pi/500;
if nargin == 1
    w = [0:1:500]'*pi/500;
else
    w = w(:);
end
Hr = sin(w*n)*c';
