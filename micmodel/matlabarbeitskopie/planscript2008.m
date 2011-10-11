function planscript200907
tic
speaker = 'S02M';
%pcondition.audiogram = zeros(11,2);


for mCounter = 1:3

%AUDIOGRAM JT79
%pcondition.audiogram = [-7.23571428571429  -9.80714285714286  -8.09285714285714  ...
%    -8.25357142857143  -5.68214285714286  -5.20000000000000  -5.36071428571429  ...
%    -2.46785714285714  -0.59285714285714   0.10357142857143  -2.95000000000000  ...
%    -4.50357142857143  -5.73571428571429  -9.91428571428571  -3.75357142857143  ...
%    -2.78928571428571  1.01428571428571   3.15714285714286   3.10357142857143];

%AUDIOGRAM RE83
% pcondition.audiogram = [-9.30654761904762  -8.50297619047619  -7.66369047619048  ...
%     -7.87797619047619  -8.78869047619048  -6.48511904761905  -4.82440476190476  ...
%     -1.28869047619048  -3.11011904761905  -6.05654761904762  -5.19940476190476  ...
%     -5.52083333333333   1.55059523809524   5.35416666666667   5.88988095238095 ...
%     3.15773809523810   5.94345238095238   2.62202380952381  -4.23511904761905];

%AUDIOGRAM HM84
% pcondition.audiogram = [0.60714285714286  -2.17857142857143  -3.62500000000000 ...
%     -1.32142857142857  -4.28571428571428  -6.85714285714286  -5.83928571428571  ...
%     -5.19642857142857  -0.42857142857143   2.73214285714286   6.37500000000000  ...
%     1.17857142857143  -0.75000000000000   2.14285714285714   2.83928571428572  ...
%     -1.66071428571429  -3.37500000000000  -0.48214285714286  -0.05357142857143];

%AUDIOGRAM MR79
% pcondition.audiogram = [2.14583333333333   2.94940476190476   3.37797619047619 ...
%     0.59226190476191   1.50297619047619   0.64583333333333   0.11011904761905  ...
%     -0.96130952380952  -0.47916666666667  -3.01488095238095  -2.10416666666667  ...
%     -6.37202380952381  -1.76488095238095  -9.90773809523809  -3.58630952380952  ...
%     -1.44345238095238  -0.90773809523809  -1.62202380952381  -0.80059523809524];

% if mCounter == 1
% %AUDIOGRAM BT69
% pcondition.audiogram = [2.18750000000000  -2.74107142857143  -3.75892857142857  ....
%     -4.77678571428571  -2.74107142857143  -2.09821428571429  -0.70535714285714  ...
%     -1.29464285714286   1.75892857142857   3.95535714285714   0.36607142857143 ...
%     -0.49107142857143  -2.68750000000000  -5.15178571428571  -1.34821428571429 ...
%     -4.29464285714286  -1.29464285714286  -2.95535714285714   4.59821428571429];
% 
% elseif mCounter == 2
% %AUDIOGRAM OJ82
% pcondition.audiogram = [2.44940476190476  -6.14583333333333  -4.91369047619048  ...
%     -7.21726190476191  -5.03869047619048  -2.52083333333333  -3.64583333333333 ...
%     -0.27083333333333   0.42559523809524  -0.91369047619048  -6.37797619047619  ...
%     -1.02083333333333  -0.69940476190476  10.49702380952381   6.31845238095238 ...
%     2.72916666666667   8.46130952380952   4.38988095238095   6.63988095238095];
% 
% elseif mCounter == 3
% %AUDIOGRAM SC72
% pcondition.audiogram = [-2.36309523809524  -5.09523809523809  -6.00595238095238 ...
%     -3.86309523809524  -2.52380952380952  -2.95238095238095  -3.75595238095238  ...
%     -0.91666666666667  -0.43452380952381   0.40476190476190  -1.89880952380952  ...
%     -1.14880952380952   1.42261904761905  -3.50595238095238   0.99404761904762  ...
%     -0.70238095238095   3.58333333333333   7.70833333333333   6.20833333333333];
% end
    

%  %AUDIOGRAM DV87
%  pcondition.audiogram = [-1.39583333333333  -4.20833333333333  -3.45833333333333 ...
%      -3.14583333333333  -3.77083333333333  -2.83333333333333  -1.08333333333333  ...
%      0.91666666666667   1.60416666666667  10.54166666666667   6.79166666666667  ...
%      5.29166666666667   0.54166666666667   1.72916666666667   0.16666666666667  ...
%      -3.20833333333333   1.16666666666667   3.60416666666667   2.35416666666667];


if mCounter == 1
%AUDIOGRAM GA77
pcondition.audiogram = [ -2.05625000000000  -3.43125000000000  -0.55625000000000  ...
    -0.36875000000000   1.38125000000000   2.50625000000000   3.13125000000000  ...
    4.69375000000000   3.63125000000000   2.63125000000000  -0.49375000000000  ...
    -4.24375000000000  -0.74375000000000  -3.93125000000000  -0.43125000000000 ...
    1.56875000000000  -0.74375000000000  -1.68125000000000   0.00625000000000];

elseif mCounter == 2
%AUDIOGRAM KD84
pcondition.audiogram = [-1.73958333333333  -7.17708333333333  -4.73958333333333 ...
    -5.67708333333333  -3.55208333333333  -3.36458333333333  -2.86458333333333  ...
    2.44791666666667   5.19791666666667   4.01041666666667   2.32291666666667  ...
    2.26041666666667  -1.17708333333333  -3.98958333333333  -6.73958333333333 ...
    -6.67708333333333  -0.36458333333333  -2.80208333333333   0.13541666666667];

elseif mCounter == 3
%AUDIOGRAM SF83
pcondition.audiogram = [-4.26375000000000  -6.57625000000000  -5.20125000000000 ...
    -4.63875000000000  -4.38875000000000  -3.51375000000000  -2.95125000000000 ...
    -1.51375000000000  -4.57625000000000  -3.57625000000000  -3.82625000000000 ...
    -2.57625000000000 -12.01375000000000  -8.07625000000000  -6.32625000000000  ...
    -6.38875000000000 -11.26375000000000  -5.63875000000000  -3.01375000000000];
end

pcondition.audiogramfreqs = 1e3.*[0.125 0.157 0.198 0.250 0.315 0.397 0.500 0.630 ...
   0.794 1.000 1.260 1.587 2.000 2.520 3.175 4.000 5.040 6.350  8.000];
pcondition.nrmodchan = 4;


% for i = 10:10
% % % %%%%%%%%%%%%%zuerst nonidentical
% workingdirectory = ['d:\tim\S02M_NOtestesttotalunterschiedlichbeitemplatesallegleichnonidenticallorentz' num2str(i) '\'];
% cd(workingdirectory);
% 
% % % %%%%%%% erster block 0 dB SNR %%%%%%%%%%%%%%%
% % 
% pcondition.noiselevel = 60;
% pcondition.speechlevel = 60;
% % 
% % %
% cd(workingdirectory);
% %make_all_vocabulary_mfb('S02M_NO',pcondition);
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
% %make_all_vocabulary_mfb('S02M_NO',pcondition);
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
% %make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% % % 
% 
% % % % %%%%%%%  block -10 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 70;
% pcondition.speechlevel = 60;
% % 
% % %
% cd(workingdirectory);
% %make_all_vocabulary_mfb('S02M_NO',pcondition);
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
% %make_all_vocabulary_mfb('S02M_NO',pcondition);
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
% %make_all_vocabulary_mfb('S02M_NO',pcondition);
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
% %make_all_vocabulary_mfb('S02M_NO',pcondition);
% recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
 % 
% % 
% % % % %%%%%%% block -25 dB SNR %%%%%%%%%%%%%%%
% % pcondition.audiogram = zeros(11,2);
% % pcondition.noiselevel = 85;
% % pcondition.speechlevel = 60;
% % 
% % % %
% % cd(workingdirectory);
% % make_all_vocabulary_mfb('S02M_NO',pcondition);
% % recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% % [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% % 
% % % %%%%%%%  block -30 dB SNR %%%%%%%%%%%%%%%
% % pcondition.noiselevel = 90;
% % pcondition.speechlevel = 60;
% % 
% % %
% % cd(workingdirectory);
% % make_all_vocabulary_mfb('S02M_NO',pcondition);
% % recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
% % %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
% % [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% % 
% %%%%%%%  block +15 dB SNR %%%%%%%%%%%%%%%
% pcondition.noiselevel = 45;
% pcondition.speechlevel = 60;
% 
% %
% cd(workingdirectory);
% %make_all_vocabulary_mfb('S02M_NO',pcondition);
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
% %make_all_vocabulary_mfb('S02M_NO',pcondition);
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
global backnoiseshift
for i = 1:10
    backnoiseshift = i;
    %     if i == 4
    %         pcondition.audiogram = 5+pcondition.audiogram;
    %     elseif i == 5
    %         pcondition.audiogram = zeros(11,2)-5;
    %     end
    if mCounter == 1
        workingdirectory = ['D:\tim\modellierunginruheGA\identical' num2str(i) '\S02M_NO\'];
    elseif mCounter == 2
        workingdirectory = ['D:\tim\modellierunginruheKD\identical' num2str(i) '\S02M_NO\'];
    elseif mCounter == 3
        workingdirectory = ['D:\tim\modellierunginruheSF\identical' num2str(i) '\S02M_NO\'];
    end
    %     if i == 1
    %         ;
    %     else
    cd(workingdirectory);
    %if i>3
        % %%%%%%% vierter block -10 dB SPL %%%%%%%%%%%%%%%
%         pcondition.noiselevel = 70;
%         pcondition.speechlevel = 60;
% 
%         %
%         cd(workingdirectory);
%         make_all_vocabulary_mfb('S02M_NO',pcondition);
%         recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%         % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%         [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
%         %   %%%%%%% erster block -15 dB SPL %%%%%%%%%%%%%%%
%         %
%         pcondition.noiselevel = 75;
%         pcondition.speechlevel = 60;
% 
%         %
%         cd(workingdirectory);
%         make_all_vocabulary_mfb('S02M_NO',pcondition);
%         recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%         % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%         [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
%     end

    %     %%%%%%% erster block -5 dB SPL %%%%%%%%%%%%%%%
    %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 10;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    
    
    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 15;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
%     
    
    
    
    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 5;

    %
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    
    
    
    
    
    
    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 20;
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    
    

    
    
    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 25;
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

    
    
    pcondition.noiselevel = 'nobackgroundnoise';
    pcondition.speechlevel = 0;
    cd(workingdirectory);
    make_all_vocabulary_mfb('S02M_NO',pcondition);
    recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
%     % %%%%%%% zweiter block -20 dB SPL %%%%%%%%%%%%%%%
%     pcondition.noiselevel = 80;
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
%     % %%%%%%% zweiter block -25 dB SPL %%%%%%%%%%%%%%%
%     pcondition.noiselevel = 85;
%     pcondition.speechlevel = 60;
% 
%     %
%     cd(workingdirectory);
%     make_all_vocabulary_mfb('S02M_NO',pcondition);
%     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
%     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
%     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
% 
%     % %%%%%%% zweiter block 0 dB SPL %%%%%%%%%%%%%%%
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
    %     % %%%%%%% dritter block +5 dB SPL %%%%%%%%%%%%%%%
    %     pcondition.noiselevel = -100;
    %     pcondition.speechlevel = 5;
    %
    %     %
    %     cd(workingdirectory);
    %     make_all_vocabulary_mfb('S02M_NO',pcondition);
    %     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    %     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    %
    %
    %
    %     %%%%%%% fünfter block 0 dB SPL %%%%%%%%%%%%%%%
    % %     pcondition.noiselevel = -100;
    % %     pcondition.speechlevel = 0;
    % %
    % %     %
    % %     cd(workingdirectory);
    % %     make_all_vocabulary_mfb('S02M_NO',pcondition);
    % %     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    % %     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    % %     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    %
    %
    %     %%%%%%% dritter block 25 dB SPL %%%%%%%%%%%%%%%
    %     pcondition.noiselevel = -100;
    %     pcondition.speechlevel = 25;
    %
    %     %
    %     cd(workingdirectory);
    %     make_all_vocabulary_mfb('S02M_NO',pcondition);
    %     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    %     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);

    %%%%%%% dritter block 17 dB SPL %%%%%%%%%%%%%%%
    %     pcondition.noiselevel = -100;
    %     pcondition.speechlevel = 17;
    %
    %     %
    %     cd(workingdirectory);
    %     %make_all_vocabulary_mfb('S02M_NO',pcondition);
    %     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    %     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);
    % %     % % %%%%%%% erster block 35 dB SPL %%%%%%%%%%%%%%%
    %     pcondition.audiogram = zeros(11,2);
    %     pcondition.noiselevel = -100;
    %     pcondition.speechlevel = 35;
    %
    %     % %
    %     cd(workingdirectory);
    %     make_all_vocabulary_mfb('S02M_NO',pcondition);
    %     recognizeall_mfb('S02M_NO',pcondition,'normal_auswahl');
    %     % recognizeall('S02M_NO',pcondition,'rand_var_auswahl_2');
    %     [BIG_CM, hitrate] = sumup_cm('S02M_NO',pcondition);


    %     %%%%%%% zweiter block -30 dB SNR %%%%%%%%%%%%%%%
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
end
toc