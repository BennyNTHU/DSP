function y=overlap_add(h,x,Q)
% Overlap-Add Method

L=length(x); M=length(h);
Nblocks=floor(L/Q);
ni=(1:Q)'; no=(1:M+Q-1)';
y=zeros(L+M-1,1);

y(no)=conv(h,x(ni));
for m=1:Nblocks-1
    z=conv(h,x(m*Q+ni));
    y(m*Q+no)= y(m*Q+no)+z;
end