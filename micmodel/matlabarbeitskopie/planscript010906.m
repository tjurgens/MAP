function planscript010906
% 
% %%%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%
  pcondition.audiogram = zeros(11,2);
%  pcondition.noiselevel = 65;
%  pcondition.speechlevel = 65;
%  speaker = 'S02M';
% % % 
% %  cd ~;
% % % %make_all_vocabulary('S02M_NO',pcondition);
% %  recognizeall('S02M_NO',pcondition,'identical');
% % % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% %  [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % % 
% % % %%%%%%% zweiter block -5 dB SNR %%%%%%%%%%%%%%%
% %  pcondition.noiselevel = 70;
% %  pcondition.speechlevel = 65;
% %  speaker = 'S02M';
% % % 
% %  cd ~;
% % % make_all_vocabulary('S02M_NO',pcondition);
% % recognizeall('S02M_NO',pcondition,'identical');
% % % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% %  [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % % 
% % % %%%%%%% dritter block +5 dB SNR %%%%%%%%%%%%%%%
% %  pcondition.noiselevel = 60;
% %  pcondition.speechlevel = 65;
% %  speaker = 'S02M';
% % % 
% %  cd ~;
% % % make_all_vocabulary('S02M_NO',pcondition);
% % recognizeall('S02M_NO',pcondition,'identical');
% % % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% %  [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % % 
% % % %%%%%%% vierter block -10 dB SNR %%%%%%%%%%%%%%%
% %  pcondition.noiselevel = 75;
% %  pcondition.speechlevel = 65;
% %  speaker = 'S02M';
% % % 
% %  cd ~;
% % % make_all_vocabulary('S02M_NO',pcondition);
% % recognizeall('S02M_NO',pcondition,'identical');
% % % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% %  [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% % %%%%%%% fünfter block +10 dB SNR %%%%%%%%%%%%%%%
% %  pcondition.noiselevel = 55;
% %  pcondition.speechlevel = 65;
% %  speaker = 'S02M';
% % % 
% %  cd ~;
% % % make_all_vocabulary('S02M_NO',pcondition);
% % recognizeall('S02M_NO',pcondition,'identical');
% % % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% %  [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% %  % %%%%%%% erster block -15 dB SNR %%%%%%%%%%%%%%%
%  pcondition.audiogram = zeros(11,2);
%  pcondition.noiselevel = 80;
%  pcondition.speechlevel = 65;
%  speaker = 'S02M';
% % 
%  cd ~;
% %make_all_vocabulary('S02M_NO',pcondition);
% recognizeall('S02M_NO',pcondition,'identical');
% %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%  [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% % % %%%%%%% zweiter block +15 dB SNR %%%%%%%%%%%%%%%
% %  pcondition.noiselevel = 50;
% %  pcondition.speechlevel = 65;
% %  speaker = 'S02M';
% % % 
% %  cd ~;
% % % make_all_vocabulary('S02M_NO',pcondition);
% % recognizeall('S02M_NO',pcondition,'identical');
% % % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% %   [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % % 
% % %%%%%%% dritter block -20 dB SNR %%%%%%%%%%%%%%%
%  pcondition.noiselevel = 85;
%  pcondition.speechlevel = 65;
%  speaker = 'S02M';
% % 
%  cd ~;
% % make_all_vocabulary('S02M_NO',pcondition);
% recognizeall('S02M_NO',pcondition,'identical');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%   [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% % % %%%%%%% vierter block +20 dB SNR %%%%%%%%%%%%%%%
% %  pcondition.noiselevel = 45;
% %  pcondition.speechlevel = 65;
% %  speaker = 'S02M';
% % % 
% %  cd ~;
% % % make_all_vocabulary('S02M_NO',pcondition);
% % recognizeall('S02M_NO',pcondition,'identical');
% % % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% %   [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% % %%%%%%% fünfter block +25 dB SNR %%%%%%%%%%%%%%%
% %  pcondition.noiselevel = 40;
% %  pcondition.speechlevel = 65;
% %  speaker = 'S02M';
% % % 
% %  cd ~;
% % % make_all_vocabulary('S02M_NO',pcondition);
% % recognizeall('S02M_NO',pcondition,'identical');
% % % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% %  [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% % %%%%%%% sechster block +30 dB SNR %%%%%%%%%%%%%%%
% % pcondition.noiselevel = 35;
% % pcondition.speechlevel = 65;
% % speaker = 'S02M';
% % 
% % cd ~;
% % % make_all_vocabulary('S02M_NO',pcondition);
% % recognizeall('S02M_NO',pcondition,'identical');
% % % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% % [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% %%%%%%% sechster block in Ruhe %%%%%%%%%%%%%%%
% pcondition.noiselevel = 'nobackgroundnoise';
% pcondition.speechlevel = 65;
% speaker = 'S02M';
% 
% cd ~;
% % make_all_vocabulary('S02M_NO',pcondition);
% recognizeall('S02M_NO',pcondition,'identical');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% % % %%%%%%% erster block -25 dB SNR %%%%%%%%%%%%%%%
%   pcondition.audiogram = zeros(11,2);
%   pcondition.noiselevel = 90;
%   pcondition.speechlevel = 65;
%   speaker = 'S02M';
% % % 
% %  cd ~;
% % make_all_vocabulary('S02M_NO',pcondition);
% recognizeall('S02M_NO',pcondition,'identical');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%   [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % % 
% % %%%%%%% zweiter block -35 dB SNR %%%%%%%%%%%%%%%
  pcondition.noiselevel = 100;
  pcondition.speechlevel = 65;
  speaker = 'S02M';
% % 
%  cd ~;
  make_all_vocabulary('S02M_NO',pcondition);
recognizeall('S02M_NO',pcondition,'identical');
%  recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
   [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% SPEAKER 08 %%%%%%%%%%%%%%%%%%%%%%%%%%%5
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% cd ~;
% %%%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%
% pcondition.audiogram = zeros(11,2);
% pcondition.noiselevel = 65;
% pcondition.speechlevel = 65;
% speaker = 'S08F';
% 
% cd ~;
% % make_all_vocabulary('S08F_NO',pcondition);
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);
% 
% %%%%%%% zweiter block -5 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 70;
% pcondition.speechlevel = 65;
% speaker = 'S08F';
% 
% cd ~;
% % make_all_vocabulary('S08F_NO',pcondition);
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);
% 
% %%%%%%% dritter block +5 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 60;
% pcondition.speechlevel = 65;
% speaker = 'S08F';
% 
% cd ~;
% % make_all_vocabulary('S08F_NO',pcondition);
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);
% 
% %%%%%%% vierter block -10 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 75;
% pcondition.speechlevel = 65;
% speaker = 'S08F';
% 
% cd ~;
% % make_all_vocabulary('S08F_NO',pcondition);
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);
% 
% %%%%%%% fünfter block +10 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 55;
% pcondition.speechlevel = 65;
% speaker = 'S08F';
% 
% cd ~;
% % make_all_vocabulary('S08F_NO',pcondition);
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);
% 
% cd ~;
% % %%%%%%% erster block -15 dB SNR %%%%%%%%%%%%%%%
%  pcondition.audiogram = zeros(11,2);
%  pcondition.noiselevel = 80;
%  pcondition.speechlevel = 65;
% speaker = 'S08F';
% 
% cd ~;
% % make_all_vocabulary('S08F_NO',pcondition);
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);
% 
% %%%%%%% zweiter block +15 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 50;
% pcondition.speechlevel = 65;
% speaker = 'S08F';
% 
% cd ~;
% % make_all_vocabulary('S08F_NO',pcondition);
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);
% 
% %%%%%%% dritter block -20 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 85;
% pcondition.speechlevel = 65;
% speaker = 'S08F';
% 
% cd ~;
% % make_all_vocabulary('S08F_NO',pcondition);
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);
% 
% %%%%%%% vierter block +20 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 45;
% pcondition.speechlevel = 65;
% speaker = 'S08F';
% 
% cd ~;
% % make_all_vocabulary('S08F_NO',pcondition);
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);
% 
% %%%%%%% fünfter block +25 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 40;
% pcondition.speechlevel = 65;
% speaker = 'S08F';
% 
% cd ~;
% % make_all_vocabulary('S08F_NO',pcondition);
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);
% 
% %%%%%%% sechster +30 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 35;
% pcondition.speechlevel = 65;
% speaker = 'S08F';
% 
% cd ~;
% % make_all_vocabulary('S08F_NO',pcondition);
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);
% 
% % cd ~;
% % % %%%%%%% erster block -25 dB SNR %%%%%%%%%%%%%%%
%   pcondition.audiogram = zeros(11,2);
%   pcondition.noiselevel = 90;
%   pcondition.speechlevel = 65;
%  speaker = 'S08F';
% % 
% % cd ~;
% % make_all_vocabulary('S08F_NO',pcondition);
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
%  [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);
% % 
% % %%%%%%% zweiter block -30 dB SNR %%%%%%%%%%%%%%%
%  pcondition.noiselevel = 95;
%  pcondition.speechlevel = 65;
% % speaker = 'S08F';
% % 
% % cd ~;
% % make_all_vocabulary('S08F_NO',pcondition);
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
%  [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);
%  
% %%%%%%% sechster block in Ruhe %%%%%%%%%%%%%%%
% pcondition.noiselevel = 'nobackgroundnoise';
% pcondition.speechlevel = 65;
% speaker = 'S08F';
% 
% cd ~;
% % make_all_vocabulary('S08F_NO',pcondition);
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
% % recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);
% 
