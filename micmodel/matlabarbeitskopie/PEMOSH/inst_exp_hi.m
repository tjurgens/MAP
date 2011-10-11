% inst_exp    Instante Expansion 
%
% [out, gain] = inst_exp_hi(in, HL)
%
% Instantane Expansion nach Fig. 1, Modell 1 aus
% Derleth et al. (2001) 'Modeling temporal and compressive
% properties of the normal and impaired auditory
% system'. Hear. Res. 159, 132-149.
%
% in:   Eingangssignal (Ausgang des Haarzellen-Modells)
% HL:   Hearing Loss in dB
% out:  Ausgangssignal (Eingang in Nachregelschleifen)
% gain: angewandter Gain in dB
%
% Kalibrierung wie bei Derleth et al: Eine 1 am Eingang
% entspricht 100 dB SPL, 10^-5 entsprechen 0 dB SPL.
%
% Die maximale Expansion erfolgt für HL = 65 dB als Inverse
% der von Moore ermittelten BM-Kompression, die bei einem Input
% von 0 dB einen Output von etwa 55 dB macht (siehe Derleth et al., Fig. 2).
%
% Autoren:  vh 04/03, rh 01/05

function [out,gain] = inst_exp_hi(in, HL)

if nargin < 2,
	error('Not enough input arguments!')
end
if HL < 0
	%warning('got negative HL; will be set to zero.');
	HL = 0;
end
if HL > 65,
	warning('HL exceeds 65 dB; will be set to 65 dB')
	HL = 65;
end

if HL == 0,
	s = size(in);
	gain = zeros(s(1), s(2));
	out = in;
	return
end

% calculate compression function according to Moore
% Koeffizienten des Polynoms, welches die I/O-Funktion beschreibt
d = HL;
c = 0.8;
b = 3/100*(1 - HL/100 - c);
a = -2/300*b;

% Vollis (Schelles) Werte
% a = 0.00007309634810;
% b = -0.01096445221445;
% c = 0.81792929292929;
% d = 54.76853146853145;

x = [0:100];
y = a*x.^3 + b*x.^2 + c*x + d;

% tabulate the inverse and add linear slope
y0 = 0;
x0 = -y(1);
x  = [x0 x];
y  = [y0 y];

% calculate gain
gain = x - y;

% extend ranges for not to get NaN from interp1 in case of out-of-range values
gain = [gain(1) gain gain(end)];
y    = [y(1)-100 y y(end)+100];

% calculate output
in_log  = 20*log10(max(abs(in),1e-10))+100;
gain = interp1(y, gain, in_log);
out  = in.*10.^(gain/20);

return;




