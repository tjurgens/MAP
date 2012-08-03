%check old and new hearing aid in terms of time course on sinusoidal
%signals

freq = 1000;
sr = 44100;
t = 0:1/44100:.25;
sinsignal = sin(2*pi*freq.*t)*.001;
sinsignal = [zeros(1,1500) sinsignal];

%test old hearing aid
%clear all, close all;  clc;
cd('c:\MAP\BioAid\extras\Matlab');
paramChanges = {'inputStimulusParams.useAid = 1;'};
 MAPparamsName = 'OHCloss4g';
 
tic
cd('c:\MAP\multiThreshold 1.46');
    y = callEssexAid(sinsignal',MAPparamsName,sr,paramChanges);
toc
old = y;

%test new hearing aid
%cd('c:\MAP\BioAid\extras\Matlab');
%[ UNIQUEpars, SHAREDpars ] = getOHCloss4gParams();%getDefaultParams();
%SHAREDpars.SampleRate = sr;

tic
%y = bioaid( sinsignal', UNIQUEpars, SHAREDpars);
y = callBioAid(sinsignal,MAPparamsName,sr,paramChanges);
toc
new = y;

%plot the results
figure, subplot(3,1,1), plot(old), 
title('Old');
subplot(3,1,2), plot(new),
title('New');

%% plot the difference
subplot(3,1,3), plot(abs(old-new));
title('Difference');

%% sound
%soundsc([x; old; new],sr);