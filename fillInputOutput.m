function [X y audioFiles] = fillInputOutput(audioFiles, dir)
	% Data locations
	mainDir = 'D:/Programming/Git Repositories/Prototypal Backprop ANN Audio Analysis';
	trainingDir = 'D:\Programming\Git Repositories\Prototypal Backprop ANN Audio Analysis\Samples\Training Set';
	crossValidationDir = 'D:\Programming\Git Repositories\Prototypal Backprop ANN Audio Analysis\Samples\Cross-validation Set';
	testDir = 'D:\Programming\Git Repositories\Prototypal Backprop ANN Audio Analysis\Samples\Test Set';
	
	switch (dir)
		case trainingDir
			cd (trainingDir);
		case crossValidationDir
			cd (crossValidationDir);
		case testDir
			cd (testDir);
	end	
	
	m = size(audioFiles, 1);
	X = zeros(m, 6); % Six features
	y = zeros(m, 1);
	length = length(audioFiles);
	dummyFiles = 0;
	
	warning('off', 'Octave:possible-matlab-short-circuit-operator'); % Suppress the warning in the upcoming if-block
		
	for i = 1:length
		% Skip dummy files
		if (regexp (audioFiles{i}, "^\\.\\.?$"))
			dummyFiles = dummyFiles + 1;
			
			continue;
		end
		
		% Positive examles; the phone call was taken by a human
		if (strcmp(audioFiles{i}, 'bf3.wav') == 1
			| strcmp(audioFiles{i}, 'RE2f.wav') == 1
			| strcmp(audioFiles{i}, 'RE99.wav') == 1
			| strcmp(audioFiles{i}, 'REe.wav') == 1
			| strcmp(audioFiles{i}, 'REf.wav') == 1)
			y(i, 1) = 1;
		end
		
		audioFile = wavread(audioFiles{i});		
		audioFileLength = size(audioFile, 1);
		audioFileSegment = floor(audioFileLength / 5);
		
		% Input features
		X(i, 1) = audioFileLength;
		X(i, 2) = mean(audioFile(1 : audioFileSegment)); % 1 to m
		X(i, 3) = mean(audioFile(audioFileSegment + 1 : 2 * audioFileSegment)); % m + 1 to 2 x m
		X(i, 4) = mean(audioFile(2 * audioFileSegment + 1 : 3 * audioFileSegment)); % 2 x m + 1 to 3 x m
		X(i, 5) = mean(audioFile(3 * audioFileSegment + 1 : 4 * audioFileSegment)); % 3 x m + 1 to 4 x m
		X(i, 6) = mean(audioFile(4 * audioFileSegment + 1 : 5 * audioFileSegment)); % 4 x m + 1 to 5 x m		
	end
	
	y = y(dummyFiles + 1 : end, :);
	X = X(dummyFiles + 1 : end, :);
	audioFiles = audioFiles(dummyFiles + 1 : end, :);
end