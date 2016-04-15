function g = getSigmoidGradient(z)
	g = zeros(size(z));

	g = getSigmoid(z) .* (1 - getSigmoid(z));
end
