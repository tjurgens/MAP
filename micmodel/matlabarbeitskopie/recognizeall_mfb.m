function recognizeall_mfb(whichdir,pcondition,testauswahl)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% tries to recognize all IRs made from wav files in the subdirectories set 
%
% usage: recognizeall_mfb(whichdir,pcondition,testauswahl)
%
% whichdir: speaker directory, must be a subdirectory of pwd
% p_condition: peripheral condition, 
%           pcondition.speechlevel: level of speech in dB SPL for PeMo
%           pcondition.noiselevel: level of noise in dB SPL for PeMo
%           pcondition.audiogram: 'mean' audiogram for both ears in dB HL
%                                  set in as a vector 11 freqs for left and
%                                  11 for right ear (internal monaural processing)
%           pcondition.nrmodchan: number of modulation channels in pemo
% testauswahl: directory name of test files
% 
% Tim Jürgens, Sept 2006
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


nowdir = pwd;
speaker = whichdir(1:4);
basedirectory = pwd;
%basedirectory = [pwd, filesep, whichdir]

directory = getDir(basedirectory);
nr_of_directories = length(directory);

for i = 1:nr_of_directories
    %HERE set the name of directory to investigate
    curr_dir = [basedirectory, filesep, directory{i}, filesep, testauswahl];
    cd(curr_dir);
    [tmp1,tmp2] = recognizer_mfb(pcondition,speaker);
    %close all
    curr_dir
end

cd(nowdir);