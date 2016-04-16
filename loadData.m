function [X y audioFiles] = loadData(dir)
	% Data locations
	mainDir = 'D:/Programming/Git Repositories/Prototypal Backprop ANN Audio Analysis';
	trainingDir = 'D:\Programming\Git Repositories\Prototypal Backprop ANN Audio Analysis\Samples\Training Set';
	crossValidationDir = 'D:\Programming\Git Repositories\Prototypal Backprop ANN Audio Analysis\Samples\Cross-validation Set';
	testDir = 'D:\Programming\Git Repositories\Prototypal Backprop ANN Audio Analysis\Samples\Test Set';
	
	% Variables
	trainingAudioFiles = readdir(trainingDir);
	crossValidationFiles = readdir(crossValidationDir);
	testFiles = readdir(testDir);
	
	switch (dir)
		case trainingDir
			[X y audioFiles] = fillInputOutput(trainingAudioFiles, dir);
		case crossValidationDir
			[X y audioFiles] = fillInputOutput(crossValidationFiles, dir);
		case testDir
			[X y audioFiles] = fillInputOutput(testFiles, dir);
	end	
	
	% Return to main directory
	cd (mainDir);	
end
