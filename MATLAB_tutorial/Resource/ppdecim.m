function y=ppdecim(h,x,D);
% Polyphase decomposition of h[n]
Lh=length(h); Lp=floor((Lh-1)/D)+1;
p=zeros(1,Lp*D); p(1:Lh)=h; p=reshape(p,D,Lp);
% Polyphase decomposition of x[n]
Lx=length(x); Ly=floor((Lx+Lh-2)/D)+1;
K=floor((Lx+D-2)/D)+1;
v=[zeros(1,D-1),reshape(x,1,Lx),zeros(1,D*K-Lx-D+1)];
v=flipud(reshape(v,D,K));
% Polyphase decimator implementation
y=zeros(1,K+Lp-1);
for m=1:D, y=y+conv(p(m,:),v(m,:)); end
y=y(1:Ly);