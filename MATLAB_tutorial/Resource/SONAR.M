function R=sonar(x,L,NFFT,step,Fs,figtitle);
% function R=sonar(x,L,NFFT,step,Fs,figtitle)

clg
N=length(x);
K=fix((N-L+step)/step);
w=hanning(L);
time=(1:L)';
N2=NFFT/2+1;
R=zeros(1:K,1:N2);

for k=1:K
	xw=x(time)-mean(x(time));
	xw=xw.*w;
	X=fft(xw,NFFT);
	X1=X(1:N2)';
	R(k,1:N2)=X1.*conj(X1);
	time=time+step;
end

% Plot signal and spectrogram

Np=K*step+L-step;
Np=K*step-step;
t=(0:Np-1)'/Fs;
axes('position',[0.1,0.7,0.8,0.2]);
plot(t,x((1:Np)'+L/2));
axis([0 Np/Fs -Inf Inf]);
xlabel('Time (Seconds)');
ylabel('Amplitude');
title(figtitle);


R=10*log10(R);
axes('position',[0.1,0.25,0.8,0.3]);
Rmax=max(max(R));
Rmin=min(min(R));
Rq=(R-Rmin)*63/(Rmax-Rmin);
colormap(jet(64));
%colormap(gray(64));
F=(0:NFFT/2)'*Fs/NFFT;
tk=(0:K-1)'*step/Fs;
image(tk,flipud(F),fliplr(Rq)');
axis on
xlabel('Time (Seconds)');
ylabel('Frequency (Hz)');

axes('position',[0.92, 0.25, 0.06, 0.3]);
pcolor([1:32;1:32]');
axis off

R=Rq;

figure

t=(0:Np-1)'/Fs;
axes('position',[0.1,0.7,0.8,0.2]);
plot(t,x(1:Np));
axis([0 Np/Fs -Inf Inf]);
xlabel('Time (Seconds)');
ylabel('Amplitude');
title(figtitle);
grid;

axes('position',[0.1,0.25,0.8,0.3]);
F=(0:NFFT/2)'*Fs/NFFT;
tk=(0:K-1)'*step/Fs;
contour(tk,F,R');
xlabel('Time (Seconds)');
ylabel('Frequency (Hz)');

