clear variaIble;
close all;

I = imread('mire.png') ;
Ihsv = rgb2hsv(I);

figure(1)
imshow(I);

figure(2)

subplot(131);hold on;
title('H Channel')
imshow(Ihsv(:,:,1));

subplot(132);hold on;
title('S Channel')

imshow(Ihsv(:,:,2));

subplot(133);hold on;
title('V Channel')

imshow(Ihsv(:,:,3));

