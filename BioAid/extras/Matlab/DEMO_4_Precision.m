close all; clear all; clc;

[x,sr] = wavread('twister_44kHz'); 

[ UNIQUEpars, SHAREDpars ] = getCWalefttestParams();%getCWalefttestParams();%getDefaultParams();
SHAREDpars.SampleRate = sr;

tic; yMEX = bioaid( x, UNIQUEpars, SHAREDpars); toc
tic; yMAT = bioaidm( x, UNIQUEpars, SHAREDpars); toc

%% Plotting from here down
dt=1/sr; 
tAxis = dt:dt:(dt*size(x,1));
figure;  plot(tAxis, yMAT(:,1)); hold on; plot(tAxis, yMEX(:,1),':r')
ylabel('Amplitude'); xlabel ('time'); xlim([0 max(tAxis)])
legend('pure-Matlab', 'mex')


soundsc([x; yMAT; yMEX], sr);