clear variables;
close all

%Ouvrir l'image correctement
im = im2double(imread('pieces.png'));

[h,w] = size(im);
[k, bin] = imhist(im);

figure(1);
subplot(1,2,1); hold on;
title('Image de départ');
imshow(im,[]);
subplot(1,2,2); hold on;
title('histogramme');
axis([0,1,0,inf]);
bar(bin,k)

%Nombre de moyennes pour le K-means
%k=2;
%imkmean = kmeansM(im,k);

%La fonction ne fonctionnant pas, on prend les photos déjà faites
im2 = im2double(imread('pieces-kmeans1.png'));
[k1, bin] = imhist(im2);

figure(2);
subplot(1,2,1); hold on;
title('Image après les k-means');
imshow(im2,[]);
subplot(1,2,2); hold on;
title('histogramme normalisé de l"image');
axis([-1,1.5,0,inf]);
bar(bin, k1);

%Histogramme cumulé
hc=zeros(1,256)
hc(1)= k(1);
for i=2:1:256;
    hc(i)=hc(i-1)+k(i);
end

figure(4);
plot(hc);

%histogramme cumulé normalisé
% hcn=zeros(1,256)
% hcn(1)= k(1);
% for i=2:1:256;
%     hcn(i)=((hcn(i-1)+k(i)))./(h.*w);
% end
hcn=hc/(h*w)

figure(5);
plot(hcn);

%Histogramme égalisé
%Nouvelle image dont on calculera la valeur des pixels
igenese=zeros(h,w)
for i = [1:1:h]
    for j = [1:1:w]
        im(i,j)*255+1
        igenese(i,j) = hcn(im(i,j)*255+1);
    end
end

figure(6)
imshow(igenese)




