function [X y] = loadData(dir)
	% Data locations
	mainDir = 'D:/Programming/Git Repositories/Backprop ANN Audio Analysis';
	trainingDir = 'D:\Programming\Git Repositories\Backprop ANN Audio Analysis\Samples\Training Set';
	crossValidationDir = 'D:\Programming\Git Repositories\Backprop ANN Audio Analysis\Samples\Cross-validation Set';
	testDir = 'D:\Programming\Git Repositories\Backprop ANN Audio Analysis\Samples\Test Set';
	
	% Variables
	trainingAudioFiles = readdir(trainingDir);
	crossValidationFiles = readdir(crossValidationDir);
	testFiles = readdir(testDir);
	
	switch (dir)
		case trainingDir
			[X y] = fillInputOutput(trainingAudioFiles, dir);
		case crossValidationDir
			[X y] = fillInputOutput(crossValidationFiles, dir);
		case testDir
			[X y] = fillInputOutput(testFiles, dir);
	end	
	
	% Return to main directory
	cd (mainDir);	
end
