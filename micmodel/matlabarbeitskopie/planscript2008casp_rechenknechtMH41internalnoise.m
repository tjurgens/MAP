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
pcondition.audiogram = [30 20 20 25 25 25 30 50 50 65 80];
pcondition.audiogramfreqs = [];
pcondition.nrmodchan = 4;

%Berechnung des OHC/IHC Verlustes
[hearing_impairment.OHC,hearing_impairment.IHC] = haircell_loss_from_audiogram(pcondition.audiogram);

%initial_sample of internal noise(length: 10s)

load('internal_noise_after_drnl_nh.mat'); %D:\tim\AFC_june2008\calibration\
hearing_impairment.CF = CF;
hearing_impairment.internalnoise = internalnoise;
% 
for i = 1:1   %ca.16std.
   workingdirectory = ['/home/tim/modelidenticalCASPhiMH41lorentzinternalnoise/daten/identicalrunninglorentz' num2str(i) '/S02M_NO/'];
   cd(workingdirectory);
    backnoiseshift = i;
   

  %%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%

    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 20;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

    %%%%% zweiter block -5 dB SNR %%%%%%%%%%%%%%%
    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 25;
% 
%     %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
%  
%     
    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 30;  
% 
%     %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% %     
%     %%%%%%% dritter block +5 dB SNR %%%%%%%%%%%%%%%
    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 35;  
% 
%     %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
%     
    

    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 40;  
% 
%     %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

%     
   pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 45;  
% 
%     %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% 
%    
    %%%%%%% fünfter block +10 dB SNR %%%%%%%%%%%%%%%
    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 50;  

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% 
%     %%%%%%% erster block -15 dB SNR %%%%%%%%%%%%%%%
%     
%    
% 
    %%%%%% dritter block -20 dB SNR %%%%%%%%%%%%%%%
    pcondition.noiselevel = 75;
    pcondition.speechlevel = 60;

    
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

    
    %%%%%% dritter block -20 dB SNR %%%%%%%%%%%%%%%
    pcondition.noiselevel = 70;
    pcondition.speechlevel = 60;

    
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    
     %%%%%% dritter block -20 dB SNR %%%%%%%%%%%%%%%
    pcondition.noiselevel = 65;
    pcondition.speechlevel = 60;

    
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    
    
        %%%%%% dritter block -20 dB SNR %%%%%%%%%%%%%%%
    pcondition.noiselevel = 60;
    pcondition.speechlevel = 60;

    
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

    %%%%%% dritter block -20 dB SNR %%%%%%%%%%%%%%%
    pcondition.noiselevel = 55;
    pcondition.speechlevel = 60;

    
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

    %%%%%% dritter block -20 dB SNR %%%%%%%%%%%%%%%
    pcondition.noiselevel = 50;
    pcondition.speechlevel = 60;

    
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

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