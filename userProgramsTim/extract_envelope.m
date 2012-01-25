function outsignal = extract_envelope(insignal,sfreq,cutoff_frequency)

%extracts the broadband temporal envelope of insignal using a smoothing
%time constant

%get the hilbert envelope of the signal
hilberttransformed_insignal = abs(hilbert(insignal));

% get filter coefficients for a 4th order butterworth low pass filter with 
% specified cutoff_frequency
[b,a]=butter(4, cutoff_frequency/(sfreq/2), 'low'); %
envelope=filter(b,a, hilberttransformed_insignal);

outsignal = envelope;
