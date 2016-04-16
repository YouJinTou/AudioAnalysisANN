function [theta] = trainANN(unrolledThetas, inputLayerSize, hiddenLayerSize, labelsCount, X, y, lambda, m)
	% Initialize theta
	initialTheta = zeros(size(unrolledThetas)); 

	% Create "short hand" for the cost function to be minimized
	costFunction = @(t) calculateCost(t, inputLayerSize, hiddenLayerSize, labelsCount, X, y, lambda, m);

	% Now, costfunction is a function that takes in only one argument
	options = optimset('MaxIter', 200, 'gradObj', 'on');

	% Minimize cost function using fmincg
	theta = fmincg(costFunction, initialTheta, options);
end
