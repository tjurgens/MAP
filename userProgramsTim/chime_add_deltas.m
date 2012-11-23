
featureDir = '/schroedersan/tim/Chime/feat1'; 

load('/schroedersan/Corpora/CHiME/eval_chime_fhg/dir_struct/chime_filepaths.mat');
nwavs = length(filepaths);
missingnumber = [];
for iCounter = 1:nwavs
    fullpath = [featureDir filesep filepaths_own{iCounter}];
    
    %load feature
    [mFeat,header] = load_htk_with_header(fullpath,0,0);
    
    %compute deltas and double-deltas
    
    
    % display every 1000th file to monitor the progress
    if ~mod(iCounter,1000) 
        disp(sprintf('Checking file no. %s',num2str(iCounter)));
    end
end