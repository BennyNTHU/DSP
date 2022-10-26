% Continuous-time windows

clear; close all;

set(0,'DefaultAxesFontName','Times','DefaultAxesFontUnits','points',...
   'DefaultAxesFontSize',8,'DefaultTextFontName','Times',...
   'DefaultTextFontUnits','points','DefaultTextFontSize',8);

f1=figure;
set(f1,'paperunits','inches','PaperPosition',[0,0,7,5],...
    'units','inches','position',[1,1,7,5]);


T_0=1; Om0=20*(2*pi/T_0); Om=linspace(-Om0,Om0,10000);
t=linspace(-T_0/2-0.1,T_0/2+0.1,12000);

wR=(t >= -T_0/2 & t <= T_0/2);%ones(size(t));
wB=(1-2*abs(t)/T_0).*wR;
wHan=(0.50+0.50*cos(2*pi*t/T_0)).*wR;
wHam=(0.54+0.46*cos(2*pi*t/T_0)).*wR;
subplot(4,4,1); 
plot(t,0*t,'k','linewidth',0.5); hold on;
plot([0,0],[-0.1,1.1],'k','linewidth',0.5);
plot(t,wR,'b','linewidth',1.5); axis([-0.6 0.6 -0.1 1.1]);
subplot(4,4,2);  
plot(t,0*t,'k','linewidth',0.5); hold on;
plot([0,0],[-0.1,1.1],'k','linewidth',0.5);
plot(t,wB,'b','linewidth',1.5); axis([-0.6 0.6 -0.1 1.1]);
subplot(4,4,3);  
plot(t,0*t,'k','linewidth',0.5); hold on;
plot([0,0],[-0.1,1.1],'k','linewidth',0.5);
plot(t,wHan,'b','linewidth',1.5); axis([-0.6 0.6 -0.1 1.1]);
subplot(4,4,4);  
plot(t,0*t,'k','linewidth',0.5); hold on;
plot([0,0],[-0.1,1.1],'k','linewidth',0.5);
plot(t,wHam,'b','linewidth',1.5); axis([-0.6 0.6 -0.1 1.1]);



a=0.5; b=0.25;

WR=sin(Om*T_0/2)./(Om/2);
WB=(4*(sin(Om*T_0/4)).^2)./(Om.*Om*T_0/2);
WHan=a*sin(Om*T_0/2)./(Om/2)+b*sin((Om-2*pi/T_0)*T_0/2)./...
    ((Om-2*pi/T_0)/2)+b*sin((Om+2*pi/T_0)*T_0/2)./((Om+2*pi/T_0)/2);
WHam=0.54*sin(Om*T_0/2)./(Om/2)+0.23*sin((Om-2*pi/T_0)*T_0/2)./...
    ((Om-2*pi/T_0)/2)+0.23*sin((Om+2*pi/T_0)*T_0/2)./((Om+2*pi/T_0)/2);
WHan=2*WHan; WHam=(1/0.54)*WHam; WB=2*WB;

subplot(4,4,5); 
plot(Om,0*Om,'k','linewidth',0.5); hold on;
plot([0,0],[-0.4,1.2],'k','linewidth',0.5);
plot(Om,WR,'b','linewidth',1.5); axis([-30 30 -0.4 1.2]);

subplot(4,4,6); 
plot(Om,0*Om,'k','linewidth',0.5); hold on;
plot([0,0],[-0.4,1.2],'k','linewidth',0.5);
plot(Om,WB,'b','linewidth',1.5); axis([-30 30 -0.4 1.2]);

subplot(4,4,7) 
plot(Om,0*Om,'k','linewidth',0.5); hold on;
plot([0,0],[-0.4,1.2],'k','linewidth',0.5);
plot(Om,WHan,'b','linewidth',1.5); axis([-30 30 -0.4 1.2]);

subplot(4,4,8)
plot(Om,0*Om,'k','linewidth',0.5); hold on;
plot([0,0],[-0.4,1.2],'k','linewidth',0.5);
plot(Om,WHam,'b','linewidth',1.5); axis([-30 30 -0.4 1.2]);


subplot(4,4,09), 
plot(Om, 20*log10(abs(WR)),'b','linewidth',1.5); axis([0 30 -60 0]);
subplot(4,4,10), 
plot(Om, 20*log10(abs(WB)),'b','linewidth',1.5); axis([0 30 -60 0]);
subplot(4,4,11), 
plot(Om, 20*log10(abs(WHan)),'b','linewidth',1.5); axis([0 30 -60 0]);
subplot(4,4,12), 
plot(Om, 20*log10(abs(WHam)),'b','linewidth',1.5); axis([0 30 -60 0]);


subplot(4,4,13), 
semilogx(Om, 20*log10(abs(WR)),'b','linewidth',1.5); axis([1 100 -60 0]);
subplot(4,4,14), 
semilogx(Om, 20*log10(abs(WB)),'b','linewidth',1.5); axis([1 100 -60 0]);
subplot(4,4,15), 
semilogx(Om, 20*log10(abs(WHan)),'b','linewidth',1.5); axis([1 100 -60 0]);
subplot(4,4,16), 
semilogx(Om, 20*log10(abs(WHam)),'b','linewidth',1.5); axis([1 100 -60 0]);

print -depsc2 ../artfiles/0726_ctwindows.eps;
