function [probmean,frequencies] = generate_tuningcurve(fiberBF,stimuluslevel,MAPparamsName,paramChanges)

addpath('C:\MAP\userProgramsASRforDummies');
addpath('C:\MAP\Aidparameters');
addpath('C:\MAP\MAP');

global ANprobRateOutput

frequencies = round(logspace(log10(100),log10(10000),50));
%frequencies = 1000;
duration = .2;
rampDuration = 1/10*duration;
dt = 1/44100;
t = [dt:dt:duration];
probmean = zeros(1,length(frequencies));

for iCounter = 1:length(frequencies)
    
    %generate sinusoid
    signal  = sin(2*pi*frequencies(iCounter)*t);
    signal = signal./sqrt(mean(signal.^2)).*10^(-(94-stimuluslevel)/20);
    %build ramp
    rampTime=dt:dt:rampDuration;
    ramp=[0.5*(1+cos(2*pi*rampTime/(2*rampDuration)+pi)) ...
        ones(1,length(t)-length(rampTime))];
    signal=signal.*ramp;
    ramp=fliplr(ramp);
    signal=signal.*ramp;
    
    
    %call the aid
    audio = callEssexAid(signal,MAPparamsName,1/dt,paramChanges);
    
    %call MAP
    MAP1_14(audio, 1/dt, fiberBF, MAPparamsName, 'probability', []);
    
    %plot the tuning curve
    %figure, plot(t,ANprobRateOutput(2,:));
    probmean(iCounter) = mean(ANprobRateOutput(2,:),2);
    
end

% figure, semilogx(frequencies,probmean);
% xlabel('stimulus frequency (Hz)');
% ylabel('average firing rate (1/s)');
