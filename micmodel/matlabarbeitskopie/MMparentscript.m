function MMparentscript(parentdir,repetitionno)
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Skript
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Microscopic Model
% Tim Jürgens, October 2011
%
%%
%  This script builds the framework for testing the microscopic model first
%  described in Juergens and Brand, JASA 2009 with the MAP model of Meddis
%  (2006) for different level and noise conditions
% parentdir: parent directory of the directory that contains all the
% scripts of the model. at the same time parent directory for the result
% directory.
thisdirectory = pwd;
SNR = -15:5:5; %dB
subject = 'Normal'; %take the parameter file of a normal-hearing listener
auditorymodel = 'MAP';
speechlevel = 70; %dB SPL

if nargin < 2
    no_repetitions = 10; %number of repetitions (temporal passages of the noise) to obtain variability
else
    no_repetitions = 1;
end

subpath_to_save = 'MMEuklidRateHSRExp1'; %specify savepath here! DON'T USE UNDERLINES FOR SAVEPATHS
%parentdir = 'C:\MAP\micmodel\';%'/scratch/tjurgens/MAP/micmodel/'; 
addpath([parentdir 'matlabarbeitskopie' filesep]);

%% Copy template filestructure for results to new subdirectory
%
 if exist([parentdir subpath_to_save]) == 7
     inputstring = input('directory already exists. overwrite? [y,n]:','s');
     if strcmp(inputstring,'n') || strcmp(inputstring,'N')
         disp('Aborting');
         return
     end
 elseif ~mkdir(parentdir,subpath_to_save)
     error('directory could not be installed. check permission rights');
 end
 
 if ~copyfile([parentdir 'templatefilestructure' filesep '*.*'],[parentdir '..' filesep '..' filesep subpath_to_save filesep]);
     error('result file structure could not be copied. check permission rights');
 end

 %get additional comment
 additionalcomment = input('Additional comment on the measurements (Enter for none):','s');
 
%% Do the model calculations
for iCounter = 1:no_repetitions
    for jCounter = 1:length(SNR)
        if no_repetitions == 1
            ;
        else
            repetitionno = iCounter;
        end
        noiselevel = speechlevel-SNR(jCounter);
        complete_path = [parentdir '..' filesep '..' filesep subpath_to_save filesep 'daten' filesep 'identicalrunninglorentz' num2str(repetitionno) filesep 'S02M_NO' filesep];
        microscopic_model_demo_train(speechlevel,noiselevel,repetitionno,parentdir,complete_path,auditorymodel,subject,additionalcomment);
    end
end

cd(thisdirectory);
%% Evaluate
auswertung_model([parentdir '..' filesep '..' filesep subpath_to_save]);

%eof