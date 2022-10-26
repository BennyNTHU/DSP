function  W=dft_matrix(N)

w=exp(-1j*2*pi/N);
W=zeros(N);
for i=1:N
    for j=1:N
        W(i,j)=w^((i-1)*(j-1));
    end
end