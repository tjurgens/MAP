%script for enabling parallel processing on cluster schroeder
clear;
cd('/net/medisan/home/tim/matlab');
speaker = 'S02M_NO' % speaker of speech material for verification purposes


snrs = '''nobackgroundnoise''';%[45:5:75];% -15:3:0;%;%70;% %
%noiselevel = '''nobackgroundnoise''';
levels = 5:5:60;%70; %10:5:15%20:5:60;%
speech_material = 'normal_auswahl' % kind of speech material for verification purposes

%%%% audiogram data for study nh in noise
% audiogram{1} = '[7.5 -2.5 -2.5 2.5 2.5 2.5 -5 -2.5  0 0 5]'; %[0 0 0 0 0 0 0 0 0 0 0]';
% audiogram{2} = '[2.5 -5 0 0 0 -2.5 -2.5 5 0 2.5 2.5]';
% audiogram{3} = '[5 5 7.5 10 7.5 7.5 10 5 2.5 -5 10]';
% audiogram{4} = '[5 5 5 5 2.5 7.5 10 5 5 0 2.5]';
% audiogram{5} = '[-2.5 -2.5 -2.5 0 -2.5 0 2.5 0 0 15 10]';
% audiogram{6} = '[-2.5 -2.5 -2.5 5 0 5 5 5 7.5 7.5 7.5]';
% audiogram{7} = '[5 2.5 0 0 2.5 -2.5 -2.5 -2.5 2.5 -2.5 2.5]';
% audiogram{8} = '[-7.5 -7.5 -5 0 0 -2.5 0 2.5 2.5 5 5]';
% audiogram{9} = '[12.5 7.5 7.5 5 5 5 5 0 5 2.5 12.5]';
% audiogram{10} = '[2.5 0 5 5 5 0 0 0 -2.5 2.5 5]';
%audiogram = '[10 0 0 0 10 30 100 100 100 100 100]';

%%%% audiogram data (zeros)
       %for i = 1:10
       %  audiogram{i} = '[0 0 0 0 0 0 0 0 0 0 0]';
       %end

%%%% audiogram data (hi listener)
  for i = 1:10
      audiogram{i} = '[10   0   0   0  10  30  40  60  70  75  90]';%GU56
      k_fit{i} = '[0.5 1 1 0.78]'; %GU56
      %k_fit{i} = '[1 1 1 1]';
%      %workingdirectory{i} = ['''/net/medisan/home/tim/2011m1GU/daten/identicalrunninglorentz' num2str(i) '/S02M_NO/'''];
      workingdirectory{i} = ['''/net/medisan/home/tim/2011m2OHCAGU/daten/identicalrunninglorentz' num2str(mod(i-1,10)+1) '/S02M_NO/'''];
  end
  for i=11:20
      audiogram{i} = '[5  10  15  20  20  25  35  35  50  60  60]';%QH43
      k_fit{i} = '[0.82 1 1 0.77]'; %QH43
      %k_fit{i} = '[1 1 1 1]';
      workingdirectory{i} = ['''/net/medisan/home/tim/2011m2OHCAQH/daten/identicalrunninglorentz' num2str(mod(i-1,10)+1) '/S02M_NO/'''];
  end
  for i=21:30
      audiogram{i} = '[35  40  30  25  20  25  40  50  50  80  75]';%MH41
      k_fit{i} = '[0.56 0.42 1 0.76]'; %MH41
      %k_fit{i} = '[1 1 1 1]';
      workingdirectory{i} = ['''/net/medisan/home/tim/2011m2OHCAMH/daten/identicalrunninglorentz' num2str(mod(i-1,10)+1) '/S02M_NO/'''];
  end
% 
  for i=31:40
      audiogram{i} = '[20  20  20  20  20  25  30  30  30  55  45]';%MC45
      %k_fit{i} = '[1 1 1 1]'; %MC45
      
      %'[20  20  15  15  15  15  15  30  30  40  35]';%AM40
      
      %audiogram{i} = '[0 5 20 30 25 35 25 30 25 50 50]';%SB41
      %k_fit{i} = '[1 1 0.97 0.64]';%SB41  
      
      %audiogram{i} = '[35 40 55 55 55 55 55 50 50 70 65]';%NB40
      %k_fit{i} = '[0.95 1 1 0.98]';%NB40
     
     k_fit{i} = '[1 1 1 1]';
     %k_fit{i} = '[0.8 0.8 0.8 0.8]';
     %k_fit{i} = '[1 1 1 1]';
     workingdirectory{i} = ['''/net/medisan/home/tim/2011m2OHCAMC/daten/identicalrunninglorentz' num2str(mod(i-1,10)+1) '/S02M_NO/'''];
 % 
  end

%%%% audiogram data for study nh in quiet
% audiogram{1} = '[5 -5 0 5 5 5 5 -5 -5 -5 5]'; %KD84
% audiogram{2} = '[5 5 5 10 5 5 -5 5 5 5 0]'; %GA77
% audiogram{3} = '[0 -5 -5 -5 -10 -10 -10 -10 -10 -5 -5]';%SF83
% audiogram{4} = '[0 0 0 5 5 5 0 0 -5 5 0]'; % DV87
% audiogram{5} = '[5 5 0 5 0 5 5 5 5 5 10]'; %SC72
% audiogram{6} = '[0 0 0 0 0 0 5 10 10 10 5]'; %OJ82
% audiogram{7} = '[5 0 0 0 5 -5 -5 -5 0 0 0]'; %MR79
% audiogram{8} = '[5 -5 -5 0 5 10 0 10 0 0 0]'; %HM84
% audiogram{9} = '[-5 -5 -5 -10 -5 -5 0 10 5 5 0]'; %RE83
% audiogram{10} = '[5 0 -5 5 5 -5 -5 -5 0 0 10]'; %BT69


%%%% hypothetical audiogram data from phatak&allen 2009 study
% for i = 1:10
%     audiogram{i} = '[5 5 5 5 5 7.5 10 35 50 65 70]'; %2L
% 
%     %directory to choose
%     workingdirectory{i} = ['''/net/medisan/home/tim/CLPhyp/PemomitEuklid/PeMoaudionly2L/daten/identicalrunninglorentz' num2str(i) '/S02M_NO/'''];
% end
% for i = 19:20
%     
%     audiogram{i} = '[10 10 5 10 15 12.5 10 35 50 65 75]'; %2R
%         %directory to choose
%             workingdirectory{i} = ['''/net/medisan/home/tim/CLPhyp/PemomitEuklid/PeMoaudionly2R/daten/identicalrunninglorentz' num2str(i-10) '/S02M_NO/'''];
% end
% for i = 29:30
%     
%     audiogram{i} = '[25 25 30 40 50 52.5 55 50 45 52.5 60]'; %4L
%     
%      %directory to choose
%             workingdirectory{i} = ['''/net/medisan/home/tim/CLPhyp/PemomitEuklid/PeMoaudionly4L/daten/identicalrunninglorentz' num2str(i-20) '/S02M_NO/'''];
%             %workingdirectory = ['''/net/medisan/home/tim/pemoshmodelnonidenticalnhlorentzcorrectlevel0MUintnoise/daten/S02M_NOtestesttotalunterschiedlichbeitemplatesallegleichnonidenticallorentz' num2str(jCounter) '/'''];         
% end
% for i = 39:40
%      audiogram{i} = '[25 25 40 42.5 45 45 45 42.5 40 47.5 55]'; %4R
%      %directory to choose
%             workingdirectory{i} = ['''/net/medisan/home/tim/CLPhyp/PemomitEuklid/PeMoaudionly4R/daten/identicalrunninglorentz' num2str(i-30) '/S02M_NO/'''];
%             %workingdirectory = ['''/net/medisan/home/tim/pemoshmodelnonidenticalnhlorentzcorrectlevel0MUintnoise/daten/S02M_NOtestesttotalunterschiedlichbeitemplatesallegleichnonidenticallorentz' num2str(jCounter) '/'''];         
% end
%level-loop
for iCounter = 1:length(levels);%snrs)
    
    
    %loop for repetition of modelling (default 10 times)
    speechlevel = levels(iCounter);
    noiselevel = snrs;%speechlevel-snrs(iCounter);
    for jCounter = 1:length(audiogram)%[19,20,29,30,39,40];%11:length(audiogram)
        
        
        
        %loop for different snrs
        %for kCounter = 1:length(snrs)
            %noiselevel = speechlevel-snrs(kCounter);
            %noiselevel = noise(iCounter);
            job_name = ['mm' num2str(levels(iCounter)) '_no' num2str(jCounter)];
            %job_name = ['mm' num2str(snrs(iCounter)) '_no' num2str(jCounter)];
            %job_name = [];

            %directory to choose
            %workingdirectory = ['''/net/medisan/home/tim/CLPhyp/PeMoaudionly4R/daten/identicalrunninglorentz' num2str(jCounter) '/S02M_NO/'''];
            %workingdirectory = ['''/net/medisan/home/tim/pemoshmodelnonidenticalnhlorentzcorrectlevel0MUintnoise/daten/S02M_NOtestesttotalunterschiedlichbeitemplatesallegleichnonidenticallorentz' num2str(jCounter) '/'''];
            
            %%nur zum testen
            %microscopic_model(speechlevel,noiselevel,jCounter,'/net/medisan/home/tim/modelidenticalCASPnhlorentzcorrectlevel/daten/identicalrunninglorentz1/S02M_NO/',[10   0   0   0  10  30  40  60  70  75  90])
            matlabcommand_to_exe = ['microscopic_model(' num2str(speechlevel) ',' num2str(noiselevel) ',' num2str(mod(jCounter-1,10)+1) ',' workingdirectory{jCounter} ',' audiogram{jCounter} ',' k_fit{jCounter} ')'];
            %% SUBMISSION
            jobID_string = qsub(matlabcommand_to_exe, job_name ,'tim.juergens@uni-oldenburg.de','-q all.q');%'-r y');%
            

           
            %% Protocol JobID
            act_dir = pwd;
            cd(workingdirectory{jCounter}(2:end-1));
            if isstr(noiselevel)
                prot_filename = ['protocol_speech' num2str(speechlevel) 'dB_noise' num2str(noiselevel(2:end-1)) 'dB.log'];
            else
                prot_filename = ['protocol_speech' num2str(speechlevel) 'dB_noise' num2str(noiselevel) 'dB.log'];
            end
            prot_file_ID = fopen(prot_filename,'w');
            fprintf(prot_file_ID,'Protocol File of Modelling Parameters\n');
            fprintf(prot_file_ID,'%s\n',jobID_string);
            fclose(prot_file_ID);
            cd(act_dir);
            %%%
        %end
    end
    
    
end