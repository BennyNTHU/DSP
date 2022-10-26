function r=acrs(x,L)
% Computes the ACRS r[m] for 0<= m <= L
% r=acrs(x-mean(x),L) yields the ACVS
N=length(x);
x1=zeros(N+L-1,1);
x2=x1;
x1(1:N,1)=x;
for m=1:L
   x2=zeros(N+L-1,1);
   x2(m:N+m-1,1)=x;
   r(m)=x1'*x2;
end
r=r(:)/N;