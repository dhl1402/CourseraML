function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%




pos = find(y == 1);
neg = find(y == 0);
posX = X(pos,:);
negX = X(neg,:);

plot(posX(:,1), posX(:,2), "k+", "markersize", 10)
plot(negX(:,1), negX(:,2), "ko", "markersize", 10)





% =========================================================================



hold off;

end
