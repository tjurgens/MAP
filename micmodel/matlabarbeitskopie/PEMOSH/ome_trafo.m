% OME_TRAFO   transform ome-filter

fsAlt = 44100;
fsNeu = 48000;
R = 0.97;

% ++++++ Filterkoeffizienten nach Pfl�gler et al.; berechnet f�r fs = 44100Hz +++++++
% 1. Teilfilter: Tiefpa�
B1a = [0.109, 0.109];
A1a = [1, -2.5359, 3.9295, -4.7532, 4.7251, -3.5548, 2.1396, -0.9879, 0.2836];
% 2. Teilfilter: Hochpa�
B2a = [1, -2, 1];
A2a = [1, -2*R, R*R];


% +++++++++ neue Filterkoeffizienten f�r neue Samplingfrequenz fsNeu berechnen +++++++++
% 1. Teilfilter: Tiefpa�
H1 = freqz(B1a,A1a,100);   % �bertragungsfunktion des 1. Teilfilters f�r 100 Punkte von 0 bis fsAlt/2 Hz
M1alt = abs(H1);
% neue �bertragungsfunktion (Betrag) berechnen (= alte �F. mit 'Schwanz')
LenAlt = length(M1alt);
LenNeu = round(LenAlt*fsNeu/fsAlt);
M1neu = M1alt;
ExtIndex = 1:LenNeu-LenAlt;
m = log(M1alt(LenAlt))-log(M1alt(LenAlt-1));    % Steigung der alten, logar. �bertragungsfunktion am Ende
logExt = log(M1alt(LenAlt)) + m*ExtIndex;
M1neu(LenAlt+1:LenNeu) = exp(logExt);   	% 'Schwanz' anh�ngen (Extrapolation)
F = 0:1/(LenNeu-1):1;   					% Frequenzvektor
% IIR-Design-Methode aufrufen
[B1n,A1n] = yulewalk(12,F',M1neu);

% 2. Teilfilter: Hochpa�
H2 = freqz(B2a,A2a,100);   % �bertragungsfunktion des 2. Teilfilters f�r 100 Punkte von 0 bis fsAlt/2 Hz
M2alt = abs(H2);
% neue �bertragungsfunktion (Betrag) berechnen (= alte �F. mit 'Schwanz')
LenAlt = length(M2alt);
LenNeu = round(LenAlt*fsNeu/fsAlt);
M2neu = M2alt;
ExtIndex = 1:LenNeu-LenAlt;
m = log(M2alt(LenAlt))-log(M2alt(LenAlt-1));    % Steigung der alten, logar. �bertragungsfunktion am Ende
logExt = log(M2alt(LenAlt)) + m*ExtIndex;
M2neu(LenAlt+1:LenNeu) = exp(logExt);   	% 'Schwanz' anh�ngen (Extrapolation)
F = 0:1/(LenNeu-1):1;   					% Frequenzvektor
% IIR-Design-Methode aufrufen
[B2n,A2n] = yulewalk(10,F',M2neu);


