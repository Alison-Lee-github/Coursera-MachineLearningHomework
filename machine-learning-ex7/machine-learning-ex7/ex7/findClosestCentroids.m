function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1); %3x2 centroid matrix, it be K=3

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
distance=0;
distance_matrix=zeros(K,1); 
for row=1:size(X,1)
    for cur_centroid=1:K
      distance=  X(row,:)-centroids(cur_centroid,:); 
      distance=abs(sum((distance.^2)));
      distance=sqrt(distance);
      distance_matrix(cur_centroid)=distance; 
      
        
    end
    [distance_min idx(row)]=min(distance_matrix); 
    
end





% =============================================================

end

