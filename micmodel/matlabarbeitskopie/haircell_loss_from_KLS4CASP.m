function [OHC,IHC,CF] = haircell_loss_from_KLS4CASP(audiogram, freq, k_best, freq_k_best)

% Hörschwelle Versuchsperson
if (exist('freq') ~= 1 || isempty(freq))
    freq = [125 250 500 750 1000 1500 2000 3000 4000 6000 8000]';
end

if (exist('freq_k_best') ~= 1 || isempty(freq_k_best))
    freq_k_best = [500 1000 2000 4000];
end

%maximaler gain in den einzelnen frequenzkanälen
%maxgain = [18.7500   20.5000   22.0000   23.5000   24.7500   26.0000   29.2500   32.5000   35.7500...
%    39.0000   40.0000   40.0000   40.0000   40.0000   40.0000   40.0000   40.0000   40.0000...
%   40.0000   40.0000   40.0000   40.0000   40.0000   40.0000   40.0000   40.0000   40.0000];
maxgain = [17 17 25 29.5 34 36 38 41 43 45 46];


%centerfrequenz der drnl-filter
%CF = 1.0e+003.*[ 0.2363    0.2894    0.3484    0.4142    0.4875    0.5691    0.6601    0.7614    0.8743...
%1.0000    1.1401    1.2961    1.4699    1.6635    1.8792    2.1194    2.3871    2.6852...
% 3.0173    3.3873    3.7994    4.2585    4.7700    5.3397    5.9744    6.6814    7.4690];
CF = [125 250 500 750 1000 1500 2000 3000 4000 6000 8000];

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


%new after hearing threshold simulations: a too-large HLIHC causes too high
%thresholds because of compression! TJ 08/2011
% for iCounter = 1:length(IHC)
%     if (IHC(iCounter) > 27.3) && (IHC(iCounter) <= 63.3)
%         IHC(iCounter) = (IHC(iCounter) - 27.3)/3+27.3;
%     elseif IHC(iCounter) > 63.3
%         IHC(iCounter) = IHC(iCounter)-12;
%     else
%     end
% end
for iCounter = 1:length(IHC)
     if (IHC(iCounter) > 30) && (IHC(iCounter) <= 66)
         IHC(iCounter) = (IHC(iCounter) - 30)/3+30;
     elseif IHC(iCounter) > 66
         IHC(iCounter) = IHC(iCounter)-24;
     else
     end
 end
