function J = getError(h, y, m, Theta1, Theta2, lambda)
	firstCostTerm = -y' .* log(h);
	secondCostTerm = (1 - y)' .* log(1 - h);
	
	J = sum(sum(firstCostTerm - secondCostTerm)) / m;
	
	% Add regularization
	thetaOneReg = sum(sum(Theta1(:, 2:end) .^ 2));
	thetaTwoReg = sum(sum(Theta2(:, 2:end) .^ 2));
	parameter = (lambda / (2 * m));
	regTerm =  parameter * (thetaOneReg + thetaTwoReg);
	
	% Final cost
	J = J + regTerm;
end