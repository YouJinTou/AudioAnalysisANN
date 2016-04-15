function J = getError(H, y, m)
	firstCostTerm = -y' .* log(H);
	secondCostTerm = (1 - y)' .* log(1 - H);
	
	J = sum(sum((firstCostTerm - secondCostTerm))) / m;
end