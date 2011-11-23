function histogram_features(filename,speechlevel)

%this function builds one histogram for each DCT coefficient (amplitude
%values) of a speech feature extraction algorithm

%set paths
if isunix 
    aurorapath = '/scratch/tjurgens/AURORA2_0/TrainingData-Clean/';
    addpath('/scratch/tjurgens/MAP/userProgramsASRforDummies');
    addpath('/scratch/tjurgens/MAP/userProgramsTim');
    addpath('/scratch/tjurgens/MAP/MAP');
else
    aurorapath = 'C:\MAP\MEGAreducedAURORA\TrainingData-Clean\';
    addpath('C:\MAP\userProgramsASRforDummies');
    addpath('C:\MAP\userProgramsTim');
    addpath('C:\MAP\MAP');
end


%level
currentSpeechLevel = speechlevel;

%how many AURORA files
number_of_AURORAfiles = 100;

%model parameters
AN_spikesOrProbability = 'probability';
MAPparameterfile = 'Normal';
MAPparamChanges = '';
numDCTcoeff = 14;

%get the signals
files = dir([aurorapath '*.wav']);
randomizedchoice = randperm(length(files));

%initialize the histogram bins
histogrammatrix = zeros(length(files)*200,numDCTcoeff);
featurecounter = 1;

for iCounter = 1:number_of_AURORAfiles %for each file
    dispstring = sprintf('File No. %i: %s',iCounter,files(randomizedchoice(iCounter)).name);
    disp(dispstring);
    [speech speechSampleRate] = wavread([aurorapath files(randomizedchoice(iCounter)).name]);
    speech = speech./sqrt(mean(speech.^2)); %Normalize RMS to 1
    speech = speech * 20e-6 * 10^(currentSpeechLevel/20); %Convert RMS to pascals at desired level
    
    %cut the silence preceding and subsequently to the utterance
    speech = cutsignal_aurora(speech,speechSampleRate,'a_a');
    
    % here put in YOUR FEATURE EXTRACTION %%%%%%%%
    [ANprobabilityResponse, dt, myBFlist] = MAPwrap(speech, speechSampleRate, -1, MAPparameterfile, AN_spikesOrProbability, MAPparamChanges);
    nChannels = numel(myBFlist);
    ANprobabilityResponse = ANprobabilityResponse(end-nChannels+1:end, :);
    
%     winSize = 25; %default 25 ms window
%     hopSize = 10; %default 10 ms jump between windows
%     winSizeSamples = round(winSize*speechSampleRate/1000);
%     hopSizeSamples = round(hopSize*speechSampleRate/1000);
%     % smooth
%     hann = hanning(winSizeSamples);
%     
%     ANsmooth = [];%Cannot pre-allocate a size as it is unknown until the enframing
%     for chan = 1:size(ANprobabilityResponse,1)
%         f = enframe(ANprobabilityResponse(chan,:), hann, hopSizeSamples);
%         ANsmooth(chan,:) = mean(f,2)'; %#ok<AGROW> see above comment
%     end
    
        
    ANtiming = fouriertransform_histogram_log(ANprobabilityResponse,speechSampleRate, myBFlist);
    features = DCT(ANtiming);%(ANsmooth);
    ANfeatures = features(1:numDCTcoeff,:);
    %%%%%%%%%% end of YOUR FEATURE EXTRACTION %%%%%%%%
    
    %set up a histogram
    for jCounter = 1:size(ANfeatures,2) %for each time step in the internal representation
        histogrammatrix(featurecounter,:) = ANfeatures(:,jCounter);
        featurecounter = featurecounter + 1;
    end
end
histogrammatrix = histogrammatrix(1:featurecounter,:);

close all;
fighandle = figure;
%plot the histograms
for iCounter = 1:size(histogrammatrix,2)
    [histogram(:,iCounter),bincenters] = hist(histogrammatrix(:,iCounter),100);
    subplot(3,5,iCounter), bar(bincenters,histogram(:,iCounter));
    xlabel('Amplitude value');
    ylabel('Frequency of occurence (counts)');
    titlestring = sprintf('DCT coefficient number %i',iCounter);
    title(titlestring);
    box on;
end

saveas(fighandle,filename,'fig');
