function planscript2008casp
global backnoiseshift 
global hearing_impairment
addpath /home/tim/matlab;
addpath /home/tim/matlab/PEMO;
addpath /home/tim/matlab/PEMO/gfb_new;
addpath /home/tim/AFC_june2008/AFC_june2008/models;
addpath /home/tim/AFC_june2008/AFC_june2008;

%backnoiseshift = 1;
   casp_initialize;
   
tic
speaker = 'S02M';
pcondition.audiogram = [5 5 10 10 15 15 50 55 55 35 25];
pcondition.audiogramfreqs = [];
pcondition.nrmodchan = 4;
hearing_impairment = [];

% 
for i = 1:10   %ca.16std.
   workingdirectory = ['/home/tim/modelidenticalCASPhiIH58lorentz/daten/testesttotalunterschiedlichbeitemplatesallegleichidenticalrunninglorentz' num2str(i) '/S02M_NO/'];
   cd(workingdirectory);
    backnoiseshift = i;
   

  %%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%

%     pcondition.noiselevel = 60;
%     pcondition.speechlevel = 60;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

    %%%%% zweiter block -5 dB SNR %%%%%%%%%%%%%%%
    pcondition.noiselevel = 64;
    pcondition.speechlevel = 60;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
%  
%     
%     pcondition.noiselevel = 55;
%     pcondition.speechlevel = 60;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% %     
%     %%%%%%% dritter block +5 dB SNR %%%%%%%%%%%%%%%
%     pcondition.noiselevel = 50;
%     pcondition.speechlevel = 60;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
%     
%     
%     pcondition.noiselevel = 45;
%     pcondition.speechlevel = 60;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

%     
    % %%%%%%% dritter block +5 dB SNR %%%%%%%%%%%%%%%
%     pcondition.noiselevel = 70;
%     pcondition.speechlevel = 60;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% 
%    
%     %%%%%%% fünfter block +10 dB SNR %%%%%%%%%%%%%%%
%     pcondition.noiselevel = 75;
%     pcondition.speechlevel = 60;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% 
%     %%%%%%% erster block -15 dB SNR %%%%%%%%%%%%%%%
%     
%    
% 
%     %%%%%% dritter block -20 dB SNR %%%%%%%%%%%%%%%
%     pcondition.noiselevel = 80;
%     pcondition.speechlevel = 60;
% 
%     
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
%     
%     
%     %%%%%% vierter block -10 dB SNR %%%%%%%%%%%%%%%
%     pcondition.noiselevel = 'nobackgroundnoise';
%     pcondition.speechlevel = 55;
% 
%     %
%     cd(workingdirectory);
%     %make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
%     %%%%%%% dritter block -20 dB SNR %%%%%%%%%%%%%%%
%     pcondition.noiselevel = 'nobackgroundnoise';
%     pcondition.speechlevel = 37;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% if i == 9
%     ;
% else
%     % % %%%%%%% erster block -25 dB SNR %%%%%%%%%%%%%%%
%     pcondition.audiogram = zeros(11,2);
%     pcondition.noiselevel = 85;
%     pcondition.speechlevel = 60;
% 
%     % %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% end
% 
%     %%%%%%% zweiter block -30 dB SNR %%%%%%%%%%%%%%%
%     pcondition.noiselevel = 90;
%     pcondition.speechlevel = 60;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

end
toc