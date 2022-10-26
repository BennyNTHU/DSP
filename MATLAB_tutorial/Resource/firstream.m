% Script file: firstream.m
% FIR filter implementation using stream processing
% Generate an input signal sequence
N=20; ni=(0:N-1); x=(3/4).^ni+0.1*rnd(size(ni));
% Store impulse response
M=5; h=ones(1,M)/M; % M-point Moving Average filter
% Initialize signal memory
s=zeros(1,M);
% Compute filter output sequence
for n=1:N     % Sampling-time index
    xin=x(n); % Get input sample from ADC or storage	
    s(1)=xin;
    yout=h(1)*s(1);
    for i=M:-1:2
        yout=yout+h(i)*s(i); % Multiply, Accumulate
        s(i)=s(i-1);         % and Shift Operation
    end
    y(n)=yout; % Put output sample to DAC or storage
end