clear variaIble;
close all;


%% Question 1
% affichage de l'image d'origine et bruitages 

im = imread('flower.png');
im = im2double(im);
figure(1);
subplot(2,2,1);
imshow(im,[]);
[h,w] = size(im);

I_g = imnoise(im,'gaussian',0.1);
I_sp = imnoise(im,'salt & pepper',0.5);


subplot(2,2,2);
imshow(I_g,[]);

subplot(2,2,3);
imshow(I_sp,[]);

%% Question 2 



% Filtre 
filtre = 'I_g';
switch filtre 
    case 'I_g'


        im_fft2 = fft2(I_g);
        im_shift = fftshift(im_fft2);
        
        figure (2); hold on;
        % Filtrage Butterworth
        subplot(2,2,1); hold on;

        p = 10;
        n_c = 75; 

        [U,V]= meshgrid(-w/2+1/2:w/2-1/2,-h/2+1/2:h/2-1/2);

        D = sqrt(U.^2+V.^2) ; % distance euclidienne au centre

        H_But = 1./(1+(D/n_c).^(2.*p)); % gain
        
 

        im_filt_fft_Bu = ifftshift(H_But.*im_shift);

        im_filt_Bu = ifft2(im_filt_fft_Bu);
        title('Filtrage Butterworth de I_g');
        imshow(im_filt_Bu,[]);
        
        

        
            %Filtre moyenneur
            
        subplot(2,2,2); hold on;
        
        K = ones(256,1) ;
        L = ones(256,1) ;
        H_moy = 1./((2.*K+1)*(2.*L'+1));
        
        im_filt_fft_moy = ifftshift(H_moy.*im_shift);

        im_filt_moy = ifft2(im_filt_fft_moy);
        title('Filtrage moyenneur de taille de I_g');
        imshow(im_filt_moy,[]);
        
             %Filtre median
                
        subplot(2,2,3); hold on;
        
        n = 9; % Taille
        p = 1+(n^2-1)/2; % Ordre

        im_filt_med = ordfilt2(I_g,p,true(n));
      
        title ('Filtrage Mean de I_g')
        imshow(im_filt_med,[]);
 
        
        
        
        
    case 'I_sp'


        figure (2); hold on;
        % Filtrage Butterworth
        subplot(2,2,1); hold on;

        p = 10;
        n_c = 75; 

        [U,V]= meshgrid(-w/2+1/2:w/2-1/2,-h/2+1/2:h/2-1/2);

        D = sqrt(U.^2+V.^2) ; % distance euclidienne au centre

        H = 1./(1+(D/n_c).^(2.*p));
        
        im_fft2 = fft2(I_g);
        im_shift = fftshift(im_fft2);

        im_filt_fft_Bu = ifftshift(H.*im_shift);

        im_filt_Bu = ifft2(im_filt_fft_Bu);
        title('Filtrage Butterworth de I_sp');
        imshow(im_filt_Bu,[]);
        
        %Filtre moyenneur
            
        subplot(2,2,2); hold on;
        
        K = ones(256,1) ;
        L = ones(256,1) ;
        H_moy = 1./((2.*K+1)*(2.*L'+1));
        
        im_filt_fft_moy = ifftshift(H_moy.*im_shift);

        im_filt_moy = ifft2(im_filt_fft_moy);
        title('Filtrage moyenneur de taille de I_sp');
        imshow(im_filt_moy,[]);
        
        %Filtre median
                
        subplot(2,2,3); hold on;
        
        n = 9; % Taille
        p = 1+(n^2-1)/2; % Ordre

        im_filt_med = ordfilt2(I_sp,p,true(n));
      
        title ('Filtrage Mean de I_sp')
        imshow(im_filt_med,[]);

        
        
end


%% TO DO :
% Enlever le switch case
% rajouter les differents parametres
% tracer le MSE

