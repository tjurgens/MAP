%Script for the generation of FTH features for CHiME

%load('/schroedersan/Corpora/CHiME/eval_chime_fhg/dir_struct/chime_filepaths.mat');

%Header for HTK
SHIFT = 10;     % sampling rate of features in [ms] (usually 10 ms)
    byteswap = 1;
    header.sampPeriod = SHIFT*1E4;
    header.sampKind = 9;
    header.nSamples = size(Features,2);     % get number of frames
    header.sampSize = size(Features,1)*4;   % get number of features
    numCoeff = 14; %14 DCT coefficients
    
for iCounter = 1:length(filepaths)
    actualfilepathname = [chime_root(2) filesep filepaths(iCounter)];
    [signal,sampleRate] = wavread(actualfilepathname);
    
    %auditory model
    [ANprobabilityResponse, dt, myBFlist] = MAPwrap(signal, sampleRate, -1, 'Normal', 'probability', '{};');
    
    %speech feature extraction
    ANtiming = fouriertransform_histogram_log(ANprobabilityResponse,sampleRate, myBFlist);
    
    %DCT
    features = cJob.GJB_dct(ANtiming);
    ANfeatures = features(1:numCoeff,:);
    
    %write HTK compatible file with features
     %Features  <= deine Feature Matrix (columns: features, rows: frames)
    

    strOutputFile = ['/schroedersan/tim/chime/features/' filepaths_own(iCounter)];
    % ^^zB (Endung own nicht vergessen)

    write_htk_with_header(ANfeatures,header,strOutputFile,byteswap); 
end