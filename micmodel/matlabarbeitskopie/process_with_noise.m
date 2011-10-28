function [outputsignal,sfreq] = process_with_noise(inputsignal,sfreq,pcondition,backnoise,vocabularyset)

% This function processes an input signal according to the noise
% specifications indicated in the input parameters
% input: inputsignal: ollo speech sample
% sfreq: sampling frequency
% pcondition: peripheral condition structure, contains, e.g., noise level
%             and speech level
% backnoise: background noise passage

if strcmp(pcondition.noiselevel,'nobackgroundnoise')
    ;
else
    %backnoise has different fieldnames in test and training condition,
    %thats why get the fieldname now
    fieldname_of_backnoise = fieldnames(backnoise);
    eval(['backgroundnoise = backnoise.' fieldname_of_backnoise{1} '{getnr_fromvocabularyset(vocabularyset)};']);
    % set noise level
    if strcmp(pcondition.auditorymodel,'MAP')
        backgroundnoise = backgroundnoise./sqrt(mean(backgroundnoise.^2)).*10^(-(94-pcondition.noiselevel)/20);
        %20*log10(sqrt(mean(backgroundnoise.^2))/20e-6) %reference pressure: 20uPa
    else
        backgroundnoise = backgroundnoise./rms(backgroundnoise)/db2factor(pcondition.noiselevel);
    end
    backgroundnoise = backgroundnoise(1:length(inputsignal));
    inputsignal = inputsignal + backgroundnoise;
end
%%
inputsignal = soft_onset(inputsignal, sfreq, 0.05); %50 ms fade in für soften onset am anfang


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
        hear_thres_noise = masknoise(pcondition.audiogram,length(inputsignal),pcondition.audiogramfreqs,sfreq)./1e5;   %HERE SET IN THE AUDIOGRAM
        %1e5 is the factor to come from rainer beutelmanns implementation to pemo-level
        hear_thres_noise = hear_thres_noise(:,1); % take only the left ears threshold simulating noise
        inputsignal = hear_thres_noise + inputsignal;
    end
end
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
outputsignal = inputsignal;

