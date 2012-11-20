function missingnumber = check_chime_features(yourDir)

% checks whether all own features for training and testing exist and gives
% out those numbers of chime files, where features are missing (number
% refers to the numeration as given in dir_struct.
%
% input: yourDir: main directory containing the features, e.g.,
% '/schroedersan/user/Chime/feat1'
%
% Tim Jürgens, November 2011


load('/schroedersan/Corpora/CHiME/eval_chime_fhg/dir_struct/chime_filepaths.mat');
nwavs = length(filepaths);
missingnumber = [];
for iCounter = 1:nwavs
    fullpath = [yourDir filesep filepaths_own{iCounter}];
    if ~exist(fullpath,'file')
        missingnumber = [missingnumber iCounter];
    end
    % display every 1000th file to monitor the progress
    if ~mod(iCounter,1000) 
        disp(sprintf('Checking file no. %s',num2str(iCounter)));
    end
end

