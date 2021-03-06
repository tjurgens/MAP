% This function wraps up whatever version of MAP I want to call. It is
% implemented partly because I want to avoid messing with jobject too much
% and mostly because I dont want to declare globals in my class.

function [myANprobRateOutput, mydt, myBF, BMoutput] = MAPwrap(stimulus, sampleRate, BFlist, participant, AN_spikesOrProbability, paramChanges)



global ANprobRateOutput  dt savedBFlist DRNLoutput


% disp(20*log10(sqrt(mean(stimulus.^2))/20e-6))
MAP1_14(stimulus, sampleRate, BFlist, participant, AN_spikesOrProbability);
% disp(20*log10(sqrt(mean(stimulus.^2))/20e-6))
myANprobRateOutput   = ANprobRateOutput;
BMoutput = DRNLoutput;
mydt = dt;
myBF = savedBFlist;
