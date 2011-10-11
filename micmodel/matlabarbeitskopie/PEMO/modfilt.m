% MODFILT - digital modulation-filter transfer function
%
%    USAGE:
%      [b, a] = modfilt(mf, fs)
% 
%    INPUT:
%      mf : center frequency of the modulation filter in Hz
%      fs : sample rate in Hz
%
%    OUTPUT:
%      b = [b0,b1, ... ,bN] : numerator coefficients
%      a = [1,a1, ... ,aN]  : denominator coefficients
%
%    Copyright University of Oldenburg 2000-2004

function [b, a]=modfilt(mf, fs)


if nargin < 2,
    error('not enough input arguments!');
end
% type = modulation filter design: 1 = Ewert (1999)
%                                  2 = Dau et al. (1997)
%                                  3 = modified Dau
type = 2;

w0 = 2*pi*mf/fs;
wlp = 2*pi*128/fs;

switch type
    case 1
        Q2 = 0.707 + 0.707./((mf/32).^2 + 1);
        Q3 = 1/(10*Q2^2);

        [b1,a1] = folp(wlp);
    [b2,a2] = sobp(w0,Q2);
    [b3,a3] = sobp(w0,Q3);

    b2 = conv(b2,a3);
    b3 = conv(b3,a2);
    b = 0.75 * b2 + 0.25 * b3;
    b = conv(b,b1); 
    a = conv(a2,a3);
    a = conv(a,a1);

    case 2
    if mf <= 10
        bw = 2*pi*5/fs;
    else
        bw = pi*mf/fs;
    end
    
    [b,a] = efilt(w0,bw);

    case 3
    [b,a] = efilt(w0,w0);
end 

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

% complex frequency shifted first order lowpass
function [b,a] = efilt(w0,bw);

e0 = exp(-bw/2);

b = 1 - e0;
a = [1, -e0*exp(1i*w0)];


%%-------------------------------------------------------------------------
%%
%%  Copyright (C) 2000-2004     University of Oldenburg, Medical Physics
%%  
%%  Permission to use, copy, and distribute this software/file and its
%%  documentation for any purpose without permission by University of
%%  Oldenburg, Medical Physics is strictly forbidden.
%%
%%  Permission to modify the software is granted, but not the right to
%%  distribute the modified code.
%%
%%  This software is provided "as is" without express or implied warranty.
%%
%%  AUTHOR:
%%      Stephan Ewert                           
%%      formerly Medical Physics Section, University of Oldenburg
%%      
%%      Current address:
%%      Ørsted•DTU
%%      Acoustic Technology
%%      Technical University of Denmark
%%      Ørsteds Plads, bldg. 352
%%      DK-2800 Kgs. Lyngby
%%      Denmark
%%
%%      e-mail: se@oersted.dtu.dk
%%
%%-------------------------------------------------------------------------







