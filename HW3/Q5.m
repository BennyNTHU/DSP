clc;clear;close all;
om=linspace(-pi, pi, 10000);

bf=[1 0 -1];
af=[1 -1.3435 0.9025];
[Hf, p]=freqz(bf,af,'whole',10000);
[gd,w] = grpdelay(bf,af,10000);

figure(1)
plot(om, abs(Hf), '.g')
title('|H|')

figure(2)
plot(om, angle(Hf), '.b')
title('|\angle H|')

figure(3)
plot(om, gd, '.r')
title('group delay')