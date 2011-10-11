clear
pcondition.speechlevel = 60;
pcondition.noiselevel = 70;
pcondition.nrmodchan = 4;
pcondition.audiogram = zeros(11,2);

matlabpath = 'd:\tim\matlab\';
backnoise = load([matlabpath,'icranoise_16k.mat']);

if strcmp(pcondition.noiselevel,'nobackgroundnoise')
    filename_to_save = sprintf('speech%i_noise%s_%s_mfb',pcondition.speechlevel,pcondition.noiselevel,'a_a');
elseif(pcondition.noiselevel < 0)
    tmp = abs(pcondition.noiselevel);
    filename_to_save = sprintf('speech%i_noise_%i_%s_mfb',pcondition.speechlevel,tmp,'a_a');
else
    filename_to_save = sprintf('speech%i_noise%i_%s_mfb',pcondition.speechlevel,pcondition.noiselevel,'a_a');
end


makevocabulary_olsa1(pcondition,filename_to_save);


%% testsignal einlesen
testsignal_name = 'S02M_L010_V6_M1_N1_CS0';
%%%%%testsignal_name = '55025';
namevocabularyfile = ['D:\tim\OlSa\OLLOgegentest\',testsignal_name,'.wav'];
%%%%%namevocabularyfile = ['D:\tim\OlSa\',testsignal_name,'.wav'];
[testsignal_raw, sfreq] = wavread(namevocabularyfile);

% gehe auf 16kHz Samplingfrequenz (analog zum Pemo-OLLO)
testsignal_raw = resample(testsignal_raw,16e3,sfreq);
sfreq = 16e3;

%%%%%[init_samp,end_samp,teiler] = fuenfteln(length(testsignal_raw));

% testsignal gemaess pegel skalieren
testsignal_raw = testsignal_raw./rms(testsignal_raw)/db2factor(pcondition.speechlevel);

t = [0:1/sfreq:0.4-1/sfreq]; %time vector length 0.4s before
silence = zeros(1,length(t));
testsignal = [silence,testsignal_raw']';

% füge hintergrundrauschen hinzu und mache einen soft onset
backgroundnoise = backnoise.icranoise_re;
% set noise level
backgroundnoise = backgroundnoise./rms(backgroundnoise)/db2factor(pcondition.noiselevel);
% set initial sample at random for creating random noise.
in_samp = ceil(500*rand);
backgroundnoise = backgroundnoise(in_samp:length(testsignal)+in_samp-1);
testsignal = testsignal + backgroundnoise;
testsignal = soft_onset(testsignal, sfreq, 0.05); %50 ms fade in für soften onset am anfang

% ab hier hören
hear_thres_noise = masknoise(pcondition.audiogram,length(testsignal),[],sfreq)./1e5;   %HERE SET IN THE AUDIOGRAM
%1e5 is the factor to come from rainer beutelmanns implementation to pemo-level
hear_thres_noise = hear_thres_noise(:,1); % take only the left ears threshold simulating noise
testsignal = hear_thres_noise + testsignal;
% PEMO %
IR_testsignal = pemo_mfb_tim(testsignal, sfreq,pcondition.nrmodchan);

% cut IR of (white,ol) noise / silence in front
for mod_freq = 1:length(IR_testsignal)
    IR_testsignal{mod_freq} = IR_testsignal{mod_freq}(:,41:end);
end
% gleiche Zeitlaenge der Modulationsfrequenzpattern an
zeitlaenge = min(cellfun('size',IR_testsignal,2)); %minimal timelength of the modulation frequency layers
for mod_freq = 1:length(IR_testsignal)
    IR_testsignal{mod_freq} = IR_testsignal{mod_freq}(:,1:zeitlaenge);
end





%% erkennen
%%%%%satzteil = {'Name','Verb','Zahl','Adjektiv','Substantiv'};
satzteil = {'Name'};


for i = 1:length(satzteil)
    %%%%%load(['d:\tim\OlSa\',satzteil{i},'\Internal_Representations\',filename_to_save]);
    load(['d:\tim\OlSa\OLLOgegentest\',satzteil{i},'\Internal_Representations\',filename_to_save]);
    % teile originalsignal je nach satzteil ein
% % % % %     switch i
% % % % %         case 1
% % % % %             einvoc = testsignal_raw(1:end_samp);
% % % % %         case 2
% % % % %             einvoc = testsignal_raw(init_samp:end_samp+teiler);
% % % % %         case 3
% % % % %             einvoc = testsignal_raw(init_samp+teiler:end_samp+2*teiler);
% % % % %         case 4
% % % % %             einvoc = testsignal_raw(init_samp+2*teiler:end_samp+3*teiler);
% % % % %         case 5
% % % % %             einvoc = testsignal_raw(init_samp+3*teiler:end);
% % % % %     end
einvoc = testsignal_raw;    

    %Stille voran, je nach laenge des vocabulars oder vorne und hinten
    %symmetrisch abschneiden
    laengenanpassung = vocab(1).length-length(einvoc);
    if (laengenanpassung <= 0)
        einvoc = einvoc(1+ceil(abs(laengenanpassung)/2):end-ceil(abs(laengenanpassung)/2));
    elseif (laengenanpassung > 0)
        silence = zeros(1,vocab(1).length-length(einvoc));
        einvoc = [silence,einvoc']';
    end
    
    % füge hintergrundrauschen hinzu und mache einen soft onset
    backgroundnoise = backnoise.icranoise_re;
    % set noise level
    backgroundnoise = backgroundnoise./rms(backgroundnoise)/db2factor(pcondition.noiselevel);
    % set initial sample at random for creating random noise.
    in_samp = ceil(500*rand);
    backgroundnoise = backgroundnoise(in_samp:length(einvoc)+in_samp-1);
    einvoc = einvoc + backgroundnoise;
    einvoc = soft_onset(einvoc, sfreq, 0.05); %50 ms fade in für soften onset am anfang
    
    %ab hier hören
    hear_thres_noise = masknoise(pcondition.audiogram,length(einvoc),[],sfreq)./1e5;   %HERE SET IN THE AUDIOGRAM
    %1e5 is the factor to come from rainer beutelmanns implementation to pemo-level
    hear_thres_noise = hear_thres_noise(:,1); % take only the left ears threshold simulating noise
    einvoc = hear_thres_noise + einvoc;
    
    %Soundausgabe (optional)
    soundsc(einvoc,sfreq);
    
        % PEMO
    IR_einvoc = pemo_mfb_tim(einvoc, sfreq,pcondition.nrmodchan);

    % cut IR of (white,ol) noise / silence in front
    for mod_freq = 1:length(IR_einvoc)
        IR_einvoc{mod_freq} = IR_einvoc{mod_freq}(:,41:end);
    end
    zeitlaenge = min(cellfun('size',IR_einvoc,2)); %minimal timelength of the modulation frequency layers
    
    % bringe alle modulationsfrequenzlayer auf gleiche zeitlaenge
    for mod_freq = 1:length(IR_einvoc)
        IR_einvoc{mod_freq} = IR_einvoc{mod_freq}(:,1:zeitlaenge);
    end

    % zuweisen des richtigen eintrags des "ORIGINALS":
    %%%%%vocab(str2num(testsignal_name(i))+1).IR = IR_einvoc;

    % determine distance between testsignal and vocabulary-templates
    for j = 1:length(vocab)
        %%%%%DTW%%%%%%
        distance(j) = dynamictimewarp_mfb(vocab(j).IR,IR_testsignal);
    end
    distance
    [tmp,recindex]= min(distance);

    recstring.name = vocab(recindex).name(1:end-4);
    disp(sprintf('Erkanntes Wort: %s\n',recstring.name));
    clear einvoc IR_einvoc
end
