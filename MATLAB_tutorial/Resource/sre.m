function y=sre(x,I)
% Sampling rate expander by a factor I

N=I*length(x);
y=zeros(1,N);
y(1:I:N)=x;