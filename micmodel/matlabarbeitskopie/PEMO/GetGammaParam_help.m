% GETGAMMAPARAM    Calculates some parameters that are needed for a
%                  gammatone-filterbank
%   USAGE:
%     [NrChannels, cfERB, cfHz] = getgammaparam(mincf, maxcf, dens)
%
%   INPUT:
%          mincf : lowest center frequency (in Hz)
%          maxcf : highest center frequency (in Hz)
%           dens : density of the filterbank in 1/ERB
%
%   OUTPUT:
%     NrChannels : number of channels of the desired filterbank
%          cfERB : array of center frequencies (in ERB)
%           cfHz : array of center frequencies (in Hz)
%
%   Copyright: University of Oldenburg 1998-2004


% mex-file (dll)



%%-------------------------------------------------------------------------
%%
%%  Copyright (C) 1998-2004     University of Oldenburg, Medical Physics
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
%%      Volker Hohmann
%%      Medical Physics Section
%%      Faculty V - Institute of Physics
%%      University of Oldenburg
%%      Germany
%%
%%      e-mail:     volker.hohmann@.uni-oldenburg.de
%%
%%-------------------------------------------------------------------------



