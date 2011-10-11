function make_psy_function(cdir)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% derives psychometric function from data in directory 'cdir'
%
% input: cdir: directory name (must be a subdirectory of pwd)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% cd(cdir);
 matfiles = dir('*.mat');
 for i = 1:length(matfiles),
     load(matfiles(i).name);
 end
hitrates = who('hitrate*');
mean_hitrates = []; 
for i = 1:length(hitrates)
    if ~isempty(str2num(hitrates{i}(23:24)))
        signalnoiseratio(i) = str2num(hitrates{i}(15:16))-str2num(hitrates{i}(23:24));
        eval(['mean_hitrates(',num2str(i),') = ',hitrates{i},'(14);']);
        eval(['mean_hitrates_vcv(',num2str(i),') = ',hitrates{i},'(15);']);
        eval(['mean_hitrates_cvc(',num2str(i),') = ',hitrates{i},'(16);']);
    end
end
figure;
plot(signalnoiseratio, mean_hitrates_cvc,'r*');
hold on;
plot(signalnoiseratio, mean_hitrates,'*');
plot(signalnoiseratio, mean_hitrates_vcv,'g*');
xlabel('SNR (dB)');
ylabel('hitrate');
title('Psychometric Function with OLLO');
legend('CVCs','all','VCVs','Location','NorthWest');
cd ..;