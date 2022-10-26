function r=acrsfft(x,L)
% r=acrsfft(x-mean(x),L) yields the ACVS
N=length(x);
Q=nextpow2(N+L);
X=fft(x,2^Q);
r0=real(ifft(X.*conj(X)));
r=r0(1:L)/N;