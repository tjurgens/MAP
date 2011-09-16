global OMEParams DRNLParams IHC_cilia_RPParams IHCpreSynapseParams
global AN_IHCsynapseParams MacGregorParams MacGregorMultiParams
global dt ANdt  savedBFlist saveAN_spikesOrProbability saveMAPparamsName...
    savedInputSignal OMEextEarPressure TMoutput OMEoutput ARattenuation ...
    DRNLoutput IHC_cilia_output IHCrestingCiliaCond IHCrestingV...
    IHCoutput ANprobRateOutput ANoutput savePavailable ANtauCas  ...
    CNtauGk CNoutput  ICoutput ICmembraneOutput ICfiberTypeRates ...
    MOCattenuation 

signalCharacteristics.type='tones';
signalCharacteristicssignalCharacteristics.sampleRate=50000;
signalCharacteristics.duration= 0.3;
signalCharacteristics.rampDuration=5;     
signalCharacteristics.beginSilence=0.05;
signalCharacteristics.endSilence=0.05;                  
signalCharacteristics.toneFrequency=1000; 
signalCharacteristics.leveldBSPL=50;

showMapOptions.printModelParameters=0;   % prints all parameters
showMapOptions.showModelOutput=0;       % plot of all stages
showMapOptions.printFiringRates=0;      % prints stage activity levels
showMapOptions.showACF=0;               % shows SACF (probability only)
showMapOptions.showEfferent=0;          % tracks of AR and MOC
showMapOptions.surfProbability=0;       % 2D plot of HSR response 
showMapOptions.surfSpikes=0;            % 2D plot of spikes histogram
showMapOptions.ICrates=0;               % IC rates by CNtauGk

tic
fprintf('\n')
disp('Computing ...')

durations=[20:20:100];
for duration=durations
signalCharacteristics.duration= duration;
% MAPrunner(MAPparamsName, AN_spikesOrProbability, ...
%     signalCharacteristics, paramChanges, showMapOptions)
MAPrunner('Normal', 'spikes', ...
    signalCharacteristics, {}, showMapOptions)
ARmin=min(ARattenuation);
disp([num2str(level) ':' num2str(ARmin)])
end
