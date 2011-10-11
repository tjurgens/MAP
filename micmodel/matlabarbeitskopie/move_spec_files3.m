function move_spec_files3

%%%%%%%%%%%%%%%
%  moves special files to desired directory
%  is designed to be changed due to purpose
%%%%%%%%%%%%%%

home_path = pwd;
basedirectory   = 'D:\tim\OLLO\S10M_NO\';

directory = getDir(basedirectory);
nr_of_directories = length(directory);

for i = 1:nr_of_directories
    curr_dir = [basedirectory directory{i}];
    to_copy_dir = ['D:\tim\OLLO\S06M_NO\' directory{i}];
    cd(to_copy_dir);
    if ~isdir('langsam_auswahl_Speaker10')
        mkdir('langsam_auswahl_Speaker10');
    end
    cd(curr_dir);
    File = dir('*.wav');
    nFiles = length(File);
    for k = 1:nFiles
        if(strcmp(File(k).name(11:18),'V2_M1_N1'))
            system(['copy ',File(k).name,' D:\tim\OLLO\S06M_NO\',directory{i},'\langsam_auswahl_Speaker10\']);
        end
    end
end
cd(home_path);