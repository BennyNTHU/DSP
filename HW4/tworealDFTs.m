function [X1, X2] = tworealDFTs(x1,x2)

x=x1+1j*x2;
X=fft(x);

X_conj=conj([X(1) fliplr(X(2:end))]);
X1=(X+X_conj)/2;
X2=(X-X_conj)/2/1j;