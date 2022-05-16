clear variaIble;
close all;

%% Question 1 

im = imread('journal.png');
im = im2double(im);
figure(1)
subplot(1,2,1);
imshow(im,[]);
colorbar;
[h,w] = size(im);

%% Question 2 et 3
subplot(1,2,2)
im_fft2 = fft2(im);
im_shift = fftshift(im_fft2);
imshow(log10(abs(im_shift)),[]); % on utilise log10 pour voir mieux les contrastes de l'image
% Sans le log on ne voit qu'un pic qui prédomine et nous fausse l'analyse
% (empeche de voir le reste)

%L'image étant la photographie d'un journal noir et blanc, on est face à une trame c'est
%à dire qu'elle est composée de points, sa transformée de fourrier est donc également
%un ensemble de points. Il y a des lignes en x et en y sur l'image ce qui
%donnera des "croix" en fourrier

%% Question 4 

% On choisit un filtre passe-bas type Butterworth car la trame affiché
% provoque un fort contraste de couleur qui va refleter des perturbations
% dans les hautes fréquences du spectre. 

%% Question 5 

% Filtre Butterworth

p = 10;
n_c = 75; 

[U,V]= meshgrid(-w/2+1/2:w/2-1/2,-h/2+1/2:h/2-1/2);

D = sqrt(U.^2+V.^2) ; % distance euclidienne au centre

H = 1./(1+(D/n_c).^(2.*p));

%% Question 6 

figure(2) % le log et la valeur absolue servent a bien afficher le spectre il ne faut pas qu'ils influent sur l'image
imshow(H.*log10(abs(im_shift)),[]); % on a bien enlever les hautes frequences toutefois il reste qque pics génants

%% Question 7 



figure(3);

im_filt_fft = ifftshift(H.*im_shift);

im_filt = ifft2(im_filt_fft);

imshow(im_filt,[]);
colorbar;







