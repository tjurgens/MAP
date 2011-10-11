function unify_vocabulary

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this function unifies vocabulary matlab-files
% written for speech recognition with PEMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%

flag = 1; %initial flag, at least one set of vocabularies must be saved

while flag,
    % select directory of speaker
    pathname = uigetdir('D:\tim\OLLO\','Select Directory of Speaker');
    cd(pathname);
    directory = getDir(pathname);
    nr_of_directories = length(directory);
    
    % for every ollo-subset
    for i = 1:nr_of_directories
        cd(directory{i});
        cd('vocabulary\Internal_Representations');
        filename = dir('*.mat');
        load(filename.name);
        %save into new directory
        save_away(vocabulary,directory{i});%save_away(voc,speakerid,directory{i});
        clear vocabulary
        cd(pathname);
    end
    flag = input('another speaker? (0:no, 1:yes): ');
end