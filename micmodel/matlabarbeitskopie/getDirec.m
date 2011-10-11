function d = getDirec(directory)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   gets subdirectories in 'directory' and returns it in the string array d
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subdirectories = dir(directory);
nr_of_entries = size(subdirectories,1);
t = 1; % variable to count the number of directories
for i = 1:nr_of_entries,
    if(subdirectories(i).isdir == 1)
        eval('d(t,:) = subdirectories(i).name');
        t = t+1;
    end
end
