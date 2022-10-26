function [x,n]=unitpulse(n1,n2,n3,n4);
%function [x,n]=unitpulse(n1,n2,n3,n4);
% The sequence is defined from n1 to n4
% The pulse starts at n2 and ends at n3
% Dimitris Manolakis, January 2001

n=(n1:n4)';
x=zeros(size(n));
ind=find(n>=n2&n<=n3);
x(ind)=ones(size(ind));