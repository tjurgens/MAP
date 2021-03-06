
%options.outputDir='publishFiles';
%options.format='doc';
%options.showCode=false;
%publish('make_modelled_profiles_doc', options);
close all;


%use only max 20 at a time!!
profiles_to_show = { ...
%                     'AMU_R'; ...
%                     'ARA_L'; ...
%                     'ATY_L'; ...
%                     'AYA_L'; ...
%                     'BCR_L'; ...
%                     'BHA_R'; ...
%                     'BME_L'; ...
%                     'BME_R'; ...
%                     'CFO_R'; ...
%                     'CWA_L'; ...
%                     'DBR_R'; ...
%                     'DJE_L'; ...
%                     'DLE_R'; ...
%                     'DPA_L'; ...
%                     'DPE_L'; ...
%                     'ECR_L'; ...
%                     'GJO_R'; ...
%                     'HBO_R'; ...
                    
%                     'INE_L'; ...
%                     'JDO_R'; ...
%                     'JFI_R'; ...
%                     'JFL_R'; ...
%                     'JHO_L'; ...
%                     'JJO_L'; ...
%                     'JPA_R'; ...
%                     'JPR_L'; ...
%                     'JSA_L'; ...
%                     'JSI_L'; ...
%                     'JTH_R'; ...
%                     'KBE_L'; ...
%                     'KBR_L'; ...
%                     'KFR_R'; ...
                    
                    'KJO_L'; ...
                    'LAD_R'; ...
                    'LBR_L'; ...
                    'LKE_R'; ...
                    'MFR_L'; ...
                    'MNO_L'; ...
                    'PBU_L'; ...
                    'POS_L'; ...
                    'PRO_L'; ...
                    'PTO_R'; ...
                    'RBL_L'; ...
                    'RME_R'; ...
                    'SFO_R'; ...
%                     'JE_L'; ...
%                     'JSAN_R'; ...
                        };
                
profilepath = ['..' filesep 'profiles' filesep 'modelled_profiles'];
%hypothesespath = ['..' filesep 'profiles' filesep 'modelled_profiles' ...
%                    filesep 'Hypotheses'];
parameterpath = ['..' filesep 'parameterStore'];
addpath(parameterpath);
                
for iCounter = 1:length(profiles_to_show)
    disp(profiles_to_show{iCounter});
    open([profilepath filesep profiles_to_show{iCounter} '.fig']);
    %open([hypothesespath filesep profiles_to_show{iCounter} 'h.fig']);
    if strcmp(profiles_to_show{iCounter}(end),'L')
        parametersuffix = [profiles_to_show{iCounter}(1:2) ...
            lower(profiles_to_show{iCounter}(3)) 'left'];
    elseif strcmp(profiles_to_show{iCounter}(end),'R')
        parametersuffix = [profiles_to_show{iCounter}(1:2) ...
            lower(profiles_to_show{iCounter}(3)) 'right'];
    else
        warning(['the parameter file ' profiles_to_show{iCounter} ' couldnt be found']);
    end
    display_paramchanges(parametersuffix);
end