function plotLearningCurve(errorTrain, errorCV, m)
	plot(1:m, errorTrain, 1:m, errorCV);
	title('Learning curve')
	legend('Train', 'Cross-validation')
	xlabel('Number of training examples')
	ylabel('Error')
	axis([0 m 0 3])
end