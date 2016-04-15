function [theta] = trainANN(inputLayerSize, hiddenLayerSize, labelsCount, X, y, lambda, m)
	% Initialize Theta
	initialTheta = zeros(size(X, 2), 1); 

	% Create "short hand" for the cost function to be minimized
	costFunction = @(t) calculateCost(t, inputLayerSize, hiddenLayerSize, labelsCount, X, y, lambda, m)

	% Now, costFunction is a function that takes in only one argument
	options = optimset('MaxIter', 200, 'GradObj', 'on');

	% Minimize cost function using fmincg
	theta = fmincg(costFunction, initialTheta, options);
end
