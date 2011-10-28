function pcondition = initialize_auditorymodel(subject,auditorymodel, parentdir);



if strcmp(subject,'Normal')
    pcondition.parameterfile = 'Normal100';
    pcondition.audiogram = zeros(1,11);
end


pcondition.auditorymodel = auditorymodel; %'MAP', 'PEMO', %CASP_Diss, CASP_2011, PEMO, or PEMOSH%
%% PATH & RANDOM INITIALIZE
addpath([parentdir 'matlabarbeitskopie' filesep]);

if strcmp(pcondition.auditorymodel,'PeMO')
    addpath([parentdir 'matlabarbeitskopie' filesep 'PEMO' filesep 'gfb_new']); 
elseif strcmp(pcondition.auditorymodel,'CASP_Diss')
    addpath([parentdir 'AFC_june2008' filesep 'AFC_june2008' filesep 'models']);
    addpath([parentdir 'AFC_june2008' filesep 'AFC_june2008']);
elseif strcmp(pcondition.auditorymodel,'CASP_2011')
    addpath([parentdir 'CASP_2011']);
    addpath([parentdir 'CASP_2011' filesep 'accessoires']);
elseif strcmp(pcondition.auditorymodel,'PEMO')
    addpath([parentdir 'matlabarbeitskopie' filesep 'PEMO']);
elseif strcmp(pcondition.auditorymodel,'PEMOSH')
    addpath([parentdir 'matlabarbeitskopie' filesep 'PEMOSH']);
elseif strcmp(pcondition.auditorymodel, 'MAP')
    addpath([parentdir '..' filesep 'MAP']);
    addpath([parentdir '..' filesep 'parameterStore']);
    addpath([parentdir '..' filesep 'userProgramsTim']);
    addpath([parentdir '..' filesep 'utilities']);
else error('auditory model not found')
end

% set model configuration
if exist('k_fit')
    pcondition.k_fit = k_fit;
else
    pcondition.k_fit = [0 0 0 0];
end
pcondition.audiogramfreqs = [];
pcondition.nrmodchan = 4;
fluctuating_htsn = 0;  %1 == fluctuating hearing threshold enabled

pcondition.speechrecognizer = 'DTW';
pcondition.distancemeasure = 'Euklid'; %Lorentz, Euklid, Absolut

if strcmp(pcondition.auditorymodel,'CASP_Diss') || strcmp(pcondition.auditorymodel,'CASP_2011')
    % INITIALIZE
    if strcmp(pcondition.auditorymodel,'CASP_2011')
        micmodel_casp_cfg;
        casp_cfg;
    end
    casp_initialize;
%     simwork.CASP_use_abs_thres = 'no';%'yes'; %use absolute threshold prediction by Morten in CASP
%      
%     if strcmp(simwork.CASP_use_abs_thres,'yes')
%         load('minlim.mat');
%         simwork.minlim = minlim;
%     end

    simwork.CASP_use_internalnoise = 'yes';%'no';
    simwork.CASP_internalnoise_var = 38;
elseif strcmp(pcondition.auditorymodel,'PeMo_SH')
    hearing_impairment.internalnoise_var = 9;
end

%% Calculation of OHC/IHC loss
%%%%%% configuration audionly %%%%%
%hearing_impairment = [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%global simdef;
%%%%%% configuration redcomp %%%%%%%%
 %simdef.hearing_impairment = 1; %enables the attenuation in the lower linear part of the I/O-characteristic
 %[hearing_impairment.OHC, hearing_impairment.IHC] = haircell_loss_from_audiogram(pcondition.audiogram); %takes a constant
 %percentage (default: 80%) of the audiogram as outer hair cell loss
 
 %if strcmp(pcondition.auditorymodel,'CASP_2011')
 %    [simdef.OHC, simdef.IHC, simdef.HCCF] = haircell_loss_from_KLS4CASP(pcondition.audiogram, [], pcondition.k_fit); %from KLS
 %elseif strcmp(pcondition.auditorymodel,'PeMo_SH')
 %    [hearing_impairment.OHC, hearing_impairment.IHC] = haircell_loss_from_KLS4PeMo(pcondition.audiogram, [], pcondition.k_fit); %from KLS
 %end
 %%center frequencies of drnl filters
%hearing_impairment.CF = 1000.*[0.2363    0.2894    0.3484    0.4142    0.4875    0.5691    0.6601    0.7614    0.8743...
%   1.0000    1.1401    1.2961    1.4699    1.6635    1.8792    2.1194    2.3871    2.6852...
%   3.0173    3.3873    3.7994    4.2585    4.7700    5.3397    5.9744    6.6814    7.4690];
% %% additionally cancel out the use of masknoise.m by setting the variable
% %%% hearing_impairment.internalnoise to a string -> this also cancels out the use of any internalnoise that is applied after DRNL;
%hearing_impairment.internalnoise = 'yes_steady'; %if this is set to 'yes_steady' a normal gaussian noise is set after MFB

%%%%% additionally change compression ratio %%%%%%
%hearing_impairment.c = 0.1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% additionally configuration intnoise %%%%%%
% load('internal_noise_after_drnl_nh.mat');
% hearing_impairment.internalnoise = internalnoise;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%% configuration pemosh_intnoise
 %hearing_impairment.audiogram(1,:) = [125 250 500 750 1000 1500 2000 3000 4000 6000 8000];
 %hearing_impairment.audiogram(2,:) = audiogram;
 %hearing_impairment.internalnoise = 'yes_steady'; %flag that cancels use of 'masknoise.m' as external noise, doen't matter what the text is.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%Implement fluctuating hearing threshold for normal-hearing listeners
%if fluctuating_htsn == 1
 %   std_of_fluctuating_to_add = 5; %[dB] standard deviation for fluctuating hearing threshold
    %for each of 150logatoms calculate one value to add to normal-hearing
    %threshold
  %  for i = 1:150
   %     pcondition.fluctuating_to_add(i) = std_of_fluctuating_to_add.*abs(randn);
 %   end
%end
