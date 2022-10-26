function X=dtft12(x,Nstart,om)

X=freqz(x,1,om);
X=exp(-j*om*Nstart).*X;