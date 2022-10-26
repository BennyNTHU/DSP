% Continuous-time windows

clear; close all;

set(0,'DefaultAxesFontName','Times','DefaultAxesFontUnits','points',...
   'DefaultAxesFontSize',8,'DefaultTextFontName','Times','DefaultTextFontUnits',...
   'points','DefaultTextFontSize',8);

f1=figure;
set(f1,'PaperPosition',[1 1 6 4]);


T_0=1; 
Om0=20*(2*pi/T_0);
Om=linspace(-Om0,Om0,10000);

t=linspace(-T_0/2,T_0/2,10000);
wR=ones(size(t));
wB=1-2*abs(t)/T_0;
wHan=0.50+0.50*cos(2*pi*t/T_0);
wHam=0.54+0.46*cos(2*pi*t/T_0);

a=0.5; b=0.25;

WR=sin(Om*T_0/2)./(Om/2);
WB=(4*(sin(Om*T_0/4)).^2)./(Om.*Om*T_0/2);
WHan=a*sin(Om*T_0/2)./(Om/2)+b*sin((Om-2*pi/T_0)*T_0/2)./((Om-2*pi/T_0)/2)+b*sin((Om+2*pi/T_0)*T_0/2)./((Om+2*pi/T_0)/2);
WHam=0.54*sin(Om*T_0/2)./(Om/2)+0.23*sin((Om-2*pi/T_0)*T_0/2)./((Om-2*pi/T_0)/2)+0.23*sin((Om+2*pi/T_0)*T_0/2)./((Om+2*pi/T_0)/2);
WHan=2*WHan; WHam=(1/0.54)*WHam; WB=2*WB;

subplot(2,2,1), plot(t,wR,t,wB,t,wHan,t,wHam)
axis([-0.6 0.6 0 1.4]); 

subplot(2,2,2), plot(Om,WR,Om,WB,Om,WHan,Om,WHam);
axis([-30 30 -0.4 1.2]);

subplot(2,2,3), plot(Om, 20*log10(abs(WR)),Om, 20*log10(abs(WB)),Om, 20*log10(abs(WHan)),Om, 20*log10(abs(WHam)));
axis([0 30 -60 0]);

subplot(2,2,4), semilogx(Om, 20*log10(abs(WR)),Om, 20*log10(abs(WB)),Om, 20*log10(abs(WHan)),Om, 20*log10(abs(WHam)));
axis([1 100 -60 0]);