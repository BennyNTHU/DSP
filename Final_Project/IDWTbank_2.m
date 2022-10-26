function [reconstruct_R, reconstruct_G, reconstruct_B]=IDWTbank_2(c32, c16, c8, c4, c2, LoR, HiR)

% 5 level 2D IDWT. c32=gain of image with 32 pixel feature and so on.
% LoR: Reconstruct low pass filter; HiR: Reconstruct high pass filter

% Read all files
R_LL1=imread('R_LL1.png'); R_LH1=imread('R_LH1.png'); R_HL1=imread('R_HL1.png'); R_HH1=imread('R_HH1.png');
R_LL2=imread('R_LL5.png'); R_LH2=imread('R_LH2.png'); R_HL2=imread('R_HL2.png'); R_HH2=imread('R_HH2.png');
R_LL3=imread('R_LL3.png'); R_LH3=imread('R_LH3.png'); R_HL3=imread('R_HL3.png'); R_HH3=imread('R_HH3.png');
R_LL4=imread('R_LL4.png'); R_LH4=imread('R_LH4.png'); R_HL4=imread('R_HL4.png'); R_HH4=imread('R_HH4.png');
R_LL5=imread('R_LL5.png'); R_LH5=imread('R_LH5.png'); R_HL5=imread('R_HL5.png'); R_HH5=imread('R_HH5.png');

G_LL1=imread('G_LL1.png'); G_LH1=imread('G_LH1.png'); G_HL1=imread('G_HL1.png'); G_HH1=imread('G_HH1.png');
G_LL2=imread('G_LL5.png'); G_LH2=imread('G_LH2.png'); G_HL2=imread('G_HL2.png'); G_HH2=imread('G_HH2.png');
G_LL3=imread('G_LL3.png'); G_LH3=imread('G_LH3.png'); G_HL3=imread('G_HL3.png'); G_HH3=imread('G_HH3.png');
G_LL4=imread('G_LL4.png'); G_LH4=imread('G_LH4.png'); G_HL4=imread('G_HL4.png'); G_HH4=imread('G_HH4.png');
G_LL5=imread('G_LL5.png'); G_LH5=imread('G_LH5.png'); G_HL5=imread('G_HL5.png'); G_HH5=imread('G_HH5.png');

B_LL1=imread('B_LL1.png'); B_LH1=imread('B_LH1.png'); B_HL1=imread('B_HL1.png'); B_HH1=imread('B_HH1.png');
B_LL2=imread('B_LL5.png'); B_LH2=imread('B_LH2.png'); B_HL2=imread('B_HL2.png'); B_HH2=imread('B_HH2.png');
B_LL3=imread('B_LL3.png'); B_LH3=imread('B_LH3.png'); B_HL3=imread('B_HL3.png'); B_HH3=imread('B_HH3.png');
B_LL4=imread('B_LL4.png'); B_LH4=imread('B_LH4.png'); B_HL4=imread('B_HL4.png'); B_HH4=imread('B_HH4.png');
B_LL5=imread('B_LL5.png'); B_LH5=imread('B_LH5.png'); B_HL5=imread('B_HL5.png'); B_HH5=imread('B_HH5.png');

% Reconstruct R, G, B Image by idwt2 function with different gain
reconstruct_RLL4 = idwt2(c32*R_LL5, c32*R_LH5, c32*R_HL5, c32*R_HH5, LoR, HiR);
reconstruct_RLL3 = idwt2(c16*reconstruct_RLL4, c16*R_LH4, c16*R_HL4, c16*R_HH4, LoR, HiR);
reconstruct_RLL2 = idwt2(c8*reconstruct_RLL3, c8*R_LH3, c8*R_HL3, c8*R_HH3, LoR, HiR);
reconstruct_RLL1 = idwt2(c4*reconstruct_RLL2, c4*R_LH2, c4*R_HL2, c4*R_HH2, LoR, HiR);
reconstruct_R    = idwt2(c2*reconstruct_RLL1, c2*R_LH1, c2*R_HL1, c2*R_HH1, LoR, HiR);

reconstruct_GLL4 = idwt2(c32*G_LL5, c32*G_LH5, c32*G_HL5, c32*G_HH5, LoR, HiR);
reconstruct_GLL3 = idwt2(c16*reconstruct_GLL4, c16*G_LH4, c16*G_HL4, c16*G_HH4, LoR, HiR);
reconstruct_GLL2 = idwt2(c8*reconstruct_GLL3, c8*G_LH3, c8*G_HL3, c8*G_HH3, LoR, HiR);
reconstruct_GLL1 = idwt2(c4*reconstruct_GLL2, c4*G_LH2, c4*G_HL2, c4*G_HH2, LoR, HiR);
reconstruct_G    = idwt2(c2*reconstruct_GLL1, c2*G_LH1, c2*G_HL1, c2*G_HH1, LoR, HiR);

reconstruct_BLL4 = idwt2(c32*B_LL5, c32*B_LH5, c32*B_HL5, c32*B_HH5, LoR, HiR);
reconstruct_BLL3 = idwt2(c16*reconstruct_BLL4, c16*B_LH4, c16*B_HL4, c16*B_HH4, LoR, HiR);
reconstruct_BLL2 = idwt2(c8*reconstruct_BLL3, c8*B_LH3, c8*B_HL3, c8*B_HH3, LoR, HiR);
reconstruct_BLL1 = idwt2(c4*reconstruct_BLL2, c4*B_LH2, c4*B_HL2, c4*B_HH2, LoR, HiR);
reconstruct_B    = idwt2(c2*reconstruct_BLL1, c2*B_LH1, c2*B_HL1, c2*B_HH1, LoR, HiR);