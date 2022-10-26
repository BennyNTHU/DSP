clear;clc;close;

% MATLAB Photoshop
X=imread('M27.jpg'); % Read file
figure(1)            % Show figure
imshow(X); X(:,1,:)=[];

% �T�����
R=X(:,:,1);
G=X(:,:,2);
B=X(:,:,3);

[LoD,HiD,LoR,HiR] = wfilters('sym4'); 

% ��T���C�ⳣ��5 Level 2D DWT
[RA, RH, RV, RD]=dwt2(R,LoD,HiD);
[GA, GH, GV, GD]=dwt2(G,LoD,HiD);
[BA, BH, BV, BD]=dwt2(B,LoD,HiD);

% �Hidwt�i��Ϥ����c
reconstruct_R=0.005*idwt2(1.2*RA, RH, RV, RD, LoD, HiD);
reconstruct_G=0.005*idwt2(1.2*RA, RH, RV, RD, LoD, HiD);
reconstruct_B=0.005*idwt2(1.2*RA, RH, RV, RD, LoD, HiD);
   
imwrite(reconstruct_R,'reconstruct_R_2.png');
imwrite(reconstruct_G,'reconstruct_G_2.png');
imwrite(reconstruct_B,'reconstruct_B_2.png');

% �T���|��
colorimage=cat(3,reconstruct_R,reconstruct_G,reconstruct_B);
figure(2)
imshow(colorimage)
imwrite(colorimage,'M27_DWTdemo.png')