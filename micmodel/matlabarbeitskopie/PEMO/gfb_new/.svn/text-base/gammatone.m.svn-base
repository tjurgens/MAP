% GAMMATONE    implements one branch of the gammatone filterbank as an
%              4 times iterated complex bandpass filter of first order
%   Usage:
%   OUT = GAMMATONE(IN, CF, BW, FS)
%
%   Parameters:
%   OUT : output array (complex)
%    IN : input array (real input signal)
%    CF : filter center frequency on ERBscale
%    BW : filter bandwidth (factor re. ERB of Auditory Filter)
%    FS : sample rate of input signal
%
%   If IN equates to '1', the impulse response (length 4096) is generated.
%
%   Auditory filter bandwidth:     ERB = 24.7+freq/9.265 (freq in Hz)
%                                  (see Moore and Glasberg (1989))
%   Filter equiv. rect. bandwidth: (see Holdsworth et al. (1988)).
%
%   Copyright: University of Oldenburg 1998-2000


% mex-file (dll)


%%-------------------------------------------------------------------------
%%
%%	Copyright (C) 1998-2000   	University of Oldenburg, Medical Physics
%%	
%%	Permission to use, copy, and distribute this software/file and its
%%	documentation for any purpose without permission by University of
%%  Oldenburg, Medical Physics is strictly forbidden.
%%
%%	Permission to modify the software is granted, but not the right to
%%	distribute the modified code.
%%
%%	This software is provided "as is" without expressed or implied warranty.
%%
%%
%%	AUTHOR
%%
%%		Volker Hohmann
%%		Fachbereich 8, AG Medizinische Physik
%%		Universität Oldenburg
%%		Carl-von-Ossietzky-Str. 9-11
%%      26111 Oldenburg
%%		Germany
%%
%%		e-mail:		vh@medi.physik.uni-oldenburg.de
%%
%%-------------------------------------------------------------------------



