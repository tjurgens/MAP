close all; clear all; clc;

[x,sr] = wavread('twister_44kHz'); 

[ UNIQUEpars, SHAREDpars ] = getCWalefttestParams;%getDefaultParams();
SHAREDpars.SampleRate = sr;

tic
y = bioaidm( x, UNIQUEpars, SHAREDpars);
toc

% Plotting from here down
dt=1/sr; 
tAxis = dt:dt:(dt*size(x,1));
figure;  plot(tAxis, x(:,1)); hold on; plot(tAxis, y(:,1),'r')
ylabel('Amplitude'); xlabel ('time'); xlim([0 max(tAxis)])
legend('input', 'output')


soundsc([x; y], sr);