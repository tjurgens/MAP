function make_all_vocabulary(whichdir,pcondition);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% makes all IRs from wav files in the subdirectories 'vocabulary'
%
% usage: make_all_vocabulary(whichdir,pcondition)
%
% whichdir: directory of speaker, it must be a subdirectory of
%           pwd
% p_condition: peripheral condition, 
%           pcondition.speechlevel: level of speech in dB SPL for PeMo
%           pcondition.noiselevel: level of noise in dB SPL for PeMo
%           pcondition.audiogram: 'mean' audiogram for both ears in dB HL
% 
% Tim Jürgens, May 2006
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nowdir = pwd;
speaker = whichdir(1:4);
basedirectory   = [pwd,filesep,whichdir]

directory = getDir(basedirectory);
nr_of_directories = length(directory);

for i = 1:nr_of_directories
    curr_dir = [basedirectory, filesep, directory{i}, filesep,'vocabulary'];
    cd(curr_dir);
    if ~isdir('Internal_Representations')
        mkdir('Internal_Representations');
    end
    if(ischar(pcondition.noiselevel))
        filename_voc = sprintf('speech%i_noise%s_%s',pcondition.speechlevel,pcondition.noiselevel,directory{i});
    else
        filename_voc = sprintf('speech%i_noise%i_%s',pcondition.speechlevel,pcondition.noiselevel,directory{i});
    end 
    make_vocabulary(filename_voc,pcondition,speaker);
    close all;
end
cd(nowdir);