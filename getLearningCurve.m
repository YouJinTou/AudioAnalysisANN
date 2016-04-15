function [errorTrain errorCV] = getLearningCurve(inputLayerSize, hiddenLayerSize, labelsCount, Xtrain, ytrain, Xcv, ycv, lambda)
	m = size(Xtrain, 1);
	errorTrain = zeros(m, 1);
	errorCV   = zeros(m, 1);
	
	for i = 1:m % Iterate over all training examples
		currentX = Xtrain(1:i, :);
		currentY = ytrain(1:i, :);
		learnedThetas = trainANN(inputLayerSize, hiddenLayerSize, ... 
		labelsCount, currentX, currentY, lambda, m); % For each example, learn all weights
		
		[Theta1 Theta2] = reshapeThetas(learnedThetas, inputLayerSize, hiddenLayerSize, labelsCount); % Reshape from a vector into two matrices
		
		Htrain = feedForward(currentX, Theta1, Theta2); % Get the prediction for the current training example			
		HCV = feedForward(Xcv, Theta1, Theta2);	% Get the prediction for the current cross-validation example	
		
		errorTrain(i) = getError(Htrain, ytrain, m); % Compute the error for this training example
		errorCV(i) = getError(HCV, ycv, m);	 % Compute the error for this cross-validation example
	end
end
