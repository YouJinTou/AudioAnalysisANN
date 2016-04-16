function p = predictNewInput(Theta1, Theta2, X, y, audioFiles)
	h = feedForward(X, Theta1, Theta2);
	p = (h >= 0.5)';

	for i = 1: length(audioFiles)		
		if (p(i) == y(i))
			disp([audioFiles{i}, " -- correct. ", num2str(h(i))]);
		else	
			disp([audioFiles{i}, " -- INCORRECT! ", num2str(h(i))]);
		endif
	end
	
	
	fprintf('\nTraining set accuracy: %f\n', mean(double(p == y)) * 100);
end
