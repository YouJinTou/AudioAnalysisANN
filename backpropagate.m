function [D1 D2] = backpropagate(Theta1, Theta2, y, a3, a2, a1, z2, m, lambda)
	D1 = zeros(size(Theta1));
	D2 = zeros(size(Theta2));
	delta1 = zeros(size(Theta1));
	delta2 = zeros(size(Theta2));
	
	d3 = a3 - y'; % Error for output layer
	d2 = (Theta2(:, 2:end)' * d3) .* getSigmoidGradient(z2); % Error for hidden layer. We omit the bias theta
	
	delta1 = d2 * a1;	
	delta2 = d3 * a2;
	
	D1 = (1 / m) * delta1;
	D2 = (1 / m) * delta2;
	
	% Add regularization
	% Get rid of the bias
	Theta1(:, 1) = 0;
	Theta2(:, 1) = 0;

	gradRegTerm1 = (lambda / m) * Theta1;
	gradRegTerm2 = (lambda / m) * Theta2;

	D1 = D1 + gradRegTerm1;
	D2 = D2 + gradRegTerm2;
end