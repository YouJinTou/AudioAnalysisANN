function ZCR = getZeroCrossingRate(X)
	ZCR = sum(abs(diff(X > 0))) / length(X);
end