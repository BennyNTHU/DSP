function h = lat2fir(k,G)
% Lattice to FIR Conversion

a = 1; b = 1; M = length(k);
for m = 1:1:M
    a = [a,0]+k(m)*[0,b];
    b = fliplr(a);
end
h = G*a;