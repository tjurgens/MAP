function level = get_sig2lev_pemo(signal)
%calculates the level in dB SPL that PEMO sees, when putting in the signal
%author: JT 0508

level = rms(signal);
level = 100+20*log10(level);