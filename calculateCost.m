function [J gradients] = calculateCost(unrolledThetas, inputLayerSize, hiddenLayerSize, labelsCount, X, y, lambda, m)	
	% Reshape unrolled weights
	Theta1 = reshape(unrolledThetas(1:hiddenLayerSize * (inputLayerSize + 1)), hiddenLayerSize, (inputLayerSize + 1));
	Theta2 = reshape(unrolledThetas((1 + (hiddenLayerSize * (inputLayerSize + 1))):end), labelsCount, (hiddenLayerSize + 1));
	
	% Perform forward propagation
	[H a3 a2 a1 z2] = feedForward(X, Theta1, Theta2);
				 
	% Compute the cost function
	J = getError(H, y, m);
	
	% Perform backpropagation
	[Theta1Gradients Theta2Gradients] = backpropagate(Theta1, Theta2, y, a3, a2, a1, z2, m);
	
	% Unroll gradients
	gradients = [Theta1Gradients(:) ; Theta2Gradients(:)];
end