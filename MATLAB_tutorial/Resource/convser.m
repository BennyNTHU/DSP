function y=convser(h,x)
% Serial computation of y=h*x
% Dimitris Manolakis, January 2001 

M=length(h); N=length(x);
L=M+N-1;
y=zeros(L,1);

for m=1:M
   for n=1:N
      k=n+m-1;
      y(k)=y(k)+h(m)*x(n);
   end
end