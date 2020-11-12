function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
J_result=0;
grad = zeros(size(theta));
if size(theta,1)
    grad=transpose(grad);
end 
%number of features is 3, so we need three gradient values
%must access X's columns 
%how to do so in a loop of 1:m without doing another loop, prob must do
%both
%gradient is a vector so I must do it for each jth element
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%slightly off 
%Cost at initial theta (zeros): 0.686216
%Expected cost (approx): 0.693
   for i=1:m
      if size(theta,2)>1
    z=(theta)*transpose(X(i,:));
    hypothesis=sigmoid(z);  
       elseif size(theta,1)>1
           theta=transpose(theta);
           z=(theta)*transpose(X(i,:));
           hypothesis=sigmoid(z);
      end 
       J_result=(-y(i)*log(hypothesis))-((1-y(i))*log(1-hypothesis));
       J=J_result+J;
       %display(hypothesis-y(i));
       %grad and theta are opposite dimensions 
       grad=(X(i,:)*(hypothesis-y(i)))+grad; %getting a 3x3 instead of a 3 vector 
   end 
 %display(J);
 J=(1/m)*J;
 grad=(1/m)*grad; 
 

%
% Note: grad should have the same dimensions as theta
%








% =============================================================

end
