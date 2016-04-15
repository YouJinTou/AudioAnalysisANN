function [Theta1 Theta2] = reshapeThetas(optimizedThetas, inputLayerSize, hiddenLayerSize, labelsCount)
	Theta1 = reshape(optimizedThetas(1:hiddenLayerSize * (inputLayerSize + 1)), hiddenLayerSize, (inputLayerSize + 1));
	Theta2 = reshape(optimizedThetas((1 + (hiddenLayerSize * (inputLayerSize + 1))):end), labelsCount, (hiddenLayerSize + 1));
end