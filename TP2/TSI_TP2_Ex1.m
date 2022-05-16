clear variaIble;
close all;

%% Question 1

im = imread('pieces.png');
im = im2double(im);

figure(1)
imshow(im,[]);

%% Question 2

% Fonction implémentant l'algo de K-means à K régions :



K = 2; % Nombre de régins : pour 2 on a donc Noir ou blanc
[h,w] = size(im); %Taille de l'image



% avoir une matrice avec des intensité aléatoires :

m_k = rand(1,K); %ça va etre la moyennes des pixels tq 


% On itère de i en ligne et j en colonne et on vérifie à chaque fois pour
% affecter le label

%Initialisations des matrices (pour la vitesse):

dist = zeros(1,K);
labels = zeros(h,w);
somme = zeros(1,K); % somme pour la moyenne
count = zeros(1,K); % Matrice de comptage pour calculer la moyenne
valRen = true; % La condition d'arret de ma boucle
check = 0; %La vérification de ma boucle[counts2,binLocations2] = imhist(im);
y = cumsum(counts2);
plot(0:1:255, y);


while(valRen) %Vérification de la convergence
    for i =1:h      
        for j=1:w %Parcours de l'image
            for k = 1:K
               dist(k) = abs(im(i,j)-m_k(k)); %On calcul la distance pour tout les pixels entre le pixel et la moyenne
            
            
                if dist(k) == min(dist) %pour éviter la boucle on peut utiliser [ù,ind] = min(...) avoir la valeur et la position
                   labels(i,j)= k; % On assigne l'observation avec la moyenne la plus proche par la distance séparant les deux.
                   somme(k) = somme(k) + dist(k); % on peux utiliser mean pour eviter la boucle
                   count(k) = count(k) + 1;
                end
            end
               
        end
    end
    
    for k =1:K
        m_k_1 (k) =m_k(k); %m_k_1 matrice gardant le précédent m_k en mémoire
        m_k (k) = somme(k)/count(k); %mean
        if abs(m_k(k)-m_k_1(k)) < 0.0001 %Vérification de la convergence
               check = check+1;
        end
    end   
    if check==K
        valRen=false;
    else
        check=0;
    end
end

%traitement de l'image avec le seuillage k-means
%on multiplie les intensités par la matrice booléenne (qui nous rend un status sur labels==k)
%et on ajoute ça dans une nouvelle matrice qui va etre notre image
imseg=zeros(h,w);
for k=1:K
    imseg=imseg+m_k(k)*(labels==k);
end





%% Question 2 et 3 

figure(2)

subplot(3,2,1); hold on;
title('Image traité par le seuillage K-means')
imshow(imseg,[]);

subplot(3,2,2); hold on;
title('Histogramme de l"image')
imhist(im)

subplot(3,2,3); hold on;
title('Histogramme  normalisé de l"image')
% h1=imhist(im);
% h2=h1/(w*h);
% imhist(im);

bar(imhist(im) ./ sum(imhist(im)))

subplot(3,2,4); hold on;
title('Histogramme cumulé de l"image')
[counts2,binLocations2] = imhist(im);
y = cumsum(counts2);
plot(0:1:255, y);


% ce que l'on veut c'est refaire histoec, en fait on prend chaque pixel de
% l'image et l'on y associe notre floor(g_k*255) pour pouvoir avoir la
% nouvelle couleur associé a la position retiré précédemment.
% Notre g_k se base sur l'histogramme cumulé
% dans un cas parfait notre histogramme égalisé devrait etre une droite y=x
% 
% for i=1:h
%     for j=1:w
%         abs(-im(i,j)-
%             
%         
%         end
%     
%     end
% end

subplot(3,2,5); hold on;
title('Image depuis l" histogramme égalisé')
im_eq = histeq(im);
imshow(im_eq,[])


subplot(3,2,6); hold on;
title('Histogramme de l"image égalisé') %On souhaite visualiser l'histo éga soit l'histo cumulé normalisé
[counts3,binLocations3] = imhist(im_eq);

y1 = cumsum(counts3);

plot(0:1:255, y1);