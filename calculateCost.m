function [J gradients] = calculateCost(unrolledThetas, inputLayerSize, hiddenLayerSize, labelsCount, X, y, lambda, m)	
	% Reshape unrolled weights
	Theta1 = reshape(unrolledThetas(1:hiddenLayerSize * (inputLayerSize + 1)), hiddenLayerSize, (inputLayerSize + 1));	
	Theta2 = reshape(unrolledThetas((1 + (hiddenLayerSize * (inputLayerSize + 1))):end), labelsCount, (hiddenLayerSize + 1));

	% Perform forward propagation
	[h a3 a2 a1 z2] = feedForward(X, Theta1, Theta2);
				 
	% Compute the cost function
	J = getError(h, y, m, Theta1, Theta2, labelsCount, lambda);
	
	% Perform backpropagation
	[D1 D2] = backpropagate(Theta1, Theta2, y, a3, a2, a1, z2, m, lambda);

	% Unroll gradients
	gradients = [D1(:) ; D2(:)];
end