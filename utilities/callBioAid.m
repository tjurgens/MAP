function audio = callBioAid(audio,MAPparamsName,sampleRate,paramChanges)
addpath(['..' filesep 'BioAid' filesep 'extras' filesep 'Matlab']); %path to the Aid
addpath(['..' filesep 'Aidparameters']); %path to the Aidparameters
%look, if there is a paramChange enabling the hearing aid
nChanges=length(paramChanges);
for idx=1:nChanges
    tmp = paramChanges{idx};
    if strfind(tmp,'inputStimulusParams.useAid = 1;')
        useAid = 1;
    end
end
%only call the aid if it is set in the paramChanges
if exist('useAid','var')
    if useAid
        %set the aid's parameters
        aidparameterfile = ['get' MAPparamsName 'Params'];
        eval(['[ UNIQUEpars, SHAREDpars ] = ' aidparameterfile ';']);
        SHAREDpars.SampleRate = sampleRate;
        
        %call the aid
        %tic
        audio = bioaid( audio', UNIQUEpars, SHAREDpars);
        %toc
        
    end
end