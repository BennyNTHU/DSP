function [k,G] = fir2lat(h)
% FIR to Lattice Conversion

G = h(1); a = h/G;
M = length(h)-1; k(M) = a(M+1); 
for m = M:-1:2
    b = fliplr(a);
    a = (a-k(m)*b)/(1-k(m)^2); a = a(1:m);
    k(m-1) = a(m);
end