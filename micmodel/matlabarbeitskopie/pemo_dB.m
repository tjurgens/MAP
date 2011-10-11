function dB = pemo__dB(insignal)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% gives out the dB-SPL-Level of the insignal 
% (integrated over the whole signal)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dB = 100+20*log10(rms(insignal));