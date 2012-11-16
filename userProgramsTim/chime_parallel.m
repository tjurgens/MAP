
%START IN AN EMPTY DIRECTORY! -> home/tim/status
cd('/home/tim/status_msg');
clear;
load('/schroedersan/Corpora/CHiME/eval_chime_fhg/dir_struct/chime_filepaths.mat');
nwavs = length(filepaths);
startindex=[1:40:nwavs];
endindex = [40:40:nwavs];
addpath('/home/tim/MAP/userProgramsTim');

for iCounter = 1:length(startindex)
    matlabcommand_to_exe = ['chime_FTHfeatures(' num2str(startindex(iCounter)) ',' num2str(endindex(iCounter)) ');'];
    job_name = ['CHiME' num2str(iCounter)];
    jobID_string = qsub(matlabcommand_to_exe, job_name ,'','-q all.q');%'-r y');%
end
            