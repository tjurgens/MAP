function paradigm_notchednoise(handles)
global stimulusParameters experiment betweenRuns

paradigmBase(handles) % default

stimulusParameters.WRVname='targetLevel';
stimulusParameters.WRVstartValues=70;
stimulusParameters.WRVsteps= [10 4];
stimulusParameters.WRVlimits=[-30 110];


stimulusParameters.cueTestDifference = 10;
experiment.psyFunSlope = -1;
withinRuns.direction='up';

betweenRuns.variableName1='gapRelativeBandWidth';
betweenRuns.variableList1=[0 .05 .1 .15 .2 .25 .3 .35 .4 ];
betweenRuns.variableName2='targetFrequency';
% retain existing targetFrequencies
betweenRuns.variableList2=str2num(get(handles.edittargetFrequency,'string'));

experiment.maskerInUse=1;
stimulusParameters.maskerType='notchednoise';
stimulusParameters.maskerPhase='random';
stimulusParameters.maskerDuration=0.500;
stimulusParameters.maskerLevel=70;
stimulusParameters.maskerRelativeFrequency=1;
stimulusParameters.probetimeinNN=...
    'stimulusParameters.gapDuration = -stimulusParameters.maskerDuration/2-stimulusParameters.targetDuration/2;';

%stimulusParameters.gapDuration=-stimulusParameters.maskerDuration/2;

stimulusParameters.targetType='tone';
stimulusParameters.targetPhase='sin';
stimulusParameters.targetFrequency=betweenRuns.variableList2(1);
stimulusParameters.targetDuration=stimulusParameters.maskerDuration/2;
stimulusParameters.targetLevel=stimulusParameters.WRVstartValues;

stimulusParameters.rampDuration=0.004;

% instructions to user
%   single interval up/down no cue
stimulusParameters.instructions{1}=[{'YES if you hear the added click'}, { }, { 'NO if not (or you are uncertain'}];
%   single interval up/down with cue
stimulusParameters.instructions{2}=[{'count how many distinct beeps you hear in the noise'},{' '},...
    {'Try to ignore the noise.'}];

