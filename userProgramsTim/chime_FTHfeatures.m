function chime_FTHfeatures(startindex,endindex)
%Script for the generation of FTH features for CHiME

load('/schroedersan/Corpora/CHiME/eval_chime_fhg/dir_struct/chime_filepaths.mat');

%paths
addpath('/home/tim/MAP/userProgramsASRforDummies');
addpath('/home/tim/MAP/userProgramsTim');
addpath('/home/tim/MAP/MAP');
addpath('/home/tim/MAP/parameterStore');

%Header for HTK
SHIFT = 10;     % sampling rate of features in [ms] (usually 10 ms)
    byteswap = 1;
    header.sampPeriod = SHIFT*1E4;
    header.sampKind = 9;
    numCoeff = 14; %14 DCT coefficients
    
for iCounter = startindex:endindex %1:length(filepaths)
    
    actualfilepathname = [chime_root{2} filesep filepaths{iCounter}];
    [signal,sampleRate] = wavread(actualfilepathname);
    %take the mean from both channels as monaural signal
    signal = mean(signal,2);
    
    %multiply by two to get about a speech level of 60 dB regardless of SNR
    signal = signal.*2; 
    
    %resample -> this step requires much time and might be unnecessary if I
    %get MAP to produce reasonable output for sfreq = 16000;
    signal = resample_wosigproc(signal,44100,sampleRate); %using a resample function that is
    %not part of the sig proc toolbox (only for upsampling!)
     
    %auditory model
    [ANprobabilityResponse, dt, myBFlist] = MAPwrap(signal, 44100, -1, 'Normal', 'probability', {';'});
    
    %take only HSR fibers
    ANResponse = ANprobabilityResponse(42:end,:);
    
    %speech feature extraction
    ANtiming = fouriertransform_histogram_log(ANResponse,sampleRate, myBFlist);
    
    %DCT
    features = cJob.GJB_dct(ANtiming);
    ANfeatures = features(1:numCoeff,:);
    
    %write HTK compatible file with features
     %Features  <= deine Feature Matrix (columns: features, rows: frames)
    header.nSamples = size(ANfeatures,2);     % get number of frames
    header.sampSize = size(ANfeatures,1)*4;   % get number of features
    strOutputFile = ['/schroedersan/tim/Chime/feat1/' filepaths_own{iCounter}];
    % ^^zB (Endung own nicht vergessen)

    write_htk_with_header(ANfeatures,header,strOutputFile,byteswap); 
   
end