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
    curr_dir = [basedirectory, filesep,directory{i}];
    cd(curr_dir);
    if ~isdir('rand_var_auswahl_2')
        mkdir('rand_var_auswahl_2');
    end
    File = dir('*.wav');
    nFiles = length(File);
    randomvec = randperm(length(File));
    streichvektor = [];
    for k = 1:nFiles
        k
        loga_number = eval(File(randomvec(k)).name(7:9))
        if (find(loga_number == streichvektor))
           disp('.');
        else
           system(['mv ',File(randomvec(k)).name,' ./rand_var_auswahl_2/']);
           streichvektor(end+1) = loga_number;
        end
    end
end
cd(home_path);