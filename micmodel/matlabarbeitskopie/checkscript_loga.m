function checkcell = checkscript_loga(maindirectory,speechlevel,noiselevel)
actdir = pwd;
cd(maindirectory);

directories = getdir(pwd);
zaehler = 1;
for iCounter = 1:length(directories)
    
    cd(directories{iCounter});
    cd('S02M_NO');
    %check for noisy condition
    
    for jCounter = 1:length(speechlevel)
        act_filename = ['speech' num2str(round(speechlevel(jCounter))) '_noise' num2str(noiselevel) '_normal_auswahl_mfb.mat'];    
        if ~exist(act_filename,'file')
            disp([act_filename ' does not exist in ' directories{iCounter}]);
            checkcell{zaehler} = act_filename;
            zaehler = zaehler+1;
        end
    end
    cd ../..
end

if ~exist('checkcell','var')
    checkcell = 0;
end
cd(actdir);
