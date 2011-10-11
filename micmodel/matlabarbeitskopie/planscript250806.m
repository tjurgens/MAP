function planscript
% 
% % %%%%%%% erster block -25 dB SNR %%%%%%%%%%%%%%%
  pcondition.audiogram = zeros(11,2);
  pcondition.noiselevel = 90;
  pcondition.speechlevel = 65;
  speaker = 'S02M';
% % 
%  cd ~;
% make_all_vocabulary('S02M_NO',pcondition);
% recognizeall('S02M_NO',pcondition,'rand_var_auswahl');
% recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
  [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% % %%%%%%% zweiter block -30 dB SNR %%%%%%%%%%%%%%%
  pcondition.noiselevel = 95;
  pcondition.speechlevel = 65;
%  speaker = 'S02M';
% % 
%  cd ~;
%  make_all_vocabulary('S02M_NO',pcondition);
%  recognizeall('S02M_NO',pcondition,'rand_var_auswahl');
%  recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
   [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

% %%%%%%% zweiter block -20 dB SNR %%%%%%%%%%%%%%%
 pcondition.noiselevel = 85
 pcondition.speechlevel = 65;
 speaker = 'S02M';
% 
 cd ~;
 %make_all_vocabulary('S02M_NO',pcondition);
 %recognizeall('S02M_NO',pcondition,'rand_var_auswahl');
 %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
  [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% SPEAKER 08 %%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% cd ~;
% % %%%%%%% erster block -25 dB SNR %%%%%%%%%%%%%%%
  pcondition.audiogram = zeros(11,2);
  pcondition.noiselevel = 90;
  pcondition.speechlevel = 65;
 speaker = 'S08F';
% 
% cd ~;
% make_all_vocabulary('S08F_NO',pcondition);
% recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);
% 
% %%%%%%% zweiter block -30 dB SNR %%%%%%%%%%%%%%%
 pcondition.noiselevel = 95;
 pcondition.speechlevel = 65;
% speaker = 'S08F';
% 
% cd ~;
% make_all_vocabulary('S08F_NO',pcondition);
% recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);

%%%%%%% zweiter block -20 dB SNR %%%%%%%%%%%%%%%
 pcondition.noiselevel = 85;
 pcondition.speechlevel = 65;
% speaker = 'S08F';
% 
% cd ~;
% make_all_vocabulary('S08F_NO',pcondition);
% recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);


