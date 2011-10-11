% OME_TRAFO   transform ome-filter

fsAlt = 44100;
fsNeu = 48000;
R = 0.97;

% ++++++ Filterkoeffizienten nach Pflügler et al.; berechnet für fs = 44100Hz +++++++
% 1. Teilfilter: Tiefpaß
B1a = [0.109, 0.109];
A1a = [1, -2.5359, 3.9295, -4.7532, 4.7251, -3.5548, 2.1396, -0.9879, 0.2836];
% 2. Teilfilter: Hochpaß
B2a = [1, -2, 1];
A2a = [1, -2*R, R*R];


% +++++++++ neue Filterkoeffizienten für neue Samplingfrequenz fsNeu berechnen +++++++++
% 1. Teilfilter: Tiefpaß
H1 = freqz(B1a,A1a,100);   % Übertragungsfunktion des 1. Teilfilters für 100 Punkte von 0 bis fsAlt/2 Hz
M1alt = abs(H1);
% neue Übertragungsfunktion (Betrag) berechnen (= alte ÜF. mit 'Schwanz')
LenAlt = length(M1alt);
LenNeu = round(LenAlt*fsNeu/fsAlt);
M1neu = M1alt;
ExtIndex = 1:LenNeu-LenAlt;
m = log(M1alt(LenAlt))-log(M1alt(LenAlt-1));    % Steigung der alten, logar. Übertragungsfunktion am Ende
logExt = log(M1alt(LenAlt)) + m*ExtIndex;
M1neu(LenAlt+1:LenNeu) = exp(logExt);   	% 'Schwanz' anhängen (Extrapolation)
F = 0:1/(LenNeu-1):1;   					% Frequenzvektor
% IIR-Design-Methode aufrufen
[B1n,A1n] = yulewalk(12,F',M1neu);

% 2. Teilfilter: Hochpaß
H2 = freqz(B2a,A2a,100);   % Übertragungsfunktion des 2. Teilfilters für 100 Punkte von 0 bis fsAlt/2 Hz
M2alt = abs(H2);
% neue Übertragungsfunktion (Betrag) berechnen (= alte ÜF. mit 'Schwanz')
LenAlt = length(M2alt);
LenNeu = round(LenAlt*fsNeu/fsAlt);
M2neu = M2alt;
ExtIndex = 1:LenNeu-LenAlt;
m = log(M2alt(LenAlt))-log(M2alt(LenAlt-1));    % Steigung der alten, logar. Übertragungsfunktion am Ende
logExt = log(M2alt(LenAlt)) + m*ExtIndex;
M2neu(LenAlt+1:LenNeu) = exp(logExt);   	% 'Schwanz' anhängen (Extrapolation)
F = 0:1/(LenNeu-1):1;   					% Frequenzvektor
% IIR-Design-Methode aufrufen
[B2n,A2n] = yulewalk(10,F',M2neu);


