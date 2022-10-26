function I=psdper(x,K)
% K-point FFT >= N
N=length(x);
X=fft(x,K);
I=X.*conj(X)/N;
I(1)=I(2); % Avoid DC bias
I=I(:);