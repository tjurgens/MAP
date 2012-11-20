function chime_repeat(missingnumber)
%START IN AN EMPTY DIRECTORY! -> home/tim/status
%cd('/home/tim/statusmsg');

load('/schroedersan/Corpora/CHiME/eval_chime_fhg/dir_struct/chime_filepaths.mat');
nwavs = length(missingnumber);
startindex=[1:20:nwavs];
endindex = [20:20:nwavs];
addpath('/home/tim/MAP/userProgramsTim');


for iCounter = 1:length(startindex)
    matlabcommand_to_exe = ['chime_FTHfeatures(' num2str(missingnumber(startindex(iCounter))) ',' num2str(missingnumber(endindex(iCounter))) ');'];
    job_name = ['CHiME' num2str(iCounter)];
    jobID_string = qsub(matlabcommand_to_exe, job_name ,'','-q all.q');%'-r y');%
end