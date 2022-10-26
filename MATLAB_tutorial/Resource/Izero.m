function y = Izero(x,K)
% Computes y = I0(x) function using a summation of K terms
% y = Izero(x,K)
K = round(K); m = 1:K;
y = 1+ sum(((x/2).^m./factorial(m)).^2);