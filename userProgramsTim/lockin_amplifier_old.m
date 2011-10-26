function [out,out_sfreq] = lockin_amplifier_old(in1, in2, sfreq, phase, integration_constant)

%function that calculates the DC lock-in signal from two in-signals
%input: in1: input signal 1, used to calculate the reference signal
%       in2: input signal 2
%       sfreq: sampling frequency in Hz
%       phase: phase shift for the incorporation in the cross-correlation,
%              can be used to maximize the DC output, radiant units
%       integration_constant: time window for the cross-correlation, unit s
%output: out: DC output signal
%        out_sfreq: output sampling frequency
% Tim Jürgens, March 2011

%find frequency of reference signal (in1)
ACF = xcorr(in1);
z_crossings_indices = find(diff(sign(diff(ACF))) < 0)+1; %+1 is necessary, because diff shortens vector by 1
period_in_samples = mean(diff(z_crossings_indices)); %average distance of peaks in the ACF
ref_freq = sfreq/period_in_samples;

%generate reference signal
time_axis = 0:1/sfreq:1;
reference_signal = sin(2*pi*ref_freq.*time_axis+phase);

%slice-wise calculation of cross-correlation between reference signal and
%in2
out_sfreq = 1/integration_constant;
integration_constant_in_samples = round(integration_constant*sfreq);
outlength_in_samples = floor(length(in2)/integration_constant_in_samples);
for iCounter = 1:outlength_in_samples
    out(iCounter) = 1/integration_constant * ...
        sum(1/sfreq.*reference_signal((iCounter-1)*integration_constant_in_samples+1:iCounter*integration_constant_in_samples)... 
        .*in2((iCounter-1)*integration_constant_in_samples+1:iCounter*integration_constant_in_samples));
end
