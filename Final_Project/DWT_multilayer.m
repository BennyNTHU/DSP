clear;clc;close;

% MATLAB Photoshop
X=imread('M27.JPG'); % Read file
figure(1)            % Show figure
imshow(X); X(:,1,:)=[];

% �T�����
R=X(:,:,1);
G=X(:,:,2);
B=X(:,:,3);

[LoD,HiD,LoR,HiR] = wfilters('sym4'); 

% ��T���C�ⳣ��5 Level 2D DWT
DWTbank_2(R,G,B,LoD,HiD);

% �Hidwt�i��Ϥ����c
[reconstruct_R, reconstruct_G, reconstruct_B]=0.005*IDWTbank_2(1,1,1,1,1,LoR,HiR);
imwrite(reconstruct_R,'reconstruct_R.png');
imwrite(reconstruct_G,'reconstruct_G.png');
imwrite(reconstruct_B,'reconstruct_B.png');

% �T���|��