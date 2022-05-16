clear variables;
close all;

%1.Affichage image

Im=imread('flower.png');
Image=im2double(Im);

figure(1)
imshow(Image,[]);

%2.K-means

K=2;
m=zeros(1,K);

for k=1:K
    m(k)=rand();
end

labels=zeros(256);
intensites=zeros(1,K);
somme=zeros(1,K);
compteur=zeros(1,K);
old_m=zeros(1,K);
Verif=true;
good=0;

while (Verif)
    for i=1:256
        for j=1:256
            for k=1:K
               intensites(k)=abs(Image(i,j)-m(k));
            end
            for k=1:K
               if intensites(k)==min(intensites)
                   labels(i,j)=k;
                   somme(k)=somme(k)+Image(i,j);
                   compteur(k)=compteur(k)+1;
               end
            end
        end 
    end

    for k=1:K
        old_m(k)=m(k);
        m(k)=somme(k)/compteur(k);
        if abs(m(k)-old_m(k))<0.001
            good=good+1;
        end
    end
    if good==K
        Verif=false;
    else
        good=0;
    end

end

%3. Affichage image segmentee

figure(2)
imshow(labels,[]);  
title('Image segmentee');
