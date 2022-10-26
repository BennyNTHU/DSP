function X=fftdifr2(x)
% DIF Radix-2 FFT Algorithm
N=length(x);
x=bitrevorder(x);
nu=log2(N);
X=zeros(1,N);

for m=1:nu
    L=2^(m-1);
    i=1;
    while (i<=N-L)
        for ir=1:L
            temp=x(i+L)*exp(-1i*2*pi*(ir-1)/N*(2^(nu-m)));
            X(i)=x(i)+temp;
            X(i+L)=x(i)-temp;
            i=i+1;
            if (ir==L)
                i=i+L;
            end
        end
    end
    x=X;
end