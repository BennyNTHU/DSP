function w = kaiser0(L,beta,K)
% Kaiser Window function using Izero function
% w = kaiser0(L,beta,K)
% Computes length-L Kaiser window values in w for the given beta
%  using first K terms in Izero function
%  w = kaiser0(L,beta) uses default 20 terms in Izerp function
%  w = kaiser0(L) uses defaults: beta=0.5, K=20

if nargin == 1
    beta=0.5; K=20;
end
if nargin == 2
    K = 20;
end
M = L-1; alpha = M/2; w = zeros(1,L);
for n=0:M
    w(n+1) = Izero(beta*sqrt(1-((n-alpha)/alpha)^2),K);
end
w = w/Izero(beta,K);