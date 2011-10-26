function [out,out_sfreq,phase] = lockin_amplifier(in1, in2, in3, in4, in5, in6, BFlistpart, sfreq, integration_constant)

%function that calculates the DC lock-in signal from two AC-in-signals
%input: in1: input signal 1
%       in2: input signal 2, both can be noisy, must be the same length 
%       in3: input signal 3
%       in4: input signal 4
%       in5: input signal 5
%       in6: input signal 6
%       BFlistpart: contains the best frequencies of the channels in Hz
%       sfreq: sampling frequency in Hz
%       integration_constant: time window for the cross-correlation, unit s
%output: out: DC output signal
%        out_sfreq: output sampling frequency
% Tim Jürgens, June 2011

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
% in1 = in1 - mean(in1);
% in2 = in2 - mean(in2);
% in3 = in3 - mean(in3);
% in4 = in4 - mean(in4);
% in5 = in5 - mean(in5);
% in6 = in6 - mean(in6);

%slice signal according to integration_constant
out_sfreq = 1/integration_constant;
integration_constant_in_samples = round(integration_constant*sfreq);
outlength_in_samples = floor(length(in2)/integration_constant_in_samples);


for iCounter = 1:outlength_in_samples
    tmpin1 = in1((iCounter-1)*integration_constant_in_samples+1:iCounter*integration_constant_in_samples);
    tmpin2 = in2((iCounter-1)*integration_constant_in_samples+1:iCounter*integration_constant_in_samples);
    tmpin3 = in3((iCounter-1)*integration_constant_in_samples+1:iCounter*integration_constant_in_samples);
    tmpin4 = in4((iCounter-1)*integration_constant_in_samples+1:iCounter*integration_constant_in_samples);
    tmpin5 = in5((iCounter-1)*integration_constant_in_samples+1:iCounter*integration_constant_in_samples);
    tmpin6 = in6((iCounter-1)*integration_constant_in_samples+1:iCounter*integration_constant_in_samples);
    
    %here:something like spontaneous rate should limit the process!
    spontaneousrate = 30;
    tmpin1(tmpin1<spontaneousrate) = 0;
    tmpin2(tmpin2<spontaneousrate) = 0;
    tmpin3(tmpin3<spontaneousrate) = 0;
    tmpin4(tmpin4<spontaneousrate) = 0;
    tmpin5(tmpin5<spontaneousrate) = 0;
    tmpin6(tmpin6<spontaneousrate) = 0;
%     if max(tmpin1) < spontaneousrate
%         tmpin1 = zeros(1,length(tmpin1));
%     end
%     if max(tmpin2) < spontaneousrate
%         tmpin2 = zeros(1,length(tmpin2));
%     end
%     if max(tmpin3) < spontaneousrate
%         tmpin3 = zeros(1,length(tmpin3));
%     end
%     if max(tmpin4) < spontaneousrate
%         tmpin4 = zeros(1,length(tmpin4));
%     end
%     if max(tmpin5) < spontaneousrate
%         tmpin5 = zeros(1,length(tmpin5));
%     end
%     if max(tmpin6) < spontaneousrate
%         tmpin6 = zeros(1,length(tmpin6));
%     end
    %normalize to 1, takes rate information out!
    tmpin1 = tmpin1./max([max(tmpin1) 20]);
    tmpin2 = tmpin2./max([max(tmpin2) 20]);
    tmpin3 = tmpin3./max([max(tmpin3) 20]);
    tmpin4 = tmpin4./max([max(tmpin4) 20]);
    tmpin5 = tmpin5./max([max(tmpin5) 20]);
    tmpin6 = tmpin6./max([max(tmpin6) 20]);
    
    %extract main frequency    
    %[~,index] = max(abs(fft(tmpin1))); %extract main frequency from channel in1
    %main_freq = max([1 index-1])*sfreq/length(tmpin1); %main frequency from channel in Hz (because the first entry is 0 Hz)
    
    
    %extract the phase between the two signals using the shift of the maximum of
    %the cross-correlation function
%     [~,index] = max(xcorr(tmpin1,tmpin2));
%     phase = 2*pi*(length(tmpin1)-index)*main_freq/sfreq; %lenght(in1) is the middle index of the CCF
%     if phase < 0 %then exchange tmpin1 by tmpin2
%         tmp = tmpin1;
%         tmpin1 = tmpin2;
%         tmpin2 = tmp;
%         phase = phase*(-1);
%         clear tmp
%     end
    
    % phase-shift: it is assumed to be 0.03*pi from one of the 178 channels
    %               to the next -> learned
    phase = 0.03*pi;
    phase_shift_samples(1) = round(phase/2/pi/BFlistpart(1)*sfreq);
    phase_shift_samples(2) = round(phase/2/pi/BFlistpart(2)*sfreq);
    phase_shift_samples(3) = round(phase/2/pi/BFlistpart(3)*sfreq);
    phase_shift_samples(4) = round(phase/2/pi/BFlistpart(4)*sfreq);
    phase_shift_samples(5) = round(phase/2/pi/BFlistpart(5)*sfreq);
    
%     if sum(phase_shift_samples) == 0
%         ;
%     else
        tmpin6 = tmpin6(1:end-sum(phase_shift_samples));
        tmpin5 = tmpin5(phase_shift_samples(5)+1:end-sum(phase_shift_samples(1:4)));
        tmpin4 = tmpin4(sum(phase_shift_samples(4:5))+1:end-sum(phase_shift_samples(1:3)));
        tmpin3 = tmpin3(sum(phase_shift_samples(3:5))+1:end-sum(phase_shift_samples(1:2)));
        tmpin2 = tmpin2(sum(phase_shift_samples(2:5))+1:end-sum(phase_shift_samples(1)));
        tmpin1 = tmpin1(sum(phase_shift_samples)+1:end);
    %end
    
    
           
    %slice-wise calculation of cross-correlation between all in
    
    %out(iCounter) = sfreq/length(tmpin1) * ...
     %   sum(tmpin1.*tmpin2.*tmpin3.*tmpin4.*tmpin5.*tmpin6);
    
    %out(iCounter) = ...%sfreq/length(tmpin1) * ...
    %    sum(tmpin1+tmpin2+tmpin3+tmpin4+tmpin5+tmpin6);
    
    outtmp = tmpin1+tmpin2+tmpin3+tmpin4+tmpin5+tmpin6;
    %for jCounter = 1:length(outtmp)
        outtmp(outtmp<2) = 0;
        out(iCounter) = sum(outtmp);
    %end
    
end
