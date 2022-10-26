function X = fftrecur_m(x,W)
% Recursive computation of the DFT using divide & conquer
% N should be a power of 2 
N = length(x);
if N==2
    X=W*x.';
else
    m=N/2;
    W2=W(1:m,1:m);
    XE=fftrecur_m(x(1:2:N-1),W2);
    XO=fftrecur_m(x(2:2:N),W2);
    D=exp(-2*pi*1j/N).^(0:N/2-1).';
    X=[XE+D.*XO; XE-D.*XO];
end
