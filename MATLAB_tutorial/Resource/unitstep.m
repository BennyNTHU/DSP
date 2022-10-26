function [x,n]=unitstep(n1,n0,n2);
% function [x,n]=unitstep(n1,n0,n2);
% unit step defined from n1 to n2 
% the step starts at n0
% Dimitris Manolakis, January 2001

if n0<n1 | n0>n2 
   error('n0 is outside signal range');
end

n=(n1:n2)'; %x=[n-n0>=0];
x=zeros(size(n));
ind=find(n-n0>=0);
x(ind)=ones(size(ind));


   