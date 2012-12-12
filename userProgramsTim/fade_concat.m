function out = fade_concat(signal1,signal2,sfreq)
%function that concatenates two signals smoothly by using fading with a
%cosine window of length 50 ms
% Tim Jürgens, Dec 2012

%calculate the number of samples corresponding to 50 ms
fadesamples = 0.05*sfreq;

%calculate the fade window
fadewindow1 = (cos(pi/fadesamples*[0:fadesamples-1])+1)./2;
fadewindow2 = fadewindow1(end:-1:1);

signal1new=[signal1(1:end-fadesamples) signal1(end-fadesamples+1:end).*fadewindow1 zeros(length(signal2)-fadesamples,1)'];
signal2new=[zeros(length(signal1)-fadesamples,1)' signal2(1:fadesamples).*fadewindow2 signal2(fadesamples+1:end)];

out = signal1new+signal2new;

