% DFT of cosines with period matching or not matching

clear; close all;

set(0,'DefaultAxesFontName','Times','DefaultAxesFontUnits','points',...
   'DefaultAxesFontSize',8,'DefaultTextFontName','Times','DefaultTextFontUnits',...
   'points','DefaultTextFontSize',8);

f1=figure;
set(f1,'PaperPosition',[1 1 5 3]);

n=(0:31);

x=cos(2*pi*(1/8)*n)+0.75*cos(2*pi*(2/8)*n);
X1=fft(x,2048);
X0=fft(x,32);

w=hanning(32);
v=w'.*(cos(2*pi*(1/8)*n)+0.75*cos(2*pi*(2/8)*n));
V1=fft(v,2048);
V0=fft(v,32);

y=cos(2*pi*(1/9)*n)+0.75*cos(2*pi*(2/7)*n);
Y1=fft(y,2048);
Y0=fft(y,32);


z=w'.*(cos(2*pi*(1/9)*n)+0.75*cos(2*pi*(2/7)*n));
Z1=fft(z,2048);
Z0=fft(z,32);

F0=(0:31)*(1/32);
F1=(0:2047)*(1/2048);
k=(0:31);


%subplot(3,1,1), plot(F0,abs(X0),'.k',F1,abs(X1),'b'); box off
%subplot(3,1,2), plot(F0,abs(Y0),'.k',F1,abs(Y1),'b'); box off
%subplot(3,1,3), plot(F0,abs(Z0),'.k',F1,abs(Z1),'b'); box off



subplot(2,1,1)
plot(32*F1,abs(X1),'b');
hold on
stem(k,abs(X0),'filled','k','markersize',3);
hold off
box off
set(gca,'xtick',[0 16  32]);
axis([0 32 0 20]);
xlabel('\itk \rm(\omega)');
ylabel('Amplitude');
%title('Rectangular window');
set(gca,'xticklabel',{'0';'16(p)';'32(2p)'},'fontname','symbol');


subplot(2,1,2)
plot(32*F1,abs(V1),'b');
hold on
stem(k,abs(V0),'filled','k','markersize',3);
hold off
box off
set(gca,'xtick',[0 16  32]);
axis([0 32 0 10]);
xlabel('\itk \rm(\omega)');
ylabel('Amplitude');
%title('Hann window');
set(gca,'xticklabel',{'0';'16(p)';'32(2p)'},'fontname','symbol');

f2=figure;
set(f2,'PaperPosition',[1 1 5 3]);

subplot(2,1,1)
plot(32*F1,abs(Y1),'b');
hold on
stem(k,abs(Y0),'filled','k','markersize',3);
hold off
box off
set(gca,'xtick',[0 16  32]);
axis([0 32 0 20]);
xlabel('\itk \rm(\omega)');
ylabel('Amplitude');
%title('Rectangular window')
set(gca,'xticklabel',{'0';'16(p)';'32(2p)'},'fontname','symbol');

subplot(2,1,2)
plot(32*F1,abs(Z1),'b');
hold on
stem(k,abs(Z0),'filled','k','markersize',3);
hold off
box off
set(gca,'xtick',[0 16  32]);
axis([0 32 0 10]);
xlabel('\itk \rm(\omega)');
ylabel('Amplitude');
%title('Hann window');
set(gca,'xticklabel',{'0';'16(p)';'32(2p)'},'fontname','symbol');


