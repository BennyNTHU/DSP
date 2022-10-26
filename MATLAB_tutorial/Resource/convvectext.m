function y=convvec(h,x)
% Vector computation of y=h*x
M=length(h); N=length(x); h=h(:); 
x=x(:); y=zeros(L+M-1,1); 
for m=1:M
   y(m:m+N-1)=y(m:m+N-1)+h(m)*x;
end