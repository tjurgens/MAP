function [OHC,IHC] = haircell_loss_from_audiogram(audiogram, freq)

% H�rschwelle Versuchsperson
if (exist('freq') ~= 1 || isempty(freq))
    freq = [125 250 500 750 1000 1500 2000 3000 4000 6000 8000]';
end

%maximaler gain in den einzelnen frequenzkan�len
maxgain = [18.7500   20.5000   22.0000   23.5000   24.7500   26.0000   29.2500   32.5000   35.7500...
    39.0000   40.0000   40.0000   40.0000   40.0000   40.0000   40.0000   40.0000   40.0000...
   40.0000   40.0000   40.0000   40.0000   40.0000   40.0000   40.0000   40.0000   40.0000];

%centerfrequenz der drnl-filter
CF = 1.0e+003.*[ 0.2363    0.2894    0.3484    0.4142    0.4875    0.5691    0.6601    0.7614    0.8743...
1.0000    1.1401    1.2961    1.4699    1.6635    1.8792    2.1194    2.3871    2.6852...
 3.0173    3.3873    3.7994    4.2585    4.7700    5.3397    5.9744    6.6814    7.4690];


%Bestimme Schwelle in dBHL an den einzelnen CFs
thr = interp1(freq,audiogram,CF,'linear','extrap');

OHC = 1.*thr;

for iCounter = 1:length(maxgain)
    if (OHC(iCounter) > maxgain(iCounter))
        OHC(iCounter) = maxgain(iCounter);
    end

end
IHC = thr-OHC;

