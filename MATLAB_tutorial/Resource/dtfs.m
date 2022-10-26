function c=dtfs(x)

N=length(x);
c=(1/N)*fft(x,N);