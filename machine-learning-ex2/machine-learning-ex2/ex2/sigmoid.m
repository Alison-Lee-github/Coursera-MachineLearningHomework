function g = sigmoid(z) %z is theta transpose times x
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z)); % must work on a matrix
 if numel(z)>1
     for i=1:numel(z)    
    g(i)=1/(1+exp(z(i)*-1));
    
     end
 else
     g=1/(1+exp(-z));
 end
 
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).
%for iter = 1:num_iters
   %for i=1:m
      % if size(theta,2)>1
    % hypothesis=(theta)*transpose(X(i,:));%hypothesis works
       %elseif size(theta,1)>1
           %theta=transpose(theta);
           %hypothesis=(theta)*transpose(X(i,:));




% =============================================================

end
