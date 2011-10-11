function planscript
% 
% %%%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%
 pcondition.audiogram = zeros(11,2);
 pcondition.noiselevel = 65;
 pcondition.speechlevel = 65;
 speaker = 'S02M';
% 
 cd ~;
make_all_vocabulary('S02M_NO',pcondition);
recognizeall('S02M_NO',pcondition,'rand_var_auswahl');
recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% %%%%%%% zweiter block -5 dB SNR %%%%%%%%%%%%%%%
 pcondition.noiselevel = 70;
 pcondition.speechlevel = 65;
 speaker = 'S02M';
% 
 cd ~;
make_all_vocabulary('S02M_NO',pcondition);
recognizeall('S02M_NO',pcondition,'rand_var_auswahl');
recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% %%%%%%% dritter block +5 dB SNR %%%%%%%%%%%%%%%
 pcondition.noiselevel = 60;
 pcondition.speechlevel = 65;
 speaker = 'S02M';
% 
 cd ~;
make_all_vocabulary('S02M_NO',pcondition);
recognizeall('S02M_NO',pcondition,'rand_var_auswahl');
recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% %%%%%%% vierter block -10 dB SNR %%%%%%%%%%%%%%%
 pcondition.noiselevel = 75;
 pcondition.speechlevel = 65;
 speaker = 'S02M';
% 
 cd ~;
make_all_vocabulary('S02M_NO',pcondition);
recognizeall('S02M_NO',pcondition,'rand_var_auswahl');
recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

% %%%%%%% fünfter block +10 dB SNR %%%%%%%%%%%%%%%
 pcondition.noiselevel = 55;
 pcondition.speechlevel = 65;
 speaker = 'S02M';
% 
 cd ~;
make_all_vocabulary('S02M_NO',pcondition);
recognizeall('S02M_NO',pcondition,'rand_var_auswahl');
recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
 [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

%%%%%%% sechster block in Ruhe %%%%%%%%%%%%%%%
pcondition.noiselevel = 'nobackgroundnoise';
pcondition.speechlevel = 65;
speaker = 'S02M';

cd ~;
make_all_vocabulary('S02M_NO',pcondition);
recognizeall('S02M_NO',pcondition,'rand_var_auswahl');
recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
[BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% SPEAKER 08 %%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cd ~;
%%%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%
pcondition.audiogram = zeros(11,2);
pcondition.noiselevel = 65;
pcondition.speechlevel = 65;
speaker = 'S08F';

cd ~;
make_all_vocabulary('S08F_NO',pcondition);
recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
[BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);

%%%%%%% zweiter block -5 dB SNR %%%%%%%%%%%%%%%
pcondition.noiselevel = 70;
pcondition.speechlevel = 65;
speaker = 'S08F';

cd ~;
make_all_vocabulary('S08F_NO',pcondition);
recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
[BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);

%%%%%%% dritter block +5 dB SNR %%%%%%%%%%%%%%%
pcondition.noiselevel = 60;
pcondition.speechlevel = 65;
speaker = 'S08F';

cd ~;
make_all_vocabulary('S08F_NO',pcondition);
recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
[BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);

%%%%%%% vierter block -10 dB SNR %%%%%%%%%%%%%%%
pcondition.noiselevel = 75;
pcondition.speechlevel = 65;
speaker = 'S08F';

cd ~;
make_all_vocabulary('S08F_NO',pcondition);
recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
[BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);

%%%%%%% fünfter block +10 dB SNR %%%%%%%%%%%%%%%
pcondition.noiselevel = 55;
pcondition.speechlevel = 65;
speaker = 'S08F';

cd ~;
make_all_vocabulary('S08F_NO',pcondition);
recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
[BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);

%%%%%%% sechster block in Ruhe %%%%%%%%%%%%%%%
pcondition.noiselevel = 'nobackgroundnoise';
pcondition.speechlevel = 65;
speaker = 'S08F';

cd ~;
make_all_vocabulary('S08F_NO',pcondition);
recognizeall('S08F_NO',pcondition,'rand_var_auswahl');
recognizeall('S08F_NO',pcondition,'rand_var_auswahl_2');
[BIG_CM, hitrate] = sumup_cm('S08F_NO',pcondition);

