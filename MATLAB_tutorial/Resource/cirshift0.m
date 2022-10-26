function y=cirshift0(x,k,N)
% Circular shift of a sequence
if length(x) > N; error('N < length(x)'); end 
x=[x zeros(1,N-length(x))];
n=(0:1:N-1); y=x(mod(n-k,N)+1);
