function [out,out_sfreq,phase] = lockin_amplifier_with_phase_extract_2in(in1, in2, sfreq, integration_constant)

%function that calculates the DC lock-in signal from two AC-in-signals
%input: in1: input signal 1
%       in2: input signal 2, both can be noisy, must be the same length as
%       sfreq: sampling frequency in Hz
%       phase: phase shift for the incorporation in the cross-correlation,
%              can be used to maximize the DC output, radiant units
%       integration_constant: time window for the cross-correlation, unit s
%output: out: DC output signal
%        out_sfreq: output sampling frequency
% Tim Jürgens, May 2011

% %find frequency of reference signal (in1)
% ACF = xcorr(in1);
% z_crossings_indices = find(diff(sign(diff(ACF))) < 0)+1; %+1 is necessary, because diff shortens vector by 1
% period_in_samples = mean(diff(z_crossings_indices)); %average distance of peaks in the ACF
% ref_freq = sfreq/period_in_samples;
% 
% %generate reference signal
% time_axis = 0:1/sfreq:1;
% reference_signal = sin(2*pi*ref_freq.*time_axis+phase);

%generate AC-signals
in1 = in1 - mean(in1);
in2 = in2 - mean(in2);

%slice signal according to integration_constant
out_sfreq = 1/integration_constant;
integration_constant_in_samples = round(integration_constant*sfreq);
outlength_in_samples = floor(length(in2)/integration_constant_in_samples);


for iCounter = 1:outlength_in_samples
    tmpin1 = in1((iCounter-1)*integration_constant_in_samples+1:iCounter*integration_constant_in_samples);
    tmpin2 = in2((iCounter-1)*integration_constant_in_samples+1:iCounter*integration_constant_in_samples);
    
    %normalize to 1, takes rate information out!
    tmpin1 = tmpin1./max(tmpin1);
    tmpin2 = tmpin2./max(tmpin2);
    
    %extract main frequency    
    [~,index] = max(abs(fft(tmpin1))); %extract main frequency from channel in1
    main_freq = max([1 index-1])*sfreq/length(tmpin1); %main frequency from channel in Hz (because the first entry is 0 Hz)
    
    
    %extract the phase between the two signals using the shift of the maximum of
    %the cross-correlation function
    [~,index] = max(xcorr(tmpin1,tmpin2));
    phase = 2*pi*(length(tmpin1)-index)*main_freq/sfreq; %lenght(in1) is the middle index of the CCF
    if phase < 0 %then exchange tmpin1 by tmpin2
        tmp = tmpin1;
        tmpin1 = tmpin2;
        tmpin2 = tmp;
        phase = phase*(-1);
        clear tmp
    end
    
    % phase-shift
    phase_shift_samples = round(phase/2/pi/main_freq*sfreq);
    tmpin2 = tmpin2(phase_shift_samples+1:end);
    tmpin1 = tmpin1(1:end-phase_shift_samples);
    
    %slice-wise calculation of cross-correlation between in1 and
    %in2
    
    out(iCounter) = 1/integration_constant * ...
        sum(1/sfreq.*tmpin1.*tmpin2);
end
