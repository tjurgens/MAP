function move_spec_files

%%%%%%%%%%%%%%%
%  moves special files to desired directory
%  is designed to be changed due to purpose
%%%%%%%%%%%%%%

home_path = pwd;
basedirectory   = pwd; %speaker directory

directory = getDir(basedirectory);
nr_of_directories = length(directory);

for i = 1:nr_of_directories
    curr_dir = [basedirectory filesep directory{i}];
    cd(curr_dir);
    if ~isdir('alle17')
        mkdir('alle17');
    end
    File = dir('*.wav');
    nFiles = length(File);
    for k = 1:nFiles
        if (strcmp(File(k).name(11:18),'V6_M1_N3'))
            system(['rm ',File(k).name]);
        else
            system(['mv ',File(k).name,' ./alle17/']);
        end
    end
end
cd(home_path);