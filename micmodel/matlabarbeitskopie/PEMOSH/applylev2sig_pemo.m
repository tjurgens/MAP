function signal = applylev2sig_pemo(signal,level)
%applies the level to the signal so that pemo sees this level
%author JT 0508

%normierung:
signal = signal./rms(signal);

%set level:
signal = signal.*10^((level-100)/20);