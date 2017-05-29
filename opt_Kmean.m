function centr = opt_Kmean(X, ini_centr, max_iter)
% opt_Kmean input a image matrix X, 
%   a random initialized centroid ini_centr (to aviod localization)
%   and a maximum loop caps max_iter
% to compute the optimal centroids for the data.


%% Initialize values
[m n] = size(X);
K = size(ini_centr, 1);
centr = ini_centr;

%% Iteratively compute Centroids.
for i=1:max_iter
    % Assign index for each point.
    idx = findinx(X, centr);
    % Compute new centroids given indices.
    centr = findCentro(X, idx, K);
end
