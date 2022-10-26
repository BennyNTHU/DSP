clear;clc;close;

% MATLAB Photoshop
X=imread('M27.jpg'); % Read file
figure(1)            % Show figure
imshow(X); X(:,1,:)=[];

% 三色分解
R=X(:,:,1);
G=X(:,:,2);
B=X(:,:,3);

[LoD,HiD,LoR,HiR] = wfilters('sym4'); 

% 對三個顏色都做5 Level 2D DWT
[RA, RH, RV, RD]=dwt2(R,LoD,HiD);
[GA, GH, GV, GD]=dwt2(G,LoD,HiD);
[BA, BH, BV, BD]=dwt2(B,LoD,HiD);

% 以idwt進行圖片重構
reconstruct_R=0.005*idwt2(1.2*RA, RH, RV, RD, LoD, HiD);
reconstruct_G=0.005*idwt2(1.2*RA, RH, RV, RD, LoD, HiD);
reconstruct_B=0.005*idwt2(1.2*RA, RH, RV, RD, LoD, HiD);
   
imwrite(reconstruct_R,'reconstruct_R_2.png');
imwrite(reconstruct_G,'reconstruct_G_2.png');
imwrite(reconstruct_B,'reconstruct_B_2.png');

% 三色疊圖
colorimage=cat(3,reconstruct_R,reconstruct_G,reconstruct_B);
figure(2)
imshow(colorimage)
imwrite(colorimage,'M27_DWTdemo.png')