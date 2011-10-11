function level = factor2level(factor)
level = 100+20*log10(factor);

% gibt den pegel aufgrund der aussteuerung an:
% 100 dB: Vollausgesteuert -> Faktor = 1;
% 0 dB: Faktor = 10^-5;