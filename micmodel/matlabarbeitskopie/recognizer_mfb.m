function [CM, distance] = recognizer_mfb(pcondition,speaker)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Recognizing Routine:
%   loads internal representations (IR) of vocabulary words,
%   computes IR of the testsignal and derives distance using dtw-algorithm
%   gives back the name of the recognized variable and the distance vector
%   that contains the distance to every tested word
%
%   (c) Tim Jürgens, Medizinische Physik, Feb.2006
%
%   usage: [CM, distance] = recognizer
%
%   CM: confusion matrix
%   distance: distancematrix, contains the distances of IR from
%   vocabulary-templates (columns) to testsignals(rows)
%        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global backnoiseshift;
global home_directory;
global hearing_impairment;
global fluctuating_htsn;

actualdirectory = pwd;
underlines = findstr(actualdirectory,'_');
vocabularyset = actualdirectory(underlines(2)-1:underlines(2)+1);
matlabpath = [home_directory 'matlabarbeitskopie' filesep];


%load background noise from disk
if isnumeric(pcondition.noiselevel)
    backnoise = load([matlabpath,'icranoisetest_16k', num2str(backnoiseshift), '.mat']);
end

%%%%%%
if strcmp(pcondition.noiselevel,'nobackgroundnoise')
    filename_to_save = sprintf('speech%i_noise%s_%s_mfb',pcondition.speechlevel,pcondition.noiselevel,vocabularyset);
elseif(pcondition.noiselevel < 0)
    tmp = abs(pcondition.noiselevel);
    filename_to_save = sprintf('speech%i_noise_%i_%s_mfb',pcondition.speechlevel,tmp,vocabularyset);
else
    filename_to_save = sprintf('speech%i_noise%i_%s_mfb',pcondition.speechlevel,pcondition.noiselevel,vocabularyset);
end

load([actualdirectory(1:underlines(2)+1) filesep 'vocabulary' filesep 'Internal_Representations' filesep filename_to_save]);

%%% for fixing the level of the vocabulary to 70 dB SPL
%load([actualdirectory(1:underlines(2)+1) filesep 'vocabulary' filesep 'Internal_Representations' filesep 'speech70' filename_to_save(end-30:end)]);
%%%

Verbose = 0;
CM = zeros(150);

correcttemplatedir = get_actual_templatedir(actualdirectory,pcondition.templatedirectory);
cd(correcttemplatedir);
File = dir('*.wav');
nFiles = length(File)
distance = zeros(nFiles,length(vocabulary)); %preallocation due to speed

addeddistance = zeros(nFiles);
min_mean_distance = 1;

for j = 1:nFiles,
    
    % check if file is from the same speaker that the program currently
    % works
    if File(j).name(1:4) == speaker,
        % get testsignal
        loga_number = eval(File(j).name(7:9));
        loga_name = iloga2sloga(loga_number)
        cd(correcttemplatedir); %change to templatedirectory
        [testsignal, sfreq] = wavread(File(j).name);
        if Verbose
          figure;
          plot((0:1/sfreq:(length(testsignal)-1)/sfreq),testsignal);
          set(gca,'FontSize',16);
          xlabel('Time (s)');
          ylabel('Amplitude (arb.units)');
          title(loga_name);
          %sound(testsignal,sfreq);
        end
        cd(actualdirectory);
        % preprocessing = cut & add white noise/silence in front
        testsignal = preproc(testsignal, sfreq, vocabularyset,pcondition,loga_number);
    
        if Verbose,
            figure;
            plot((0:1/sfreq:(length(testsignal)-1)/sfreq),testsignal);
            set(gca,'FontSize',16);
            xlabel('Time (s)');
            ylabel('Amplitude (arb.units)');
            title(loga_name);
            hold on;
            plot(ones(1:500,1)*(length(testsignal)-(length(testsignal)-0.4*sfreq)*0.25)/sfreq,(0:1/500:1-1/500),'k');
        end

        
        if strcmp(pcondition.noiselevel,'nobackgroundnoise')
               ;
        else
            backgroundnoise = backnoise.icranoise_test{getnr_fromvocabularyset(vocabularyset)};
            % set noise level
            if strcmp(pcondition.auditorymodel,'MAP')
                backgroundnoise = backgroundnoise./sqrt(mean(backgroundnoise.^2)).*10^(-(94-pcondition.noiselevel)/20);
                %20*log10(sqrt(mean(backgroundnoise.^2))/20e-6) %reference pressure: 20uPa
            else
                backgroundnoise = backgroundnoise./rms(backgroundnoise)/db2factor(pcondition.noiselevel);
            end
            % set initial sample at random for creating random noise.
            in_samp = 1;%ceil(500*rand);
            backgroundnoise = backgroundnoise(in_samp:length(testsignal)+in_samp-1);
            testsignal = testsignal + backgroundnoise;
        end
            
        testsignal = soft_onset(testsignal, sfreq, 0.05); %50 ms fade in für soften onset am anfang
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % ab hier hören!
        %
        % hörschwellensimulierendes rauschen
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if fluctuating_htsn == 1;
            %Gleichgewichtung aller Frequenzen
            %actual_audiogram = pcondition.audiogram+pcondition.fluctuating_to_add(loga_number);
            
            %Tiefe Frequenzen staerker verrauscht
            %actual_audiogram = pcondition.audiogram+(2*pcondition.fluctuating_to_add(loga_number)-...
            %    [0:1/10*2*pcondition.fluctuating_to_add(loga_number):2*pcondition.fluctuating_to_add(loga_number)]);
            
            %Hohe Frequenzen staerker verrauscht
            actual_audiogram = pcondition.audiogram+(2*pcondition.fluctuating_to_add(loga_number)-...
                [2*pcondition.fluctuating_to_add(loga_number):-1/10*2*pcondition.fluctuating_to_add(loga_number):0]);
                       
        else
            actual_audiogram = pcondition.audiogram;
        end
        if strcmp(pcondition.auditorymodel,'MAP')
        else
            if ~isfield(hearing_impairment,'internalnoise')
                %add hearing threshold simulating noise
                hear_thres_noise = masknoise(actual_audiogram,length(testsignal),pcondition.audiogramfreqs,sfreq)./1e5;   %HERE SET IN THE AUDIOGRAM
                %1e5 is the factor to come from rainer beutelmanns implementation to pemo-level
                hear_thres_noise = hear_thres_noise(:,1); % take only the left ears threshold simulating noise
                testsignal = hear_thres_noise + testsignal;
            end
        end
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        % control of preprocessing by printing pemo-input
        if (j == 2) && strcmp(vocabularyset,'a_a'),
            f_preproc = figure,plot(testsignal);
            if (ischar(pcondition.noiselevel))
              tempstring = [pcondition.noiselevel,'_',num2str(pcondition.speechlevel)];
            else
              tempstring = [num2str(pcondition.noiselevel),'_',num2str(pcondition.speechlevel)];
            end
            tosave_filenamestring = ['atta_pp_',tempstring,'.mat'];
            save(tosave_filenamestring,'testsignal');
%             saveas(f_preproc,[loga_name,'_pp_',tempstring,'.fig']);
%             saveas(f_preproc,[loga_name,'_pp_',tempstring,'.jpg']);
            close(f_preproc);
        end
        
        
        if pcondition.use_mfb == 1
            %%%%%%%%%%%% PEMO %%%%%%%%%%%%%%%%%%%%%
            if strcmp(pcondition.auditorymodel,'CASP_Diss')
                IR_testtmp = pemo_preproc(testsignal,sfreq);%, sfreq,pcondition.nrmodchan);
                if iscell(IR_testtmp)
                    IR_testsignal = IR_testtmp;
                else
                    IR_testsignal{1} = IR_testtmp(:,:,1)';
                    IR_testsignal{2} = IR_testtmp(:,:,2)';
                    IR_testsignal{3} = IR_testtmp(:,:,3)';
                    IR_testsignal{4} = IR_testtmp(:,:,4)';
                    %             if ~isempty(IR_vocabultmp(:,:,5))
                    %                 error('IR_vocabul hat mehr Modulationsfilterbankkanäle als ausgewertet werden.')
                end
            elseif strcmp(pcondition.auditorymodel,'CASP_2011')
                IR_testtmp = casp_preproc(testsignal,0);%, sfreq,pcondition.nrmodchan);
                if iscell(IR_testtmp)
                    IR_testsignal = IR_testtmp;
                else
                    IR_testsignal{1} = IR_testtmp(:,:,1)';
                    IR_testsignal{2} = IR_testtmp(:,:,2)';
                    IR_testsignal{3} = IR_testtmp(:,:,3)';
                    IR_testsignal{4} = IR_testtmp(:,:,4)';
                    %             if ~isempty(IR_vocabultmp(:,:,5))
                    %                 error('IR_vocabul hat mehr Modulationsfilterbankkanäle als ausgewertet werden.')
                end
            elseif strcmp(pcondition.auditorymodel,'PEMO')
                IR_testsignal = pemo_mfb_tim(testsignal,sfreq,pcondition.nrmodchan);
                % the original normal-hearing model
            elseif strcmp(pcondition.auditorymodel,'PEMOSH')
                IR_testsignal = pemo_mfb_hi_schelle1_tim(testsignal,sfreq,hearing_impairment.audiogram,pcondition.nrmodchan);
                % schelles hearing-impaired model
            elseif strcmp(pcondition.auditorymodel,'MAP')
                MAP1_14(testsignal,sfreq,-1,pcondition.parameterfile,'probability')
                global ANprobRateOutput savedBFlist
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
                
                %calculate timing pattern
                formantpattern = fourierautocorrelationhistogram_direct_new(AN_HSRoutput,sfreq,savedBFlist);
                
                %concatenate the features
                IR_testsignal = [ANsmooth(:,1:min([size(ANsmooth,2) size(formantpattern,2)])); ...
                    1/10.*formantpattern(:,1:min([size(ANsmooth,2) size(formantpattern,2)]))];
                
            else
                error('auditory model not found!')
            end

        elseif pcondition.use_mfb == 0
            IR_testsignal{1} = pemo_tim(testsignal,sfreq);

        end
    
        if Verbose,
            figure;
            imagesc((0:1/100:(size(IR_testsignal,2)-1)/100),[],IR_testsignal);
            set(gca,'FontSize',16);
            axis xy;
            axis tight;
            xlabel('Time (s)');
            ylabel('# Channel');
            colorbar;        
        end
    
        % cut IR of (white,ol) noise / silence in front
        if strcmp(pcondition.auditorymodel,'MAP')
            IR_testsignal = IR_testsignal(:,41:end);
        else
            for mod_freq = 1:length(IR_testsignal)
                IR_testsignal{mod_freq} = IR_testsignal{mod_freq}(:,41:end);
            end
        end
        
        if pcondition.use_mfb == 0
            if pcondition.use_lpc == 1;
                [arearatios,a_values,k_values] = perceptive_linear_prediction_arearatios(IR_testsignal{1},pcondition.lpc_order);
                %IR_testsignal{1} = a_values;%arearatios;%k_values;
                 %smooth internal representation due to LPC-values
                out_IR = smoothedLPC_IR(a_values,IR_testsignal{1});%,tmpIR_vorher);
                IR_testsignal{1} = out_IR;
            end
        end
       
        % equalize testsignal-IR in time damit in allen
        % modulationsfrequenz-IRs die zeit gleich ist.
        if strcmp(pcondition.auditorymodel,'MAP')
        else
            zeitlaenge = min(cellfun('size',IR_testsignal,2)); %minimal timelength of the modulation frequency layers
            for mod_freq = 1:length(IR_testsignal)
                IR_testsignal{mod_freq} = IR_testsignal{mod_freq}(:,1:zeitlaenge);
            end
        end
        
        %%%%%look especially at the middle phoneme, new: Aug.09
%         time_weight = repmat([zeros(1,7)+0.5 zeros(1,32-8)+4 zeros(1,size(IR_testsignal{1},2)-32+1)+0.5],size(IR_testsignal{1},1),1);
%         if size(time_weight,2) > size(IR_testsignal{1},2)
%             time_weight = time_weight(:,1:size(IR_testsignal{1},2));
%         end
%         IR_testsignal{1} = IR_testsignal{1}.*time_weight;
%         IR_testsignal{2} = IR_testsignal{2}.*time_weight;
%         IR_testsignal{3} = IR_testsignal{3}.*time_weight;
%         IR_testsignal{4} = IR_testsignal{4}.*time_weight;
        %%%%%
        
        
       if Verbose,
            figure;
            imagesc((0:1/100:(size(IR_testsignal{1},2)-1)/100),[],IR_testsignal{1});
            set(gca,'FontSize',16);
            axis xy;
            axis tight;
            xlabel('Time (s)');
            ylabel('# Channel');
            title('Internal Representation ModulationChannel 1(lowpass at 2.5Hz)')
            colorbar;         
        end

    % determine distance between testsignal and vocabulary-templates
        for k = 1:length(vocabulary) 
            if strcmp(pcondition.auditorymodel,'MAP')
                %%%%%DTW%%%%%%
                if strcmp(pcondition.speechrecognizer,'DTW')
                    distance(j,k) = dynamictimewarp(vocabulary(k).IR,IR_testsignal,pcondition.distancemeasure);
                end
            else 
                % equalize template-IRs in time
                zeitlaenge = min(cellfun('length',vocabulary(k).IR(1,:)));%minimal timelength of the modulation frequency layers
                for mod_freq = 1:length(vocabulary(k).IR)
                    vocabulary(k).IR{mod_freq} = vocabulary(k).IR{mod_freq}(:,1:zeitlaenge);
                end
                %%%%%DTW%%%%%%
                if strcmp(pcondition.speechrecognizer,'DTW')
                    distance(j,k) = dynamictimewarp_mfb(vocabulary(k).IR,IR_testsignal,pcondition.distancemeasure);
                end
            end
        end
        
        
    %% select minimal mean distance (optional), attention: recordings
        % must be in correct order!
        if min_mean_distance == 1
            distances_in_categories = cell(1,nFiles);
            i = 1;
            only_one_loga(1) = 0; %numerates number of logatomes
            for k = 1:length(vocabulary) %loop for every vocabulary-entry 
                if(find(only_one_loga == vocabulary(k).number))
                    i = find(only_one_loga == vocabulary(k).number);
                elseif(only_one_loga(i) == 0)
                    only_one_loga(i) = vocabulary(k).number;
                else
                    i = length(only_one_loga)+1; %do this only if a new logatome is given
                    only_one_loga(i) = vocabulary(k).number;
                    
                end
             
                distances_in_categories{i}(end+1) = distance(j,k); 
            end
            [tmp,index] = min(cellfun(@mean,distances_in_categories));
            recname = iloga2sloga(only_one_loga(index))
            actual_col = only_one_loga(index);
        elseif min_mean_distance == 0
            % starting point for "identical" model configuration
            [tmp, index] = min(distance(j,:));
            recname = vocabulary(index).name
            actual_col = vocabulary(index).number;
        elseif min_mean_distance == 2
            % proposal by Inga Holube: if many response alternatives are
            % close to one another-> random choice
            [tmp, min_index] = min(distance(j,:));
            hochzaehler = 1;
            for k = 1:length(distance(j,:))
                %collect all response alternatives that are close
                if (distance(j,k) - 5) < distance(j,min_index) %2.3 is std of distances in deep noise
                    index(hochzaehler) = k;
                    hochzaehler = hochzaehler+1;
                end
            end
            %random choice from close response alternatives
            random_index_index = randperm(length(index));
            random_index_index = random_index_index(1);
            index = index(random_index_index);
            
            recname = vocabulary(index).name
            actual_col = vocabulary(index).number;
        else
            error('min_mean_distance not set properly!');
        end
        % write recognizing results to convolution matrix, where columns are
        % single vocabulary logatomes and rows are single test logatomes;
        % 1 for recognized, 0 for not recognized
        actual_row = sloga2iloga(loga_name);
    
        % if more than one template for a logatome write it in same column of
        % convolution matrix

        CM(actual_row,actual_col) = CM(actual_row,actual_col)+1;
        %close all;
    else
        ;
    end
end

%%% output: MAT, HTML, Confusion Matrix
save([filename_to_save '.mat'], 'CM', 'distance');
printhtmlpage([filename_to_save '.html'],vocabulary,File,CM,distance,sfreq,pcondition,filename_to_save);


if Verbose,
    figure,imagesc(CM);
    colormap(abs(gray-1));
    set(gca,'FontSize',16);
    xlabel('Recognized No. of Logatome');
    ylabel('Presented No. of Logatome');
end
