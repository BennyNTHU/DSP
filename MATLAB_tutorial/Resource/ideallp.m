function h=ideallp(omc,M)
% M=2*alpha
n=(0:M)'-M/2;
h=(omc/pi)*ones(size(n));
i=find(n);
h(i)=sin(omc*n(i))./(pi*n(i));