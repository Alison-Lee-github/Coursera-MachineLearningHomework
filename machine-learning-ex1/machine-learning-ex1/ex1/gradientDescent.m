function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
%getting -infinity for theta
%problem sends 9 values instead of 3, math seems correct? 
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
delta=0;
for iter = 1:num_iters
   for i=1:m
       if size(theta,2)>1
     hypothesis=(theta)*transpose(X(i,:));%hypothesis works
       elseif size(theta,1)>1
           theta=transpose(theta);
           hypothesis=(theta)*transpose(X(i,:));
       end 
      delta=(X(i,:)*(hypothesis-y(i)))+delta; 
   end 
   hypothesis=0;
   delta=(alpha)*(1/m)*delta;
   theta=theta-delta; 
    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %


    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    display(theta);
   end 
 