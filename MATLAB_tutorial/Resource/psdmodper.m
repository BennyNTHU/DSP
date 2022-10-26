function I=psdmodper(x,K)
% K-point FFT >= N
N=length(x);
w=hann(N); % choose window
w=w/(norm(w)/sqrt(N)); % sum w^2[k]=N
X=fft(x(:).*w(:),K);
I=X.*conj(X)/N;
I(1)=I(2); % Avoid DC bias
I=I(:);