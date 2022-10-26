function S=psdwelch(x,L,K)
% Welch PSD estimator of S(2*pi*k/K)
M=fix((length(x)-L/2)/(L/2)) % 50% overlap
time=(1:L)';
I=zeros(K,1);
w=hanning(L); % Choose window
w=w/(norm(w)/sqrt(L)); % sum w^2[k]=L
for m=1:M
   %xw=w.*detrend(x(time)); % detrenting
   xw=w.*x(time); % data windowing
   X=fft(xw,K);
   I=I+X.*conj(X);
   time=time+L/2;
end
I=I/(M*L); S=2*I(1:K/2); S(1)=S(2);