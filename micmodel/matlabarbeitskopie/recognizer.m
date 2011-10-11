function [CM, distance] = recognizer(pcondition,speaker)

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

tic
homedir = pwd;
underlines = findstr(homedir,'_');
vocabularyset = homedir(underlines(2)-1:underlines(2)+1);
matlabpath = 'd:\tim\matlab\';
backnoise = load([matlabpath,'icranoise_16k.mat']);

if pcondition.noiselevel == 'nobackgroundnoise'
    filename_voc = sprintf('speech%i_noise%s_%s',pcondition.speechlevel,pcondition.noiselevel,vocabularyset);
else
    filename_voc = sprintf('speech%i_noise%i_%s',pcondition.speechlevel,pcondition.noiselevel,vocabularyset);
end

%load(['../vocabulary/Internal_Representations/cw' vocabularyset]);
load([homedir(1:underlines(2)+1) filesep 'vocabulary' filesep 'Internal_Representations' filesep filename_voc]);

Verbose = 0;
CM = zeros(150);
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

        % preprocessing = cut & add white noise
        testsignal = preproc(testsignal, sfreq, vocabularyset,pcondition);
    
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

        % set noise level
        if pcondition.noiselevel == 'nobackgroundnoise'
               ;
        else
            
            backgroundnoise = backnoise.icranoise_re;
            backgroundnoise = backgroundnoise./rms(backgroundnoise)/db2factor(pcondition.noiselevel);
         %set here random initial sample for creating random noise.
            in_samp = ceil(500*rand);
            backgroundnoise = backgroundnoise(in_samp:length(testsignal)+in_samp-1);
            testsignal = testsignal + backgroundnoise;
            %backgroundnoise = 2*(rand(length(vocabul),1)-0.5);
            %backgroundnoise = backgroundnoise./2^((100-pcondition.noiselevel)/(20*log10(2)));
        end
            
    
        % control of preprocessing by printing pemo-input
        if (j == 2) && strcmp(vocabularyset,'a_a'),
            f_preproc = figure,plot(testsignal);
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
        IR_testsignal = pemo_tim(testsignal, sfreq);
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
    
        % cut IR of (white,ol) noise
        IR_testsignal = IR_testsignal(:,41:end);
       if Verbose,
            figure;
            imagesc((0:1/100:(size(IR_testsignal,2)-1)/100),[],IR_testsignal);
            set(gca,'FontSize',16);
            axis xy;
            axis tight;
            xlabel('Time (s)');
            ylabel('# Channel');
            colorbar;     
            %hold on;
            %plot((0:1/100:(size(IR_testsignal,2)-1)/100),ones(1,size(IR_testsignal,2))*15,'k');
            %plot(ones(1,size(IR_testsignal,1))*(ceil(size(IR_testsignal,2)*0.75))/100,(1:size(IR_testsignal,1)),'k');
     
      end

    % determine distance between testsignal and vocabulary-templates
        for k = 1:length(vocabulary) 
            distance(j,k) = dynamictimewarp(vocabulary(k).IR,IR_testsignal);
        end
    
        % select minimal mean distance if wished
        if min_mean_distance
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
                addeddistance(j,i) = addeddistance(j,i)+distance(j,k);
            end
           
            [tmp, index] = min(addeddistance(j,:));
            recname = iloga2sloga(only_one_loga(index))
            actual_col = only_one_loga(index);
        else
            [tmp, index] = min(distance(j,:));
            recname = vocabulary(index).name
            actual_col = vocabulary(index).number;
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

%%% output: MAT, HTML, Convolution Matrix
save([filename_voc '.mat'], 'CM', 'distance');
printhtmlpage([filename_voc '.html'],vocabulary,File,CM,distance,sfreq,pcondition,filename_voc);
toc

if Verbose,
    figure,imagesc(CM);
    colormap(abs(gray-1));
    set(gca,'FontSize',16);
    xlabel('Recognized No. of Logatome');
    ylabel('Presented No. of Logatome');
end
