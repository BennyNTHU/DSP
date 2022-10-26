% Script klt.m
[N,p]=size(X);
G=cov(X,1);
[U,L,A]=svd(G);
lambda=diag(L);
Mx=repmat(mean(X),N,1);
C=(X-Mx)*A;
Xhat=C(:,1:m)*A(:,1:m)'+Mx;
E=X(:)-Xhat(:);
MSE1=sum(E.^2)/N
MSE2=sum(lambda(m+1:p))
