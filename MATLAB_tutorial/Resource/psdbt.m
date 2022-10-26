function S=psdbt(x,L,K)
% BT PSD estimator of S(2*pi*k/K)
N=length(x);
w=hann(N); % Data window
w=w/(norm(w)/sqrt(N)); % sum w^2[k]=N
x=x.*w; % Data windowing
r=acrsfft(x,L);
wc=parzenwin(2*L-1); % Lag window
rw=r.*wc(L:2*L-1); % Lag windowing
g=zeros(K,1);
g(1:L)=rw;
g(K-L+2:K)=flipud(rw(2:L));
G=fft(g,K); % f even => F real
S=2*real(G(1:K/2)); S(1)=S(2);