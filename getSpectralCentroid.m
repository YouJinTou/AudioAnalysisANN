function [vsc] = getSpectralCentroid(X, f_s)
    X = X.^2;
    vsc = ([0:size(X,1)-1]*X)./sum(X,1);
    
    % avoid NaN for silence frames
    vsc (sum(X,1) == 0) = 0;
        
    % convert from index to Hz
    vsc = vsc / size(X,1) * f_s/2;
end