function [OHC,IHC] = haircell_loss_from_KLS4PeMo(audiogram, freq, k_best, freq_k_best)

% H�rschwelle Versuchsperson
if (exist('freq') ~= 1 || isempty(freq))
    freq = [125 250 500 750 1000 1500 2000 3000 4000 6000 8000]';
end

if (exist('freq_k_best') ~= 1 || isempty(freq_k_best))
    freq_k_best = [500 1000 2000 4000];
end

%maximaler OHC in den einzelnen frequenzkan�len
maxgain = [55.00   55.000   55.0000   55.00   55.00   55.0000   55.00   55.000   55.00...
    55.0000   55.0000   55.0000   55.0000   55.0000   55.0000   65.0000   65.0000   65.0000...
   65.0000   65.0000   65.0000   65.0000   65.0000   65.0000   65.0000   65.0000   65.0000];

%centerfrequenz der drnl-filter
CF = 1.0e+003.*[ 0.2363    0.2894    0.3484    0.4142    0.4875    0.5691    0.6601    0.7614    0.8743...
1.0000    1.1401    1.2961    1.4699    1.6635    1.8792    2.1194    2.3871    2.6852...
 3.0173    3.3873    3.7994    4.2585    4.7700    5.3397    5.9744    6.6814    7.4690];


%Bestimme Audiogramm-Schwelle in dBHL an den einzelnen CFs
thr = interp1(freq,audiogram,CF,'linear','extrap');


%Bestimme OHC fuer alle Frequenzkanaele
%OHC = 1.*thr;
k_best_interp = interp1(freq_k_best,k_best,CF,'linear','extrap');
for iCounter = 1:length(CF)
    if CF(iCounter) < 500
        k_best_interp(iCounter) = k_best(1);
    elseif CF(iCounter) > 4000
        k_best_interp(iCounter) = k_best(4);
    end
end

OHC = thr.*k_best_interp;

for iCounter = 1:length(maxgain)
    if (OHC(iCounter) > maxgain(iCounter))
        OHC(iCounter) = maxgain(iCounter);
    end

end
IHC = thr-OHC;

