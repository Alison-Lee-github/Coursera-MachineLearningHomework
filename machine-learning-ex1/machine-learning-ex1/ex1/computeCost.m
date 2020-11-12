function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y


% Initialize some useful values
m = length(y); 
%number of features for first example is 2, Profit and population

number=size(X,2); 

% You need to return the following variables correctly 
J = 0;

hypothesis=0;
%multiply hypothesis by each feature
%keeps returning [0 0
%                 0 0] 
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

for i=1:m
  if size(theta,2)>1
     hypothesis=(theta)*transpose(X(i,:));%hypothesis works
     %display(hypothesis);
       elseif size(theta,1)>1
           hypothesis=X(i,:)*theta;
           %display(hypothesis);
       end 

 J_result=(hypothesis-y(i))^2; % error when running as power 
 %display(J_result); 
  J=J_result+J;
end 
  J=(1/(2*m))*J; 
  
    
    


    




% =========================================================================

end
