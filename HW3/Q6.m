clc;clear;close all;

n=(-100:100);
om=linspace(-pi, pi, 10000);
T=0.1;

x=5*exp(1i*40*T*n)+3*exp(-1i*70*T*n);

X=freqz(x, 1, om);
X_mag = abs(X);
X_phase = angle(X);

figure(1)
subplot(2,1,1)
plot(om, X_mag, '.b')
xlabel('|X|')
xlabel('rad/s')
subplot(2,1,2)
plot(om, X_phase, '.g')
title('angle(X)')
xlabel('rad/s')

figure(2)
subplot(2,1,1)
plot(om/(2*pi), X_mag, '.b')
title('|X|')
xlabel('Hz')
subplot(2,1,2)
plot(om/(2*pi), X_phase, '.g')
title('angle(X1)')
xlabel('Hz')

