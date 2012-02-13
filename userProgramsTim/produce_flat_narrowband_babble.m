function outsignal = produce_flat_narrowband_babble(insignal,sfreq)
%function that analyzes insignal with Volker Hohmann's gammatone
%filterbank, low-pass-filters the envelope, divides the signals in the
%respective frequency channels by their envelope and puts the signal back
%together.

addpath('C:\Documents and Settings\tjurgens\My Documents\Dropbox\gammatone\gammatone');

%% Signaleingabe
%[signal, sampling_frequency_hz]=wavread('01521.wav'); 
%S03M_P024_V1_M1_N1_CS0.wav
signal=insignal'; %is now row vector

signallaenge=length(signal);                    
time_axis= 1/sfreq*[0:signallaenge-1];   

% filterbank parameterk

    lower_cutoff_frequency_hz =     80;
    upper_cutoff_frequency_hz =   8000;
    base_frequency_hz         =   1000;
    sampling_rate_hz          =   sfreq; 
    filters_per_ERB           =     1.0;
    desired_delay_in_seconds  =     0.015;
    filter_order              =     4;
    bandwidth_factor          =     1.0;
    nyquist_frequency=0.5*sfreq; %f_Ny=1/2*samp, for lowpass
    cutoff_frequency=16; %cutoff freq. for lowpass [Hz]
    butter_filterorder= 2; % filterorder 
    channel_number=15; % selected filter channel
    
%% initializing of filterbank    

analyzer = Gfb_Analyzer_new(sampling_rate_hz, lower_cutoff_frequency_hz, ...
                            base_frequency_hz, upper_cutoff_frequency_hz,...
			    filters_per_ERB, filter_order, bandwidth_factor);


%% signal analysis
 
[analyzed_signal, analyzer] = Gfb_Analyzer_process(analyzer, signal);

%% Output of gammatone filterbank

%    figure; 
%    plot(time_axis, abs(analyzed_signal(channel_number,:)), ...
%        time_axis, real(analyzed_signal(channel_number,:)), 'm', time_axis, imag(analyzed_signal(channel_number,:)))
%    title('output Filter 15'),
%    axis([0.20, 0.24, -0.06, 0.06])
%   
%% extraction of envelope and lowpass filtering
% filteroutput is already hilbert transformed signal! 

[b,a]=butter(butter_filterorder, cutoff_frequency/nyquist_frequency, 'low');
ENV=filtfilt(b,a, abs(analyzed_signal'));
lowpassed_envelope=ENV'; %is 30xsamples matrix

flat_signal = zeros(30,length(insignal));

for iCounter = 1:size(analyzed_signal,1)
    flat_signal(iCounter,:) = analyzed_signal(iCounter,:)./ ...
        lowpassed_envelope(iCounter,:).*mean(abs(analyzed_signal(iCounter,:)));
end


%% put together filtered carriers and smoothed envelope, resynthesize

%new_signal_whole_sine= sine_carrier.*lowpassed_envelope;
%new_signal_whole_noise=analyzed_noise.*lowpassed_envelope;
%new_signal_whole_normnoise= analyzed_normnoise .*lowpassed_envelope;


%initialize synthesizer
synthesizer = Gfb_Synthesizer_new(analyzer, desired_delay_in_seconds);
delay = synthesizer.delay;
mixer = synthesizer.mixer;
bands = length(mixer.gains);

[resynthesized_signal, synthesizer] = ...
    Gfb_Synthesizer_process(synthesizer, flat_signal);

outsignal = resynthesized_signal;

% synthesizer parameter

% fprintf(1,'%3s|%7s | %22s | %5s\n\n', ...
%         '# ', 'delay ', 'phase factor    ', 'gain / dB');
% for band = 1:bands
%   fprintf(1,'%3d|%7d | %9f + %9fi | %5.2f\n', ...
% 	  band,                            ...
% 	  delay.delays_samples(band),      ...
% 	  real(delay.phase_factors(band)), ...
% 	  imag(delay.phase_factors(band)), ...
% 	  20*log10(mixer.gains(band)));
% end

