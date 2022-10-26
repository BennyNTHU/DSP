close all; clear; clc;
%% filters : average, disk, gaussian, laplacian, log, motion, prewitt, sobel

% PSF1 = fspecial('motion', 13, 45);
% the motion filter mimics the linear motion of a moving camera, hence it
% is not suitable for our target

PSF2 = fspecial('average', 3); % 3x3 matrix
PSF3 = fspecial('disk', 1); % size = 2*1+1 = 3, also 3x3 matrix
% disk filter choosees nearby elements within the radius to average, our
% pictures are stars surrouded by black universe, if choosing large radius 
% after averaging the brightness of the star will be reduced to much.

% disk filter performs better than average filter when the matrix size are
% the same, the output of average looks more vague.

% The disadvantage of average and disk filter is that they only function
% well when matrix size is 3, any size greater than 3 may make the output
% figure too blur.

PSF4 = fspecial('gaussian', 3, 0.5);


% 5~8: only suitable for B/W picture, and it breaks the shape too much
% PSF5 = fspecial('laplacian', 0.5);
% PSF6 = fspecial('log', 3, 0.5);
% PSF7 = fspecial('prewitt');
% PSF8 = fspecial('sobel');

%% Sources
% image = imread('star1.jpg');
% image = imread('star2.jpg');
% image = imread('star3.jpg');
% image = imread('star4.png');
% image = imread('star5.png');
image = imread('star6.tiff');

%% Shape of filters 

% figure(1)
% subplot(1,3,1)
% imshow(PSF2, [], 'InitialMagnification', 'fit')
% title('PSF with average')
% subplot(1,3,2)
% imshow(PSF3, [], 'InitialMagnification', 'fit')
% title('PSF with disk')
% subplot(1,3,3)
% imshow(PSF4, [], 'InitialMagnification', 'fit')
% title('PSF with gaussian')

%% Outputs
Blur2 = imfilter(image, PSF2, 'circ', 'conv');
Blur3 = imfilter(image, PSF3, 'circ', 'conv');
Blur4 = imfilter(image, PSF4, 'circ', 'conv');

% figure(2)
% imshow(Blur2)
% title('Blurred with average')
% figure(3)
% imshow(Blur3)
% title('Blurred with disk')
% figure(4)
% imshow(Blur4)
% title('Blurred with gaussian')

imwrite(Blur2, 'star_average.jpeg');
imwrite(Blur3, 'star_disk.jpeg');
imwrite(Blur4, 'star_gaussian.jpeg');