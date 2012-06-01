%function plot_single_psy

snr = -25:5:5;

for i = 1:length(snr)
    %actualstring = ['snr_' num2str(abs(snr(i))) '.alle.consonantCM'];
    actualstring = ['CM_consonants_speech60_noise' num2str(60-snr(i))];
    eval(['consonantmatrix(' num2str(i) ',:) = diag(' actualstring ')./50;']);
    
end

for i = 1:length(snr)
    %actualstring = ['snr_' num2str(abs(snr(i))) '.alle.vowelCM'];
    actualstring = ['CM_vowels_speech60_noise' num2str(60-snr(i))];
    eval(['vowelmatrix(' num2str(i) ',:) = diag(' actualstring ')./80;']);
    
end