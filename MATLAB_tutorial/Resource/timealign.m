function [y1,y2,n]=timealign(x1,n1,x2,n2)
% We assume row vectors; modify routine to handle 
% any mixture of column or row vectors
% Dimitris Manolakis, January 2001

L1=length(x1); L2=length(x2);
n=min(n1(1),n2(1)):max(n1(L1),n2(L2)); L=length(n);
y1=zeros(1,L); y1(find((n>=min(n1))&(n<=max(n1))))=x1;
y2=zeros(1,L); y2(find((n>=min(n2))&(n<=max(n2))))=x2;