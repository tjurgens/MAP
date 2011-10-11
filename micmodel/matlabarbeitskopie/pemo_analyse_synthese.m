function output = pemo_analyse_synthese(x, fs)

if nargin < 2,
    error('Not enough input arguments.');
end

fsTemp = 1500;
fsIR = 100;         % sample rate of the (downsampled) internal representation in Hz
ShowWaitBar = 0;
Verbatim = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
lower_cutoff_frequency_hz = 100;%70;
upper_cutoff_frequency_hz = 8000;%6700;
base_frequency_hz = 1000;
%sampling_rate_hz = 16276;
%sampling_rate_hz = 44800;
filters_per_ERB = 1.0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% upsampling of input signal to avoid aliasing in upper gammatone filters
if fs < 44100,
	x = resample(x, min([44100, round(1.5*fs)]), fs);
	fs = min([44100, round(1.5*fs)]);
end

analyzer = Gfb_Analyzer_new(fs, lower_cutoff_frequency_hz, ...
                            base_frequency_hz, upper_cutoff_frequency_hz,...
			    filters_per_ERB);
channels = length(analyzer.center_frequencies_hz);

[x_response, analyzer] = Gfb_Analyzer_process(analyzer, x);
x_response = real(x_response);     %taking only real part of the filtered signal

 y_response = zeros(size(x_response,2),channels); %preallocation due to speed
 for FreqChanNr = 1:channels,
     y_response(:,FreqChanNr) = haircell(real(x_response(FreqChanNr,:)'), fs);    % haircell model 
 end
% 
 for FreqChanNr = 1:channels,
     y_response(:,FreqChanNr) = adapt(y_response(:,FreqChanNr), fs,0);     % adaptation loops
 end
 y_response = resample(y_response, fsTemp, fs);
 y_response = resample(y_response, fsIR, fsTemp);
 %up to here: pemo-original
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 y_response = y_response(50:200,:);
 
% %tmp = rehaircell(y_response);
% %y_response = tmp;
% %make a signal that is processable for GFB by multiplying the processed
% %spectrum y_response on a carrier-matrix
 %carrier = GFB_carrier(analyzer, size(y_response,1));
 %max_y_value = max(max(y_response))
 %y_response = y_response./max_y_value*100;
 y_response = resample(y_response,fsTemp,fsIR);
 y_response = resample(y_response,fs,fsTemp);
 y_response = 10.^(y_response./20-5);
 
 y_response = y_response(800:end-800,:);   %cut artefacts due to upsampling
 %noise_signal = generate_noise(fs, size(y_response,1));
pulsetrain = repmat([1,zeros(1,242)],1,250);    %pitch frequency about 99Hz
pulsetrain = pulsetrain(1:size(y_response,1));
%pulsetrain = glottis(100,24e3,0.5,size(y_response,1));
 %pulsetrain_after_GFB = Gfb_Analyzer_process(analyzer, pulsetrain);
 [carrier, analyzer] = Gfb_Analyzer_process(analyzer, pulsetrain);
 %scaling carrier
 %carrier = real(carrier)./max(max(real(carrier)));
 zusammen = y_response.*carrier';
 zusammen = zusammen./max(max(zusammen))*max(max(x_response));
 y_response = zusammen;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SYNTHESE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
desired_delay_in_seconds = 4e-3;   %taking optimal value out of hohmann's GFB paper p.439(4 ms)%mindestens 1/fs;
synthesizer = Gfb_Synthesizer_new(analyzer, desired_delay_in_seconds);
[output, synthesizer] = Gfb_Synthesizer_process(synthesizer, y_response');
