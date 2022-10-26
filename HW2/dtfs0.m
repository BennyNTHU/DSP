function c = dtfs0(x)
    sizex = size(x);
    N=sizex(2);
    n = 0:1:N-1;
    F = zeros(N,1);
    c = zeros(N,1);
    
    for k=1:N
        for n=1:N
            F(n) = exp(-1i*2*pi*(k-1)*(n-1)/N);
        end
        c(k)=dot(x,F)/N;
    end
end