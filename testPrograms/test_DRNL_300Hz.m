function test_DRNL_300Hz
% test_DRNL_Ruggero97 attempts to match Ruggero's (1992 and 1997)
% Tuning curve data are given both as velocity and displacement.
% The aim is to show filter broadening and CF shift comparable to the
%  original data.

global dt  DRNLoutput DRNLParams TMoutput
restorePath=path;
addpath (['..' filesep 'MAP'],    ['..' filesep 'wavFileStore'], ...
    ['..' filesep 'utilities'])

figure(2), clf
dbstop if error
clrs='bgrcmykb';

%  # parameter file name. this is the base set of parameters
MAPparamsName='NormalFeb';

% # probability representation (not directly relevant here as only
%    the DRNL output is used
AN_spikesOrProbability='probability';

% # tone characteristics
sampleRate= 100000;
duration=0.0400;                % Rhode uses 40 ms tones
rampDuration=0.005;            % raised cosine ramp (seconds)
beginSilence=0.050;
endSilence=0.020;

% dataFreqList=[	200	400	600	800	900	1000	1100];
% dataLevels=[12 18 24	30	36	42	48	54	60	66	72	78	84	90];
% displacement=[...
% NaN         0.776       NaN         NaN         NaN         NaN         NaN; 
% NaN         1.36        NaN         NaN         NaN         NaN         NaN; 
%  4.97E+00	9.46E+00	1.25E+01	3.60E+00	-2.70E+00	-1.87E+01	NaN;
% 1.24E+01	1.46E+01	1.87E+01	9.28E+00	2.52E+00	-1.74E+01	NaN;
% 1.67E+01	1.99E+01	2.46E+01	1.49E+01	9.28E+00	-1.38E+01	-1.81E+01;
% 2.20E+01	2.64E+01	3.00E+01	2.00E+01	1.41E+01	-7.86E+00	-1.13E+01;
% 2.71E+01	3.16E+01	3.43E+01	2.55E+01	1.83E+01	-1.56E+00	-8.18E+00;
% 3.16E+01	3.65E+01	3.87E+01	2.95E+01	2.21E+01	3.21E+00	-2.50E+00;
% 3.49E+01	4.13E+01	4.37E+01	3.23E+01	2.61E+01	7.71E+00	2.38E+00;
% 3.95E+01	4.66E+01	4.83E+01	3.56E+01	2.88E+01	1.15E+01	7.52E+00;
% 4.54E+01	5.17E+01	NaN         3.90E+01	3.23E+01	1.33E+01	1.36E+01;
% 5.10E+01	NaN         NaN     	4.35E+01	3.69E+01	1.68E+01	1.86E+01;
% NaN         NaN     	NaN			4.89E+01	4.19E+01	2.37E+01	2.42E+01;
% NaN         NaN     	NaN			NaN         4.60E+01	2.87E+01	3.02E+01;
%     ];
% 
% displacement=displacement*1e-9;

dataLevels=15:6:105;
dataFreqList=[150 300 500 800 1000 1200 1400 1600];
disp.data{1}=[
30.272	1.331;
36.47	2.592;
42.516	5.612;
48.563	11.09;
54.307	19.688;
60.203	31.423;
66.25	43.073;
71.693	53.827;
78.042	82.134;
83.938	150.36;
];
disp.data{2}=[
    16.665	1.79;
22.862	3.539;
29.06	7.212;
35.409	15.156;
41.305	25.322;
47.2	42.954;
53.248	57.99;
58.992	87.056;
64.888	159.371;
70.63	310.01;
];
disp.data{3}=[
    23.467	3.283;
29.514	6.012;
35.561	11.523;
41.759	21.106;
47.805	35.813;
53.55	50.584;
59.446	72.563;
65.342	121.23;
70.935	250.578;
77.284	473.299;
];
disp.data{4}=[
    22.107	1.864;
28.154	3.627;
34.503	7.062;
40.398	13.742;
46.294	23.669;
52.341	35.014;
58.086	49.455;
64.133	76.582;
70.029	118.557;
76.075	223.814;
];
disp.data{5}=[
    22.109	0.758;
28.155	1.545;
34.504	2.874;
40.551	6.514;
46.598	10.721;
52.493	17.373;
58.238	31.315;
64.133	51.527;
70.029	66.436;
76.076	98.279;
81.97	104.98;
87.72	208.45;
];
disp.data{6}=[
    38.889	1.648;
44.936	2.591;
50.832	5.44;
57.03	7.807;
62.623	12.08;
68.52	14.215;
74.568	9.965;
80.468	0.416;
86.511	18.157;
92.556	74.571;
];
disp.data{7}=[
    37.833	0.437;
43.88	0.876;
49.775	1.509;
55.52	2.132;
61.718	2.472;
67.463	3.335;
73.358	7.792;
79.405	17.662;
85.15	26.514;
91.347	60.116;
97.39	103.57;
];
disp.data{8}=[
 49.323	0.383;
55.219	0.756;
61.115	1.282;
67.01	2.347;
72.906	3.921;
78.953	5.627;
84.848	11.287;
91.046	18.868;
96.64	32.48;
102.989	71.45 ;
];


%% # change model parameters
% Parameter changes can be used to change one or more model parameters
%  *after* the MAPparams file has been read

paramChanges={};

% # BF is the BF of the filter to be assessed
BF=300;

paramChanges={...
    'DRNLParams.a=3.5e3;', ...
    'DRNLParams.ctBMdB = 10;', ...
    'DRNLParams.c=.2;', ...
    'DRNLParams.nlBWs=500;', ...
    'DRNLParams.g=1200;', ...
    'DRNLParams.linCFs=330;', ...
    'DRNLParams.linBWs=150;' ...
    };


ctBMdB= 15;
DRNLa=7e5;
ctBM=10e-9*10^(ctBMdB/20);
(['compression threshold (m)=' num2str(ctBM)])

%% plot original data
figure(2)%, cla
for freqNo=1:8
    x=disp.data{freqNo};
semilogy(x(:,1), x(:,2)*1e-9,[':o' clrs(freqNo)]), hold on
end
% ylim([min(min(displacement)) max(max(displacement))])
ylabel('displacement, m')
xlabel('level')
xlim([10 105])
set(gca,'xtick', [ 20:20:100])
title ('DRNL  displacement')
% 
%% now vary level and frequency while measuring the response
toneFrequencyList=dataFreqList;
peakOutputDisp=zeros(length(dataLevels),length(toneFrequencyList));
peakStapesDisp=zeros(length(dataLevels),length(toneFrequencyList));

levelNo=0;
for leveldBSPL=dataLevels
    levelNo=levelNo+1;
    (['level: ' num2str(leveldBSPL)])

    freqNo=0;
    for toneFrequency=toneFrequencyList
        freqNo=freqNo+1;

        %% Generate stimuli
        dt=1/sampleRate;
        time=dt: dt: duration;
        inputSignal=sum(sin(2*pi*toneFrequency'*time), 1);
        amp=10^(leveldBSPL/20)*28e-6;   % converts to Pascals (peak)
        inputSignal=amp*inputSignal;
        % apply ramps
        if rampDuration>0.5*duration, rampDuration=duration/2; end
        rampTime=dt:dt:rampDuration;
        ramp=[0.5*(1+cos(2*pi*rampTime/(2*rampDuration)+pi)) ...
            ones(1,length(time)-length(rampTime))];
        inputSignal=inputSignal.*ramp;
        ramp=fliplr(ramp);
        inputSignal=inputSignal.*ramp;
        % add silence
        intialSilence= zeros(1,round(beginSilence/dt));
        finalSilence= zeros(1,round(endSilence/dt));
        inputSignal= [intialSilence inputSignal finalSilence];

        %% run the model
        MAP1_14(inputSignal, sampleRate, BF, ...
            MAPparamsName, AN_spikesOrProbability, paramChanges);
        
%         if isnan(displacement(levelNo,freqNo))
%             peakOutputDisp(levelNo,freqNo)=NaN;
%             peakStapesDisp(levelNo,freqNo)=NaN;
%         else
            peakOutputDisp(levelNo,freqNo)=max(DRNLoutput);
            peakStapesDisp(levelNo,freqNo)=max(TMoutput);
%         end
        
    end % probe frequencies

    % monitor progress (displacement)
%     figure(2), 
%     semilogy(toneFrequencyList, peakOutputDisp,'-x'), hold on

    figure(2)
    semilogy(dataLevels, (peakOutputDisp)'), hold on
    legend(num2str(toneFrequencyList'),'location','northwest')

end  % dataLevels

% DRNL parameter set
UTIL_showStructureSummary(DRNLParams, 'DRNLParams', 10)

% stimulus characteristics



% if required dump one or more matrices in tab spaced format
%  (suitable for pasting directly into EXCEL.
%     UTIL_printTabTable([toneFrequencyList' peakOutputDisp'])

% leave the path as you found it
path(restorePath)


