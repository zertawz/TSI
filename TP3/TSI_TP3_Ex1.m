clear variaIble;
close all;


% im100 = imread('iso100.png');
% im200 = imread('iso200.png');
% im400 = imread('iso400.png');
% im800 = imread('iso800.png');
% im1600 = imread('iso1600.png');
% im3200 = imread('iso3200.png')1000:1067,1117:1118;
% im6400 = imread('iso6400.png');
% im12800 = imread('iso12800.png');
% 
% grey100=rgb2grey(im100);
% grey200=rgb2grey(im200);
% grey400=rgb2grey(im400);
% grey800=rgb2grey(im800);
% grey1600=rgb2grey(im1600);
% grey3200=rgb2grey(im3200);
% grey6400=rgb2grey(im6400);
% grey12800=rgb2grey(im12800);

%La boucle fait ce qu'il y a en commentaire mais en beaucoup plus rapide
SNR = zeros(1,8);
for i = 1:8
    iso = [100,200,400,800,1600,3200,6400,12800];
    fname = sprintf('iso%d.jpg',iso(i)) ;
    I = imread(fname);
    Ig = rgb2gray(I);
    
    figure(1)
    subplot(2,4,i);hold on;
    title(fname)
    imshow(Ig)
    
    mu = mean2(Ig(1000:1067,1117:1118)); %Calcul de la moyenne et choix de la région I en prenant deux pixels sur l'image directement
    sigma = std2(Ig(1000:1067,1117:1118));
    
    SNR(i) = 20*log10(mu/sigma);
    
end


figure(2)
plot(iso,SNR)