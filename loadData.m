function [X y audioFiles] = loadData(dir)
	% Data locations
	mainDir = 'C:/Users/DIMITARD/Desktop/Random/Tests/Check/Prototypal Backprop ANN Audio Analysis/';
	trainingDir = 'C:/Users/DIMITARD/Desktop/Random/Tests/Check/Prototypal Backprop ANN Audio Analysis/Samples/Training Set';
	crossValidationDir = 'C:/Users/DIMITARD/Desktop/Random/Tests/Check/Prototypal Backprop ANN Audio Analysis/Samples/Cross-validation Set';
	testDir = 'C:/Users/DIMITARD/Desktop/Random/Tests/Check/Prototypal Backprop ANN Audio Analysis/Samples/Test Set';
		
	switch (dir)
		case trainingDir
			trainingAudioFiles = readdir(trainingDir);
			[X y audioFiles] = fillInputOutput(trainingAudioFiles, dir);
		case crossValidationDir
			crossValidationFiles = readdir(crossValidationDir);
			[X y audioFiles] = fillInputOutput(crossValidationFiles, dir);
		case testDir
			testFiles = readdir(testDir);
			[X y audioFiles] = fillInputOutput(testFiles, dir);
	end	
	
	% Return to main directory
	cd (mainDir);	
end
