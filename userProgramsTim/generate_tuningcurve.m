function [levelmatrix,frequencies,targetrates] = generate_tuningcurve(fiberBF,MAPparamsName,paramChanges)

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

targetrates = 80:20:240; %68 is spontaneous rate and 240 maximal rate
probmean = zeros(length(frequencies),length(targetrates));
startlevels = 10:10:100; %choose start levels in a reasonable range

for iCounter = 1:length(frequencies)
    iCounter
    
    %target levels
    for jCounter = 1:length(targetrates)
        stimuluslevel = startlevels(jCounter);
        actual_rate = 0;
        while_loop_counter = 0;
        while (abs(actual_rate-targetrates(jCounter))>10) && while_loop_counter < 50 %empirical value that has to be confirmed
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
            %audio = callEssexAid(signal,MAPparamsName,1/dt,paramChanges);
            audio = callBioAid(signal,MAPparamsName,1/dt,paramChanges);
            %audio = signal;
            %call MAP
            MAP1_14(audio, 1/dt, fiberBF, MAPparamsName, 'probability', []);
            
            %plot the tuning curve
            %figure, plot(t,ANprobRateOutput(2,:));
            actual_rate = mean(ANprobRateOutput(2,:),2);
            if (abs(actual_rate-targetrates(jCounter))>10)
                if(actual_rate < targetrates(jCounter)) 
                    stimuluslevel = stimuluslevel+1;
                else
                    stimuluslevel = stimuluslevel-1;
                end
            end
            while_loop_counter = while_loop_counter +1;
        end
        levelmatrix(iCounter,jCounter) = stimuluslevel;
        
    end
    startlevels = levelmatrix(iCounter,:); %startlevels for the next frequency
end

% figure, semilogx(frequencies,probmean);
% xlabel('stimulus frequency (Hz)');
% ylabel('average firing rate (1/s)');
