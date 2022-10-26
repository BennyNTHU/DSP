function [Hr,w,P,L] = ampl_res(h,w);
%
% function [Hr,w,P,L] = ampl_res(h)
%
% Computes Amplitude response Hr(w) and its polynomial P of order L,
%   given a linear-phase FIR filter impulse response h.
% The type of filter is determined automatically by the subroutine.
%
% Hr = Amplitude Response
%  w = frequencies between [0 pi] over which Hr is computed
%  P = Polynomial coefficients
%  L = Order of P
%  h = Linear Phase filter impulse response
%

 M = length(h);
 L = floor(M/2);
if fix(abs(h(1:1:L))*10^10) ~= fix(abs(h(M:-1:M-L+1))*10^10)
	error('Not a linear-phase impulse response')
end
if nargin == 1
    w = [0:1:500]'*pi/500;
else
    w = w(:);
end

if 2*L ~= M
	if fix(h(1:1:L)*10^10) == fix(h(M:-1:M-L+1)*10^10)
		disp('*** Type-1 Linear-Phase Filter ***')
		[Hr,w,P,L] = hr_type1(h,w);
	elseif fix(h(1:1:L)*10^10) == -fix(h(M:-1:M-L+1)*10^10)
		disp('*** Type-3 Linear-Phase Filter ***')
		h(L+1) = 0;
		[Hr,w,P,L] = hr_type3(h,w);
	end
else
	if fix(h(1:1:L)*10^10) == fix(h(M:-1:M-L+1)*10^10)
		disp('*** Type-2 Linear-Phase Filter ***')
		[Hr,w,P,L] = hr_type2(h,w);
	elseif fix(h(1:1:L)*10^10) == -fix(h(M:-1:M-L+1)*10^10)
		disp('*** Type-4 Linear-Phase Filter ***')
		[Hr,w,P,L] = hr_type4(h,w);
	end
end

