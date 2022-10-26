function y=overlap_save(h,x,Q)
% Overlap-Save Method

L=length(x); M=length(h);
if Q >= M; else end;
P=Q-M+1; % Overlap
Nblocks=floor((L-Q)/P+1);
y=zeros(L+M-1,1);

y(1:Q)=cconv(h,x(1:Q-M),Q);

z=cconv(h,x(1:Q),Q);
y(P:Q)=z(P:Q);
for m=1:Nblocks-1
    z=cconv(h,x(m*P+(1:Q)),Q);
    y(Q+(m-1)*P+(1:M))= z(P:Q);
end