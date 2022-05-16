clear variaIble;
close all;

I = imread('iso100.jpg') ;
Ig = rgb2gray(I);


Iss = imresize(Ig,0.25) ;
Iov_b = imresize(Iss,4,'bilinear');
Iov_c = imresize(Iss,4,'bicubic');
figure(1);
subplot(2,2,1)
imshow(Ig)

subplot(2,2,2)
imshow(Iss)

subplot(2,2,3)
imshow(Iov_b)

subplot(2,2,4)
imshow(Iov_c)