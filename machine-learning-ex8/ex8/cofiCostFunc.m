function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features); % num_movies x num_features: 5x3
Theta = reshape(params(num_movies*num_features+1:end), ... % num_users x num_features: 4x3
                num_users, num_features);
% R: 5x4
            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X)); % 5x3
Theta_grad = zeros(size(Theta)); % 4x3


% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

% R
% Theta
% X
% Y

h = (X * Theta') .* R; % 5x4
error = h - Y; % 5x4
squareError = error .^ 2; % 5x4

X_reg = (lambda/2) * sum((X.^2)(:));
Theta_reg = (lambda/2) * sum((Theta.^2)(:));
J = (1/2) * sum(squareError(:)) + X_reg + Theta_reg;

X_grad = (error * Theta) + (lambda * X); % 5x3
Theta_grad = (error' * X) + (lambda * Theta); % 4x3

% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
