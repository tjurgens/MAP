% modf2.m - digital modulation-filter transfer function (bilinear transform)				
%
% Usage: [b,a] = modf2(mf,fs)
%
% mf = center frequency of the modulation filter in Hz
% fs = sampling rate in Hz
%
% b = [b0,b1, ... ,bN] = numerator coefficients
% a = [1,a1, ... ,aN] = denominator coefficients
%
% copyright (c) 1999 Stephan Ewert, Universitaet Oldenburg

function [b,a]=modf2(mf,fs)

Q = 1;
lpcut = 150;

w0 = 2*pi*mf/fs;
wlp = 2*pi*lpcut/fs;

[b1,a1] = folp(wlp);
[b2,a2] = sobp(w0,Q);

b = conv(b1,b2); 
a = conv(a1,a2);

% subfunctions

% second order bandpass filter
function [b,a] = sobp(w0,Q)

W0 = tan(w0/2);
B0 = W0/Q;

b = [B0; 0; -B0];
a = [1 + B0 + W0^2; 2*W0^2 - 2; 1 - B0 + W0^2];

b = b/a(1);
a = a/a(1);

% first order lowpass filter
function [b,a] = folp(w0);

W0 = tan(w0/2);

b = [W0, W0]/(1 + W0);
a = [1,(W0 - 1)/(1 + W0)];

% end of modf.m







