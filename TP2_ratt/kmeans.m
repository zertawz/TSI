clear variables;
close all;

% Image import
Img = imread('pieces.png');
Img = im2double(Img);
[h, w] = size(Img);

% Parameters
k = 3;
% Précision (condition d'arrêt de la boucle)
precision = 0.01;


% Initialisation
k_list = rand(1,k);
prev_ks = zeros(1,k);

printf("Original ks %d \n", k_list);
printf("--------------------------\n")

labels = zeros(h,w);
label_count = zeros(1, k);
mean_total = zeros(1, k);

% Iterations

while abs(sum(k_list - prev_ks)) > precision
  for x = 1:w
    for y = 1:h
      
      % x y pixel proximity check
      min = 256;
      k_index = -1;
      for i = 1:length(k_list)
        if abs(Img(y,x) - k_list(i)) < min
          k_index = i;
          min = abs(Img(y,x) - k_list(i));
        endif
      endfor
      
      % Label assignment
      labels(y,x) = k_list(k_index);
      label_count(k_index) = label_count(k_index) + 1;
      mean_total(k_index) = mean_total(k_index) + Img(y,x);
    endfor
  endfor
  
  % mean computation
  prev_ks = k_list;
  k_list = mean_total ./ label_count;
  printf("New ks: %d \n", k_list);
  printf("--------------------------\n")
endwhile

printf("Final ks: %d \n", k_list);