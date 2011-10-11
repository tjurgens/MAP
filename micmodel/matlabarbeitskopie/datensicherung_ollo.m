%Saving Ollo-Pemo
%in an hd-memory-saving way
%relevant data from d:\tim\ollo is copied to d:\tim\datensicherung\...

mainpath = 'D:\tim\OLLO';
savepath = 'D:\tim\OLLOsave';
cd(mainpath);
firstdir = getDir(pwd);
if(~isdir('D:\tim\datensicherung'))
   mkdir('D:\tim\datensicherung');
end
for i = 1:length(firstdir)
    cd(firstdir{i});
    
    seconddir = getDir(pwd);
    if (seconddir{1} == 0)
        ;
    else
    if(~isdir(['D:\tim\datensicherung' filesep firstdir{i}]))
       mkdir(['D:\tim\datensicherung' filesep firstdir{i}]);
    end
    for j = 1:length(seconddir)
        cd(seconddir{j})
        thirddir = getDir(pwd);
        if thirddir{1} == 'a_a',
            if(~isdir(['D:\tim\datensicherung' filesep firstdir{i} filesep seconddir{j}]))
                mkdir(['D:\tim\datensicherung' filesep firstdir{i} filesep seconddir{j}]);
            end
            for k = 1:length(thirddir)
                cd(thirddir{k})
                forthdir = getDir(pwd);
                if(~isdir(['D:\tim\datensicherung' filesep firstdir{i} filesep seconddir{j} filesep thirddir{k}]))
                    mkdir(['D:\tim\datensicherung' filesep firstdir{i} filesep seconddir{j} filesep thirddir{k}]);
                end
                for l = 1:length(forthdir)
                    if(~isdir(['D:\tim\datensicherung' filesep firstdir{i} filesep seconddir{j} filesep thirddir{k} filesep forthdir{l}]))
                        mkdir(['D:\tim\datensicherung' filesep firstdir{i} filesep seconddir{j} filesep thirddir{k} filesep forthdir{l}]);
                    end
                    cd(forthdir{l})
                    copyfile('*.*',['D:\tim\datensicherung' filesep firstdir{i} filesep seconddir{j} filesep thirddir{k} filesep forthdir{l}]);
                    cd ..
                end
                cd ..
            end
            
        else error 'Verzeichnisstruktur unerwartet';
        end
        cd ..
    end
    cd ..
    end
    cd(mainpath);
end
;