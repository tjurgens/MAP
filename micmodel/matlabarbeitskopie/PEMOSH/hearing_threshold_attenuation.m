function outsignal = hearing_threshold_attenuation(insignal,centerfrequency);
% this function attenuates a narrowband signal (as is given e.g. in the respective channels of a gammatone filterbank)
% according to the absolute hearing threshold of normal-hearing listeners
% written and tested by JT 13.8.2009

[HLFreq,HLevel] = HearingLevel; %hearing threshold in free-field condition (ISO/CD 226)

attenuation_level = interp1(HLFreq,HLevel,centerfrequency,'linear','extrap');

outsignal = insignal.*10.^(-attenuation_level/20);
