function aidparams = AidparametersDPeleft

aidparams = cEssexAid;
%aidparams.sr         = 48e3;
aidparams.numSamples = 48;%1024; %MAX=6912, LAB_USE=48


%------------------------------------------------------------------
% Params for audiometric freqs 250, 500, 1000, 2000, 4000, 8000 Hz
%------------------------------------------------------------------
%aidparams.audiometry_dB= [ 25;    28;    45;    45;    10;   35];   %Pure tone threshold in dB SPL
% aidparams.mainGain_dB  = [ 27;    23;    33;    50;    0;   -100];
% aidparams.TC_dBSPL      = [52;   52;   52;   50.3;   52;  40];   %Compression thresholds (in dB HL from 2nd filt)
% aidparams.TM_dBSPL      = [22.9;   19.4;   19.4;   17.7;   17.7;  5];   %MOC thresholds (in dB OUTPUT from 2nd filt)
% aidparams.DRNLc        = [ 0.2;  0.2;  0.2;  0.2;  0.2; 0.2]; %Compression exponent at audiometric frequencies


%aidparams.mainGain_dB  = [ 27;    10;    33;    50;    60;   60];   %Gain applied at audiometric frequencies
%aidparams.TC_dBSPL      = [52;   35;   52;   65;   100;  100];   %Compression thresholds (in dB HL from 2nd filt)
%aidparams.TM_dBSPL      = [45;   25;   45;   45;   100;  100];   %MOC thresholds (in dB OUTPUT from 2nd filt)
%aidparams.DRNLc        = [ 0.2;  0.2;  0.2;  0.2;  0.2; 0.2]; %Compression exponent at audiometric frequencies

aidparams.mainGain_dB  = [ 27;    23;    33;    50;    50;   50];   %Gain applied at audiometric frequencies
aidparams.TC_dBSPL      = [42;   43;   33;   17;   55.4;  48.6];   %Compression thresholds (in dB HL from 2nd filt)
aidparams.TM_dBSPL      = [24.6;   21.1;  22;   16;   12.6;  10.9];   %MOC thresholds (in dB OUTPUT from 2nd filt)
aidparams.DRNLc        = [ 0.2;  0.2;  0.2;  0.2;  0.2; 0.2]; %Compression exponent at audiometric frequencies

%------------------------------------------------------------------
% Dynamic compression properties
%------------------------------------------------------------------
aidparams.ARtau = 60e-3;       %decay time constant
aidparams.ARthreshold_dB = 70; %dB SPL (input signal level) =>200 to disable
aidparams.MOCtau = 50e-3;     %Time constant in Seconds
aidparams.MOCfactor = 0.74;     %dB attenuation applied to the input per dB exceeding output threshold

%------------------------------------------------------------------
% Band filtering properties
%------------------------------------------------------------------
aidparams.bwOct = 1/2; %1/1, 1/2, 1/3, 1/4, 1/5
aidparams.filterOrder = 3; %BUTTER=2, GTF=3
aidparams.useGTF = true;%false; %If false, revert to butterworth