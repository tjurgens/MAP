%testZCPA
%paths
%addpath(['..' filesep 'wavFileStore']);
addpath(['..' filesep 'MAP']);


%load a wavfile
fileName = '../wavFileStore/new-da-44khz.wav';
[signal,sfreq] = wavread(fileName);

%set level
level4MAP = 70; %level in dB SPL
signal = signal./sqrt(mean(signal.^2)).*10^(-(94-level4MAP)/20);

MAP1_14(signal,sfreq,-1,'Normal','probability',{''});
global DRNLoutput savedBFlist

%parameters for ZCPA
params.compression = 'log';%'none';%'log';%'none';
params.BFlist = savedBFlist;
params.hop_size_msec = 10;
params.numfreqbins = 47;
method.plotGraphs = 0;
method.dt = 1/sfreq;
method.subPlotNo = 3;
method.numPlots = 1;
method.figureNo = 56;

[zcpa,zcpa_bincenter] = ZCPA(DRNLoutput,method,params);

