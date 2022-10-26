function y = firdec(h,x,D)
% FIR decimation by a factor D 
M=length(h)-1; x=[zeros(1,M) x]; L=length(x); h=fliplr(h);
for n=1:floor(L/D-M);
    m=(n-1)*D;
    y(n)=dot(h,x(m+1:m+M+1));
end
