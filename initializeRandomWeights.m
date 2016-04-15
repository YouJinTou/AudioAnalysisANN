function W = initializeRandomWeights(inputLayerSize, outputLayerSize)
	W = zeros(outputLayerSize, 1 + inputLayerSize);
	initialEpsilon = 0.12;
	
	W = rand(outputLayerSize, 1 + inputLayerSize) * 2 * initialEpsilon - initialEpsilon;
end
