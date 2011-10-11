pcondition.speechlevel = 60;
pcondition.noiselevel = 30;
pcondition.nrmodchan = 4;
pcondition.audiogram = zeros(11,2);


if strcmp(pcondition.noiselevel,'nobackgroundnoise')
    filename_to_save = sprintf('speech%i_noise%s_%s_mfb',pcondition.speechlevel,pcondition.noiselevel,'a_a');
elseif(pcondition.noiselevel < 0)
    tmp = abs(pcondition.noiselevel);
    filename_to_save = sprintf('speech%i_noise_%i_%s_mfb',pcondition.speechlevel,tmp,'a_a');
else
    filename_to_save = sprintf('speech%i_noise%i_%s_mfb',pcondition.speechlevel,pcondition.noiselevel,'a_a');
end

%% ERZEUGE VOKABULAR
%makevocabulary_olsa(pcondition,filename_to_save);
%% ERKENNE WORTE IM SATZ

testsignalpath = 'D:\tim\OlSa\';
cd(testsignalpath)
File = dir('*.wav');
nFiles = length(File);

for iCounter = 1:nFiles
    trefferquote(iCounter) = olsa_erster_test(testsignalpath,File(iCounter).name(1:5),pcondition,filename_to_save);
    iCounter
end
gesamttrefferquote = mean(trefferquote)