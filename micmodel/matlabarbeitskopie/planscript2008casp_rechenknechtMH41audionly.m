function planscript2008casp
global backnoiseshift 
global hearing_impairment
addpath /net/medisan/home/tim/matlab;
addpath /net/medisan/home/tim/matlab/PEMO;
addpath /net/medisan/home/tim/matlab/PEMO/gfb_new;
addpath /net/medisan/home/tim/AFC_june2008/AFC_june2008/models;
addpath /net/medisan/home/tim/AFC_june2008/AFC_june2008;

%backnoiseshift = 1;
   casp_initialize;
   
tic
speaker = 'S02M';
pcondition.audiogram = [35 40 30 25 20 25 40 50 50 80 75];
pcondition.audiogramfreqs = [];
pcondition.nrmodchan = 4;
hearing_impairment = [];

% 
for i = 1:10   %ca.16std.
   workingdirectory = ['/net/medisan/home/tim/neumodelidenticalCASPhiMH41lorentz/daten/testesttotalunterschiedlichbeitemplatesallegleichidenticalrunninglorentz' num2str(i) '/S02M_NO/'];
   cd(workingdirectory);
    backnoiseshift = i;
   

  %%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%

    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 35;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

%%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%

    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 40;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    
    %%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%

    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 45;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    
    %%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%

    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 50;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

    %%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%

    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 55;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

    %%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%

    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 60;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    
    %%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%

    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 65;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);




end
toc