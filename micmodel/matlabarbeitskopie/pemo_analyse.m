function pemo_analyse_synthese(x, fs)

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