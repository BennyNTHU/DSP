function x=bitrev(x)
% Bit reversal algorithm based on Gold and Rader (1969)
N=length(x); r=0;
for n=0:N-2;
    if n<r % swap samples only for the first half of array
        temp=x(n+1);
        x(n+1)=x(r+1);
        x(r+1)=temp;
    end
    k=N/2; % even n: adds to the previous r; 
           %  odd n: subtract from the previous r
    while k <= r
        r=r-k; % keep subtracting reverse carry
        k=k/2; % generate next reverse carry
    end
    r=r+k; % even n: add N/2; odd n: add the last carry.
end