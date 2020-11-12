function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;
row=1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
C_values=[0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]; 
sigma_values=[0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
prediction_matrix=zeros(size(C_values,1), size(sigma_values,1)); 

    for cost=C_values
        for s=sigma_values 
    model=svmTrain(X, y, cost, @(x1, x2) gaussianKernel(x1, x2, s));       
    predictions = svmPredict(model, Xval);
    prediction_error= mean(double(predictions ~= yval));
     %prediction_matrix(cost,s)=prediction_error; %error because no proper index
       results(row,:) = [cost s prediction_error]; %64x3 matrix 
        row = row + 1;
     
        end
        
    end 
    
[error_min, row]=min(results(:,3)); 
C=results(row,1);
sigma=results(row,2); 


% =========================================================================

end
