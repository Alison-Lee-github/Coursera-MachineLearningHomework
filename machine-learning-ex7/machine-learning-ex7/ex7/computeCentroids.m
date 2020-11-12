function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X); %m=300 n=2

% You need to return the following variables correctly.
centroids = zeros(K, n); % 3 by 2 matrix


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

idx_num=0;
for i=1:K
    for j=1:m
    if(idx(j)==i)
        idx_num=idx_num+1;
        centroids(i,:)=centroids(i,:)+X(j,:); 
        % need the number of times that it is an idx
        
        
        
        
        
        
        
    end
    
    end
  centroids(i,:)= centroids(i,:)/idx_num;   
    idx_num=0;


end



% =============================================================


end

