function trefferquote = olsa_erster_test(testsignalpath,testsignal_name,pcondition,filename_to_save)



matlabpath = 'd:\tim\matlab\';
backnoise1 = load([matlabpath,'icranoise_16k1.mat']);
backnoise2 = load([matlabpath,'icranoise_16k2.mat']);

%%%initialisiere randomisierung
rand('state',sum(100*clock));





%% testsignal einlesen

namevocabularyfile = [testsignalpath,testsignal_name,'.wav'];
[testsignal_raw, sfreq] = wavread(namevocabularyfile);

% gehe auf 16kHz Samplingfrequenz (analog zum Pemo-OLLO)
testsignal_raw = resample(testsignal_raw,16e3,sfreq);
sfreq = 16e3;

% hole samplewerte zum automatischen aufteilen
[init_samp,end_samp,teiler] = fuenfteln(length(testsignal_raw));

% testsignal gemaess pegel skalieren
testsignal_raw = testsignal_raw./rms(testsignal_raw)/db2factor(pcondition.speechlevel);




%% erkennen
satzteil = {'Name','Verb','Zahl','Adjektiv','Substantiv'};
erkanntzaehler = 0;


for i = 1:length(satzteil)
    load(['d:\tim\OlSa\',satzteil{i},'\Internal_Representations\',filename_to_save]);
    
    % teile originalsignal je nach satzteil ein
    switch i
        case 1
            einvoc_raw = testsignal_raw(1:end_samp);
        case 2
            einvoc_raw = testsignal_raw(init_samp:end_samp+teiler);
        case 3
            einvoc_raw = testsignal_raw(init_samp+teiler:end_samp+2*teiler);
        case 4
            einvoc_raw = testsignal_raw(init_samp+2*teiler:end_samp+3*teiler);
        case 5
            einvoc_raw = testsignal_raw(init_samp+3*teiler:end);
    end

    %Stille vorne und hinten anfügen, je nach laenge des vocabulars oder vorne und hinten
    %symmetrisch abschneiden
    laengenanpassung = vocab(1).length-length(einvoc_raw);
    if (laengenanpassung <= 0)
        einvoc_raw = einvoc_raw(1+ceil(abs(laengenanpassung)/2):end-ceil(abs(laengenanpassung)/2));
    elseif (laengenanpassung > 0)
        silence = zeros(1,vocab(1).length-length(einvoc_raw));
        einvoc_raw = [silence(1:ceil(end/2)),einvoc_raw',silence(1:ceil(end/2))]';
    end
    
    % füge hintergrundrauschen hinzu und mache einen soft onset
    backgroundnoise = backnoise1.icranoise_re;
    % set noise level
    backgroundnoise = backgroundnoise./rms(backgroundnoise)/db2factor(pcondition.noiselevel);
    % set initial sample at random for creating random noise.
    backgroundnoise = backgroundnoise(1:length(einvoc_raw));
    einvoc = einvoc_raw + backgroundnoise;
    einvoc = soft_onset(einvoc, sfreq, 0.05); %50 ms fade in für soften onset am anfang
    
    %ab hier hören
    
    hear_thres_noise = masknoise(pcondition.audiogram,length(einvoc),[],sfreq)./1e5;   %HERE SET IN THE AUDIOGRAM
    %1e5 is the factor to come from rainer beutelmanns implementation to pemo-level
    hear_thres_noise = hear_thres_noise(:,1); % take only the left ears threshold simulating noise
    einvoc = hear_thres_noise + einvoc;
    
    %Soundausgabe (optional)
    %%%%%soundsc(einvoc,sfreq);
    
        % PEMO
    IR_einvoc = pemo_mfb_tim(einvoc, sfreq,pcondition.nrmodchan);

    for mod_freq = 1:length(IR_einvoc)
        IR_einvoc{mod_freq} = IR_einvoc{mod_freq}(:,21:end-20);
    end
    
    % cut IR of (white,ol) noise / silence in front
%     for mod_freq = 1:length(IR_einvoc)
%         IR_einvoc{mod_freq} = IR_einvoc{mod_freq}(:,41:end);
%     end
    zeitlaenge = min(cellfun('size',IR_einvoc,2)); %minimal timelength of the modulation frequency layers
    
    % bringe alle modulationsfrequenzlayer auf gleiche zeitlaenge
    for mod_freq = 1:length(IR_einvoc)
        IR_einvoc{mod_freq} = IR_einvoc{mod_freq}(:,1:zeitlaenge);
    end
    
    
    
    
    %%%fürs testsignal%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% füge hintergrundrauschen hinzu und mache einen soft onset
    backgroundnoise = backnoise2.icranoise_re;
    % set noise level
    backgroundnoise = backgroundnoise./rms(backgroundnoise)/db2factor(pcondition.noiselevel);
    % set initial sample at random for creating random noise.
    backgroundnoise = backgroundnoise(1:length(einvoc_raw));
    testsignal = einvoc_raw + backgroundnoise;
    testsignal = soft_onset(testsignal, sfreq, 0.05); %50 ms fade in für soften onset am anfang
    
    %ab hier hören
    hear_thres_noise = masknoise(pcondition.audiogram,length(einvoc),[],sfreq)./1e5;   %HERE SET IN THE AUDIOGRAM
    %1e5 is the factor to come from rainer beutelmanns implementation to pemo-level
    hear_thres_noise = hear_thres_noise(:,1); % take only the left ears threshold simulating noise
    testsignal = hear_thres_noise + testsignal;
    
    %Soundausgabe (optional)
    %%%%%soundsc(einvoc,sfreq);
    
        % PEMO
    IR_testsignal = pemo_mfb_tim(testsignal, sfreq,pcondition.nrmodchan);

    for mod_freq = 1:length(IR_testsignal)
        IR_testsignal{mod_freq} = IR_testsignal{mod_freq}(:,21:end-20);
    end
    
    
    
    % cut IR of (white,ol) noise / silence in front
%     for mod_freq = 1:length(IR_testsignal)
%         IR_testsignal{mod_freq} = IR_testsignal{mod_freq}(:,41:end);
%     end
    zeitlaenge = min(cellfun('size',IR_testsignal,2)); %minimal timelength of the modulation frequency layers
    
    % bringe alle modulationsfrequenzlayer auf gleiche zeitlaenge
    for mod_freq = 1:length(IR_testsignal)
        IR_testsignal{mod_freq} = IR_testsignal{mod_freq}(:,1:zeitlaenge);
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





    %%% zuweisen des richtigen eintrags des "ORIGINALS": FÜR IDENTICAL
    %%% WICHTIG !!!!!!!!!!!!!!!!!!!!!!!!!
    vocab(str2num(testsignal_name(i))+1).IR = IR_einvoc;

    %SICHERHEIT! Sind alle IR gleich lang????
    for secure_i = 1: length(vocab)
        securevector(secure_i) = size(vocab(secure_i).IR{2},2);
    end
    if max(securevector) == min(securevector)
        ;
    else
        disp('Zeitliche Laenge der Vokabulareintraege ist nicht gleich!')
    end
    %%%%%%%%%%%%%%%%%%%%%%%
        
    % determine distance between testsignal and vocabulary-templates
    for j = 1:length(vocab)
        %%%%%DTW%%%%%%
        distance(j) = dynamictimewarp_mfb(vocab(j).IR,IR_testsignal);
    end
    %%%%%distance
    [tmp,recindex]= min(distance);

%    recstring.name = vocab(recindex).name(1:end-4);
    recstring.name = iolsa2solsa(i,recindex-1);
    presentedword = iolsa2solsa(i,str2num(testsignal_name(i))); % i ist auch die Position des gerade bearbeiteten Satzteils
    disp(sprintf('Dargebotenes Wort: %s',presentedword));
    disp(sprintf('Erkanntes Wort: %s\n',recstring.name));
    
    %%%%%%%%%%%%% Trefferquote berechnen %%%%%%%%%%%%%%%%%%%%%%
    
    if strcmp(presentedword,recstring.name)
        erkanntzaehler = erkanntzaehler+1;
    else
        ;
    end
    clear einvoc IR_einvoc
end
trefferquote = erkanntzaehler/length(satzteil);