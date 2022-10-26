clc;clear;close all;

n=(-100:100);
om=linspace(-pi, pi, 10000);
T=15;

y=2*cos(200*pi*T*n)+3*sin(500*pi*T*n);

Y=freqz(y, 1, om);
Y_mag = abs(Y);
Y_phase = angle(Y);

figure(3)
subplot(2,1,1)
plot(om, Y_mag, '.y')
title('|Y|')
xlabel('rad/s')
subplot(2,1,2)
plot(om, Y_phase, '.r')
title('angle(Y)')
xlabel('Hz')

figure(4)
subplot(2,1,1)
plot(om/(2*pi), Y_mag, '.y')
title('|Y|')
xlabel('rad/s')
subplot(2,1,2)
plot(om/(2*pi), Y_phase, '.r')
title('angle(Y)')
xlabel('Hz')