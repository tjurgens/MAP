function mix_sig_noise(snr,cdir,zieldir)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% vermischt signal und rauschen im angegebenen snr
% input: snr: signalrauschverhältnis
%        cdir: verzeichnis, in dem quelldateien für signale liegen, muß
%              unterverzeichnis von pwd sein
%        zieldir: zielverzeichnis
% Oktober 2006
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
actualdir = pwd;
cd('d:\tim\matlab');
[icranoise,sfreq_icra] = wavread('icra1.wav');
icranoise = resample(icranoise,16000,sfreq_icra);
if ~isdir(zieldir)
    mkdir(zieldir);
end
cd(actualdir);
cd(cdir);
Files = dir('*.wav');
nFiles = length(Files);
for i = 1:nFiles,
    [signal,sfreq] = wavread(Files(i).name);
    cutted_signal = cutsignal(signal(:,1),sfreq,'a_a');
    speechlevel = factor2level(rms(cutted_signal));
    noiselevel = speechlevel - snr;
    in_samp = ceil(2000*rand)
    noise = icranoise(in_samp:length(signal(:,1))+in_samp-1);
    noise = noise./rms(noise)/db2factor(noiselevel);
    noise = soft_onset(noise',16000,0.05);
    mixed = signal(:,1) + noise;
    mixed = repmat(mixed,1,2);
    mixed = resample(mixed,44100,sfreq);
    mixed = mixed./max(max(abs(mixed)))*0.99;
    cd(zieldir);
    wavwrite(mixed,44100,Files(i).name);
    cd(actualdir);
    cd(cdir);
end
cd(actualdir);
