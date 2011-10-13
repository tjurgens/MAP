function MMparentscript(parentdir)
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Skript
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Microscopic Model
% Tim J�rgens, October 2011
%
%%
%  This script builds the framework for testing the microscopic model first
%  described in Juergens and Brand, JASA 2009 with the MAP model of Meddis
%  (2006) for different level and noise conditions

SNR = 0; %dB
subject = 'Normal'; %take the parameter file of a normal-hearing listener
auditorymodel = 'MAP';
speechlevel = 60; %dB SPL
noiselevel = speechlevel-SNR;
no_repetitions = 10; %number of repetitions (temporal passages of the noise) to obtain variability
subpath_to_save = 'MMtest'; %specify savepath here! DON'T USE UNDERLINES FOR SAVEPATHS
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
 
 if ~copyfile([parentdir 'templatefilestructure' filesep '*.*'],[parentdir subpath_to_save filesep]);
     error('result file structure could not be copied. check permission rights');
 end

%% Do the model calculations
for iCounter = 1:no_repetitions
    complete_path = [parentdir subpath_to_save filesep 'daten' filesep 'identicalrunninglorentz' num2str(iCounter) filesep 'S02M_NO' filesep];
    microscopic_model_demo_train(speechlevel,noiselevel,iCounter,parentdir,complete_path,auditorymodel,subject);
 end


%% Evaluate
auswertung_model([parentdir subpath_to_save]);

%eof