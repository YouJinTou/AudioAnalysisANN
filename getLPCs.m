function y = getLPCs(X, fs)
	mainDir = 'C:/Users/DIMITARD/Desktop/Random/Tests/Check/Prototypal Backprop ANN Audio Analysis/';
	rastamatDir = 'C:/Users/DIMITARD/Desktop/Random/Tests/Check/Prototypal Backprop ANN Audio Analysis/rastamat';
    
	cd (rastamatDir);
	 
	order = fs / 1000 + 5;
	y = mean(dolpc(X, fs));

	cd (mainDir);
end
