function collect_conf_mats

directory = getDir(pwd);
nr_of_directories = length(directory);

for i = 1: nr_of_directories
    cd([directory{i} filesep 'S02M_NO']);
    matfiles = dir('*.mat');
    for j = 1:length(matfiles),
        load(matfiles(j).name);
        if i == 1
            eval(['CM_' matfiles(j).name(1:end-4) 'BIG = zeros(150);']);
            eval(['hitrate_' matfiles(j).name(1:end-4) 'BIG = zeros(1,16);']);
        end
        eval(['CM_' matfiles(j).name(1:end-4) 'BIG = CM_' matfiles(j).name(1:end-4) 'BIG + CM_' matfiles(j).name(1:end-4) ';']);
        eval(['hitrate_' matfiles(j).name(1:end-4) 'BIG = hitrate_' matfiles(j).name(1:end-4) 'BIG + hitrate_' matfiles(j).name(1:end-4) ';']);
    end
    cd ..
    cd ..
end 
  
% rück-umbenenennen
for j = 1:length(matfiles),    
        eval(['CM_' matfiles(j).name(1:end-4) ' = CM_' matfiles(j).name(1:end-4) 'BIG;']);
        eval(['hitrate_' matfiles(j).name(1:end-4) ' = hitrate_' matfiles(j).name(1:end-4) 'BIG./' num2str(nr_of_directories) ';']);
        eval(['clear CM_' matfiles(j).name(1:end-4) 'BIG;']);
        eval(['clear hitrate_' matfiles(j).name(1:end-4) 'BIG;']);
end
    cd ..
    cd auswertung
    save auswertungalle.mat;
    