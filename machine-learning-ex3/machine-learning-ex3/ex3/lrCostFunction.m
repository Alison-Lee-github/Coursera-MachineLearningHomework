function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%


    hypothesis=sigmoid(X*theta); 
   display(hypothesis);
   grad=(1/m)*(transpose(X)*(hypothesis-y));
    display(grad);
    %display(log(hypothesis)); 
    %display(log(1-hypothesis))
    %display(log(hypothesis)*-y) % gets 0.8919 
    %display(log(1-hypothesis)*(1-y))% gets -2.7822
    %display(sum((log(hypothesis).*-y))) %0.8919
    %J=sum(-y.*log(hypothesis))-sum((1-y).*log(1-hypothesis));
    %display(sum(-y.*log(hypothesis)))
    %display(sum((1-y).*log(1-hypothesis)))
    %0.8919
   %-2.7822
   %doing it right but need to regularize first 
    %A=(-y.*log(hypothesis))-((1-y).*log(1-hypothesis));
    %display(A); 
    J=sum((-y.*log(hypothesis))-((1-y).*log(1-hypothesis))); 
    %display(J) %3.6741
    J=(1/m)*J;%.7348 first example divides by 5 
    %display(J)

%log10 gets me 1.5956/5
cost_reg=theta.^2; 
display(cost_reg);
for i=2:size(theta)
   cost_reg(i)=(lambda/(2*m))*cost_reg(i);
   grad_reg=(lambda/m)*theta(i); 
   grad(i)=grad_reg+grad(i); 
   %display(cost_reg(i))
  
end 

display(cost_reg);
cost_reg=sum(cost_reg)-cost_reg(1);
display(cost_reg);
J=cost_reg+J; 

% =============================================================

grad = grad(:);

end
