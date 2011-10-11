function planscript280806
% 
% % %%%%%%% 0dB SNR für Statistik %%%%%%%%%%%%%%%
tic;  
pcondition.audiogram = zeros(11,2);
  pcondition.noiselevel = 65;
  pcondition.speechlevel = 65;
  speaker = 'S02M';
% % 
  cd ~;
 %make_all_vocabulary('S02M_NO',pcondition);
 recognizeall('S02M_NO',pcondition,'alle17');
% recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
  %[BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
toc;