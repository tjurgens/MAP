function IR = computeIR_using_auditorymodel(inputsignal,sfreq,pcondition)

if pcondition.use_mfb == 1
    %%%%%%%%%%%% CASP %%%%%%%%%%%%%%%%%%%%%
    if strcmp(pcondition.auditorymodel,'CASP_Diss')
        IR_testtmp = pemo_preproc(inputsignal,sfreq);%, sfreq,pcondition.nrmodchan);
        if iscell(IR_testtmp)
            IR = IR_testtmp;
        else
            IR{1} = IR_testtmp(:,:,1)';
            IR{2} = IR_testtmp(:,:,2)';
            IR{3} = IR_testtmp(:,:,3)';
            IR{4} = IR_testtmp(:,:,4)';
            %             if ~isempty(IR_vocabultmp(:,:,5))
            %                 error('IR_vocabul hat mehr Modulationsfilterbankkanäle als ausgewertet werden.')
        end
        
    elseif strcmp(pcondition.auditorymodel,'CASP_2011')
        IR_testtmp = casp_preproc(inputsignal,0);%, sfreq,pcondition.nrmodchan);
        if iscell(IR_testtmp)
            IR = IR_testtmp;
        else
            IR{1} = IR_testtmp(:,:,1)';
            IR{2} = IR_testtmp(:,:,2)';
            IR{3} = IR_testtmp(:,:,3)';
            IR{4} = IR_testtmp(:,:,4)';
            %             if ~isempty(IR_vocabultmp(:,:,5))
            %                 error('IR_vocabul hat mehr Modulationsfilterbankkanäle als ausgewertet werden.')
        end
        
    elseif strcmp(pcondition.auditorymodel,'PEMO')
        IR = pemo_mfb_tim(inputsignal,sfreq,pcondition.nrmodchan);
        % the original normal-hearing model
        
    elseif strcmp(pcondition.auditorymodel,'PEMOSH')
        IR = pemo_mfb_hi_schelle1_tim(inputsignal,sfreq,hearing_impairment.audiogram,pcondition.nrmodchan);
        % schelles hearing-impaired model
        
    elseif strcmp(pcondition.auditorymodel,'MAP')
        %Meddis' MAP model
        MAP1_14(inputsignal,sfreq,-1,pcondition.parameterfile,'probability')
        global ANprobRateOutput savedBFlist
        %take only the HSR fibers
        AN_HSRoutput = ANprobRateOutput(size(ANprobRateOutput)/2+1:end,:);
        %calculate rate pattern
         %ANsmooth = [];%Cannot pre-allocate a size as it is unknown until the enframing
         %hopSize = 10; %ms
         %winSize = 25; %ms
         %winSizeSamples = round(winSize*sfreq/1000);
         %hann = hanning(winSizeSamples);
         %hopSizeSamples = round(hopSize*sfreq/1000);
         %for chan = 1:size(AN_HSRoutput,1)
         %    f = enframe(AN_HSRoutput(chan,:), hann, hopSizeSamples);
         %    ANsmooth(chan,:) = mean(f,2)';
         %end
         
         %IR = ANsmooth;
        %calculate timing pattern
        formantpattern = fouriertransform_histogram_log(AN_HSRoutput,sfreq,savedBFlist);
        formantpattern = formantpattern./max(max(formantpattern));
        %formantpattern = getIFpattern(AN_HSRoutput,sfreq,savedBFlist);
        
        %just take the timing features
        IR = formantpattern;
        
        %concatenate the features
        %IR = [ANsmooth(1:5:end,1:min([size(ANsmooth,2) size(formantpattern,2)])); ...
        %    1/70.*formantpattern(:,1:min([size(ANsmooth,2) size(formantpattern,2)]))];
        
    else
        error('auditory model not found!')
    end
    
elseif pcondition.use_mfb == 0
    IR{1} = pemo_tim(testsignal,sfreq);
    
end