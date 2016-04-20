function STE = getShortTimeEnergy(X, fs)
	% X-signal
	% fs - sampling frequency of the signal

	signalLen = length(X); % length of the file

	% Define constants for boundary conditions
	frameLen = .03 * fs; % Frame length: used 30 msec for short time
	nOverlap = frameLen * 0.5; % 50% overlap
	windowLen = frameLen - nOverlap; % Windows length

	nWindows = round(signalLen / windowLen); % Number of windows

	for n = 1:nWindows    
		frameN1 = (n-1) * windowLen + 1;
		
		if (frameN1 + frameLen -1 > signalLen)
			frameN2 = signalLen;        
		else
			frameN2 = frameN1 + frameLen - 1;
		end
		
		frame = X(frameN1:frameN2);
		STE(n) = sum(frame .^ 2) / length(frame);		
	end
	
	% lengthSTE = length(STE);
	% segmentSTE = floor(lengthSTE / 20);
	% result = zeros(1, 20);
	
	% result(1, 1) = mean(STE(1 : segmentSTE));
	% result(1, 2) = mean(STE(segmentSTE + 1 : 2 * segmentSTE));
	% result(1, 3) = mean(STE(2 * segmentSTE + 1 : 3 * segmentSTE));
	% result(1, 4) = mean(STE(3 * segmentSTE + 1 : 4 * segmentSTE));
	% result(1, 5) = mean(STE(4 * segmentSTE + 1 : 5 * segmentSTE));
	% result(1, 6) = mean(STE(5 * segmentSTE + 1 : 6 * segmentSTE));
	% result(1, 7) = mean(STE(6 * segmentSTE + 1 : 7 * segmentSTE));
	% result(1, 8) = mean(STE(7 * segmentSTE + 1 : 8 * segmentSTE));
	% result(1, 9) = mean(STE(8 * segmentSTE + 1 : 9 * segmentSTE));
	% result(1, 10) = mean(STE(9 * segmentSTE + 1 : 10 * segmentSTE));
	% result(1, 11) = mean(STE(10 * segmentSTE + 1 : 11 * segmentSTE));
	% result(1, 12) = mean(STE(11 * segmentSTE + 1 : 12 * segmentSTE));
	% result(1, 13) = mean(STE(12 * segmentSTE + 1 : 13 * segmentSTE));
	% result(1, 14) = mean(STE(13 * segmentSTE + 1 : 14 * segmentSTE));
	% result(1, 15) = mean(STE(14 * segmentSTE + 1 : 15 * segmentSTE));
	% result(1, 16) = mean(STE(15 * segmentSTE + 1 : 16 * segmentSTE));
	% result(1, 17) = mean(STE(16 * segmentSTE + 1 : 17 * segmentSTE));
	% result(1, 18) = mean(STE(17 * segmentSTE + 1 : 18 * segmentSTE));
	% result(1, 19) = mean(STE(18 * segmentSTE + 1 : 19 * segmentSTE));
	% result(1, 20) = mean(STE(19 * segmentSTE + 1 : 20 * segmentSTE));
end