function averageMFFCs = getFeaturesMFCC(X, audioFile, dir)
	mainDir = 'C:/Users/DIMITARD/Desktop/Random/Tests/Check/Prototypal Backprop ANN Audio Analysis/';
	%rastamatDir = 'C:/Users/DIMITARD/Desktop/Random/Tests/Check/Prototypal Backprop ANN Audio Analysis/rastamat';
	
	% % Load a speech waveform
	cd (dir);
	% [d,sr] = wavread(audioFile);
	
	% % Back to rastamat directory
	% cd (rastamatDir);

	% % Calculate basic RASTA-PLP cepstra and spectra
	% [cep1, spec1] = rastaplp(d, sr);
	
	% % Calculate 12th order PLP features without RASTA
	% [cep2, spec2] = rastaplp(d, sr, 0, 12);
		
	% % Append deltas and double-deltas onto the cepstral vectors
	% del = deltas(cep2);
	
	% % Double deltas are deltas applied twice with a shorter window
	% ddel = deltas(deltas(cep2,5),5);
	
	% % Composite, 39-element feature vector, just like we use for speech recognition
	% cepDpDD  = [cep2;del;ddel];
		 
	% Get final result
	[X, sf] = wavread(audioFile);
	
	cd (mainDir);
	
	[cep] = mfcc(X, sf);
	averageMFFCs = mean(cep.');
end