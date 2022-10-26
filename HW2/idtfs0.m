function d = idtfs0(c)
    c = c.';
    sizex = size(c);
    N=sizex(2);
    F = zeros(1,N);
    d = zeros(1,N);
    
    for n=1:N
        for k=1:N
            F(k) = exp(1i*2*pi*(k-1)*(n-1)/N);
        end
        d(n)=F*c.';
    end
end