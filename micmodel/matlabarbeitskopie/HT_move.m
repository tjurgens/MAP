function HT_out = HT_move(freqs, stepbekesy_results, AFC_freqs, AFC_results);

for iCounter = 1:length(AFC_freqs);
    index_freq(iCounter) = find(round(freqs) == AFC_freqs(iCounter));
    difference(iCounter) = stepbekesy_results(index_freq(iCounter))-AFC_results(iCounter);
end
mean_difference = mean(difference)
HT_out = stepbekesy_results-mean_difference;