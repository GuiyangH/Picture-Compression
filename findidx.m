function idx = findidx(X, centro)
% findidx input an image matrix X, and a set of given centroids,
% output the labels for each point in matrix as idx. 

%% Initialize
idx = zeros(size(X,1), 1);
n = size(X,1);

%% Iteratively lookover all n points and for each one assign it an index.
for i = 1:n
    % according to k-mean algorithm's formula
    minus_term = X(i,:);
    intermediate = (centro - ones(size(centro))*diag(minus_term)).^2;
    normd = sum(intermediate,2);
    [~,idx(i)] = min(normd);
end
