function [ UNIQUEpars, SHAREDpars ] = getOHCloss4hParams(  )
%GETDEFAULTPARAMS Returns a pair of default parameter structures
%   This function returns some default parameter sets for the gain model.
%   The parameter sets can be modified once they have been created, or
%   alternatively they can be generated from scratch if desired. The
%   main use of this helper function is to reduce code bloat in the demo
%   files.


%%
SHAREDpars.SampleRate = 44100;
SHAREDpars.NumBands = 9;

%octave bands at the low-frequency end
SHAREDpars.Band_0_LowBandEdge = 250*2^-.5;
SHAREDpars.Band_0_HighBandEdge= 250*2^.5;
 
SHAREDpars.Band_1_LowBandEdge = 500*2^-.5;
SHAREDpars.Band_1_HighBandEdge= 500*2^.5;
 
SHAREDpars.Band_2_LowBandEdge = 1000*2^-.5;
SHAREDpars.Band_2_HighBandEdge= 1000*2^.25;
 
%half-octave bands at the high-frequency end
cf = 250*2.^(2.5:0.5:5);

SHAREDpars.Band_3_LowBandEdge = cf(1)*2^-.25;
SHAREDpars.Band_3_HighBandEdge= cf(1)*2^.25;
SHAREDpars.Band_4_LowBandEdge = cf(2)*2^-.25;
SHAREDpars.Band_4_HighBandEdge= cf(2)*2^.25;
SHAREDpars.Band_5_LowBandEdge = cf(3)*2^-.25;
SHAREDpars.Band_5_HighBandEdge= cf(3)*2^.25;
SHAREDpars.Band_6_LowBandEdge = cf(4)*2^-.25;
SHAREDpars.Band_6_HighBandEdge= cf(4)*2^.25;
SHAREDpars.Band_7_LowBandEdge = cf(5)*2^-.25;
SHAREDpars.Band_7_HighBandEdge= cf(5)*2^.25;
SHAREDpars.Band_8_LowBandEdge = cf(6)*2^-.25;
SHAREDpars.Band_8_HighBandEdge= cf(6)*2^.25;
% SHAREDpars.SampleRate = 44100;
% SHAREDpars.NumBands = 11;
% 
 for nn = 0:SHAREDpars.NumBands-1 %Channels are indexed from zero!
     %cf = 250 * ( 2 ^ (nn/2) );
     %bw = 1/2;
     %loEdge = cf * (2^(-bw/2)); %#ok<NASGU> Warnings suppressed as value is used in eval statement below
     %hiEdge = cf * (2^ (bw/2)); %#ok<NASGU> Warnings suppressed as value is used in eval statement below
     
     %eval(['SHAREDpars.Band_' num2str(nn) '_LowBandEdge  = loEdge;']);
     %eval(['SHAREDpars.Band_' num2str(nn) '_HighBandEdge = hiEdge;']);
     
     eval(['SHAREDpars.Band_' num2str(nn) '_MOCtc = 0.05;']);
     eval(['SHAREDpars.Band_' num2str(nn) '_MOCfactor = 0.85;']);
     eval(['SHAREDpars.Band_' num2str(nn) '_MOClatency = 0.001;']);
     eval(['SHAREDpars.Band_' num2str(nn) '_MOCthreshold_dBspl = 10;']);%10
 end
 

%%
UNIQUEpars.InputGain_dB = 0;
UNIQUEpars.OutputGain_dB = 0;
UNIQUEpars.ARthreshold_dBSPL = 200;
UNIQUEpars.ARtc = 0.06;
UNIQUEpars.ARlatency = 0.01;

for nn = 0:SHAREDpars.NumBands-1 %Channels are indexed from zero!    
    %eval(['UNIQUEpars.Band_' num2str(nn) '_InstantaneousCmpThreshold_dBspl  = 30;']);
    eval(['UNIQUEpars.Band_' num2str(nn) '_DRNLc = 0.2;']);       
    eval(['UNIQUEpars.Band_' num2str(nn) '_Gain_dB  =  50.0;']);
end

 UNIQUEpars.Band_0_InstantaneousCmpThreshold_dBspl  = 25;
 UNIQUEpars.Band_1_InstantaneousCmpThreshold_dBspl  = 25;
 UNIQUEpars.Band_2_InstantaneousCmpThreshold_dBspl  = 20;
 UNIQUEpars.Band_3_InstantaneousCmpThreshold_dBspl  = 22.5;
 UNIQUEpars.Band_4_InstantaneousCmpThreshold_dBspl  = 25;
 UNIQUEpars.Band_5_InstantaneousCmpThreshold_dBspl  = 30;
 UNIQUEpars.Band_6_InstantaneousCmpThreshold_dBspl  = 35;
 UNIQUEpars.Band_7_InstantaneousCmpThreshold_dBspl  = 37.5;
 UNIQUEpars.Band_8_InstantaneousCmpThreshold_dBspl  = 40;

end