function make_vocabulary_mfb(filename_to_save,pcondition,speaker)

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
global home_directory;
global hearing_impairment;

if nargin < 1,
    error('Input argument "filename" is undefined');
end
global backnoiseshift;
Verbose = 0;
actualdirectory = pwd;
underlines = findstr(actualdirectory,'_');
vocabularyset = actualdirectory(underlines(2)-1:underlines(2)+1);
matlabpath = [home_directory 'matlabarbeitskopie' filesep];


%%%%%%%%%%
%backnoise = load([matlabpath,'icranoise_16k.mat']);
if isnumeric(pcondition.noiselevel)
    backnoise = load([matlabpath,'icranoisevoc_16k', num2str(backnoiseshift) '.mat']);
end
%%%%%%%%%%
correcttemplatedir = get_actual_templatedir(actualdirectory,pcondition.templatedirectory);
cd(correcttemplatedir);

File = dir('*.wav');
nFiles = length(File);
if ~isdir('Internal_Representations')      
     mkdir('Internal_Representations');
end
vocabul = cell(1,nFiles);

%%%%%%%%%%%%%%%%%%% first: read in and equalize lengths %%%%%%%%%%%%%%%%%%% 
for i = 1:nFiles,
    % check if file is from the same speaker that the program currently
    % works
    if File(i).name(1:4) == speaker,
        % get testsignal
        cd(correcttemplatedir); %change to templatedirectory
        [vocabul{i}, sfreq, nbits] = wavread(File(i).name);
        if Verbose,
            figure;
            plot(vocabul{i});
            %sound(vocabul,sfreq);
        end
        % preprocessing = cut & add white noise
        %[vocabul{i},hear_thres_noise{i}] = preproc(vocabul{i}, sfreq, vocabularyset, pcondition);
        loganumber = eval(File(i).name(7:9));
        vocabul{i} = preproc(vocabul{i}, sfreq, vocabularyset, pcondition, loganumber);
        if Verbose,
            figure;
            plot(vocabul{i});
        end
    end
end
%% change directory back to modellingdirectory
cd(actualdirectory);

%%%%%%%%%%%%%%%%%%%%%%%%%%
% equalize vocabulary length to rule out a possible word discrimination
% from individual durations, just add zeros afterwards
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vocabularymaxlength = max(cellfun('length',vocabul));

for i = 1:nFiles
    vocabul{i} = [vocabul{i}',zeros(vocabularymaxlength-length(vocabul{i}),1)']';
end

%%%%%%%%%%%%%%%% 2nd: compute IR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:nFiles,
    vocab(i).number = eval(File(i).name(7:9));
    % check if file is spoken by the same speaker who is indicated in 'speaker'
    if File(i).name(1:4) == speaker,
        i
        if strcmp(pcondition.noiselevel,'nobackgroundnoise')
            ;
        else
            backgroundnoise = backnoise.icranoise_voc{getnr_fromvocabularyset(vocabularyset)};
            % set noise level
            if strcmp(pcondition.auditorymodel,'MAP')
                backgroundnoise = backgroundnoise./sqrt(mean(backgroundnoise.^2)).*10^(-(94-pcondition.noiselevel)/20);
                %20*log10(sqrt(mean(backgroundnoise.^2))/20e-6) %reference pressure: 20uPa
            else
                backgroundnoise = backgroundnoise./rms(backgroundnoise)/db2factor(pcondition.noiselevel);
            end
            backgroundnoise = backgroundnoise(1:length(vocabul{i}));
            vocabul{i} = vocabul{i} + backgroundnoise;
        end
        %%
        vocabul{i} = soft_onset(vocabul{i}, sfreq, 0.05); %50 ms fade in für soften onset am anfang
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% ab hier hören!
        %%
        %% hörschwellensimulierendes rauschen
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %hier kein fluktuierendes rauschen, da davon ausgegangen wird, dass
        %das gelernte optimal ist und nicht zufaellig ein logatom
        %schlechter im speicher ist als ein anderes.
        %         if fluctuating_htsn == 1;
        %             pcondition.audiogram = pcondition.audiogram+pcondition.fluctuating_to_add(vocab(i).number);
        %         else
        %             actual_audiogram = pcondition.audiogram;
        %         end
        if strcmp(pcondition.auditorymodel,'MAP')
        else
            if ~isfield(hearing_impairment,'internalnoise')
                %         %add hearing threshold simulating noise
                hear_thres_noise = masknoise(pcondition.audiogram,length(vocabul{i}),pcondition.audiogramfreqs,sfreq)./1e5;   %HERE SET IN THE AUDIOGRAM
                %1e5 is the factor to come from rainer beutelmanns implementation to pemo-level
                hear_thres_noise = hear_thres_noise(:,1); % take only the left ears threshold simulating noise
                vocabul{i} = hear_thres_noise + vocabul{i};
            end
        end
        %         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        % control of preprocessing by once saving pemo-input
        if (i == 2) && strcmp(vocabularyset,'a_a'),
          f_preproc = figure,plot(vocabul{i});
          if (ischar(pcondition.noiselevel))
              tempstring = [pcondition.noiselevel,'_',num2str(pcondition.speechlevel)];
          else
              tempstring = [num2str(pcondition.noiselevel),'_',num2str(pcondition.speechlevel)];
          end
          tosave_filenamestring = ['atta_pp_',tempstring,'.mat'];
          save(tosave_filenamestring,'vocabul');
          %saveas(f_preproc,['atta_pp_',tempstring,'.fig']);
          %saveas(f_preproc,['atta_pp_',tempstring,'.jpg']);
          close(f_preproc);
        end
        
        if pcondition.use_mfb == 1
            %%%%%%%%%%%%%%% AUDITORY MODELS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if strcmp(pcondition.auditorymodel,'CASP_Diss')
                IR_vocabultmp = pemo_preproc(vocabul{i},sfreq);%, sfreq,pcondition.nrmodchan);
                if iscell(IR_vocabultmp)
                    IR_vocabul = IR_vocabultmp;
                else
                    IR_vocabul{1} = IR_vocabultmp(:,:,1)';
                    IR_vocabul{2} = IR_vocabultmp(:,:,2)';
                    IR_vocabul{3} = IR_vocabultmp(:,:,3)';
                    IR_vocabul{4} = IR_vocabultmp(:,:,4)';
                    
                end
            elseif strcmp(pcondition.auditorymodel,'CASP_2011')
                IR_vocabultmp = casp_preproc(vocabul{i},0);%, sfreq,pcondition.nrmodchan);
                if iscell(IR_vocabultmp)
                    IR_vocabul = IR_vocabultmp;
                else
                    IR_vocabul{1} = IR_vocabultmp(:,:,1)';
                    IR_vocabul{2} = IR_vocabultmp(:,:,2)';
                    IR_vocabul{3} = IR_vocabultmp(:,:,3)';
                    IR_vocabul{4} = IR_vocabultmp(:,:,4)';
                    
                end
            elseif strcmp(pcondition.auditorymodel,'PEMO')
                IR_vocabul = pemo_mfb_tim(vocabul{i},sfreq,pcondition.nrmodchan);
                % the original normal-hearing model
            elseif strcmp(pcondition.auditorymodel,'PEMOSH')
                IR_vocabul = pemo_mfb_hi_schelle1_tim(vocabul{i},sfreq,hearing_impairment.audiogram,pcondition.nrmodchan);
                % schelles hearing-impaired model
            elseif strcmp(pcondition.auditorymodel,'MAP')
                MAP1_14(vocabul{i},sfreq,-1,pcondition.parameterfile,'probability')
                global ANprobRateOutput %savedBFlist
                %take only the HSR fibers
                AN_HSRoutput = ANprobRateOutput(size(ANprobRateOutput)/2+1:end,:);
                %calculate rate pattern
                ANsmooth = [];%Cannot pre-allocate a size as it is unknown until the enframing
                hopSize = 10; %ms
                winSize = 25; %ms
                winSizeSamples = round(winSize*sfreq/1000);
                hann = hanning(winSizeSamples);
                hopSizeSamples = round(hopSize*sfreq/1000);
                for chan = 1:size(AN_HSRoutput,1)
                    f = enframe(AN_HSRoutput(chan,:), hann, hopSizeSamples);
                    ANsmooth(chan,:) = mean(f,2)';
                end
                IR_vocabul = ANsmooth;
            else
                error('auditory model not found!')
            end


            if Verbose,
                figure;
                surf(IR_vocabul{1});
                view(2);
            end

           
            
        elseif pcondition.use_mfb == 0
            if strcmp(pcondition.auditorymodel,'PeMo')
                IR_vocabul{1} = pemo_tim(vocabul{i},sfreq);
                % the original normal-hearing model without mfb
            end
        end
        
        % cut IR of (white,ol) noise / silence in front
        if strcmp(pcondition.auditorymodel,'MAP')
            IR_vocabul = IR_vocabul(:,41:end);
        else
            for mod_freq = 1:length(IR_vocabul)
                IR_vocabul{mod_freq} = IR_vocabul{mod_freq}(:,41:end);
            end
        end
        
        if pcondition.use_mfb == 0
            if pcondition.use_lpc == 1;
                [arearatios,a_values,k_values]= perceptive_linear_prediction_arearatios(IR_vocabul{1},pcondition.lpc_order);
                %tmpIR_vorher = IR_vocabul{1};
                %IR_vocabul{1} = a_values;%k_values;%arearatios
                %smooth internal representation due to LPC-values
                out_IR = smoothedLPC_IR(a_values,IR_vocabul{1});%,tmpIR_vorher);
                IR_vocabul{1} = out_IR;
            end
        end
        
                
        if Verbose,
            figure;
            surf(IR_vocabul);
            view(2);
        end
        
        %%%%%look especially at the middle phoneme, new JT, Aug.09
%         time_weight = repmat([zeros(1,7)+0.5 zeros(1,32-8)+4 zeros(1,size(IR_vocabul{1},2)-32+1)+0.5],size(IR_vocabul{1},1),1);
%         if size(time_weight,2) > size(IR_vocabul{1},2)
%             time_weight = time_weight(:,1:size(IR_vocabul{1},2));
%         end
%         IR_vocabul{1} = IR_vocabul{1}.*time_weight;
%         IR_vocabul{2} = IR_vocabul{2}.*time_weight;
%         IR_vocabul{3} = IR_vocabul{3}.*time_weight;
%         IR_vocabul{4} = IR_vocabul{4}.*time_weight;
        %%%%%
        
        %ask for variable name
        vocab(i).number = eval(File(i).name(7:9));
        vocab(i).name = iloga2sloga(vocab(i).number);
        vocab(i).IR = IR_vocabul;
        vocab(i).speaker = File(i).name(1:4);
        vocab(i).variability = eval(File(i).name(12));
        vocab(i).version = eval(File(i).name(18));
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
