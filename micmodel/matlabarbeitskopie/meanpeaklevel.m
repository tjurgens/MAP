function outlevel = meanpeaklevel(signal)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%
%% this function calculates the mean peak level of a given signal
%%
%% calculates threshold above that 1% the sample values lie
%% that threshold is the mean peak amplitude 
%% convention for pemo: full relative magnitude (-1;1) is 100 dB
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

threshold = [0.5 1]; %initial values
PERCENTTHRESHOLD = 0.1;%0.305;  % this gives the percentage of samples that should lie above the calculated threshold
percent = 0.3; %initial percentage of samples above threshold
iCounter = 1; %loop-counter (maximaler Schleifendurchlauf)
while ((abs(percent - PERCENTTHRESHOLD) > 1e-4) && (iCounter < 10)) %the value 1e-4 is arbitrary
    a = find(abs(signal) > threshold(1));
    percent = length(a)/length(signal);
    threshold(3) = threshold(2);  %silo-variable, die sukzessive die schwelle hochsetzt
    threshold(2) = threshold(1);
    iCounter = iCounter +1;
    if (percent > PERCENTTHRESHOLD)
       threshold(1) = threshold(2) + abs(threshold(2) - threshold(3))/2;  %increase threshold
    else
        threshold(1) = threshold(2) - abs(threshold(2) - threshold(3))/2; %decrease threshold
    end
end
outlevel = 100+20*log10(threshold(1));  %if threshold(1) == 1 then outlevel should be 100dB
                                        %if threshold(1) == 1e-5 then outlevel should be 0dB