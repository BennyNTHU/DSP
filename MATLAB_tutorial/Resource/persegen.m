function [x,n]=persegen(xp,Np,N,n0)
% function [x,n]=persegen(xp,Np,N,n0)
% xp=signal segment to be repeated; 
% Np=fundamental period
% N=number of samples
% n0=starting point
% Dimitris Manolakis, January 2001
% A better version can be obtained using repmat

Nps=fix(N/Np)+1;
xp=xp(:);
xp=[xp ;zeros(Np-length(xp),1)];
xp=xp*ones(1,Nps);
x=xp(:);x=x(1:N);
n=(n0:n0+N-1)';