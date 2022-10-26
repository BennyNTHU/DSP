function [A, H, V, D] = waveletanalysis2(X,lpf,hpf)

[M,N]=size(X);

% ����n��V��convolution�P������
for m=1:M
    lp_row=conv(X(m,:), lpf);
    hp_row=conv(X(m,:), hpf);
    lp_image(m,:)=lp_row;
    hp_image(m,:)=hp_row;
end

[ML,NL]=size(lp_image);
[MH,NH]=size(hp_image);

for n=1:(NL+1)/2
    v1L(:,n)=lp_image(:,2*n-1); % down sampled low pass picture
end
for n=1:(NH+1)/2
    v1H(:,n)=hp_image(:,2*n-1); % down sampled high pass picture
end

lp_image=[];
hp_image=[];

% �Nv1L, �]�N�Odown sampled low pass picture ��m��V��convolution�P������
[MvL,NvL]=size(v1L);

for n=1:NvL
    lp_col=conv(v1L(:,n), lpf);
    hp_col=conv(v1L(:,n), hpf);
    lp_image(:,n)=lp_col;
    hp_image(:,n)=hp_col;
end

[ML,NL]=size(lp_image);
[MH,NH]=size(hp_image);

for m=1:(MH+1)/2
    A(m,:)=lp_image(2*m-1,:); % down sampled low pass picture
end
for m=1:(MH+1)/2
    H(m,:)=hp_image(2*m-1,:); % down sampled high pass picture
end

lp_image=[];
hp_image=[];

% �Nv1H, �]�N�Odown sampled high pass picture ��m��V��convolution�P������
[MvH,NvH]=size(v1H);

for n=1:NvH
    lp_col=conv(v1H(:,n), lpf);
    hp_col=conv(v1H(:,n), hpf);
    lp_image(:,n)=lp_col;
    hp_image(:,n)=hp_col;
end

[ML,NL]=size(lp_image);
[MH,NH]=size(hp_image);

for m=1:(MH+1)/2
    V(m,:)=lp_image(2*m-1,:); % down sampled low pass picture
end
for m=1:(MH+1)/2
    D(m,:)=hp_image(2*m-1,:); % down sampled high pass picture
end
