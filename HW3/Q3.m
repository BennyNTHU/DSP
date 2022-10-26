clc;clear;close all;
om=linspace(-pi, pi, 360);

bf=[-1/16 9/8 -1/16];
af=[1];
bi=[9];
ai=[8 1];
[mag_Hf, phase_Hf]=freqz(bf,af,'whole',360); 
[mag_Hi, phase_Hi]=freqz(bi,ai,'whole',360); 

figure(1)
plot(om, abs(mag_Hf), '.g')
title('|H_{FIR}|')

figure(2)
plot(om, abs(mag_Hi), '.b')
title('|H_{IIR}|')