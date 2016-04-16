function p = predictNewInput(Theta1, Theta2, X)
	h = feedForward(X, Theta1, Theta2);
	p = (h >= 0.5)';
end
