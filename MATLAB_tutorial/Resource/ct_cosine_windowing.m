% Continuous-time cosine windowing

clear; close all;

set(0,'DefaultAxesFontName','Times','DefaultAxesFontUnits','points',...
   'DefaultAxesFontSize',8,'DefaultTextFontName','Times','DefaultTextFontUnits',...
   'points','DefaultTextFontSize',8);

f1=figure;
set(f1,'PaperPosition',[1 1 6 4]);

F0=1;
F1=3;
F2=4;

Fs=20;
T=1/Fs;
T0=2;

t=(0:T:T0);
L=length(t);

xc=cos(2*pi*F0*t)+cos(2*pi*F1*t)+cos(2*pi*F2*t); 

w=linspace(0,pi,2^16);
F=(w/(2*pi))*Fs;

Xr=freqz(xc(:),1,w);
Xb=freqz(xc(:).*bartlett(L),1,w);
Xhan=freqz(xc(:).*hann(L),1,w);
Xham=freqz(xc(:).*hamming(L),1,w);

subplot(2,2,1), plot(F,T*abs(Xr));
xlabel('\itF \rm(Hz)');
ylabel('Amplitude');
title('Rectangular window');
axis([0 10 0 1.4]);
subplot(2,2,2), plot(F,T*abs(Xb));
xlabel('\itF \rm(Hz)');
ylabel('Amplitude');
title('Bartlett window');
axis([0 10 0 0.6]);
subplot(2,2,3), plot(F,T*abs(Xhan));
xlabel('\itF \rm(Hz)');
ylabel('Amplitude');
title('Hann window');
axis([0 10 0 0.6]);
subplot(2,2,4), plot(F,T*abs(Xham));
xlabel('\itF \rm(Hz)');
ylabel('Amplitude');
title('Hamming window');
axis([0 10 0 0.6]);
