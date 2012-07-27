%test old hearing aid
clear all, close all;  clc;
cd('c:\MAP\BioAid\extras\Matlab');
testoldhearingaid;
old = y;

%test new hearing aid
cd('c:\MAP\BioAid\extras\Matlab');
myDEMO_1_Mono_speech;
new = y;

%plot the results
figure, subplot(2,1,1), plot(old), hold on, plot(new,'r')
legend('old','new')
title('Old and New');

%% plot the difference
subplot(2,1,2), plot(abs(old-new));
title('Difference');

%% sound
soundsc([x; old; new],sr);