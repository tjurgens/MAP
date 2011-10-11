%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Demonstration Skript
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Microscopic Model
% Tim Jürgens, August 2011
%
%%
%  This skript is designed to demonstrate the microscopic model of Jürgens
%  and Brand, J.Acoust.Soc.Am (2009). It calculates speech recognition for
%  normal-hearing listeners in ICRA1 background noise at an SNR of -15 dB.
%  The model runs on the computer cluster SCHROEDER, so this skript should
%  be run by a user who has read and write access to the subdirectories
%  called.
%  Ten repetitions of the model are submitted, each one as a separate job
%  to the cluster, so that the ten jobs can run in parallel
%  After 2 hours, a checkup-Skripts checks whether or not all files are
%  processed and (if not) repeats one simulation
%  If all files are processed then an evaluation script does the necessary
%  steps to sum up the data and generates confusion matrices that are
%  stored to the subdirectory 'auswertung'.
%  Within statistical limits (it's a non-deterministic model because running 
%  noise is used), the plots of Fig.6 and Fig.7 (lower panel, respectively)
%  should be reproduced.
%  This skript is only for demo purposes, the skript for generating a
%  massive amount of data is parallel_script.m

SNR = -15; %dB
audiogram = zeros(1,11); %dB HL, normal-hearing listener
k_fit = [0 0 0 0]; % fitparameter for simulating supra-threshold processing. here: normal-hearing
speechlevel = 60; %dB SPL
noiselevel = speechlevel-SNR;
no_repetitions = 10; %number of repetitions (temporal passages of the noise) to obtain variability
subpath_to_save = 'demomicmodel'; %specify savepath here! DON'T USE UNDERLINES FOR SAVEPATHS
parentdir = '/net/medisan/home/tom/'; 
emailaddress = 'thomas.brand@uni-oldenburg.de';
%addpath('/net/medisan/home/tim/matlab/');
addpath('/net/medisan/home/tim/matlabarbeitskopie/');

cd('/net/medisan/home/tom/matlab/');

%% Copy template filestructure for results to new subdirectory
%
% if exist([parentdir subpath_to_save]) == 7
%     inputstring = input('directory already exists. overwrite? [y,n]:','s');
%     if strcmp(inputstring,'n') || strcmp(inputstring,'N')
%         disp('Aborting');
%         return
%     end
% elseif ~mkdir(parentdir,subpath_to_save)
%     error('directory could not be installed. check permission rights');
% end
% 
% if ~copyfile([parentdir 'templatefilestructure/*.*'],[parentdir subpath_to_save '/']);
%     error('result file structure could not be copied. check permission rights');
% end

%% Job Submission training
for iCounter = 1:no_repetitions
    complete_path = ['''' parentdir subpath_to_save '/daten/identicalrunninglorentz' num2str(iCounter) '/S02M_NO/'''];
    job_name = ['mm' num2str(abs(SNR)) '_no' num2str(iCounter)];
    matlabcommand_to_exe = ['microscopic_model_demo_train(' num2str(speechlevel) ',' num2str(noiselevel) ',' num2str(mod(iCounter-1,10)+1) ',' complete_path ',[' num2str(audiogram) '],[' num2str(k_fit) '])'];
        %Note: all calculations from Tim Jürgens were done using the function
    %microscopic_model.m rather than microscopic_model_demo_train.m and
    %microscopic_model_demo_reco.m. Both
    %differ only in the type of auditory model used and the separation of training and testing in two functions.
    %% SUBMISSION
    jobID_string = qsub(matlabcommand_to_exe, job_name , emailaddress, '-q all.q');%'-r y');%
            
end

%% Wait for 30min that files are generated
pause(30*60);

%% Job Submission recognizing
for iCounter = 1:no_repetitions
    complete_path = ['''' parentdir subpath_to_save '/daten/identicalrunninglorentz' num2str(iCounter) '/S02M_NO/'''];
    job_name = ['mm' num2str(abs(SNR)) '_no' num2str(iCounter)];
    matlabcommand_to_exe = ['microscopic_model_demo_reco(' num2str(speechlevel) ',' num2str(noiselevel) ',' num2str(mod(iCounter-1,10)+1) ',' complete_path ',[' num2str(audiogram) '],[' num2str(k_fit) '])'];
    %Note: all calculations from Tim Jürgens were done using the function
    %microscopic_model.m rather than microscopic_model_demo_train.m and
    %microscopic_model_demo_reco.m. Both
    %differ only in the type of auditory model used and the separation of training and testing in two functions.
    %% SUBMISSION
    jobID_string = qsub(matlabcommand_to_exe, job_name , emailaddress, '-q all.q');%'-r y');%
            
end

%% Wait for 30min that files are generated
pause(30*60);
%% Check if all files are there
stilltodo = checkscript_loga([parentdir subpath_to_save filesep 'daten'],speechlevel,noiselevel);

%% If not please repeat
if stilltodo
    disp('Some jobs are not processed by the cluster, please repeat the script');
else
    %% Evaluate
    auswertung_model([parentdir subpath_to_save]);
end

%eof