function planscript290806
% 
% % %%%%%%% nobackgroundnoise für Statistik %%%%%%%%%%%%%%%
  
pcondition.audiogram = zeros(11,2);
  pcondition.noiselevel = 'nobackgroundnoise';
  pcondition.speechlevel = 65;
  speaker = 'S08F';
% % 
  cd ~;
 %make_all_vocabulary('S02M_NO',pcondition);
 recognizeall('S08F_NO',pcondition,'alle17');
% recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
  %[BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 


%%%%%speaker2m%%%
pcondition.audiogram = zeros(11,2);
  pcondition.noiselevel = 'nobackgroundnoise';
  pcondition.speechlevel = 65;
  speaker = 'S02M';
% % 
  cd ~;
 %make_all_vocabulary('S02M_NO',pcondition);
 recognizeall('S02M_NO',pcondition,'alle17');
% recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
  %[BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 