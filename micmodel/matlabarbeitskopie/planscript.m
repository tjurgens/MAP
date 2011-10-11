function planscript

tic;% 
% %%%%%%% erster block identical1 -10 dB SNR %%%%%%%%%%%%%%%
   pcondition.audiogram = zeros(11,2);
   pcondition.noiselevel = 75;
   pcondition.speechlevel = 65;
   pcondition.nrmodchan = 4;
  speaker = 'S02M';
% % 
  cd('d:\tim\pemoollonhicra\identical1');
 make_all_vocabulary_mfb('S02M_NO',pcondition);
 recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 


  cd('d:\tim\pemoollonhicra\identical4');
 make_all_vocabulary_mfb('S02M_NO',pcondition);
 recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
 
   cd('d:\tim\pemoollonhicra\identical5');
 make_all_vocabulary_mfb('S02M_NO',pcondition);
 recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
 
   cd('d:\tim\pemoollonhicra\identical6');
 make_all_vocabulary_mfb('S02M_NO',pcondition);
 recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
 
    cd('d:\tim\pemoollonhicra\identical7');
 make_all_vocabulary_mfb('S02M_NO',pcondition);
 recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    cd('d:\tim\pemoollonhicra\identical8');
 make_all_vocabulary_mfb('S02M_NO',pcondition);
 recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    cd('d:\tim\pemoollonhicra\identical9');
 make_all_vocabulary_mfb('S02M_NO',pcondition);
 recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    cd('d:\tim\pemoollonhicra\identical10');
 make_all_vocabulary_mfb('S02M_NO',pcondition);
 recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    cd('d:\tim\pemoollonhicra\identical11');
 make_all_vocabulary_mfb('S02M_NO',pcondition);
 recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    cd('d:\tim\pemoollonhicra\identical12');
 make_all_vocabulary_mfb('S02M_NO',pcondition);
 recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
 