
featureDirread = '/schroedersan/tim/Chime/feat1'; 
featureDirwrite = '/schroedersan/tim/Chime/feat3'; 
byteswap = 1;   %serves to synchronize byte order between UNIX and matlab
load('/schroedersan/Corpora/CHiME/eval_chime_fhg/dir_struct/chime_filepaths.mat');
nwavs = length(filepaths);
missingnumber = [];

for iCounter = 1:nwavs
    
    fullpathread = [featureDirread filesep filepaths_own{iCounter}];
    fullpathwrite = [featureDirwrite filesep filepaths_own{iCounter}];
    %load feature
    [Features,header] = load_htk_with_header(fullpathread,byteswap,0);
    
    %compute deltas and double-deltas
    %Features_D  = delta_coefficients(Features',3);    %compute deltas
    %Features_DD = delta_coefficients(Features_D,2);   %compute double deltas
    %Features = [Features; Features_D'; Features_DD'];
    Features_D_DD = calc_deltas(Features,2);   %compute deltas and double deltas
        
    %normalize features in dimensions
    Features_norm = fe_norm_feat(Features_D_DD);
    
    %write feature
    header.sampSize = header.sampSize*3; %because deltas and doubledeltas are added
    write_htk_with_header(Features_norm,header,fullpathwrite,byteswap);
    
    % display every 1000th file to monitor the progress
    if ~mod(iCounter,1000) 
        disp(sprintf('Checking file no. %s',num2str(iCounter)));
    end
end