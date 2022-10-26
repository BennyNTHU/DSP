function DWTbank_2(R,G,B,LoD,HiD)

% Implement 5 level 2D DWT on RGB colors
[R_LL1,R_LH1,R_HL1,R_HH1] = dwt2(R,LoD,HiD);
[R_LL2,R_LH2,R_HL2,R_HH2] = dwt2(R_LL1,LoD,HiD);
[R_LL3,R_LH3,R_HL3,R_HH3] = dwt2(R_LL2,LoD,HiD);
[R_LL4,R_LH4,R_HL4,R_HH4] = dwt2(R_LL3,LoD,HiD);
[R_LL5,R_LH5,R_HL5,R_HH5] = dwt2(R_LL4,LoD,HiD);

[G_LL1,G_LH1,G_HL1,G_HH1] = dwt2(G,LoD,HiD);
[G_LL2,G_LH2,G_HL2,G_HH2] = dwt2(G_LL1,LoD,HiD);
[G_LL3,G_LH3,G_HL3,G_HH3] = dwt2(G_LL2,LoD,HiD);
[G_LL4,G_LH4,G_HL4,G_HH4] = dwt2(G_LL3,LoD,HiD);
[G_LL5,G_LH5,G_HL5,G_HH5] = dwt2(G_LL4,LoD,HiD);

[B_LL1,B_LH1,B_HL1,B_HH1] = dwt2(B,LoD,HiD);
[B_LL2,B_LH2,B_HL2,B_HH2] = dwt2(B_LL1,LoD,HiD);
[B_LL3,B_LH3,B_HL3,B_HH3] = dwt2(B_LL2,LoD,HiD);
[B_LL4,B_LH4,B_HL4,B_HH4] = dwt2(B_LL3,LoD,HiD);
[B_LL5,B_LH5,B_HL5,B_HH5] = dwt2(B_LL4,LoD,HiD);

% Save all image
imwrite(R_LL1,'R_LL1.png'); imwrite(R_LH1,'R_LH1.png'); imwrite(R_HL1,'R_HL1.png'); imwrite(R_HH1,'R_HH1.png');
imwrite(R_LL2,'R_LL2.png'); imwrite(R_LH2,'R_LH2.png'); imwrite(R_HL2,'R_HL2.png'); imwrite(R_HH2,'R_HH2.png');
imwrite(R_LL3,'R_LL3.png'); imwrite(R_LH3,'R_LH3.png'); imwrite(R_HL3,'R_HL3.png'); imwrite(R_HH3,'R_HH3.png');
imwrite(R_LL4,'R_LL4.png'); imwrite(R_LH4,'R_LH4.png'); imwrite(R_HL4,'R_HL4.png'); imwrite(R_HH4,'R_HH4.png');
imwrite(R_LL5,'R_LL5.png'); imwrite(R_LH5,'R_LH5.png'); imwrite(R_HL5,'R_HL5.png'); imwrite(R_HH5,'R_HH5.png');

imwrite(G_LL1,'G_LL1.png'); imwrite(G_LH1,'G_LH1.png'); imwrite(G_HL1,'G_HL1.png'); imwrite(G_HH1,'G_HH1.png');
imwrite(G_LL2,'G_LL2.png'); imwrite(G_LH2,'G_LH2.png'); imwrite(G_HL2,'G_HL2.png'); imwrite(G_HH2,'G_HH2.png');
imwrite(G_LL3,'G_LL3.png'); imwrite(G_LH3,'G_LH3.png'); imwrite(G_HL3,'G_HL3.png'); imwrite(G_HH3,'G_HH3.png');
imwrite(G_LL4,'G_LL4.png'); imwrite(G_LH4,'G_LH4.png'); imwrite(G_HL4,'G_HL4.png'); imwrite(G_HH4,'G_HH4.png');
imwrite(G_LL5,'G_LL5.png'); imwrite(G_LH5,'G_LH5.png'); imwrite(G_HL5,'G_HL5.png'); imwrite(G_HH5,'G_HH5.png');

imwrite(B_LL1,'B_LL1.png'); imwrite(B_LH1,'B_LH1.png'); imwrite(B_HL1,'B_HL1.png'); imwrite(B_HH1,'B_HH1.png');
imwrite(B_LL2,'B_LL2.png'); imwrite(B_LH2,'B_LH2.png'); imwrite(B_HL2,'B_HL2.png'); imwrite(B_HH2,'B_HH2.png');
imwrite(B_LL3,'B_LL3.png'); imwrite(B_LH3,'B_LH3.png'); imwrite(B_HL3,'B_HL3.png'); imwrite(B_HH3,'B_HH3.png');
imwrite(B_LL4,'B_LL4.png'); imwrite(B_LH4,'B_LH4.png'); imwrite(B_HL4,'B_HL4.png'); imwrite(B_HH4,'B_HH4.png');
imwrite(B_LL5,'B_LL5.png'); imwrite(B_LH5,'B_LH5.png'); imwrite(B_HL5,'B_HL5.png'); imwrite(B_HH5,'B_HH5.png');
