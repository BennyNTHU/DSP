function y=circonvfft(h,x)
% Computation of linear convolution using the FFT algorithm

N=length(h)+length(x)-1;
y=ifft(fft(h,N).*fft(x,N));