function [BIG_CM, hitrate] = sumup_cm(cdir,pcondition)
%%%%%%%%%%%%%%%%%%%%%%%%%%
%% sums up convolution matrices in subdirectories
%% cdir: current directory of speaker, must be a subdirectory of pwd
%% pcondition: peripheral conditions (speech level ...)
%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5 mal ersetzen für _2 !!!

basedirectory   = [pwd,filesep];
if pcondition.noiselevel == 'nobackgroundnoise'
    filename_voc = sprintf('speech%i_noise%s',pcondition.speechlevel,pcondition.noiselevel);
elseif(pcondition.noiselevel < 0)
    tmp = abs(pcondition.noiselevel);
    filename_voc = sprintf('speech%i_noise_%i',pcondition.speechlevel,tmp);
else
    filename_voc = sprintf('speech%i_noise%i',pcondition.speechlevel,pcondition.noiselevel);
end
directory = getDir(basedirectory);
nr_of_directories = length(directory);
BIG_CM = zeros(150);
fighandle1 = figure;
for i = 1:nr_of_directories,
    curr_file = [basedirectory directory{i} filesep 'normal_auswahl' filesep filename_voc '_' directory{i} '_mfb.mat'];
    if (exist(curr_file,'file') > 0)
        CM = load(curr_file);
        hitrate(i) = sum(diag(CM.CM))/sum(sum(CM.CM));
        BIG_CM = BIG_CM+CM.CM;
    end
end


imagesc(BIG_CM);
set(gca,'FontSize',16);
colormap(abs(gray-1));
xlabel('Recognized No. of Logatome');
ylabel('Presented No. of Logatome');
title(['Confusion Matrix of Speaker ' basedirectory(end-7:end-1)]);
%cd(cdir);
saveas(fighandle1,[filename_voc '_normal_auswahl_mfb.fig']);

close all;
%%%%%%%%%%%%%%%%%%%%%%%
% calculate hitrate
%%%%%%%%%%%%%%%%%%%%%%

hitrate(end+1) = mean(hitrate);
hitrate(end+1) = mean([hitrate(1),hitrate(4),hitrate(7),hitrate(9),hitrate(13)]); %hitrate of VCVs
hitrate(end+1) = mean([hitrate(2),hitrate(3),hitrate(5),hitrate(6),hitrate(8),hitrate(10),hitrate(11),hitrate(12)]); %hitrate of CVCs
%% save variables [conditionsname].mat
CM_filename = ['CM_', filename_voc,'_normal_auswahl_mfb'];
hitrate_filename = ['hitrate_', filename_voc,'_normal_auswahl_mfb'];
save_filename = [filename_voc '_normal_auswahl_mfb.mat']
eval([CM_filename '= BIG_CM;']);
eval([hitrate_filename '= hitrate;']);

save(save_filename,CM_filename,hitrate_filename);

cd ..;