function [h a3 a2 a1 z2] = feedForward(X, Theta1, Theta2)
	m = size(X, 1);
	
	a1 = [ones(m, 1) X]; % Adding the bias term for the input layer
	z2 = Theta1 * a1';
	a2 = getSigmoid(z2);
	a2 = [ones(m, 1) a2']; % Adding the bias term for the hidden layer
	z3 = Theta2 * a2';
	a3 = getSigmoid(z3);
	
	h = a3;
end