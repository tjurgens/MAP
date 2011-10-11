function setlevel_speechtest(level,cdir,zieldir)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% vermischt signal und rauschen im angegebenen snr
% input: level: Pegel des Signals
%        cdir: verzeichnis, in dem quelldateien f¸r signale liegen, muﬂ
%              unterverzeichnis von pwd sein
%        zieldir: zielverzeichnis
% Januar/Februar 2007
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
actualdir = pwd;
%cd('d:\tim\matlab');
%[icranoise,sfreq_icra] = wavread('icra1.wav');
%icranoise = resample(icranoise,16000,sfreq_icra);
f_f = [75:8:147]; %alle logatome, die f als auﬂenphonem haben werden gesondert geschnitten
cd(actualdir);
cd(cdir);
Files = dir('*.wav');
nFiles = length(Files);

maxlength = 0;
for i = 1:nFiles,
    %% einlesen
    [allsignals{i},sfreq] = wavread(Files(i).name);   
    templength = length(allsignals{i});
    if templength > maxlength
        maxlength = templength;
    else;
    end
end
for i = 1:nFiles,
    signal = allsignals{i};
    if (find(str2num(Files(i).name(7:9)) == f_f))
        cutted_signal = cutsignal(signal(:,1),sfreq,'f_f');
        1                  %%%%%%% einser-AUSGABE
    else
        cutted_signal = cutsignal(signal(:,1),sfreq,'a_a');
    end
    %% skalierungsfaktor bestimmen
    speechfactor = rms(cutted_signal);
    speechlevel =  factor2level(speechfactor);%meanpeaklevel(cutted_signal);
    %speechfactor = 1/db2factor(speechlevel); only for meanpeaklevel
    
    
    %% signal skalieren
    cutted_signal = cutted_signal./speechfactor;  % bringe signal auf rms = 1;
    cutted_signal = cutted_signal./128;  %abschw‰chung dies ist die Referenz: der Sprachpegel.  -> wird in der kalibrierung auf genau 60 dB SPL gemapped.
    leveldifference = 100-(60-level); %Differenz zum Sprachpegel 60 dB SPL als input f¸r db2factor
    attenuationfactor = db2factor(leveldifference);
    cutted_signal = cutted_signal./attenuationfactor;
    
    %% signale auf gleiche zeitliche l‰nge bringen
    %signal = [signal',zeros(maxlength-length(signal),1)']';
    
    %% rauschen skalieren und randomisieren
    %noiselevel = speechlevel - snr;
%     in_samp = ceil(1.5*16000*rand) % take random initial value from the first 1 and 1/2 seconds of icranoise
%     noise = icranoise(in_samp:length(signal(:,1))+in_samp-1);
%     noise = noise./rms(noise);   %bringe rauschen auf rms = 1;
%     noise = noise./db2factor(100-snr); % skalierung nach jew. snr
%     noise = noise./128;  %abschw‰chung - sollte nicht mehr als 128 betragen!
%     noise = soft_onset(noise',16000,0.05);
%     rms(noise)
%     %% rauschen und signal mischen
    mixed = cutted_signal(:,1);% + noise;
    if (max(abs(mixed)) > 1)
        error('Canceling due to clipping');
    else;
    end
    mixed = repmat(mixed,1,2); %2 channels
    mixed = resample(mixed,44100,sfreq);
    %mixed = mixed./max(max(abs(mixed)))*0.99;
    cd ..
    if ~isdir(zieldir)
       mkdir(zieldir);
    else;
    end
    cd(zieldir);
    wavwrite(mixed,44100,32,Files(i).name); %speichere alles mit 32 bit ab um zu verhindern, daﬂ sich Quantisierungsrauschen bemerkbar macht
    cd(actualdir);
    cd(cdir);
end
cd(actualdir);
