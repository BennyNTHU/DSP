function y = aplatfilt(k,G,x)

M = length(k); g = zeros(1,M); f = g;
oldy = 0; x = G*x; y = zeros(size(x));
for n = 1:length(x)
    f(M) = x(n);
    for i = 1:M-1
        m = M+1-i;
        f(m-1) = f(m)-k(m)*g(m-1);
        g(m) = k(m)*f(m-1)+g(m-1);
    end
    y(n) = f(1)-k(1)*oldy;
    g(1) = k(1)*y(n)+oldy;
    oldy = y(n);
end