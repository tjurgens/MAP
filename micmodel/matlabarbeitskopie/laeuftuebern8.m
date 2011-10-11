basedirectory = 'D:\tim\datensicherung\';
primarydirectory = getDir(basedirectory);


% %1.normal hearing+hearing threshold simulating noise, speech ~90dB
% %backgroud:quiet
% speechlevel = 90;
% noiselevel = 'nobackgroundnoise';
% for i = 4:length(primarydirectory)
%     curr_dir = [basedirectory primarydirectory{i}];
%     cd(curr_dir);
%     secondarydirectory = getDir(curr_dir);
%     
%         if ~isdir('hearingthreshold-whitenoise\')
%             mkdir('hearingthreshold-whitenoise\');
%         end
%         cd Whitenoise
%         thirddirectory = getDir(pwd);
%         for k = 1:length(thirddirectory)
%             if ~isdir(['..\hearingthreshold-whitenoise\',thirddirectory{k}])
%                mkdir(['..\hearingthreshold-whitenoise\',thirddirectory{k}]);
%             end
%             eval(['copyfile ',thirddirectory{k},' ..\hearingthreshold-whitenoise\',thirddirectory{k},'\']);
%         end
%         cd ..
%     
%     make_all_vocabulary([primarydirectory{i},'\hearingthreshold-whitenoise\'],speechlevel,noiselevel);
%     recognizeall([primarydirectory{i},'\hearingthreshold-whitenoise\'],speechlevel,noiselevel);
% end
% 
%2.normal hearing+hearing threshold simulating noise, speech ~66dB
%backgroud:quiet
% speechlevel = 66;
% noiselevel = 'nobackgroundnoise';
% for i = 1:length(primarydirectory)
%     curr_dir = [basedirectory primarydirectory{i}];  %primarydirectory:speaker
%     cd(curr_dir);
%     secondarydirectory = getDir(curr_dir);
%     
%         if ~isdir('speech66dB-hearingthreshold-whitenoise-quiet\')
%             mkdir('speech66dB-hearingthreshold-whitenoise-quiet\');
%         end
%         cd Whitenoise
%         thirddirectory = getDir(pwd);
%         for k = 1:length(thirddirectory)
%             if ~isdir(['..\speech66dB-hearingthreshold-whitenoise-quiet\',thirddirectory{k}])
%                mkdir(['..\speech66dB-hearingthreshold-whitenoise-quiet\',thirddirectory{k}]);
%             end
%             eval(['copyfile ',thirddirectory{k},' ..\speech66dB-hearingthreshold-whitenoise-quiet\',thirddirectory{k},'\']);
%         end
%         cd ..
%     
%     make_all_vocabulary([primarydirectory{i},'\speech66dB-hearingthreshold-whitenoise-quiet\'],speechlevel,noiselevel);
%     recognizeall([primarydirectory{i},'\speech66dB-hearingthreshold-whitenoise-quiet\'],speechlevel,noiselevel);
% end
% 
% %3.normal hearing+hearing threshold simulating noise, speech ~66dB
% %backgroud:whitenoise ~66dB (0dB SNR)
% speechlevel = 66;
% noiselevel = 66;
% for i = 1:length(primarydirectory)
%     curr_dir = [basedirectory primarydirectory{i}];
%     cd(curr_dir);
%     secondarydirectory = getDir(curr_dir);
%     
%         if ~isdir('speech66dB-hearingthreshold-whitenoise-0dBSNR\')
%             mkdir('speech66dB-hearingthreshold-whitenoise-0dBSNR\');
%         end
%         cd Whitenoise
%         thirddirectory = getDir(pwd);
%         for k = 1:length(thirddirectory)
%             if ~isdir(['..\speech66dB-hearingthreshold-whitenoise-0dBSNR\',thirddirectory{k}])
%                mkdir(['..\speech66dB-hearingthreshold-whitenoise-0dBSNR\',thirddirectory{k}]);
%             end
%             eval(['copyfile ',thirddirectory{k},' ..\speech66dB-hearingthreshold-whitenoise-0dBSNR\',thirddirectory{k},'\']);
%         end
%         cd ..
%     
%     make_all_vocabulary([primarydirectory{i},'\speech66dB-hearingthreshold-whitenoise-0dBSNR\'],speechlevel,noiselevel);
%     recognizeall([primarydirectory{i},'\speech66dB-hearingthreshold-whitenoise-0dBSNR\'],speechlevel,noiselevel);
% end

%4.normal hearing+hearing threshold simulating noise, speech ~66dB
%backgroud:whitenoise ~61dB (5dB SNR)
% speechlevel = 66;
% noiselevel = 61;
% for i = 1:length(primarydirectory)
%     curr_dir = [basedirectory primarydirectory{i}];
%     cd(curr_dir);
%     secondarydirectory = getDir(curr_dir);
%     
%         if ~isdir('speech66dB-hearingthreshold-whitenoise-5dBSNR\')
%             mkdir('speech66dB-hearingthreshold-whitenoise-5dBSNR\');
%         end
%         cd Whitenoise
%         thirddirectory = getDir(pwd);
%         for k = 1:length(thirddirectory)
%             if ~isdir(['..\speech66dB-hearingthreshold-whitenoise-5dBSNR\',thirddirectory{k}])
%              mkdir(['..\speech66dB-hearingthreshold-whitenoise-5dBSNR\',thirddirectory{k}]);
%             end
%             eval(['copyfile ',thirddirectory{k},' ..\speech66dB-hearingthreshold-whitenoise-5dBSNR\',thirddirectory{k},'\']);
%         end
%         cd ..
%     
%     make_all_vocabulary([primarydirectory{i},'\speech66dB-hearingthreshold-whitenoise-5dBSNR\'],speechlevel,noiselevel);
%     recognizeall([primarydirectory{i},'\speech66dB-hearingthreshold-whitenoise-5dBSNR\'],speechlevel,noiselevel);
% end

%5.normal hearing+hearing threshold simulating noise, speech ~66dB
%backgroud:whitenoise ~56dB (10dB SNR)
% speechlevel = 66;
% noiselevel = 56;
% for i = 1:length(primarydirectory)
%     curr_dir = [basedirectory primarydirectory{i}];
%     cd(curr_dir);
%     secondarydirectory = getDir(curr_dir);
%     
%         if ~isdir('speech66dB-hearingthreshold-whitenoise-10dBSNR\')
%             mkdir('speech66dB-hearingthreshold-whitenoise-10dBSNR\');
%         end
%         cd Whitenoise
%         thirddirectory = getDir(pwd);
%         for k = 1:length(thirddirectory)
%             if ~isdir(['..\speech66dB-hearingthreshold-whitenoise-10dBSNR\',thirddirectory{k}])
%              mkdir(['..\speech66dB-hearingthreshold-whitenoise-10dBSNR\',thirddirectory{k}]);
%             end
%             eval(['copyfile ',thirddirectory{k},' ..\speech66dB-hearingthreshold-whitenoise-10dBSNR\',thirddirectory{k},'\']);
%         end
%         cd ..
%     
%     make_all_vocabulary([primarydirectory{i},'\speech66dB-hearingthreshold-whitenoise-10dBSNR\'],speechlevel,noiselevel);
%     recognizeall([primarydirectory{i},'\speech66dB-hearingthreshold-whitenoise-10dBSNR\'],speechlevel,noiselevel);
% end

%6.normal hearing+hearing threshold simulating noise, speech ~66dB
%backgroud:whitenoise ~51dB (15dB SNR)
% speechlevel = 66;
% noiselevel = 51;
% for i = 1:length(primarydirectory)
%     curr_dir = [basedirectory primarydirectory{i}];
%     cd(curr_dir);
%     secondarydirectory = getDir(curr_dir);
%     
%         if ~isdir('speech66dB-hearingthreshold-whitenoise-15dBSNR\')
%             mkdir('speech66dB-hearingthreshold-whitenoise-15dBSNR\');
%         end
%         cd Whitenoise
%         thirddirectory = getDir(pwd);
%         for k = 1:length(thirddirectory)
%             if ~isdir(['..\speech66dB-hearingthreshold-whitenoise-15dBSNR\',thirddirectory{k}])
%              mkdir(['..\speech66dB-hearingthreshold-whitenoise-15dBSNR\',thirddirectory{k}]);
%             end
%             eval(['copyfile ',thirddirectory{k},' ..\speech66dB-hearingthreshold-whitenoise-15dBSNR\',thirddirectory{k},'\']);
%         end
%         cd ..
%     
%     make_all_vocabulary([primarydirectory{i},'\speech66dB-hearingthreshold-whitenoise-15dBSNR\'],speechlevel,noiselevel);
%     recognizeall([primarydirectory{i},'\speech66dB-hearingthreshold-whitenoise-15dBSNR\'],speechlevel,noiselevel);
% end

%7.normal hearing+hearing threshold simulating noise, speech ~66dB
%backgroud:whitenoise ~46dB (20dB SNR)
speechlevel = 66;
noiselevel = 46;
for i = 6:length(primarydirectory)
    curr_dir = [basedirectory primarydirectory{i}];
    cd(curr_dir);
    secondarydirectory = getDir(curr_dir);
    
        if ~isdir('speech66dB-hearingthreshold-whitenoise-20dBSNR\')
            mkdir('speech66dB-hearingthreshold-whitenoise-20dBSNR\');
        end
        cd Whitenoise
        thirddirectory = getDir(pwd);
        for k = 1:length(thirddirectory)
            if ~isdir(['..\speech66dB-hearingthreshold-whitenoise-20dBSNR\',thirddirectory{k}])
             mkdir(['..\speech66dB-hearingthreshold-whitenoise-20dBSNR\',thirddirectory{k}]);
            end
            eval(['copyfile ',thirddirectory{k},' ..\speech66dB-hearingthreshold-whitenoise-20dBSNR\',thirddirectory{k},'\']);
        end
        cd ..
    
    make_all_vocabulary([primarydirectory{i},'\speech66dB-hearingthreshold-whitenoise-20dBSNR\'],speechlevel,noiselevel);
    recognizeall([primarydirectory{i},'\speech66dB-hearingthreshold-whitenoise-20dBSNR\'],speechlevel,noiselevel);
end

% %datensicherung_ollo;