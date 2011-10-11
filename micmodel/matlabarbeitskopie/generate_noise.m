function noise_signal = generate_noise(sfreq,signalLen)
% generates white noise with modulation amplitude [-1:1]
%
% Tim Jürgens, August 2006
%
% usage:    noise_signal = generate_noise(sfreq,signalLen)
%
% input:    sfreq: Sampling Frequency in Hertz
%           signalLen: Signal length in Samples
%
% output:   noise_signal

signal_length = signalLen/sfreq; %signal length in s
t = [0:1/sfreq:signal_length-1/sfreq]; %time vector
noise_signal = 2.*(rand(1,length(t))-0.5);
%plot(t,noise_signal);