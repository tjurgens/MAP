function sinus_signal = generate_sinus(sinus_freq, sfreq, signalLen)
% generates a normalized sinus signal
%
% Tim Jürgens, August 2006
%
% usage:    sinus_signal = generate_sinus(sinus_freq, sfreq, signalLen)
%
% input:    sinus_freq: Frequency of Sinus in Hertz
%           sfreq: Sampling Frequency in Hertz
%           signalLen: Signal length in Samples
%
% output:   sinus_signal (normalized [-1:1])

signal_length = signalLen/sfreq; %signal length in s
t = [0:1/sfreq:signal_length-1/sfreq];
%sinus frequency in Hz
sinus_amp = 1; %sinus amplitude
sinus_signal = sin(2*pi*sinus_freq*t);
plot(t,sinus_signal);