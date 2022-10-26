function y=circfold(x,N)
% Circular time reversal (folding)
if length(x) > N; error('N < length(x)'); end 
x=[x zeros(1,N-length(x))];
n=(0:1:N-1);
y=x(mod(-n,N)+1);