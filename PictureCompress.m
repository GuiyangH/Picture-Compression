%% Picture Compress
%-----------------------
%   Introduction
% Method: Use K-means cluster to classify pixels colors.
%-----------------------
%    Files
%
% guiyang_photo.png   picture of me as an example :)
% opt_Kmean.m         iteratively compute the optimized Centroids.
% ->findCentro.m      define the new centroid given the old centroid.
% ->findidx.m         find the index for each points(bunch points to their
%                                                    centroids).

%% Initialization
clear ; close all; clc

%% ============= Import and Shaping the Image===============
fprintf('Importing image as pixels... \n');

%  Ask for an image
% Convert image into 3 A matrix, Red, Green and Blue pixel matrices.
inp = input('Press N to use default image, or type the name of image: ');
if inp == 'N'
    A = double(imread('guiyang_photo.png'));
elseif inp ~='N'
    A = double(imread(inp));
end
    


A = A / 255; % normalize each element
img_size = size(A);
X = reshape(A, img_size(1) * img_size(2), 3);

fprintf('Press anykey to process to cluster the data. \n');
pause;
%% ============= Implement K-means===============
fprintf('Importing image as pixels...\n');
K = input('How many clusters you want? \nthe smaller the more compressed \nif you have no idea try 10 first');
max_iter = 20;


% Randomly reorder the indices of examples
randidx = randperm(size(X, 1));
% Take the first K examples as centroids
ini_centr = X(randidx(1:K), :);

% Run K-Means
centroids = opt_Kmean(X, ini_centr, max_iter);



fprintf('Press anykey to process to training process. \n');
pause;
%% ================= Compress the Image ======================
fprintf('Applying K-Means to compress the image...\n');

idx = findidx(X, centroids);


X_compress = centroids(idx,:);
X_compress = reshape(X_compress, img_size(1), img_size(2), 3);

% Display the original image 
subplot(1, 2, 1);
imagesc(A); 
title('Original Picture');

% Display compressed image side by side
subplot(1, 2, 2);
imagesc(X_compress)
title(sprintf('Compressed Picture with %d Colors', K));

