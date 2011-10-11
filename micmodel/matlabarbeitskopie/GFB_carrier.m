function carrier = GFB_carrier(analyzer, signalLen)
% generates the sinus carriers in the frequency channels in the GFB-domain
%
% Tim Jürgens, August 2006
%
% usage:    carrier = GFB_carrier(analyzer,signalLen)
%
% input:    analyzer: GFB-analyzer-structure
%           signalLen: Signal length in Samples
%
% output:   carrier: (Signal length x channel)-matrix with one normed 
%                    sinus signal in every frequency channel

for ChanNr = 1:length(analyzer.center_frequencies_hz)
    carrier(:,ChanNr) = generate_sinus(analyzer.center_frequencies_hz(ChanNr), ...
                        analyzer.sampling_frequency_hz, signalLen);
end

