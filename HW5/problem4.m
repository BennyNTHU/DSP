clc;clear;close all;

h=[1 1 1 1];
om=linspace(-pi, pi, 360);

% calculate
H=freqz(h,1,om);
A=amplresp(h,om);
H_mag=abs(H);
H_phase=angle(H);
[phi,w]=phasez(h,[1],360);

% plot
figure(1)
plot(om/pi, H_mag);
grid on;
xlabel('\omega/\pi');
ylabel('|H(e^{j\omega})|');
title('magnitude response');

figure(2)
plot(om/pi, H_phase);
grid on;
xlabel('\omega/\pi');
ylabel('\angle H(e^{j\omega})');
title('Phase response');

figure(3)
plot(om/pi, A);
grid on;
xlabel('\omega/\pi');
ylabel('A(e^{j\omega})');
title('Aplitude response');

figure(4)
plot(w/pi, phi);
grid on;
xlabel('\omega/\pi');
ylabel('\Psi(e^{j\omega})');
title('Angle response');
