function S=spectrogram0(x,L,NFFT,step,Fs)
% S=spectrogram0(x,L,NFFT,step,Fs)
N=length(x); K=fix((N-L+step)/step);
w=hanning(L); time=(1:L)';
N2=NFFT/2+1; S=zeros(K,N2);
for k=1:K
   	xw=x(time).*w;
   	X=fft(xw,NFFT);
   	X1=X(1:N2)';
   	S(k,1:N2)=X1.*conj(X1);
   	time=time+step;
end
S=fliplr(S)'; S=S/max(max(S));
colormap(1-gray); % colormap(jet);
tk=(0:K-1)'*step/Fs; F=(0:NFFT/2)'*Fs/NFFT;
imagesc(tk,flipud(F),20*log10(S),[-100 0]); axis xy