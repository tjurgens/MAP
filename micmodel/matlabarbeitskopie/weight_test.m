% dieses script soll testweise die aus der gfb direkt herauskommenden
% VOR-IR RMS-sen und für einen sprecher alle aufsummieren.
% daraus ergibt sich eine hüllkurve, die angibt wo der hauptteil der 
% informationsfläche liegt.

File = dir('*.wav');
nFiles = length(File)

for i = 1:nFiles
    i
    [signal,fs] = wavread(File(i).name);
    x = cutsignal(signal,fs,'g_g');
    
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

    % Indicate progress ("waitbar")
    if ShowWaitBar,
        h = waitbar(0, 'Computing internal representation...');
        waitbar(0,h);
    end

    % calculate center frequencies of gammatone filterbank 
    %[NrFreqChans, CenterFreq, CenterFreq_in_Hz] = GetGammaParam(MinCF, MaxCF, Dens);

    % ----------------------------------------------------------------------
    % actual signal processing
    % ----------------------------------------------------------------------

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   GFB    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    %cd d:\tim\matlab\PEMO\gammatone_filterbank

    analyzer = Gfb_Analyzer_new(fs, lower_cutoff_frequency_hz, ...
                            base_frequency_hz, upper_cutoff_frequency_hz,...
			    filters_per_ERB);
    channels = length(analyzer.center_frequencies_hz);

    if Verbatim,
       disp(['filterbank contains ', num2str(channels), ' filters:']);

      fprintf(1,'%3s|%12s |%15s |%16s\n\n', ...
          '# ', 'f / Hz ', 'normalization', 'coefficient');

      %% display filter parameters of the individual filters: %%
     for channel = 1:channels
         filter = Gfb_Analyzer_get_filter(analyzer, channel);
         fprintf(1,'%3d|%12f |%15e | %f + %fi\n', ...
         channel, analyzer.center_frequencies_hz(channel), ...
         filter.normalization_factor, ...
         real(filter.coefficient), imag(filter.coefficient));
     end
    end
                               
    [x_response, analyzer] = Gfb_Analyzer_process(analyzer, x);
    weighted(i,:) = sum(real(x_response)'.^2);
end