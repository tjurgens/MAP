function planscript061110

tic;% 
% %%%%%%% erster block realistic 0 dB SNR %%%%%%%%%%%%%%%
   pcondition.audiogram = zeros(11,2);
   pcondition.noiselevel = 65;
   pcondition.speechlevel = 65;
   pcondition.nrmodchan = 4;
  speaker = 'S02M';
% % 
%    cd('d:\tim\S02M_NOtestMFB4mehrerevockombination2');
%    %make_all_vocabulary_mfb('S02M_NO',pcondition);
%    %recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%   [BIG_CM, hitrate] = sumup_cm('S02M_NOtestMFB4mehrerevockombination2',pcondition);
% % 
%    cd('d:\tim\S02M_NOtestMFB4mehrerevockombination3');
%    make_all_vocabulary_mfb('S02M_NO',pcondition);
%    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%    [BIG_CM, hitrate] = sumup_cm('S02M_NOtestMFB4mehrerevockombination3',pcondition);
%  
   cd('d:\tim\S02M_NOtestMFB4mehrerevockombination4');
   %make_all_vocabulary_mfb('S02M_NO',pcondition);
   recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
   [BIG_CM, hitrate] = sumup_cm('S02M_NOtestMFB4mehrerevockombination4',pcondition);
%  
   cd('d:\tim\S02M_NOtestMFB4mehrerevockombination5');
   make_all_vocabulary_mfb('S02M_NO',pcondition);
   recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
   [BIG_CM, hitrate] = sumup_cm('S02M_NOtestMFB4mehrerevockombination5',pcondition);
%  
   cd('d:\tim\S02M_NOtestMFB4mehrerevockombination6');
   make_all_vocabulary_mfb('S02M_NO',pcondition);
   recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
 % % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
   [BIG_CM, hitrate] = sumup_cm('S02M_NOtestMFB4mehrerevockombination6',pcondition);
   
   cd('d:\tim\S02M_NOtestMFB4mehrerevockombination7');
   make_all_vocabulary_mfb('S02M_NO',pcondition);
   recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
  [BIG_CM, hitrate] = sumup_cm('S02M_NOtestMFB4mehrerevockombination7',pcondition);
% 
   cd('d:\tim\S02M_NOtestMFB4mehrerevockombination8');
   make_all_vocabulary_mfb('S02M_NO',pcondition);
   recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
   [BIG_CM, hitrate] = sumup_cm('S02M_NOtestMFB4mehrerevockombination8',pcondition);
%  
   cd('d:\tim\S02M_NOtestMFB4mehrerevockombination9');
   make_all_vocabulary_mfb('S02M_NO',pcondition);
   recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
   [BIG_CM, hitrate] = sumup_cm('S02M_NOtestMFB4mehrerevockombination9',pcondition);
%  
   cd('d:\tim\S02M_NOtestMFB4mehrerevockombination10');
   make_all_vocabulary_mfb('S02M_NO',pcondition);
   recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
   [BIG_CM, hitrate] = sumup_cm('S02M_NOtestMFB4mehrerevockombination10',pcondition);
%  
   cd('d:\tim\S02M_NOtestMFB4mehrerevockombination11');
   make_all_vocabulary_mfb('S02M_NO',pcondition);
   recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
 % % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
   [BIG_CM, hitrate] = sumup_cm('S02M_NOtestMFB4mehrerevockombination11',pcondition);
   
   cd('d:\tim\S02M_NOtestMFB4mehrerevockombination12');
   make_all_vocabulary_mfb('S02M_NO',pcondition);
   recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
 % % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
   [BIG_CM, hitrate] = sumup_cm('S02M_NOtestMFB4mehrerevockombination12',pcondition);
   
   
%     cd('d:\tim\pemoollonhicra\identical8');
%  make_all_vocabulary_mfb('S02M_NO',pcondition);
%  recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%  [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
%     cd('d:\tim\pemoollonhicra\identical9');
%  make_all_vocabulary_mfb('S02M_NO',pcondition);
%  recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%  [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
%     cd('d:\tim\pemoollonhicra\identical10');
%  make_all_vocabulary_mfb('S02M_NO',pcondition);
%  recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%  [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
%     cd('d:\tim\pemoollonhicra\identical11');
%  make_all_vocabulary_mfb('S02M_NO',pcondition);
%  recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%  [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
%     cd('d:\tim\pemoollonhicra\identical12');
%  make_all_vocabulary_mfb('S02M_NO',pcondition);
%  recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%  [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
 toc;
 