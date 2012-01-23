function paradigm_notchedNoiseBW(handles)
global stimulusParameters experiment betweenRuns

paradigmBase(handles) % default

stimulusParameters.WRVname='targetLevel';
stimulusParameters.WRVstartValues=40;
stimulusParameters.WRVsteps= [10 3];
stimulusParameters.WRVlimits=[-30 110];

stimulusParameters.cueTestDifference = 10;
experiment.psyFunSlope = 1;
withinRuns.direction='up';

betweenRuns.variableName1='notchedNoiseBW';
betweenRuns.variableList1=[0 .1 .2 .3 .4];%[0 .05 .1 .15 .2 .25 .3 .35 .4 ];
betweenRuns.variableName2='targetFrequency';
betweenRuns.variableList2=[1000];

experiment.maskerInUse=1;
stimulusParameters.maskerType='notchedNoise';
stimulusParameters.maskerPhase='random';
stimulusParameters.maskerDuration=0.500;
stimulusParameters.maskerLevel=40;
stimulusParameters.maskerRelativeFrequency=1;

stimulusParameters.targetType='tone';
stimulusParameters.targetPhase='sin';
stimulusParameters.targetFrequency=1000;
stimulusParameters.targetLevel=-stimulusParameters.WRVstartValues(1);

stimulusParameters.targetDuration=0.25;
stimulusParameters.gapDuration= -stimulusParameters.maskerDuration/2 ...
    -stimulusParameters.targetDuration/2;

stimulusParameters.rampDuration=0.004;

% instructions to user
% single interval up/down no cue
stimulusParameters.instructions{1}=[{'YES if you hear the added tone'}, { }, { 'NO if not (or you are uncertain'}];
% single interval up/down with cue
stimulusParameters.instructions{2}=[{'count how many distinct tones you hear in the noise'},{' '},...
    {'Try to ignore the noise.'}];
experiment.singleIntervalMaxTrials=[20];
experiment.maxTrials=20;
% catchTrials
experiment.allowCatchTrials= 1;


