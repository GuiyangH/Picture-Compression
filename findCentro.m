function centroids = findCentro(X, idx, K)
% findCentro input an image matrix X,
%       indices for each data point,
%       and the expected number of clusters K.
% output the new, better centroids.

%% initialize
[m ~] = size(X);
centroids = zeros(K, n);

%% Iteratively go through K centroids and modify them
for i = 1:K
    % setup variables
    test = X;
    indices = find(idx ~= i);
    test(indices,:) = 0;
    % Assign new centroid
    centroids(i,:) = 1/(m-length(indices))*sum(test);
end



