% This skript yields an automatical evaluation of model results
% Attention: You must be in the model directory, respectively to execute this properly
function auswertung_model(model_directory)

%whole_path = ['/net/medisan/home/tim/' model_directory];
whole_path = ['D:\tim\2006-2007\' model_directory];
actualdir = pwd;
cd(whole_path);
cd('daten');
directories = getdir(pwd);
for iCounter = 1:length(directories)
    cd(directories{iCounter});
    subdirectory = getdir(pwd);
    %cd(subdirectory{1});
    
    %load all mat-files
    matfiles = dir('*.mat');
    for jCounter = 1:length(matfiles);
        load(matfiles(jCounter).name);
    end
    s = who;
    zahl_zum_anhaengen =iCounter;

    indexvec = cellfun(@(x) strcmp(x(end-2:end), 'mfb'),s);
    to_rename = {s{indexvec}};                   

    for i = 1:length(to_rename)
       eval([to_rename{i} num2str(zahl_zum_anhaengen) ' = ' to_rename{i} ';']);
       eval(['clear ' to_rename{i} ';']);
    end
    clear s zahl_zum_anhaengen to_rename ans indexvec i;
    cd ..
    %cd ..
    
end


%merging confusion matrices
single_levelCM = who('CM*1'); %take all variables that start with CM and end with 1
for i=1:length(single_levelCM)
    short_single_level_CM{i} = single_levelCM{i}(1:end-1);
    plusstring = single_levelCM{i};
    for iCounter = 2:length(directories)
        plusstring = [plusstring ' + ' short_single_level_CM{i} num2str(iCounter)];
    end
    eval(['BIG_' short_single_level_CM{i} ' = ' plusstring ';']);
end

%taking hitrates
single_levelhitrate = who('hitr*1');
for i=1:length(single_levelhitrate)
    short_single_level_hitrate{i} = single_levelhitrate{i}(1:end-1);
    plusstring_cons = [single_levelhitrate{i} '(15)'];
    for iCounter = 2:length(directories)
        plusstring_cons = [plusstring_cons ' + ' short_single_level_hitrate{i} num2str(iCounter) '(15)'];
    end
    eval(['hitrate_consonants(' num2str(i) ') = (' plusstring_cons ')/' num2str(length(directories)) ';']);
    
    plusstring_vows = [single_levelhitrate{i} '(16)'];
    for iCounter = 2:length(directories)
        plusstring_vows = [plusstring_vows ' + ' short_single_level_hitrate{i} num2str(iCounter) '(16)'];
    end
    eval(['hitrate_vowels(' num2str(i) ') = (' plusstring_vows ')/' num2str(length(directories)) ';']);
    
    plusstring_mean = [single_levelhitrate{i} '(14)'];
    for iCounter = 2:length(directories)
        plusstring_mean = [plusstring_mean ' + ' short_single_level_hitrate{i} num2str(iCounter) '(14)'];
    end
    eval(['hitrate_mean(' num2str(i) ') = (' plusstring_mean ')/' num2str(length(directories)) ';']);
end

bigCMs = who('BIG*');
for i = 1:length(bigCMs)
    eval(['[cons' bigCMs{i} ' ,vows' bigCMs{i} '] = makePCM(' bigCMs{i} ');']);
end

%matlabdir = '/net/medisan/home/tim/matlab';
matlabdir = 'D:\tim\matlab\';
act_dir = pwd;
cd(matlabdir);
conphon = load('phonemestring_consonants.mat');
vowphon = load('phonemestring_vowels.mat');
cd(act_dir);
cd ..
cd('auswertung');


consCMs = who('cons*');
vowsCMs = who('vows*');
for i = 1:length(bigCMs)
    cm_filename = ['consCMspeech' bigCMs{i}(14:15) 'noise' bigCMs{i}(22:23) 'dB.html'];
    eval(['printhtmlconfmat(' consCMs{i} './50,conphon.phonemestring,cm_filename);']);
    cm_filename = ['vowsCMspeech' bigCMs{i}(14:15) 'noise' bigCMs{i}(22:23) 'dB.html'];
    eval(['printhtmlconfmat(' vowsCMs{i} './80,vowphon.phonemestring,cm_filename);']);
end


 for i = 1:length(single_levelhitrate)
     if ~isempty(str2num(single_levelhitrate{i}(16)))
         level(i) = str2num(single_levelhitrate{i}(15:16));
     else
         level(i) = str2num(single_levelhitrate{i}(15));
     end
 end
 snr = 20:-5:-15;
level = snr;
%level = 0:5:30;
f1 = figure, plot(level,hitrate_vowels.*100,'ro');
hold on, plot(level,hitrate_mean.*100, 'k+');
hold on, plot(level,hitrate_consonants.*100,'g.')
xlabel = 'Level (dB)';
ylabel = 'Recognition Rate (%)'
saveas(f1,'psy.fig','fig');
save alldata.mat
cd(actualdir)

% BIG_CM_speech0_noisenobackgroundnoise = CM_speech0_noisenobackgroundnoise_normal_auswahl_mfb1 + CM_speech0_noisenobackgroundnoise_normal_auswahl_mfb2 + CM_speech0_noisenobackgroundnoise_normal_auswahl_mfb3 + CM_speech0_noisenobackgroundnoise_normal_auswahl_mfb4 + CM_speech0_noisenobackgroundnoise_normal_auswahl_mfb5 + CM_speech0_noisenobackgroundnoise_normal_auswahl_mfb6 + CM_speech0_noisenobackgroundnoise_normal_auswahl_mfb7 + CM_speech0_noisenobackgroundnoise_normal_auswahl_mfb8 +CM_speech0_noisenobackgroundnoise_normal_auswahl_mfb9 + CM_speech0_noisenobackgroundnoise_normal_auswahl_mfb10
% BIG_CM_speech5_noisenobackgroundnoise = CM_speech5_noisenobackgroundnoise_normal_auswahl_mfb1 + CM_speech5_noisenobackgroundnoise_normal_auswahl_mfb2 + CM_speech5_noisenobackgroundnoise_normal_auswahl_mfb3 + CM_speech5_noisenobackgroundnoise_normal_auswahl_mfb4 + CM_speech5_noisenobackgroundnoise_normal_auswahl_mfb5 + CM_speech5_noisenobackgroundnoise_normal_auswahl_mfb6 + CM_speech5_noisenobackgroundnoise_normal_auswahl_mfb7 + CM_speech5_noisenobackgroundnoise_normal_auswahl_mfb8 +CM_speech5_noisenobackgroundnoise_normal_auswahl_mfb9 + CM_speech5_noisenobackgroundnoise_normal_auswahl_mfb10
% BIG_CM_speech10_noisenobackgroundnoise = CM_speech10_noisenobackgroundnoise_normal_auswahl_mfb1 + CM_speech10_noisenobackgroundnoise_normal_auswahl_mfb2 + CM_speech10_noisenobackgroundnoise_normal_auswahl_mfb3 + CM_speech10_noisenobackgroundnoise_normal_auswahl_mfb4 + CM_speech10_noisenobackgroundnoise_normal_auswahl_mfb5 + CM_speech10_noisenobackgroundnoise_normal_auswahl_mfb6 + CM_speech10_noisenobackgroundnoise_normal_auswahl_mfb7 + CM_speech10_noisenobackgroundnoise_normal_auswahl_mfb8 +CM_speech10_noisenobackgroundnoise_normal_auswahl_mfb9 + CM_speech10_noisenobackgroundnoise_normal_auswahl_mfb10
% BIG_CM_speech15_noisenobackgroundnoise = CM_speech15_noisenobackgroundnoise_normal_auswahl_mfb1 + CM_speech15_noisenobackgroundnoise_normal_auswahl_mfb2 + CM_speech15_noisenobackgroundnoise_normal_auswahl_mfb3 + CM_speech15_noisenobackgroundnoise_normal_auswahl_mfb4 + CM_speech15_noisenobackgroundnoise_normal_auswahl_mfb5 + CM_speech15_noisenobackgroundnoise_normal_auswahl_mfb6 + CM_speech15_noisenobackgroundnoise_normal_auswahl_mfb7 + CM_speech15_noisenobackgroundnoise_normal_auswahl_mfb8 +CM_speech15_noisenobackgroundnoise_normal_auswahl_mfb9 + CM_speech15_noisenobackgroundnoise_normal_auswahl_mfb10
% BIG_CM_speech20_noisenobackgroundnoise = CM_speech20_noisenobackgroundnoise_normal_auswahl_mfb1 + CM_speech20_noisenobackgroundnoise_normal_auswahl_mfb2 + CM_speech20_noisenobackgroundnoise_normal_auswahl_mfb3 + CM_speech20_noisenobackgroundnoise_normal_auswahl_mfb4 + CM_speech20_noisenobackgroundnoise_normal_auswahl_mfb5 + CM_speech20_noisenobackgroundnoise_normal_auswahl_mfb6 + CM_speech20_noisenobackgroundnoise_normal_auswahl_mfb7 + CM_speech20_noisenobackgroundnoise_normal_auswahl_mfb8 +CM_speech20_noisenobackgroundnoise_normal_auswahl_mfb9 + CM_speech20_noisenobackgroundnoise_normal_auswahl_mfb10
% BIG_CM_speech25_noisenobackgroundnoise = CM_speech25_noisenobackgroundnoise_normal_auswahl_mfb1 + CM_speech25_noisenobackgroundnoise_normal_auswahl_mfb2 + CM_speech25_noisenobackgroundnoise_normal_auswahl_mfb3 + CM_speech25_noisenobackgroundnoise_normal_auswahl_mfb4 + CM_speech25_noisenobackgroundnoise_normal_auswahl_mfb5 + CM_speech25_noisenobackgroundnoise_normal_auswahl_mfb6 + CM_speech25_noisenobackgroundnoise_normal_auswahl_mfb7 + CM_speech25_noisenobackgroundnoise_normal_auswahl_mfb8 +CM_speech25_noisenobackgroundnoise_normal_auswahl_mfb9 + CM_speech25_noisenobackgroundnoise_normal_auswahl_mfb10
% % BIG_CM_speech60_noise45 = CM_speech60_noise45_normal_auswahl_mfb1 + CM_speech60_noise45_normal_auswahl_mfb2 + CM_speech60_noise45_normal_auswahl_mfb3 + CM_speech60_noise45_normal_auswahl_mfb4 + CM_speech60_noise45_normal_auswahl_mfb5 + CM_speech60_noise45_normal_auswahl_mfb6 + CM_speech60_noise45_normal_auswahl_mfb7 + CM_speech60_noise45_normal_auswahl_mfb8 +CM_speech60_noise45_normal_auswahl_mfb9 + CM_speech60_noise45_normal_auswahl_mfb10
% % BIG_CM_speech60_noise40 = CM_speech60_noise40_normal_auswahl_mfb1 + CM_speech60_noise40_normal_auswahl_mfb2 + CM_speech60_noise40_normal_auswahl_mfb3 + CM_speech60_noise40_normal_auswahl_mfb4 + CM_speech60_noise40_normal_auswahl_mfb5 + CM_speech60_noise40_normal_auswahl_mfb6 + CM_speech60_noise40_normal_auswahl_mfb7 + CM_speech60_noise40_normal_auswahl_mfb8 +CM_speech60_noise40_normal_auswahl_mfb9 + CM_speech60_noise40_normal_auswahl_mfb10
% 
% % [consonantCM_speech60_noise40,vowelCM_speech60_noise40] = makePCM(BIG_CM_speech60_noise40)
% % [consonantCM_speech60_noise45,vowelCM_speech60_noise45] = makePCM(BIG_CM_speech60_noise45)
% [consonantCM_speech0_noisenobackgroundnoise,vowelCM_speech0_noisenobackgroundnoise] = makePCM(BIG_CM_speech0_noisenobackgroundnoise)
% [consonantCM_speech5_noisenobackgroundnoise,vowelCM_speech5_noisenobackgroundnoise] = makePCM(BIG_CM_speech5_noisenobackgroundnoise)
% [consonantCM_speech10_noisenobackgroundnoise,vowelCM_speech10_noisenobackgroundnoise] = makePCM(BIG_CM_speech10_noisenobackgroundnoise)
% [consonantCM_speech15_noisenobackgroundnoise,vowelCM_speech15_noisenobackgroundnoise] = makePCM(BIG_CM_speech15_noisenobackgroundnoise)
% [consonantCM_speech20_noisenobackgroundnoise,vowelCM_speech20_noisenobackgroundnoise] = makePCM(BIG_CM_speech20_noisenobackgroundnoise)
% [consonantCM_speech25_noisenobackgroundnoise,vowelCM_speech25_noisenobackgroundnoise] = makePCM(BIG_CM_speech25_noisenobackgroundnoise)
% 
% %%VORSICHT: Du musst dafür im richtigen Verzeichnis sein, sonst wird
% %%unwiederbringlich überschrieben!!!
% 
% printhtmlconfmat(vowelCM_speech0_noisenobackgroundnoise./80,phonemestring,'vowel_speech0_noisenobackgroundnoise.html')
% printhtmlconfmat(vowelCM_speech10_noisenobackgroundnoise./80,phonemestring,'vowel_speech10_noisenobackgroundnoise.html')
% printhtmlconfmat(vowelCM_speech5_noisenobackgroundnoise./80,phonemestring,'vowel_speech5_noisenobackgroundnoise.html')
% printhtmlconfmat(vowelCM_speech15_noisenobackgroundnoise./80,phonemestring,'vowel_speech15_noisenobackgroundnoise.html')
% printhtmlconfmat(vowelCM_speech20_noisenobackgroundnoise./80,phonemestring,'vowel_speech20_noisenobackgroundnoise.html')
% printhtmlconfmat(vowelCM_speech25_noisenobackgroundnoise./80,phonemestring,'vowel_speech25_noisenobackgroundnoise.html')
% 
% 
% printhtmlconfmat(consonantCM_speech0_noisenobackgroundnoise./50,phonemestring,'consonant_speech0_noisenobackgroundnoise.html')
% printhtmlconfmat(consonantCM_speech5_noisenobackgroundnoise./50,phonemestring,'consonant_speech5_noisenobackgroundnoise.html')
% printhtmlconfmat(consonantCM_speech10_noisenobackgroundnoise./50,phonemestring,'consonant_speech10_noisenobackgroundnoise.html')
% printhtmlconfmat(consonantCM_speech15_noisenobackgroundnoise./50,phonemestring,'consonant_speech15_noisenobackgroundnoise.html')
% printhtmlconfmat(consonantCM_speech20_noisenobackgroundnoise./50,phonemestring,'consonant_speech20_noisenobackgroundnoise.html')
% printhtmlconfmat(consonantCM_speech25_noisenobackgroundnoise./50,phonemestring,'consonant_speech25_noisenobackgroundnoise.html')
% % printhtmlconfmat(consonantCM_speech60_noise45./50,phonemestring,'consonant_speech60_noise45.html')
% % printhtmlconfmat(consonantCM_speech60_noise40./50,phonemestring,'consonant_speech60_noise40.html')

% hitrate_consonants = [(hitrate_speech60_noise65_normal_auswahl_mfb1(15)+hitrate_speech60_noise65_normal_auswahl_mfb2(15)+hitrate_speech60_noise65_normal_auswahl_mfb3(15)+hitrate_speech60_noise65_normal_auswahl_mfb4(15)+hitrate_speech60_noise65_normal_auswahl_mfb5(15)+hitrate_speech60_noise65_normal_auswahl_mfb6(15)+hitrate_speech60_noise65_normal_auswahl_mfb7(15)+hitrate_speech60_noise65_normal_auswahl_mfb8(15)+hitrate_speech60_noise65_normal_auswahl_mfb9(15)+hitrate_speech60_noise65_normal_auswahl_mfb10(15))/10];
% hitrate_consonants = [hitrate_consonants (hitrate_speech60_noise70_normal_auswahl_mfb1(15)+hitrate_speech60_noise70_normal_auswahl_mfb2(15)+hitrate_speech60_noise70_normal_auswahl_mfb3(15)+hitrate_speech60_noise70_normal_auswahl_mfb4(15)+hitrate_speech60_noise70_normal_auswahl_mfb5(15)+hitrate_speech60_noise70_normal_auswahl_mfb6(15)+hitrate_speech60_noise70_normal_auswahl_mfb7(15)+hitrate_speech60_noise70_normal_auswahl_mfb8(15)+hitrate_speech60_noise70_normal_auswahl_mfb9(15)+hitrate_speech60_noise70_normal_auswahl_mfb10(15))/10];
% hitrate_consonants = [hitrate_consonants (hitrate_speech60_noise75_normal_auswahl_mfb1(15)+hitrate_speech60_noise75_normal_auswahl_mfb2(15)+hitrate_speech60_noise75_normal_auswahl_mfb3(15)+hitrate_speech60_noise75_normal_auswahl_mfb4(15)+hitrate_speech60_noise75_normal_auswahl_mfb5(15)+hitrate_speech60_noise75_normal_auswahl_mfb6(15)+hitrate_speech60_noise75_normal_auswahl_mfb7(15)+hitrate_speech60_noise75_normal_auswahl_mfb8(15)+hitrate_speech60_noise75_normal_auswahl_mfb9(15)+hitrate_speech60_noise75_normal_auswahl_mfb10(15))/10];
% hitrate_consonants = [hitrate_consonants (hitrate_speech60_noise80_normal_auswahl_mfb1(15)+hitrate_speech60_noise80_normal_auswahl_mfb2(15)+hitrate_speech60_noise80_normal_auswahl_mfb3(15)+hitrate_speech60_noise80_normal_auswahl_mfb4(15)+hitrate_speech60_noise80_normal_auswahl_mfb5(15)+hitrate_speech60_noise80_normal_auswahl_mfb6(15)+hitrate_speech60_noise80_normal_auswahl_mfb7(15)+hitrate_speech60_noise80_normal_auswahl_mfb8(15)+hitrate_speech60_noise80_normal_auswahl_mfb9(15)+hitrate_speech60_noise80_normal_auswahl_mfb10(15))/10];
% %hitrate_consonants = [hitrate_consonants (hitrate_speech606_noise65_normal_auswahl_mfb1(15)+hitrate_speech606_noise65_normal_auswahl_mfb2(15)+hitrate_speech606_noise65_normal_auswahl_mfb3(15)+hitrate_speech606_noise65_normal_auswahl_mfb4(15)+hitrate_speech606_noise65_normal_auswahl_mfb5(15)+hitrate_speech606_noise65_normal_auswahl_mfb6(15)+hitrate_speech606_noise65_normal_auswahl_mfb7(15)+hitrate_speech606_noise65_normal_auswahl_mfb8(15)+hitrate_speech606_noise65_normal_auswahl_mfb9(15)+hitrate_speech606_noise65_normal_auswahl_mfb10(15))/10];
% %  hitrate_consonants = [hitrate_consonants (hitrate_speech6060_noise45_normal_auswahl_mfb1(15)+hitrate_speech6060_noise45_normal_auswahl_mfb2(15)+hitrate_speech6060_noise45_normal_auswahl_mfb3(15)+hitrate_speech6060_noise45_normal_auswahl_mfb4(15)+hitrate_speech6060_noise45_normal_auswahl_mfb5(15)+hitrate_speech6060_noise45_normal_auswahl_mfb6(15)+hitrate_speech6060_noise45_normal_auswahl_mfb7(15)+hitrate_speech6060_noise45_normal_auswahl_mfb8(15)+hitrate_speech6060_noise45_normal_auswahl_mfb9(15)+hitrate_speech6060_noise45_normal_auswahl_mfb10(15))/10];
% %  hitrate_consonants = [hitrate_consonants (hitrate_speech6060_noise40_normal_auswahl_mfb1(15)+hitrate_speech6060_noise40_normal_auswahl_mfb2(15)+hitrate_speech6060_noise40_normal_auswahl_mfb3(15)+hitrate_speech6060_noise40_normal_auswahl_mfb4(15)+hitrate_speech6060_noise40_normal_auswahl_mfb5(15)+hitrate_speech6060_noise40_normal_auswahl_mfb6(15)+hitrate_speech6060_noise40_normal_auswahl_mfb7(15)+hitrate_speech6060_noise40_normal_auswahl_mfb8(15)+hitrate_speech6060_noise40_normal_auswahl_mfb9(15)+hitrate_speech6060_noise40_normal_auswahl_mfb10(15))/10];
% 
% hitrate_vowels = [(hitrate_speech60_noise65_normal_auswahl_mfb1(16)+hitrate_speech60_noise65_normal_auswahl_mfb2(16)+hitrate_speech60_noise65_normal_auswahl_mfb3(16)+hitrate_speech60_noise65_normal_auswahl_mfb4(16)+hitrate_speech60_noise65_normal_auswahl_mfb5(16)+hitrate_speech60_noise65_normal_auswahl_mfb6(16)+hitrate_speech60_noise65_normal_auswahl_mfb7(16)+hitrate_speech60_noise65_normal_auswahl_mfb8(16)+hitrate_speech60_noise65_normal_auswahl_mfb9(16)+hitrate_speech60_noise65_normal_auswahl_mfb10(16))/10];
% hitrate_vowels = [hitrate_vowels (hitrate_speech60_noise70_normal_auswahl_mfb1(16)+hitrate_speech60_noise70_normal_auswahl_mfb2(16)+hitrate_speech60_noise70_normal_auswahl_mfb3(16)+hitrate_speech60_noise70_normal_auswahl_mfb4(16)+hitrate_speech60_noise70_normal_auswahl_mfb5(16)+hitrate_speech60_noise70_normal_auswahl_mfb6(16)+hitrate_speech60_noise70_normal_auswahl_mfb7(16)+hitrate_speech60_noise70_normal_auswahl_mfb8(16)+hitrate_speech60_noise70_normal_auswahl_mfb9(16)+hitrate_speech60_noise70_normal_auswahl_mfb10(16))/10];
% hitrate_vowels = [hitrate_vowels (hitrate_speech60_noise75_normal_auswahl_mfb1(16)+hitrate_speech60_noise75_normal_auswahl_mfb2(16)+hitrate_speech60_noise75_normal_auswahl_mfb3(16)+hitrate_speech60_noise75_normal_auswahl_mfb4(16)+hitrate_speech60_noise75_normal_auswahl_mfb5(16)+hitrate_speech60_noise75_normal_auswahl_mfb6(16)+hitrate_speech60_noise75_normal_auswahl_mfb7(16)+hitrate_speech60_noise75_normal_auswahl_mfb8(16)+hitrate_speech60_noise75_normal_auswahl_mfb9(16)+hitrate_speech60_noise75_normal_auswahl_mfb10(16))/10];
% hitrate_vowels = [hitrate_vowels (hitrate_speech60_noise80_normal_auswahl_mfb1(16)+hitrate_speech60_noise80_normal_auswahl_mfb2(16)+hitrate_speech60_noise80_normal_auswahl_mfb3(16)+hitrate_speech60_noise80_normal_auswahl_mfb4(16)+hitrate_speech60_noise80_normal_auswahl_mfb5(16)+hitrate_speech60_noise80_normal_auswahl_mfb6(16)+hitrate_speech60_noise80_normal_auswahl_mfb7(16)+hitrate_speech60_noise80_normal_auswahl_mfb8(16)+hitrate_speech60_noise80_normal_auswahl_mfb9(16)+hitrate_speech60_noise80_normal_auswahl_mfb10(16))/10];
% 
% 
% hitrate_gesamt = [(hitrate_speech60_noise65_normal_auswahl_mfb1(14)+hitrate_speech60_noise65_normal_auswahl_mfb2(14)+hitrate_speech60_noise65_normal_auswahl_mfb3(14)+hitrate_speech60_noise65_normal_auswahl_mfb4(14)+hitrate_speech60_noise65_normal_auswahl_mfb5(14)+hitrate_speech60_noise65_normal_auswahl_mfb6(14)+hitrate_speech60_noise65_normal_auswahl_mfb7(14)+hitrate_speech60_noise65_normal_auswahl_mfb8(14)+hitrate_speech60_noise65_normal_auswahl_mfb9(14)+hitrate_speech60_noise65_normal_auswahl_mfb10(14))/10];
% hitrate_gesamt = [hitrate_gesamt (hitrate_speech60_noise70_normal_auswahl_mfb1(14)+hitrate_speech60_noise70_normal_auswahl_mfb2(14)+hitrate_speech60_noise70_normal_auswahl_mfb3(14)+hitrate_speech60_noise70_normal_auswahl_mfb4(14)+hitrate_speech60_noise70_normal_auswahl_mfb5(14)+hitrate_speech60_noise70_normal_auswahl_mfb6(14)+hitrate_speech60_noise70_normal_auswahl_mfb7(14)+hitrate_speech60_noise70_normal_auswahl_mfb8(14)+hitrate_speech60_noise70_normal_auswahl_mfb9(14)+hitrate_speech60_noise70_normal_auswahl_mfb10(14))/10];
% hitrate_gesamt = [hitrate_gesamt (hitrate_speech60_noise75_normal_auswahl_mfb1(14)+hitrate_speech60_noise75_normal_auswahl_mfb2(14)+hitrate_speech60_noise75_normal_auswahl_mfb3(14)+hitrate_speech60_noise75_normal_auswahl_mfb4(14)+hitrate_speech60_noise75_normal_auswahl_mfb5(14)+hitrate_speech60_noise75_normal_auswahl_mfb6(14)+hitrate_speech60_noise75_normal_auswahl_mfb7(14)+hitrate_speech60_noise75_normal_auswahl_mfb8(14)+hitrate_speech60_noise75_normal_auswahl_mfb9(14)+hitrate_speech60_noise75_normal_auswahl_mfb10(14))/10];
% hitrate_gesamt = [hitrate_gesamt (hitrate_speech60_noise80_normal_auswahl_mfb1(14)+hitrate_speech60_noise80_normal_auswahl_mfb2(14)+hitrate_speech60_noise80_normal_auswahl_mfb3(14)+hitrate_speech60_noise80_normal_auswahl_mfb4(14)+hitrate_speech60_noise80_normal_auswahl_mfb5(14)+hitrate_speech60_noise80_normal_auswahl_mfb6(14)+hitrate_speech60_noise80_normal_auswahl_mfb7(14)+hitrate_speech60_noise80_normal_auswahl_mfb8(14)+hitrate_speech60_noise80_normal_auswahl_mfb9(14)+hitrate_speech60_noise80_normal_auswahl_mfb10(14))/10];
