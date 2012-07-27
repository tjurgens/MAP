function [ UNIQUEpars, SHAREDpars ] = gethalfOctParams(  )
%GETDEFAULTPARAMS Returns a pair of default parameter structures
%   This function returns some default parameter sets for the gain model.
%   The parameter sets can be modified once they have been created, or
%   alternatively they can be generated from scratch if desired. The
%   main use of this helper function is to reduce code bloat in the demo
%   files.


%%
SHAREDpars.SampleRate = 44100;
SHAREDpars.NumBands = 11;

for nn = 0:SHAREDpars.NumBands-1 %Channels are indexed from zero!
    cf = 250 * ( 2 ^ (nn/2) );
    bw = 1/2;
    loEdge = cf * (2^(-bw/2)); %#ok<NASGU> Warnings suppressed as value is used in eval statement below
    hiEdge = cf * (2^ (bw/2)); %#ok<NASGU> Warnings suppressed as value is used in eval statement below
    
    eval(['SHAREDpars.Band_' num2str(nn) '_LowBandEdge  = loEdge;']);
    eval(['SHAREDpars.Band_' num2str(nn) '_HighBandEdge = hiEdge;']);
    
    eval(['SHAREDpars.Band_' num2str(nn) '_MOCtc = 0.05;']);
    eval(['SHAREDpars.Band_' num2str(nn) '_MOCfactor = 0.74;']);
    eval(['SHAREDpars.Band_' num2str(nn) '_MOClatency = 0.001;']);
    eval(['SHAREDpars.Band_' num2str(nn) '_MOCthreshold_dBspl = 10;']);
end

%%
UNIQUEpars.InputGain_dB = 0;
UNIQUEpars.OutputGain_dB = 0;
UNIQUEpars.ARthreshold_dBSPL = 200;
UNIQUEpars.ARtc = 0.06;
UNIQUEpars.ARlatency = 0.001;

for nn = 0:SHAREDpars.NumBands-1 %Channels are indexed from zero!    
    eval(['UNIQUEpars.Band_' num2str(nn) '_InstantaneousCmpThreshold_dBspl  = 65;']);
    eval(['UNIQUEpars.Band_' num2str(nn) '_DRNLc = 0.2;']);       
    eval(['UNIQUEpars.Band_' num2str(nn) '_Gain_dB  =  50.0;']);
end

end