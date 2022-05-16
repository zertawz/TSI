clear variaIble;
close all;

%% Question 1

im = imread('flower.png');
im = im2double(im);

figure(1)
imshow(im,[]);

%% Question 2

% Fonction implémentant l'algo de K-means à K régions :



K = 2; % Noir ou blanc
P = 256; %Taille de l'image

m_k = zeros(1,K);

% avoir une matrice avec des intensité aléatoires :
for k = 1:K
    m_k(k) = rand(1);
end

% On itère de i en ligne et j en colonne et on vérifie à chaque fois pour
% affecter le label

%Initialisations des matrices (pour la vitesse):

dist = zeros(1,K);
labels = zeros(P,P);
sum = zeros(1,K); % somme pour la moyenne
count = zeros(1,K); % Matrice de comptage pour calculer la moyenne
valRen = true; % La condition d'arret de ma boucle
check = 0; %La vérification de ma boucle


while(valRen)
    for i =1:P      
        for j=1:P
            for z = 1:K
               dist(z) = abs(im(i,j)-m_k(z)); % On assigne l'observation avec la moyenne la plus proche par la distance séparant les deux.
            end
            for k = 1:K
                if dist(k) == min(dist)
                    labels(i,j)= k;
                    sum(k) = sum(k) + im(i,j);
                    count(k) = count(k) + 1;
                end
            end   
        end
    end
    
    for k =1:K
        m_k_1 (k) =m_k(k); %m_k_1 matrice gardant le précédent m_k en mémoire
        m_k (k) = sum(k)/count(k);
        if abs(m_k(k)-m_k_1(k)) < 0.001
               check = check+1;
        end
    end
    if check==K
        valRen=false;
    else
        check=0;
    end
end

%% Question 3 

figure(2)
title('Image traité par le seuillage K-means')
imshow(labels,[]);


