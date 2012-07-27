close all; 

[x,sr] = wavread('twister_44kHz'); 

%[ UNIQUEpars, SHAREDpars ] = getOHCloss4g_aidparams();
%SHAREDpars.SampleRate = sr;
 paramChanges = {'inputStimulusParams.useAid = 1;'};
 MAPparamsName = 'OHCloss4g';
 
tic
%y = bioaid( x, UNIQUEpars, SHAREDpars);
cd('c:\MAP\multiThreshold 1.46');
    y = callEssexAid(x,MAPparamsName,sr,paramChanges);
toc

% Plotting from here down
% dt=1/sr; 
% tAxis = dt:dt:(dt*size(x,1));
% figure;  plot(tAxis, x(:,1)); hold on; plot(tAxis, y(:,1),'r')
% ylabel('Amplitude'); xlabel ('time'); xlim([0 max(tAxis)])
% legend('input', 'output')


%soundsc([x; y], sr);