function x=idtfs(c)

N=length(c);
x=N*ifft(c,N);