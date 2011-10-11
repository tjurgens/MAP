% OME_FILT   Aussen- und Mittelohrfilter nach Pflüger et al.
%
%   Aufruf:  
%   y = ome_filt(x, fs)
%   
%    y : gefiltertes Ausgangssignal
%    x : Eingangssignal
%	fs : Samplingfrequenz 
%
%   Beschreibung:
%   Für Samplingfrequenzen von 44.1kHz und 48kHz wird zur Filterung des
%   Eingangssignals ein von Pflügler et al. entworfenes Filter verwendet, 
%   dessen Übertragungsfunktion derjenigen von Aussen- und Mittelohr bei
%   mittleren Pegeln angenähert ist.
%   Für andere Samplingfrequenzen wird ein einfaches Bandpassfilter als grobe
%   Näherung verwendet.
%
%   Ref.: Pflügler, Hoeldrich, Riedler; IEM-Report 02/98 
%         http://iem.at/projekte/publications/iem_report/report02_98/


function y = ome_filt(x, fs);

%R = 0.97;    % Parameter der Hochpassfilterung (-> Pegelabhängigkeit) (0.97 ~ mittlere Pegel)
R = 0.97;
ftp = 0;

% ++++++ Filterkoeffizienten nach Pflügler et al.; berechnet für fs = 44.1kHz, gefittet für 48kHz +++++++
% 2. Teilfilter: Hochpass
B2 = [1, -2, 1];
A2 = [1, -2*R, R*R];
% 1. Teilfilter: Tiefpass
if fs == 44100,
	B1 = [0.109, 0.109];
   	A1 = [1, -2.5359, 3.9295, -4.7532, 4.7251, -3.5548, 2.1396, -0.9879, 0.2836];
elseif fs == 48000,
	B1 = [0.0774, -0.0074, -0.0111, 0.0215, -0.0319, 0.0260, -0.0087, -0.0047, 0.0034, -0.0021, 0.0012, -0.0010, 0.0016];
	A1 = [1.0000, -4.0331, 9.1956, -15.3968, 20.5762, -22.5069, 20.5486, -15.7550, 10.0521, -5.2211, 2.1358, -0.6238, 0.0992];
else 
	% 'simpler' Tiefpass (Butterworth 4. Ordnung, Grenzfrequenz: 12000Hz)
	ftp = 2*12000/fs;		
	if ftp < 1,
		[B1,A1] = butter(4,ftp);
	end
	% 'simpler' Hochpass (Butterworth 2. Ordnung, Grenzfrequenz: 200Hz)
	fhp = 2*200/fs;
	[B2,A2] = butter(2,fhp,'high');
end

% +++++++ Filterung ++++++++
if ftp < 1,
	tmp = filter(B1,A1,x);
else
	tmp = x;
end
y = filter(B2,A2,tmp);


%%-------------------------------------------------------------------------
%%
%%	Copyright (C) 2000-2009   	University of Oldenburg, Medical Physics
%%                              and HörTech gGmbH Oldenburg
%%	
%%	Permission to use, copy, and distribute this software/file and its
%%	documentation for any purpose without permission by University of
%%  Oldenburg, Medical Physics is strictly forbidden.
%%
%%	Permission to modify the software is granted, but not the right to
%%	distribute the modified code.
%%
%%	This software is provided "as is" without express or implied warranty.
%%
%%
%%	AUTHOR
%%
%%		Dr. Rainer Huber
%%		HörTech gGmbH
%%      Marie-Curie-Str. 2
%%      D-26120 Oldenburg
%%      Germany
%%
%%		e-mail : Rainer.Huber@HoerTech.de
%%       phone : +49-(0)441/2172-205
%%
%%-------------------------------------------------------------------------




