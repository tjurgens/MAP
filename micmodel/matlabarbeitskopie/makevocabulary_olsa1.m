function makevocabulary_olsa1(pcondition,filename_to_save)

matlabpath = 'd:\tim\matlab\';
backnoise = load([matlabpath,'icranoise_16k.mat']);




%% vocabular einlesen

satzteil = {'Name'};
%%%%%satzteil = {'Name','Verb','Zahl','Adjektiv','Substantiv'};

for k = 1:length(satzteil)
%%%%%cd(['D:\tim\OlSa\' satzteil{k} '\']);
cd(['D:\tim\OlSa\OLLOgegentest\' satzteil{k} '\']);
if ~isdir('Internal_Representations')      
     mkdir('Internal_Representations');
end
File = dir('*.wav');
nFiles = length(File)


for i = 1:nFiles
    [vocabulary{i}, sfreq] = wavread(File(i).name);
    
    % gehe auf 16kHz Samplingfrequenz (analog zum Pemo-OLLO)
    vocabulary{i} = resample(vocabulary{i},16e3,sfreq);
    sfreq = 16e3;
    
    % skaliere gemaess pegel
    cutted_signal{i} = vocabulary{i}./rms(vocabulary{i})/db2factor(pcondition.speechlevel);

    % setze stille davor
    t = [0:1/sfreq:0.4-1/sfreq]; %time vector length 0.4s
    silence = zeros(1,length(t));
    vocabulary{i} = [silence,cutted_signal{i}']';
end


%%%%%%%%%%%%%%%%%%%%%%%%%%
% equalize vocabulary length to rule out a possible word discrimination
% from individual durations, hänge einfach hearthresnoise dahinter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vocabularymaxlength = max(cellfun('length',vocabulary));
%hear_thres_noise = masknoise(pcondition.audiogram,vocabularymaxlength,[],sfreq)./1e5;
for i = 1:nFiles
    vocabulary{i} = [vocabulary{i}',zeros(vocabularymaxlength-length(vocabulary{i}),1)']';
    % füge hintergrundrauschen hinzu und mache einen soft onset
    backgroundnoise = backnoise.icranoise_re;
    % set noise level
    backgroundnoise = backgroundnoise./rms(backgroundnoise)/db2factor(pcondition.noiselevel);
    % set initial sample at random for creating random noise.
    in_samp = ceil(500*rand);
    backgroundnoise = backgroundnoise(in_samp:length(vocabulary{i})+in_samp-1);
    vocabulary{i} = vocabulary{i} + backgroundnoise;
    
    vocabulary{i} = soft_onset(vocabulary{i}, sfreq, 0.05); %50 ms fade in für soften onset am anfang
end


for i = 1:nFiles
    hear_thres_noise = masknoise(pcondition.audiogram,length(vocabulary{i}),[],sfreq)./1e5;   %HERE SET IN THE AUDIOGRAM
    %1e5 is the factor to come from rainer beutelmanns implementation to pemo-level
    hear_thres_noise = hear_thres_noise(:,1); % take only the left ears threshold simulating noise
    vocabulary{i} = hear_thres_noise + vocabulary{i};
    % PEMO
    IR_vocabulary = pemo_mfb_tim(vocabulary{i}, sfreq,pcondition.nrmodchan);

    % cut IR of (white,ol) noise / silence in front
    for mod_freq = 1:length(IR_vocabulary)
        IR_vocabulary{mod_freq} = IR_vocabulary{mod_freq}(:,41:end);
    end
    zeitlaenge = min(cellfun('size',IR_vocabulary,2)); %minimal timelength of the modulation frequency layers
    for mod_freq = 1:length(IR_vocabulary)
        IR_vocabulary{mod_freq} = IR_vocabulary{mod_freq}(:,1:zeitlaenge);
    end
    vocab(i).number = str2num(File(i).name(1));
    vocab(i).name = File(i).name(2:end);
    vocab(i).IR = IR_vocabulary;
    vocab(i).length = vocabularymaxlength;
end

cd Internal_Representations;
save(filename_to_save,'vocab');
end


% %% VERB %%
% cd('D:\tim\OlSa\Verb\')
% if ~isdir('Internal_Representations')      
%      mkdir('Internal_Representations');
% end
% File = dir('*.wav');
% nFiles = length(File)
% 
% 
% for i = 1:nFiles
%     [vocabulary{i}, sfreq] = wavread(File(i).name);
%     cutted_signal{i} = vocabulary{i}./rms(vocabulary{i})/db2factor(pcondition.speechlevel);
% 
%     t = [0:1/sfreq:0.4-1/sfreq]; %time vector length 0.4s
%     silence = zeros(1,length(t));
%     vocabulary{i} = [silence,cutted_signal{i}']';
% end
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%
% % equalize vocabulary length to rule out a possible word discrimination
% % from individual durations, hänge einfach hearthresnoise dahinter
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% vocabularymaxlength = max(cellfun('length',vocabulary));
% %hear_thres_noise = masknoise(pcondition.audiogram,vocabularymaxlength,[],sfreq)./1e5;
% for i = 1:nFiles
%     vocabulary{i} = [vocabulary{i}',zeros(vocabularymaxlength-length(vocabulary{i}),1)']';
% end
% 
% 
% for i = 1:nFiles
%     hear_thres_noise = masknoise(pcondition.audiogram,length(vocabulary{i}),[],sfreq)./1e5;   %HERE SET IN THE AUDIOGRAM
%     %1e5 is the factor to come from rainer beutelmanns implementation to pemo-level
%     hear_thres_noise = hear_thres_noise(:,1); % take only the left ears threshold simulating noise
%     vocabulary{i} = hear_thres_noise + vocabulary{i};
%     vocabulary{i} = soft_onset(vocabulary{i}, sfreq, 0.05); %50 ms fade in für soften onset am anfang
%     IR_vocabulary = pemo_mfb_tim(vocabulary{i}, sfreq,pcondition.nrmodchan);
% 
%     % cut IR of (white,ol) noise / silence in front
%     for mod_freq = 1:length(IR_vocabulary)
%         IR_vocabulary{mod_freq} = IR_vocabulary{mod_freq}(:,41:end);
%     end
%     zeitlaenge = min(cellfun('size',IR_vocabulary,2)); %minimal timelength of the modulation frequency layers
%     for mod_freq = 1:length(IR_vocabulary)
%         IR_vocabulary{mod_freq} = IR_vocabulary{mod_freq}(:,1:zeitlaenge);
%     end
%     vocab(i).number = str2num(File(i).name(1));
%     vocab(i).name = File(i).name(2:end);
%     vocab(i).IR = IR_vocabulary;
%     vocab(i).length = vocabularymaxlength;
% end
% cd Internal_Representations;
% save('vocabular.mat','vocab');
% 
% 
% %% ZAHL %%
% cd('D:\tim\OlSa\Zahl\')
% if ~isdir('Internal_Representations')      
%      mkdir('Internal_Representations');
% end
% File = dir('*.wav');
% nFiles = length(File)
% 
% for i = 1:nFiles
%     [vocabulary{i}, sfreq] = wavread(File(i).name);
%     cutted_signal{i} = vocabulary{i}./rms(vocabulary{i})/db2factor(pcondition.speechlevel);
% 
%     t = [0:1/sfreq:0.4-1/sfreq]; %time vector length 0.4s
%     silence = zeros(1,length(t));
%     vocabulary{i} = [silence,cutted_signal{i}']';
% end
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%
% % equalize vocabulary length to rule out a possible word discrimination
% % from individual durations, hänge einfach hearthresnoise dahinter
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% vocabularymaxlength = max(cellfun('length',vocabulary));
% %hear_thres_noise = masknoise(pcondition.audiogram,vocabularymaxlength,[],sfreq)./1e5;
% for i = 1:nFiles
%     vocabulary{i} = [vocabulary{i}',zeros(vocabularymaxlength-length(vocabulary{i}),1)']';
% end
% 
% 
% for i = 1:nFiles
%     hear_thres_noise = masknoise(pcondition.audiogram,length(vocabulary{i}),[],sfreq)./1e5;   %HERE SET IN THE AUDIOGRAM
%     %1e5 is the factor to come from rainer beutelmanns implementation to pemo-level
%     hear_thres_noise = hear_thres_noise(:,1); % take only the left ears threshold simulating noise
%     vocabulary{i} = hear_thres_noise + vocabulary{i};
%     vocabulary{i} = soft_onset(vocabulary{i}, sfreq, 0.05); %50 ms fade in für soften onset am anfang
%     IR_vocabulary = pemo_mfb_tim(vocabulary{i}, sfreq,pcondition.nrmodchan);
% 
%     % cut IR of (white,ol) noise / silence in front
%     for mod_freq = 1:length(IR_vocabulary)
%         IR_vocabulary{mod_freq} = IR_vocabulary{mod_freq}(:,41:end);
%     end
%     zeitlaenge = min(cellfun('size',IR_vocabulary,2)); %minimal timelength of the modulation frequency layers
%     for mod_freq = 1:length(IR_vocabulary)
%         IR_vocabulary{mod_freq} = IR_vocabulary{mod_freq}(:,1:zeitlaenge);
%     end
%     vocab(i).number = str2num(File(i).name(1));
%     vocab(i).name = File(i).name(2:end);
%     vocab(i).IR = IR_vocabulary;
%     vocab(i).length = vocabularymaxlength;
% end
% cd Internal_Representations;
% save('vocabular.mat','vocab');
% 
%       
% %% ADJEKTIV %%
% cd('D:\tim\OlSa\Adjektiv\')
% if ~isdir('Internal_Representations')      
%      mkdir('Internal_Representations');
% end
% File = dir('*.wav');
% nFiles = length(File)
% 
% 
% for i = 1:nFiles
%     [vocabulary{i}, sfreq] = wavread(File(i).name);
%     cutted_signal{i} = vocabulary{i}./rms(vocabulary{i})/db2factor(pcondition.speechlevel);
% 
%     t = [0:1/sfreq:0.4-1/sfreq]; %time vector length 0.4s
%     silence = zeros(1,length(t));
%     vocabulary{i} = [silence,cutted_signal{i}']';
% end
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%
% % equalize vocabulary length to rule out a possible word discrimination
% % from individual durations, hänge einfach hearthresnoise dahinter
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% vocabularymaxlength = max(cellfun('length',vocabulary));
% %hear_thres_noise = masknoise(pcondition.audiogram,vocabularymaxlength,[],sfreq)./1e5;
% for i = 1:nFiles
%     vocabulary{i} = [vocabulary{i}',zeros(vocabularymaxlength-length(vocabulary{i}),1)']';
% end
% 
% 
% for i = 1:nFiles
%     hear_thres_noise = masknoise(pcondition.audiogram,length(vocabulary{i}),[],sfreq)./1e5;   %HERE SET IN THE AUDIOGRAM
%     %1e5 is the factor to come from rainer beutelmanns implementation to pemo-level
%     hear_thres_noise = hear_thres_noise(:,1); % take only the left ears threshold simulating noise
%     vocabulary{i} = hear_thres_noise + vocabulary{i};
%     vocabulary{i} = soft_onset(vocabulary{i}, sfreq, 0.05); %50 ms fade in für soften onset am anfang
%     IR_vocabulary = pemo_mfb_tim(vocabulary{i}, sfreq,pcondition.nrmodchan);
% 
%     % cut IR of (white,ol) noise / silence in front
%     for mod_freq = 1:length(IR_vocabulary)
%         IR_vocabulary{mod_freq} = IR_vocabulary{mod_freq}(:,41:end);
%     end
%     zeitlaenge = min(cellfun('size',IR_vocabulary,2)); %minimal timelength of the modulation frequency layers
%     for mod_freq = 1:length(IR_vocabulary)
%         IR_vocabulary{mod_freq} = IR_vocabulary{mod_freq}(:,1:zeitlaenge);
%     end
%     vocab(i).number = str2num(File(i).name(1));
%     vocab(i).name = File(i).name(2:end);
%     vocab(i).IR = IR_vocabulary;
%     vocab(i).length = vocabularymaxlength;
% end
% cd Internal_Representations;
% save('vocabular.mat','vocab');
% 
% 
% %% SUBSTANTIV %%
% cd('D:\tim\OlSa\Substantiv\')
% if ~isdir('Internal_Representations')      
%      mkdir('Internal_Representations');
% end
% File = dir('*.wav');
% nFiles = length(File)
% 
% 
% for i = 1:nFiles
%     [vocabulary{i}, sfreq] = wavread(File(i).name);
%     cutted_signal{i} = vocabulary{i}./rms(vocabulary{i})/db2factor(pcondition.speechlevel);
% 
%     t = [0:1/sfreq:0.4-1/sfreq]; %time vector length 0.4s
%     silence = zeros(1,length(t));
%     vocabulary{i} = [silence,cutted_signal{i}']';
% end
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%
% % equalize vocabulary length to rule out a possible word discrimination
% % from individual durations, hänge einfach hearthresnoise dahinter
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% vocabularymaxlength = max(cellfun('length',vocabulary));
% %hear_thres_noise = masknoise(pcondition.audiogram,vocabularymaxlength,[],sfreq)./1e5;
% for i = 1:nFiles
%     vocabulary{i} = [vocabulary{i}',zeros(vocabularymaxlength-length(vocabulary{i}),1)']';
% end
% 
% 
% for i = 1:nFiles
%     hear_thres_noise = masknoise(pcondition.audiogram,length(vocabulary{i}),[],sfreq)./1e5;   %HERE SET IN THE AUDIOGRAM
%     %1e5 is the factor to come from rainer beutelmanns implementation to pemo-level
%     hear_thres_noise = hear_thres_noise(:,1); % take only the left ears threshold simulating noise
%     vocabulary{i} = hear_thres_noise + vocabulary{i};
%     vocabulary{i} = soft_onset(vocabulary{i}, sfreq, 0.05); %50 ms fade in für soften onset am anfang
%     IR_vocabulary = pemo_mfb_tim(vocabulary{i}, sfreq,pcondition.nrmodchan);
% 
%     % cut IR of (white,ol) noise / silence in front
%     for mod_freq = 1:length(IR_vocabulary)
%         IR_vocabulary{mod_freq} = IR_vocabulary{mod_freq}(:,41:end);
%     end
%     zeitlaenge = min(cellfun('size',IR_vocabulary,2)); %minimal timelength of the modulation frequency layers
%     for mod_freq = 1:length(IR_vocabulary)
%         IR_vocabulary{mod_freq} = IR_vocabulary{mod_freq}(:,1:zeitlaenge);
%     end
%     vocab(i).number = str2num(File(i).name(1));
%     vocab(i).name = File(i).name(2:end);
%     vocab(i).IR = IR_vocabulary;
%     vocab(i).length = vocabularymaxlength;
% end
% cd Internal_Representations;
% save('vocabular.mat','vocab');

