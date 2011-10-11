function planscript160507
tic
speaker = 'S02M';
pcondition.audiogram = zeros(11,2);
pcondition.nrmodchan = 4;

%%%%%%%%%%%%%zuerst nonidentical
%workingdirectory = ['d:\tim\modelnonidentical\S02M_NOtestMFB4mehrerevockombination1'];
% cd(workingdirectory);
% %%%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%
% 
% pcondition.noiselevel = 60;
% pcondition.speechlevel = 60;
% 
% %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% 
% % %%%%%%% zweiter block -5 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 65;
% pcondition.speechlevel = 60;
% 
% %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% 
% % %%%%%%% dritter block +5 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 55;
% pcondition.speechlevel = 60;
% 
% %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% 
% % %%%%%%%  block -10 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 70;
% pcondition.speechlevel = 60;
% 
% %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% 
% %%%%%%% fünfter block +10 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 50;
% pcondition.speechlevel = 60;
% 
% %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% 
% % %%%%%%%  block -15 dB SNR %%%%%%%%%%%%%%%
% pcondition.audiogram = zeros(11,2);
% pcondition.noiselevel = 75;
% pcondition.speechlevel = 60;
% 
% %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% 
% %%%%%%%  block -20 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 80;
% pcondition.speechlevel = 60;
% 
% %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% 
% % % %%%%%%% block -25 dB SNR %%%%%%%%%%%%%%%
% pcondition.audiogram = zeros(11,2);
% pcondition.noiselevel = 85;
% pcondition.speechlevel = 60;
% 
% % %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% 
% % %%%%%%%  block -30 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 90;
% pcondition.speechlevel = 60;
% 
% %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% %%%%%%%  block +15 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 45;
% pcondition.speechlevel = 60;
% 
% %
% cd(workingdirectory);
% make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
% %%%%%%%  block +20 dB SNR %%%%%%%%%%%%%%%
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









%jetzt identical in Ruhe

for i = 1:10   %ca.16std.
    workingdirectory = ['d:\tim\modelidentical\daten\identical' num2str(i) '\S02M_NO\'];
    cd(workingdirectory);
    %%%%%%% erster block 20 dB SPL %%%%%%%%%%%%%%%

    pcondition.noiselevel = -10;
    pcondition.speechlevel = 20;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);


    % %%%%%%% zweiter block 5 dB SPL %%%%%%%%%%%%%%%
    pcondition.noiselevel = -10;
    pcondition.speechlevel = 5;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);


    % %%%%%%% dritter block 10dB SPL %%%%%%%%%%%%%%%
    pcondition.noiselevel = -10;
    pcondition.speechlevel = 10;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);


    % %%%%%%% vierter block 15 dB SPL %%%%%%%%%%%%%%%
    pcondition.noiselevel = -10;
    pcondition.speechlevel = 15;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);


    %%%%%%% fünfter block 0 dB SPL %%%%%%%%%%%%%%%
    pcondition.noiselevel = -10;
    pcondition.speechlevel = 0;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);


    % %%%%%%% erster block 25 dB SPL %%%%%%%%%%%%%%%
    pcondition.audiogram = zeros(11,2);
    pcondition.noiselevel = -10;
    pcondition.speechlevel = 25;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);


    %%%%%%% dritter block 30dB SPL %%%%%%%%%%%%%%%
    pcondition.noiselevel = -10;
    pcondition.speechlevel = 30;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);


    % % %%%%%%% erster block 35 dB SNR %%%%%%%%%%%%%%%
    pcondition.audiogram = zeros(11,2);
    pcondition.noiselevel = -10;
    pcondition.speechlevel = 35;

    % %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);


%     % %%%%%%% zweiter block -30 dB SNR %%%%%%%%%%%%%%%
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