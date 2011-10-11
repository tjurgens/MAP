File = dir('*.wav');
nFiles = length(File);
gesamtsignal = 0;
for i = 1:5
    [actual_signal, sfreq] = wavread(File(14*i-5).name);
    actual_signal = cutsignal(actual_signal,sfreq,'a_a');
    fadedsignal = soft_onset(actual_signal,sfreq,0.05);
    gesamtsignal = [gesamtsignal,fadedsignal']; 
end
rms_ollo = rms(gesamtsignal);
[ollo_freq,ollo_spec] = fourier_analyse(gesamtsignal,sfreq,'r');