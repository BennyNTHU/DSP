function y = azlatfilt(k,G,x)

M = length(k); f = zeros(1,M); g = f;
x = G*x; y = zeros(size(x));
oldg = zeros(1,M); oldx = 0;
for n=1:length(x)
    f(1) = x(n)+k(1)*oldx;
    g(1) = k(1)*x(n)+oldx;
    oldx = x(n);
    for m = 2:M
        f(m) = f(m-1)+k(m)*oldg(m-1);
        g(m) = k(m)*f(m-1)+oldg(m-1);
        oldg(m-1) = g(m-1);
    end
    y(n) = f(M);
end