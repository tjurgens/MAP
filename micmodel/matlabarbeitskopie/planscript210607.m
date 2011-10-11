function planscript210607
tic
speaker = 'S02M';
pcondition.audiogram = zeros(11,2);
pcondition.nrmodchan = 4;


% for i = 1:5
% % % %%%%%%%%%%%%%zuerst nonidentical
% workingdirectory = ['d:\tim\S02M_NOtestesttotalunterschiedlichbeitemplatesallegleichnonidenticallorentz' num2str(i) '\'];
% cd(workingdirectory);
% % % %%%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%
% % 
% pcondition.noiselevel = 60;
% pcondition.speechlevel = 60;
% % 
% % %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% % % 
% % % % %%%%%%% zweiter block -5 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 65;
% pcondition.speechlevel = 60;
% % 
% % %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% % % 
% % % % %%%%%%% dritter block +5 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 55;
% pcondition.speechlevel = 60;
% % 
% % %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% % % 
% % % % %%%%%%%  block -10 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 70;
% pcondition.speechlevel = 60;
% % 
% % %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% % % 
% % % %%%%%%% fünfter block +10 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 50;
% pcondition.speechlevel = 60;
% % 
% % %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
%  
% % % 
% % % % %%%%%%%  block -15 dB SNR %%%%%%%%%%%%%%%
% pcondition.audiogram = zeros(11,2);
% pcondition.noiselevel = 75;
% pcondition.speechlevel = 60;
% % 
% % %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% % % 
% % % %%%%%%%  block -20 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 80;
% pcondition.speechlevel = 60;
% % % 
% % % %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
%  % 
% % % 
% % % % % %%%%%%% block -25 dB SNR %%%%%%%%%%%%%%%
% % % pcondition.audiogram = zeros(11,2);
% % % pcondition.noiselevel = 85;
% % % pcondition.speechlevel = 60;
% % % 
% % % % %
% % % cd(workingdirectory);
% % % make_all_vocabulary_mfb('S02M_NO',pcondition);
% % % recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % % % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% % % [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % % 
% % % 
% % % % %%%%%%%  block -30 dB SNR %%%%%%%%%%%%%%%
% % % pcondition.noiselevel = 90;
% % % pcondition.speechlevel = 60;
% % % 
% % % %
% % % cd(workingdirectory);
% % % make_all_vocabulary_mfb('S02M_NO',pcondition);
% % % recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% % % [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % % 
% % %%%%%%%  block +15 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 45;
% pcondition.speechlevel = 60;
% 
% %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% % %%%%%%%  block +20 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 40;
% pcondition.speechlevel = 60;
% 
% %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% end
% 
% 
% 
% 
% 
% 
% 
% 
% %%%%%% jetzt non-identical noch weitere 9 mal bei 0dB SNR
% for i = 2:10
%     workingdirectory = ['d:\tim\modelnonidentical\S02M_NOtestMFB4mehrerevockombination' num2str(i)];
%     cd(workingdirectory);
%     %%%%%%% block 0 dB SNR %%%%%%%%%%%%%%%
% 
%     pcondition.noiselevel = 60;
%     pcondition.speechlevel = 60;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% end
% 
% 
% 






%jetzt identical

for i = 7:10   %ca.16std.
    workingdirectory = ['d:\tim\testesttotalunterschiedlichbeitemplatesallegleichidenticalrunninglorentz' num2str(i) '\S02M_NO\'];
    cd(workingdirectory);
%    % %%%%%%% vierter block -10 dB SNR %%%%%%%%%%%%%%%
%     pcondition.noiselevel = 70;
%     pcondition.speechlevel = 60;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

%   %%%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%
% 
%     pcondition.noiselevel = 60;
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
%     % %%%%%%% zweiter block -5 dB SNR %%%%%%%%%%%%%%%
%     pcondition.noiselevel = 65;
%     pcondition.speechlevel = 60;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);


%     % %%%%%%% dritter block +5 dB SNR %%%%%%%%%%%%%%%
%     pcondition.noiselevel = 55;
%     pcondition.speechlevel = 60;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 

   
%     %%%%%%% fünfter block +10 dB SNR %%%%%%%%%%%%%%%
%     pcondition.noiselevel = 50;
%     pcondition.speechlevel = 60;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);


    % %%%%%%% erster block -15 dB SNR %%%%%%%%%%%%%%%
    
        
%     pcondition.audiogram = zeros(11,2);
%     pcondition.noiselevel = 75;
%     pcondition.speechlevel = 60;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

% 
%     %%%%%%% dritter block -20 dB SNR %%%%%%%%%%%%%%%
%     pcondition.noiselevel = 80;
%     pcondition.speechlevel = 60;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

if i == 9
    ;
else
    % % %%%%%%% erster block -25 dB SNR %%%%%%%%%%%%%%%
    pcondition.audiogram = zeros(11,2);
    pcondition.noiselevel = 85;
    pcondition.speechlevel = 60;

    % %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
end

    % %%%%%%% zweiter block -30 dB SNR %%%%%%%%%%%%%%%
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