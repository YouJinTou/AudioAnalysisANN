% Clear environment
clear; close all; clc

% Constants
mainDir = 'D:/Programming/Git Repositories/Prototypal Backprop ANN Audio Analysis';
trainingDir = 'D:\Programming\Git Repositories\Prototypal Backprop ANN Audio Analysis\Samples\Training Set';
crossValidationDir = 'D:\Programming\Git Repositories\Prototypal Backprop ANN Audio Analysis\Samples\Cross-validation Set';
testDir = 'D:\Programming\Git Repositories\Prototypal Backprop ANN Audio Analysis\Samples\Test Set';

% Initialize layer variables
inputLayerSize  = 6; % Mean + 5 x 20% sections 
hiddenLayerSize = 5; % Five neurons in the hidden layer
labelsCount = 1; % Man or machine

% Load training data
[Xtrain ytrain audioFiles] = loadData(trainingDir);

% Normalize training data
Xtrain = featureNormalize(Xtrain);

% Initialize useful variables
m = size(Xtrain, 1);

% Initialize random weights
Theta1 = initializeRandomWeights(inputLayerSize, hiddenLayerSize); % From input layer to hidden layer
Theta2 = initializeRandomWeights(hiddenLayerSize, labelsCount); % From hidden layer to output layer

% Unroll weights
unrolledThetas = [Theta1(:) ; Theta2(:)];

% Run a cost-minimization function
lambda = 0; % Regularization parameter
costFunction = @(p) calculateCost(p, inputLayerSize, hiddenLayerSize, labelsCount, Xtrain, ytrain, lambda, m);
options = optimset('MaxIter', 50);

optimizedThetas = fmincg(costFunction, unrolledThetas, options);

% Obtain optimized weights			 
[Theta1 Theta2] = reshapeThetas(optimizedThetas, inputLayerSize, hiddenLayerSize, labelsCount);

% Check if backpropagation works correctly
% checkNNGradients(Xtrain, ytrain, lambda, m);

% Load cross-validation data
[Xcv ycv audioFiles] = loadData(crossValidationDir);

% Normalize cross-validation data
Xcv = featureNormalize(Xcv);

% Plot learning curves
%[errorTrain errorCV] = getLearningCurveParams(unrolledThetas, inputLayerSize, hiddenLayerSize, labelsCount, Xtrain, ytrain, Xcv, ycv, lambda);

%plotLearningCurve(errorTrain, errorCV, m);

% Predict new input
predictNewInput(Theta1, Theta2, Xcv, ycv, audioFiles);