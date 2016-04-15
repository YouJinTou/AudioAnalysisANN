function [Theta1Gradients Theta2Gradients] = backpropagate(Theta1, Theta2, y, a3, a2, a1, z2, m)
	Theta1Gradients = zeros(size(Theta1));
	Theta2Gradients = zeros(size(Theta2));
	delta1 = zeros(size(Theta1));
	delta2 = zeros(size(Theta2));
	
	d3 = a3 - y'; % Error for output layer
	d2 = (Theta2(:, 2:end)' * d3) .* getSigmoidGradient(z2); % Error for hidden layer. We omit the bias theta
	
	delta1 = d2 * a1;	
	delta2 = d3 * a2;
	
	Theta1Gradients = (1 / m) * delta1;
	Theta2Gradients = (1 / m) * delta2;
	
end