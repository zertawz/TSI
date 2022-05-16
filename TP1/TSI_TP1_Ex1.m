clear variaIble;
close all;
% Les masques donnés sont déjà retourné
%% Question 1 :
% Lecture et conversion des images en double [0,1]

im1 = imread('flower.png');
im1 = im2double(im1);
im2 = imread('journal.png');
im2 = im2double(im2);
min_Im1=min(im1);

% Affichage des images
figure(1);
imshow(im1,[]); %On met les crochets pour s'assurer de scale entre le min et le max du imread
colorbar;
figure(2);
imshow(im2,[]);

% On cherche à detecter les contours de l'image flower.png


% On décompose un filtre de Sobel en filtre de lissage 1D et filtre dérivatif
% 1D

% Filtre dérivatif spatial 1D:

G1 = [-1;0;1];

%Filtre lissage spatial 1D:

G2 = [1;2;1];


% Filtre total 

xsobel = G2*G1';
ysobel = G1*G2';

% On lisse pour éliminer les faux contours (baisser la "tolérance du
% contour")

%% Question 2 et 3

Gh = imfilter(im1,xsobel);
Gv = imfilter(im1,ysobel);
figure(3)
subplot(2,2,1); hold on;
title('Image avec Gradient horizontal')
imshow(Gh)

subplot(2,2,2); hold on;
title('Image avec Gradient vertical')
imshow(Gv)

subplot(2,2,3); hold on;
G = sqrt(Gh.^2+Gv.^2);
title('Image avec Gradient total')
imshow(G)

%% Question 4 :

im1_noise = imnoise(im1,'gaussian',0.1);

Gh_noise = imfilter(im1_noise,xsobel);
Gv_noise = imfilter(im1_noise,ysobel);

figure(4)
subplot(2,2,1); hold on;
title('Image avec Gradient horizontal')
imshow(Gh_noise)

subplot(2,2,2); hold on;
title('Image avec Gradient vertical')
imshow(Gv_noise)

subplot(2,2,3); hold on;
G_noise = sqrt(Gh_noise.^2+Gv_noise.^2);
title('Image avec Gradient total')
imshow(G_noise)



