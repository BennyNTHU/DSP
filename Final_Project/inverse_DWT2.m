function X = inverse_DWT2(A, H, V, D, LoR, HiR)

[M,N]=size(A);

% 先對m方向做升取樣與convolution
for n=1:N
    for m=1:2*M
        A_up_sample_col(m)=A(ceil(m/2),n);
        H_up_sample_col(m)=H(ceil(m/2),n);
        V_up_sample_col(m)=V(ceil(m/2),n);
        D_up_sample_col(m)=D(ceil(m/2),n);
    end
    A_up_sample(:,n)=conv(A_up_sample_col, LoR);
    H_up_sample(:,n)=conv(H_up_sample_col, HiR);
    V_up_sample(:,n)=conv(V_up_sample_col, LoR);
    D_up_sample(:,n)=conv(D_up_sample_col, HiR);
    A_up_sample_col=[];
    H_up_sample_col=[];
    V_up_sample_col=[];
    D_up_sample_col=[];
end

AH=A_up_sample+H_up_sample;
VD=V_up_sample+D_up_sample;

[M,N]=size(AH);

% 再對n方向做升取樣與convolution
for m=1:M
    for n=1:2*N
        AH_up_sample_row(n)=AH(m,ceil(n/2));
        VD_up_sample_row(n)=VD(m,ceil(n/2));
    end
    AH_up_sample(m,:)=conv(AH_up_sample_row, LoR);
    VD_up_sample(m,:)=conv(VD_up_sample_row, HiR);
    AH_up_sample_row=[];
    VD_up_sample_row=[];
end

X=AH_up_sample+VD_up_sample;
