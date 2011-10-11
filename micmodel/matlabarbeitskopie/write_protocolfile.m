function write_protocolfile(pcondition, workingdirectorynumber, simwork)

%this function writes the protocol file in the respective directory of the
%data that should be modelled
% (c) Tim Juergens

global hearing_impairment
global fluctuating_htsn
global simdef
%%
%%%% Write Protocol file %%%%%
pcondition.prot_filename = ['protocol_speech' num2str(pcondition.speechlevel) 'dB_noise' num2str(pcondition.noiselevel) 'dB.log'];
prot_file_ID = fopen(pcondition.prot_filename,'a');
time_vector = clock;
time_string = [num2str(time_vector(1)) ' ' num2str(time_vector(2)) ' ' num2str(time_vector(3)) ...
     ' ' num2str(time_vector(4))  ' ' num2str(time_vector(5))  ' ' num2str(time_vector(6))];
fprintf(prot_file_ID,'Time Stamp: %s\n\n\n',time_string);

%%%% peripheral conditions
fprintf(prot_file_ID,'Speech Level: %d dB\n',pcondition.speechlevel);
if isstr(pcondition.noiselevel)
    fprintf(prot_file_ID,'Noise Level: %s \n\n\n', pcondition.noiselevel);
else
    fprintf(prot_file_ID,'Noise Level: %d dB\n\n\n', pcondition.noiselevel);
end

%%%% Subject specific data
fprintf(prot_file_ID,'Audiogram data: %s \n', num2str(pcondition.audiogram));
if isempty(pcondition.audiogramfreqs)
    fprintf(prot_file_ID,'Audiogram Freqs: default\n');
else
    fprintf(prot_file_ID,'Audiogram Freqs: %s\n', num2str(pcondition.audiogramfreqs));
end
fprintf(prot_file_ID,'Subject ID: %s\n',pcondition.subjectID);
fprintf(prot_file_ID,'Additional subject specific parameters: \n');
if isfield(pcondition,'k_fit')
  fprintf(prot_file_ID,'k_fit: %s\n',num2str(pcondition.k_fit));
end
if ~isempty(simdef)
    if isfield(simdef,'OHC')
        fprintf(prot_file_ID,'OHC": %d\n',simdef.OHC);
    end
    if isfield(simdef,'IHC')
        fprintf(prot_file_ID,'IHC": %d\n',simdef.IHC);
    end
end

% if ~isempty(hearing_impairment)
%     if isfield(hearing_impairment,'OHC')
%         fprintf(prot_file_ID,'Flag "Hearing Impairment": %d\n',hearing_impairment.OHC);
%     end
%     if isfield(hearing_impairment,'a')
%         fprintf(prot_file_ID,'Attenuate signal in lower linear part of the DRNL: %s\n',hearing_impairment.a);
%     end
% else
%     fprintf(prot_file_ID,'Flag "Hearing Impairment": []\n');
% end
if fluctuating_htsn == 1
    fprintf(prot_file_ID,'Fluctuating Hearing Threshold: \n');
    fprintf(prot_file_ID,'%d ',pcondition.fluctuating_to_add);
end

if exist('simwork','var')
    if isfield(simwork,'CASP_use_abs_thres')
        fprintf(prot_file_ID,'Use absolute threshold according to Morten: %s\n',simwork.CASP_use_abs_thres);
    end
    if isfield(simwork,'CASP__use_internalnoise')
        fprintf(prot_file_ID,'Use internalnoise_at_the_end: %s\n',simwork.CASP_use_internalnoise);
    end
    if isfield(simwork,'CASP_internalnoise_var')
        fprintf(prot_file_ID,'STD of internal noise at the end: %s\n',num2str(simwork.CASP_internalnoise_var));
    end
end
    
fprintf(prot_file_ID,'\n\n\n');

%%%% Data important for model
fprintf(prot_file_ID,'Repetition session: %d\n', workingdirectorynumber);
fprintf(prot_file_ID,'Working directory path: %s\n', pcondition.workingdirectory);
fprintf(prot_file_ID,'Chance number to check status of rand: %.4f\n', rand);
fprintf(prot_file_ID,'Chance number to check status of randn: %.4f\n', randn);
fprintf(prot_file_ID,'Choice of the recognized response alternative: Least distance\n');
fprintf(prot_file_ID,'Speech Recognizer: DTW\n');
fprintf(prot_file_ID,'Perceptual Distance Measure: %s\n\n\n', pcondition.distancemeasure);
fprintf(prot_file_ID,'Auditory Model: %s\n', pcondition.auditorymodel);
fprintf(prot_file_ID,'Perception Model Details:\n');

if strcmp(pcondition.auditorymodel,'CASP_Diss') 
    temp_fid = fopen('ToneInNoise2_cfg.m','r');
    temp_rows = textscan(temp_fid,'%s','Delimiter','\n');
    for i = 1:length(temp_rows{1})
        fprintf(prot_file_ID,'%s\n',temp_rows{1}{i});
    end
    fclose(temp_fid);
    fprintf(prot_file_ID,'\n\n\n');
    temp_fid = fopen('speech_pemo_cfg.m','r');
    temp_rows = textscan(temp_fid,'%s','Delimiter','\n');
    for i = 1:length(temp_rows{1})
        fprintf(prot_file_ID,'%s\n',temp_rows{1}{i});
    end

    fclose(temp_fid);
elseif strcmp(pcondition.auditorymodel,'CASP_2011')
    temp_fid = fopen('micmodel_casp_cfg.m','r');
    temp_rows = textscan(temp_fid,'%s','Delimiter','\n');
    for i = 1:length(temp_rows{1})
        fprintf(prot_file_ID,'%s\n',temp_rows{1}{i});
    end
    fclose(temp_fid);
    fprintf(prot_file_ID,'\n\n\n');
    temp_fid = fopen('casp_cfg.m','r');
    temp_rows = textscan(temp_fid,'%s','Delimiter','\n');
    for i = 1:length(temp_rows{1})
        fprintf(prot_file_ID,'%s\n',temp_rows{1}{i});
    end

    fclose(temp_fid);
end
fclose(prot_file_ID);
%%%% End Writing Protocol File %%%
