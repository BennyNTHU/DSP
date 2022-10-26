function y=ppinterp(h,x,I)
% Polyphase decomposition of h[n]
Lh=length(h); Lp=floor((Lh-1)/I)+1;
p=flipud(reshape([reshape(h,1,Lh),zeros(1,Lp*I-Lh)],I,Lp));
% Polyphase interpolator implementation
Lx=length(x); Ly=Lx*I+Lh-1;
Lv=Lx+Lp;
v=zeros(I,Lv);
for i=1:I, v(i,1:Lv-1)=conv(p(i,:),x); end
y=reshape(flipud(v),1,I*Lv);
y=y(1:Ly);