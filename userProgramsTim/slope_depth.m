function [TMCBFs,TMCslope,IFMCBFs,IFMCdepth] = slope_depth(datastruct)
% evaluates the average slope of TMCs and depth measure of IFMCs of a given
% datastructure produced by multithreshold profile data
% Tim Jürgens, Sept 2012

% Slopes of TMCs
TMCBFs = datastruct.TMCFreq;
for iCounter = 1:length(TMCBFs)
    [x y]=stripNaNs(datastruct.Gaps,datastruct.TMC(iCounter,:));
    if length(x) > 2
        p = polyfit(x,y,1); %straight line fit
        TMCslope(iCounter) = p(1)*0.1; %to get dB/100ms
    else
        TMCslope(iCounter) = NaN;
    end
end

%Depth of IFMCs
IFMCBFs = datastruct.IFMCFreq;
onfreq_idx = find(datastruct.MaskerRatio == 1); %identify on-frequency case
offfreq_idx(1) = find(datastruct.MaskerRatio == 0.5);
offfreq_idx(2) = find(datastruct.MaskerRatio == 0.7);
offfreq_idx(3) = find(datastruct.MaskerRatio == 1.3);
offfreq_idx(4) = find(datastruct.MaskerRatio == 1.6);
for iCounter = 1:length(IFMCBFs)
    IFMCdepth(iCounter) = nanmean(datastruct.IFMCs(iCounter,offfreq_idx)) - datastruct.IFMCs(iCounter,onfreq_idx);
end



function [a b]=stripNaNs(a,b)
idx=find(~isnan(b)); a=a(idx); b=b(idx);