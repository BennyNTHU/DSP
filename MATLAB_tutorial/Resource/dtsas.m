% Signal Processing with MATLAB
% Copyright (C) 2005 by Dimitris Manolakis
% Discrete-Time Signals and Systems

% Signal generation and plotting

close all; clear;
figure
n=(-5:25);
x=2*cos(2*pi*0.05*n);

subplot(3,1,1);
stem(n,x,'fill');
ylabel('x[n]');
xlabel('Time index (n)');

t=linspace(-5,25,1000);
xc=2*cos(2*pi*0.05*t);

subplot(3,1,2);
plot(t,xc);
ylabel('x_c(t)');
xlabel('Time (t)');

subplot(3,1,3);
plot(t,xc,n,x,'.');
xlabel('Time (t)');
legend('x_c(t)','x_c(nT)')

% Generate and plot elementary signals

figure
[x,n]=delta(-5,4,10);
subplot(4,1,1), stem(n,x,'fill');
title('Unit sample');
xlabel('n'); ylabel('x[n]');

[x,n]=unitstep(-5,-2,10);
subplot(4,1,2), stem(n,x,'fill');
title('Unit step');
xlabel('n'); ylabel('x[n]');

[x,n]=unitpulse(-5,-2,4,10);
subplot(4,1,3), stem(n,x,'fill');
title('Unit pulse');
xlabel('n'); ylabel('x[n]');

[x,n]=persegen([0 1 2 3 2 1],6,16,-5);
subplot(4,1,4), stem(n,x,'fill');
title('Triangular pulse train');
xlabel('n'); ylabel('x[n]');

% Time aligment of sequences

x1=[1 2 3 4 0 0];
n1=[0 1 2 3 4 5];

x2=[0 2 2 2];
n2=[-3 -2 -1 0];

figure
[y1,y2,n]=timealign(x1,n1,x2,n2);
subplot(2,1,1), stem(n,y1,'fill');
xlabel('n'); ylabel('x_1[n]');
subplot(2,1,2), stem(n,y2,'fill');
xlabel('n'); ylabel('x_2[n]');

% Exercise: Plot x1+x2, x1-x2, x1*x2, x1/x2

% Time reversal and shifting 
% See Figures 2.9 and 2.10 in textbook

figure

x=[-1 0 1 2 3 4 4 4 4 4];
nx=[-5 -4 -3 -2 -1 0 1 2 3 4];

[x1, n1]=shift(x,nx,-3);
[x2, n2]=shift(x,nx,2);

[y1,y2,n]=timealign(x1,n1,x2,n2);
[y,y1,n]=timealign(x,nx,y1,n);

subplot(3,1,1), stem(n,y,'fill');
title('x[n]'); xlabel('n');
subplot(3,1,2), stem(n,y1,'fill');
title('x[n-3]'); xlabel('n');
subplot(3,1,3), stem(n,y2,'fill');
title('x[n+2]'); xlabel('n');

x=[2 2 2 0 1 2 3 4];
nx=[-3 -2 -1 0 1 2 3 4];

[x1, n1]=fold(x,nx);
[x2, n2]=shift(x1,n1,-2);


[y,y1,nt]=timealign(x,nx,x1,n1);
[y,y2,n]=timealign(y,nt,x2,n2);
[y1,y2,n]=timealign(y1,nt,x2,n2);

figure
subplot(3,1,1), stem(n,y,'fill');
title('x[n]'); xlabel('n');
subplot(3,1,2), stem(n,y1,'fill');
title('x[-n]'); xlabel('n');
subplot(3,1,3), stem(n,y2,'fill');
title('x[-n+2]'); xlabel('n');

% Downsampling: y[n]=x[2n]
% See Figure 

x=[-3 -2 -1 0 1 2 3 4 4 4 4 4 4 4];
nx=(-7:6);

N=length(x);
y=x(2:2:N);
ny=nx(2:2:N)/2;


[x1,y1,n]=timealign(x,nx,y,ny);

figure
subplot(2,1,1), stem(n,x1,'fill');
title('x[n]'); xlabel('n');
subplot(2,1,2), stem(n,y1,'fill');
title('x[2n]'); xlabel('n');




