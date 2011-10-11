function [noise,tones] = masknoise(aud,N,freq,fs,analyzer_data,maskthreshlevel)
% 
% function noise = masknoise(Audiogram,Length,AudiogramFrequencies,SamplingFrequency)
% Rainer Beutelmann
% returns a noise signal that masks pure tones like the hearing threshold
% currently works with noise lengths of 2^n where n is integer due to
% internal fft-processing

[HLFreq,HLevel] = HearingLevel;

% Konstanten
if (exist('fs') ~= 1 || isempty(fs))
    fs = 44100;
end
if (exist('N') ~= 1 || isempty(N))
    N = 65536;
end
if (exist('maskthreshlevel') ~= 1 || isempty(maskthreshlevel))
    maskthreshlevel = 4;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% nehme für N nächsthöhere zweierpotenz wegen FFT
desired_length = N;
potenz = ceil(log(N)/log(2));
N = 2^potenz;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = [(0:N-1)/fs]';
f = ifftshift([(-floor(N/2):ceil(N/2)-1)/N*fs]');

% Hörschwelle Versuchsperson
if (exist('freq') ~= 1 || isempty(freq))
    freq = [125 250 500 750 1000 1500 2000 3000 4000 6000 8000]';
end
if (exist('aud') ~= 1  || isempty(aud))
    aud = zeros(length(freq),2); %Normalhörend ohne Abweichungen
end

if size(aud,1) == 1
    aud = [aud', aud'];  %% falls nur eine Audiogrammseite eingegeben wird, nehme für die andere die gleiche Hörschwelle
end

% Analyzer-Parameter
if (exist('analyzer_data') ~= 1 || isempty(analyzer_data))
    analyzer_data = [16000 100 1000 8000 1];
    %analyzer_data = [44100 140 1000 9000 1];  %[sfreq, lower_cutoff, center, uppercutoff, filterperERB]
end

% ERB-Mittenfrequenzen
tmp = Gfb_Analyzer_new(analyzer_data(1),analyzer_data(2),analyzer_data(3),analyzer_data(4),analyzer_data(5));
fc = tmp.center_frequencies_hz';
clear temp;

% Untere und obere Grenzfrequenz
fl = Gfb_erbscale2hz(Gfb_hz2erbscale(fc)-0.5);
fu = Gfb_erbscale2hz(Gfb_hz2erbscale(fc)+0.5);

% Welche Indizes gehören zu welchem Band
for k = 1:length(fc)
    ind{k} = find(f > fl(k) & f <= fu(k));
end

% Schwelle in dB SPL ausrechnen (4dBfürRauschen + xdBvomAudiogramm + ydBvonabsoluterHörschwelle)
thr(:,1) = maskthreshlevel + interp1(freq,aud(:,1),fc,'linear','extrap') + interp1(HLFreq,HLevel,fc,'linear','extrap');
thr(:,2) = maskthreshlevel + interp1(freq,aud(:,2),fc,'linear','extrap') + interp1(HLFreq,HLevel,fc,'linear','extrap');
%disp(['maskthreshlevel = ' num2str(maskthreshlevel)]);

% Tonkomplex zusammenbauen
tones(:,1) = sqrt(2) * cos(2*pi*t*interp1(f,f,fc','nearest')) * 10.^(thr(:,1)/20);
tones(:,2) = sqrt(2) * cos(2*pi*t*interp1(f,f,fc','nearest')) * 10.^(thr(:,2)/20);

% Spektrum
S = fft(tones);
A = abs(S);

% Energie im Band gleichmäßig verteilen
for k = 1:length(ind)
    A(ind{k},:) = repmat(max(A(ind{k},:)) / sqrt(length(ind{k})),length(ind{k}),1);
end

% Rauschen aus der Phase von Gaußschem Rauschen
x = randn(N,2);
phi = angle(fft(x));
% % Rauschen durch Verwürfeln der Phasen erzeugen
% phi = -pi + 2*pi*rand(N,2);

% relles Zeitsignal generieren
noise = real(ifft(realspec(A .* exp(i*phi))));
% auf gewünschte länge kürzen
noise = noise(1:desired_length,:);
