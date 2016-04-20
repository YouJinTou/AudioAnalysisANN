function [X y audioFiles] = fillInputOutput(audioFiles, dir)	
	mainDir = 'C:/Users/DIMITARD/Desktop/Random/Tests/Check/Prototypal Backprop ANN Audio Analysis/';		
	m = size(audioFiles, 1);
	X = zeros(m, 37); % Thirty-seven features
	y = zeros(m, 1);
	length = length(audioFiles);
	dummyFiles = 0;
	
	warning('off', 'Octave:possible-matlab-short-circuit-operator'); % Suppress the warning in the upcoming if-block
	
	cd (dir);
		
	for i = 1:length
		% Skip dummy files
		if (regexp (audioFiles{i}, "^\\.\\.?$"))
			dummyFiles = dummyFiles + 1;
			
			continue;
		end
		
		currentFileNameLength = size(audioFiles{i}, 2);		
		
		% Positive examles; the phone call was taken by a human
		if (currentFileNameLength == 7) % Labels y = 1 are always in the format 'xxx.wav'
			y(i, 1) = 1;
		end		
				
		[S fs] = wavread(audioFiles{i});		
		audioFileLength = size(S, 1);
		audioFileSegment = floor(audioFileLength / 20);
		
		% Input features					
		X(i, 1) = audioFileLength;
		X(i, 2) = mean(S(1 : audioFileSegment)); % 1 to m
		X(i, 3) = mean(S(audioFileSegment + 1 : 2 * audioFileSegment)); % m + 1 to 2 x m
		X(i, 4) = mean(S(2 * audioFileSegment + 1 : 3 * audioFileSegment)); % 2 x m + 1 to 3 x m
		X(i, 5) = mean(S(3 * audioFileSegment + 1 : 4 * audioFileSegment)); % 3 x m + 1 to 4 x m
		X(i, 6) = mean(S(4 * audioFileSegment + 1 : 5 * audioFileSegment)); % ...		
		X(i, 7) = mean(S(5 * audioFileSegment + 1 : 6 * audioFileSegment)); % ...
		X(i, 8) = mean(S(6 * audioFileSegment + 1 : 7 * audioFileSegment)); % ...
		X(i, 9) = mean(S(7 * audioFileSegment + 1 : 8 * audioFileSegment)); % ...
		X(i, 10) = mean(S(8 * audioFileSegment + 1 : 9 * audioFileSegment)); 
		X(i, 11) = mean(S(9 * audioFileSegment + 1 : 10 * audioFileSegment)); 
		X(i, 12) = mean(S(10 * audioFileSegment + 1 : 11 * audioFileSegment)); 
		X(i, 13) = mean(S(11 * audioFileSegment + 1 : 12 * audioFileSegment)); 
		X(i, 14) = mean(S(12 * audioFileSegment + 1 : 13 * audioFileSegment)); 
		X(i, 15) = mean(S(13 * audioFileSegment + 1 : 14 * audioFileSegment)); 
		X(i, 16) = mean(S(14 * audioFileSegment + 1 : 15 * audioFileSegment)); 
		X(i, 17) = mean(S(15 * audioFileSegment + 1 : 16 * audioFileSegment)); 
		X(i, 18) = mean(S(16 * audioFileSegment + 1 : 17 * audioFileSegment)); 
		X(i, 19) = mean(S(17 * audioFileSegment + 1 : 18 * audioFileSegment)); 
		X(i, 20) = mean(S(18 * audioFileSegment + 1 : 19 * audioFileSegment)); 
		X(i, 21) = mean(S(19 * audioFileSegment + 1 : 20 * audioFileSegment));
		
		cd (mainDir);
		
		X(i, 22) = getSpectralSpread(S, fs); % helps a lot
		X(i, 23) = mean(getShortTimeEnergy(S, fs));
		X(i, 24) = getZeroCrossingRate(S);
		X(i, 25:37) = getFeaturesMFCC(S, audioFiles{i}, dir);
		
		cd (dir);	
	end
	
	y = y(dummyFiles + 1 : end, :);
	X = X(dummyFiles + 1 : end, :);
	audioFiles = audioFiles(dummyFiles + 1 : end, :);
end