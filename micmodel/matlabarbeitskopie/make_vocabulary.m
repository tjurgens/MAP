function make_vocabulary(filename_to_save,pcondition,speaker)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Create vocabulary of internal representations of test words
%
%   (c) Tim Jürgens, Medizinische Physik, Feb.2006
%
%   usage: make_vocabulary(filename,pcondition,speaker)
%
%   filename: filename to save vocabulary (*.mat)
%   p_condition: peripheral condition, 
%           pcondition.speechlevel: level of speech in dB SPL for PeMo
%           pcondition.noiselevel: level of noise in dB SPL for PeMo
%           pcondition.audiogram: 'mean' audiogram for both ears in dB HL
%   speaker: speaker of speechmaterial in the actual directory (for vocabulary)
%     
%   calculates for every *.wav file in the current directory the IR
%   and saves it to filename
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin < 1,
    error('Input argument "filename" is undefined');
end

Verbose = 0;
actualdirectory = pwd;
underlines = findstr(actualdirectory,'_');
%vocabularyset = actualdirectory(underlines(2)-1:underlines(2)+1);
vocabularyset = 'a_a';
matlabpath = 'd:\tim\matlab\';
backnoise = load([matlabpath,'icranoise_16k.mat']);

File = dir('*.wav');
nFiles = length(File)
if ~isdir('Internal_Representations')      
     mkdir('Internal_Representations');
end
vocabul = cell(1,nFiles);
hear_thres_noise = cell(1,nFiles);
%%%%%%%%%%%%%%%%%%% first: read in and equalize lengths %%%%%%%%%%%%%%%%%%% 
for i = 1:nFiles,
    % check if file is from the same speaker that the program currently
    % works
    if File(i).name(1:4) == speaker,
        % get testsignal
        [vocabul{i}, sfreq, nbits] = wavread(File(i).name);
        if Verbose,
            figure;
            plot(vocabul{i});
            %sound(vocabul,sfreq);
        end
        % preprocessing = cut & add white noise
        vocabul{i} = preproc(vocabul{i}, sfreq, vocabularyset, pcondition);
        if Verbose,
            figure;
            plot(vocabul{i});
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%
% equalize vocabulary length to rule out a possible word discrimination
% from individual durations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% vocabularymaxlength = max(cellfun('length',vocabul));
% hear_thres_noise = masknoise(pcondition.audiogram,vocabularymaxlength,[],sfreq)./1e5;
% for i = 1:nFiles
%     vocabul{i} = [vocabul{i}',hear_thres_noise(1:vocabularymaxlength-length(vocabul{i}),1)']';
% end
% clear hear_thres_noise;
%%%%%%%%%%%%%%%% 2nd: compute IR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:nFiles,
    % check if file is from the same speaker that the program currently
    % works
    if File(i).name(1:4) == speaker,
        i
        % set noise level
        if pcondition.noiselevel == 'nobackgroundnoise'
            ;
        else
            %backgroundnoise = load([matlabpath,'icranoise_3s.mat']);
            backgroundnoise = backnoise.icranoise_re;
            backgroundnoise = backgroundnoise./rms(backgroundnoise)/db2factor(pcondition.noiselevel);
            %set initial sample random -> random noise
            in_samp = ceil(500*rand);
            backgroundnoise = backgroundnoise(in_samp:length(vocabul{i})+in_samp-1);
            vocabul{i} = vocabul{i} + backgroundnoise;
            %backgroundnoise = 2*(rand(length(vocabul),1)-0.5);
            %backgroundnoise = backgroundnoise./2^((100-pcondition.noiselevel)/(20*log10(2)));
        end
        
        % control of preprocessing by saving pemo-input
        if (i == 2) && strcmp(vocabularyset,'a_a'),
          f_preproc = figure,plot(vocabul{i});
          if (ischar(pcondition.noiselevel))
              tempstring = [pcondition.noiselevel,'_',num2str(pcondition.speechlevel)];
          else
              tempstring = [num2str(pcondition.noiselevel),'_',num2str(pcondition.speechlevel)];
          end
          saveas(f_preproc,['atta_pp_',tempstring,'.fig']);
          saveas(f_preproc,['atta_pp_',tempstring,'.jpg']);
          close(f_preproc);
        end
    
        % pemo
        IR_vocabul = pemo_tim(vocabul{i}, sfreq);
        if Verbose,
            figure;
            surf(IR_vocabul);
            view(2);
        end

        % cut IR of (white,ol) noise
        IR_vocabul = IR_vocabul(:,41:end);
        if Verbose,
           figure;
           surf(IR_vocabul);
           view(2);
        end
    
        
        %ask for variable name
        
        vocab(i).number = eval(File(i).name(7:9));
        vocab(i).name = iloga2sloga(vocab(i).number);
        vocab(i).IR = IR_vocabul;
        vocab(i).speaker = File(i).name(1:4);
        vocab(i).variability = eval(File(i).name(12));
        vocab(i).version = eval(File(i).name(18));
        %close all
    else
        ;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% put vocabulary into appropriate order 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:length(vocab)
   ordering(i) = vocab(i).number;
end
[ordering,ord_ind] = sort(ordering);
for i = 1:length(vocab)
   vocabulary(i) = vocab(ord_ind(i));
end


%clear temporary variables and save workspace to filename
%clear IR_vocabul nbits File sfreq loga_name loga_number vocabul ans Verbose i nFiles
%g=setdiff(who,'filename_to_save');
cd Internal_Representations;
save(filename_to_save,'vocabulary');
cd ..;
