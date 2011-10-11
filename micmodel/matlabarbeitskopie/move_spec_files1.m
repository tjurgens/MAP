function move_spec_files1

%%%%%%%%%%%%%%%
%  moves special files to desired directory
%  is designed to be changed due to purpose
%%%%%%%%%%%%%%

home_path = pwd;
basedirectory   = pwd; %speaker directory

directory = getDir(basedirectory);
nr_of_directories = length(directory);

for i = 1:nr_of_directories
    curr_dir = [basedirectory directory{i}];
    cd(curr_dir);
    if ~isdir('rand_var_auswahl')
        mkdir('rand_var_auswahl');
    end
    File = dir('*.wav');
    nFiles = length(File);
    for k = 1:nFiles
        if(strcmp(File(k).name(11:18),'V6_M1_N2'))
            system(['move ',File(k).name,' ./rand_var_auswahl/']);
        end
    end
end
cd(home_path);