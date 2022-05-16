clear variaIble;
close all;


%% Programme qui permet de binarisé notre image (K = 2)

im = imread('pieces.png');
im = im2double(im);

figure(1)
imshow(im,[]);



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
check = 0; %La vérification de ma boucle


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



figure(2)

subplot(2,2,1); hold on;
title('Image traité par le seuillage K-means')
imshow(labels,[]);
%% On peut traiter l'image avec soit une fermeture ou juste une dilatation





















