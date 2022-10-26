function a = lat2fir_old(k)
% Lattice to FIR Conversion

M = length(k);
J = 1; A = 1;
for m = 2:1:M
	A = [A,0]+conv([0,k(m)],J);
	J = fliplr(A);
end
a = A*k(1);