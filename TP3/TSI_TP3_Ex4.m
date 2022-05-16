clear variaIble;
close all;

I = imread('mire.png') ;

figure(1)
imshow(I);

figure(2)

subplot(131);hold on;
title('Red Channel')
imshow(I(:,:,1));

subplot(132);hold on;
title('Green Channel')

imshow(I(:,:,2));

subplot(133);hold on;
title('Blue Channel')

imshow(I(:,:,3));
