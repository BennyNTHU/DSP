% Illustration of FIR system implementation
% using stream processing.
% Combined multiply-accumulate-shift loop
% Dimitris Manolakis, April 2002

clear; close all;

% Create an input signal source
N=20;
ni=(0:N-1);
x=(3/4).^ni;

% Store impulse response
M=5;
h=ones(1,M)/M;

% Create and initialize signal memory

s=zeros(1,M);

% Simulation of stream processing for FIR systems

for n=1:N
    s(1)=x(n);
    yout=h(1)*s(1);
    for i=M:-1:2
        yout=yout+h(i)*s(i);
        s(i)=s(i-1);
    end
    y(n)=yout;
end

% Output using MATLAB function filter

ym=filter(h,1,x);

% Plot and compare results

hp=NaN*ones(1,N); hp(1:M)=h;
plot(ni,x,'.',ni,y,'+',ni,ym,'o',ni,hp,'*');
legend('Input','Output (stream)','Output (filter)'...
,'Impulse response');
xlabel('n');

% The impulse response is appended with NaN to have the
% same length with x, y, and ym for plotting purposes