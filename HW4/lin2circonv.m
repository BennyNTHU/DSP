function [y] = lin2circonv(x,h,N)

y1=conv(x,h); 
L=length(y1);    % N1+N2-1

if N >= L        % in program assignment 3, x_4[n]=x_3[n]
    y=y1(1:N);   % one period
else             % x_4[n]=x_3[n]+x_3[n+lN], where l=1 (in program assignment 3(b))
    y=y1+[y1(N+1:L) zeros(1,N)];
    y=y(1:N);
end

