function aidparams = AidparametersOHCloss6

aidparams = cEssexAid;
%aidparams.sr         = 48e3;
aidparams.numSamples = 48;%1024; %MAX=6912, LAB_USE=48


%------------------------------------------------------------------
% Params for audiometric freqs 250, 500, 1000, 2000, 4000, 8000 Hz
%------------------------------------------------------------------

aidparams.mainGain_dB  = [ 50;    50;    50;    50;    50;   50];   %Gain applied at audiometric frequencies
aidparams.TC_dBSPL      = [25;   25;   20;   25;   35;  40];   %Compression thresholds (in dB HL from 2nd filt)
aidparams.TM_dBSPL      = [40;  40;  40;  40;   40;  40];   %MOC thresholds (in dB OUTPUT from 2nd filt)
aidparams.DRNLc        = [ 0.2;  0.2;  0.2;  0.2;  0.2; 0.2]; %Compression exponent at audiometric frequencies

%------------------------------------------------------------------
% Dynamic compression properties
%------------------------------------------------------------------
aidparams.ARtau = 60e-3;       %decay time constant
aidparams.ARthreshold_dB = 200; %dB SPL (input signal level) =>200 to disable
aidparams.MOCtau = 50e-3;     %Time constant in Seconds
aidparams.MOCfactor = 0.74;     %dB attenuation applied to the input per dB exceeding output threshold

%------------------------------------------------------------------
% Band filtering properties
%------------------------------------------------------------------
aidparams.bwOct = 1/2; %1/1, 1/2, 1/3, 1/4, 1/5
aidparams.filterOrder = 3; %BUTTER=2, GTF=3
aidparams.useGTF = true;%false; %If false, revert to butterworth