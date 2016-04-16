function [errorTrain errorCV] = getLearningCurveParams(unrolledThetas, inputLayerSize, hiddenLayerSize, labelsCount, Xtrain, ytrain, Xcv, ycv, lambda)
	m = size(Xtrain, 1);
	errorTrain = zeros(m, 1);
	errorCV   = zeros(m, 1);
	
	for i = 1:m % Iterate over all training examples
		currentX = Xtrain(i, :);
		currentY = ytrain(i, :);
		learnedThetas = trainANN(unrolledThetas, inputLayerSize, hiddenLayerSize, ... 
		labelsCount, currentX, currentY, lambda, m); % For each example, learn all weights
		
		[Theta1 Theta2] = reshapeThetas(learnedThetas, inputLayerSize, hiddenLayerSize, labelsCount); % Reshape from a vector into two matrices
		
		hTrain = feedForward(currentX, Theta1, Theta2); % Get the prediction for the current training example			
		hCV = feedForward(Xcv, Theta1, Theta2);	% Get the prediction for the current cross-validation example	
		
		errorTrain(i) = getError(hTrain, ytrain, m, Theta1, Theta2, lambda); % Compute the error for this training example
		errorCV(i) = getError(hCV, ycv, m, Theta1, Theta2, lambda);	 % Compute the error for this cross-validation example
	end
end
