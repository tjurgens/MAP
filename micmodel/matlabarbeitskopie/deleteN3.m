function deleteN3;
home_path = pwd;
basedirectory   = pwd; %speaker directory

directory = getDir(basedirectory);
nr_of_directories = length(directory);

for i = 1:nr_of_directories
    curr_dir = [basedirectory, filesep, directory{i}];
    cd(curr_dir);
    File = dir('*.wav');
    nFiles = length(File);
    for k = 1:nFiles
        if (strcmp(File(k).name(17:18),'N3'))
            system(['rm ',File(k).name]);
        end
    end
end
cd(home_path);