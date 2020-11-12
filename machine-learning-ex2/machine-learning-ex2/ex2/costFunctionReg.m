function [cost, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n=size(X,2);%28 features 
%Cost at initial theta (zeros): 5.186178
%Expected cost (approx): 0.693
%Gradient at initial theta (zeros) - first five values only:
 %0.005815 
 %-0.002235 
 %0.000261 
 %0.000379 
 %0.001220 
%gradient at test theta 
 %0.365436 
 %0.095997 
 %0.129441 
 %0.161508 
 %0.026831 
%Expected gradients (approx) - first five values only:
 %0.3460
 %0.1614
 %0.1948
 %0.2269
 %0.0922
 

% You need to return the following variables correctly 
cost = 0;
cost_reg_result=0;
grad_reg_result=0; 
grad = zeros(size(theta));
if size(theta,1)>1
    grad=transpose(grad);
end 
 if size(theta,1)>1
     theta=transpose(theta);
 end 

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
for i=1  % cost works but okay gradient 
     z=(theta)*transpose(X(i,:));
    hypothesis=sigmoid(z);   
    cost_result=(-y(i)*log(hypothesis))-((1-y(i))*log(1-hypothesis));
    cost=cost_result+cost;
     grad=(X(i,:)*(hypothesis-y(i)))+grad;
end 
    
for i=2:m %yeah no need for second loop
    z=(theta)*transpose(X(i,:));
    hypothesis=sigmoid(z);   
       cost_result=(-y(i)*log(hypothesis))-((1-y(i))*log(1-hypothesis));%becomes NaN at n=30
       %0*log(0) gives NaN
       cost=cost_result+cost;
       %display(hypothesis-y(i));
       %grad and theta are opposite dimensions
       grad=(X(i,:)*(hypothesis-y(i)))+grad; % this is why I have a second loop
  
           
       %still not sure if second loop is needed
end 
 grad=(1/m)*grad; 
   for j=2:n
            cost_reg_result=theta(j)^2+cost_reg_result;  
            grad_reg_result=((lambda/m)*theta(j));
            grad(j)=grad_reg_result+grad(j);
          
   end
  
 display(cost);
 cost_reg_result=(lambda/(2*m))*cost_reg_result;
 display(cost_reg_result)
 cost=((1/m)*cost)+cost_reg_result; 









% =============================================================

end
