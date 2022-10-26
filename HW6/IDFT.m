function x=IDFT(X,N)

x=fft(circfold(X,N))/N;