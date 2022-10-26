function y=circonv(h,x)
% Circular convolution of equal length sequences
N=length(x); y=zeros(N,1);
x=circfold(x,N);
y(1)=h'*x;
for n=2:N
    x=cirshift0(x,1,N);
    y(n)=h'*x;
end