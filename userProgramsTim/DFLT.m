function out = DFLT(in_pattern)
% calculates the discrete fourier log transform
% in_pattern: auditory internal representation that is on a log frequency
%               axis
% out: fourier coefficients (only half of the samples remain)
outtmp = abs(fft(in_pattern));
out = outtmp(1:ceil(end/2),:);