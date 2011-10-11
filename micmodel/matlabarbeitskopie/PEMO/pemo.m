
% PEMO  Oldenburg Perception Model (preprocessing part) example 
%
%   USAGE:
%     IR = pemo(x, fs)
% 
%   INPUT:
%      x : input signal (|x| <= 1)
%     fs : sample rate 
%
%   OUTPUT:
%     IR : N x length(x)/fs*100 - matrix: model output ("internal representation") 
%          (N = 35 if fs >= 30000, else smaller)
%
%   DESCRIPTION:
%     This program is designed to process audio data according to the "Perception 
%     Model" of the auditory periphery described in 
%    
%      'A quantitative model of the "effective" signal processing in the auditory 
%      system. I. Model Structure' by Tosten Dau, Dirk Pueschel & Armin Kohlrausch, 
%      JASA 99(6), Jun 1996, pp. 3615.
%    
%     This Perception Model was originally designed to simulate human performance in
%     psychoacoustical experiments (especially masking effects), however, it may also
%     be used as a preprocessing stage for speech recognition algorithms or for the
%     evaluation of audio and speech quality.
%    
%     Steps of signal processing:
%    
%     - GAMMATONE FILTERBANK:
%       The input signal is processed by a bandpass filterbank with N channels. 
%       This is regarded as a model of basilar membrane filtering and so-called 
%       gammatone filters are used as proposed by Patterson in
%    
%         (Patterson, R.D., Nimmo-Smith, J., Holdsworth, J.,Rice, P. (1987). ``An 
%         efficient auditory filterbank based on the gammatone function,'' paper 
%         presented at at a meeting of the IOC Speech Group on Auditory Modeling at 
%         RSRE, Dec. 14-15). 
%    
%       The order of the bandpass filters is four.
%       The number of channels, N, depends on the minimum center frequency (MinCF),
%       the maximum center frequency (MaxCF), density of filters (Dens) and the
%       bandwidth (BW). (In this example: N = 33)
%    
%     All following calculations are carried out individually for each filter 
%     channel.
%    
%     - HAIRCELL MODEL:
%       The haircell model consists of halfwave rectification followed by a lowpass 
%       filtering (cutoff frequency 1 kHz). 
%    
%     - ADAPTATION LOOPS:
%       Next, the signal is adaptively compressed in each channel by so-called
%       adaptive loop stages (ADLs) introduced by Dirk Pueschel.
%       They consist of a chain of five ADLs.  Each ADL consists of a dividing
%       element, the dividend of which is the input signal, while the divisor is
%       formed by the low-pass filtered quotient (the output of the 
%       dividing element). To account for the absolute treshold (which is assumed 
%       to be 100 dB (by default) below the maximum input level), the input to the
%       first loop is limited to a corresponding lower bound by a maximum operation.
%       S t a t i o n a r y   signals are compressed by the 32nd root (as five ADLs 
%       are cascaded), which approximates the logarithm of the input signal.  In this
%       case each of the five stages performs a square root calculation if the capacity
%       of the lowpass has reached saturation. 
%       R a p i d l y  c h a n g i n g  input signals - on the other hand - are 
%       transmitted linearly in the beginning.  This is due to the fact that the 
%       charging states of the capacities, which are the divisor of the dividend,
%       can only be altered according to their respective time constants.  The 
%       compression/decompression is accomplished with a certain time delay.  The 
%       ADLs are able to model forward masking effects, because the input signal is 
%       compressed/expanded according to the former amplitude variations.    
%       The time constants of the first-order low-pass filters in the ADLs are: 5,
%       50, 129, 253, and 500 ms.  The output of the fifth ADL is linearly scaled to
%       so-called Model-Units (MU), in a way that a stationary input at a level
%       between 0...100 dB SPL is mapped to an output with amplitudes between
%       0...100 MU.
%    
%     - MODULATION LOWPASS:
%        A first-order resonance lowpass with cutoff frequency LowpassCutoff 
%       (default is 8 Hz) limits the temporal resolution of the auditory system to
%       envelope fluctuations.  
%    
%     - DATA REDUCTION:                                  
%       Finally, the signal is downsampled to 100Hz (in this example) for the purpose
%       of data reduction. The resulting two-dimensional (time-frequency) 
%       representation is called the ``internal representation'' (IR).  
%
%   Copyright University of Oldenburg 1998-2003


function IR = pemo(x, fs);


if nargin < 2,
    error('Not enough input arguments.');
end

% ----------------------------------------------------------------------
% settings
% ----------------------------------------------------------------------
%MinCF = 145;        % (desired) minimum center frequency of the Gammatone filterbank in Hz (first filter) (formerly: 235)

MinCF = 235;		% !!! +++++++++++++++++++++++++++++++++++++++++++++++++++++ nur zur Repro alter Ergebnisse !!!

MaxCF = min([fs/2, 14500]); % (desired) maximum center frequency of the Gammatone filterbank in Hz (last filter)
BW = 1.0;           % bandwidth of each gammatone filter in ERB
Dens = 1.0;         % density of the gammatone filterbank in 1/ERB
LP_cutoff = 7.96;	% lowpass cutoff frequency of adaptation loops
FS_Level = 100;		% SPL in dB of full scale (i.e. amplitude = 1) square wave 
Threshold = 0;		% SPL in dB at hearing threshold
fsTemp = 1500;
fsIR = 100;         % sample rate of the (downsampled) internal representation in Hz
ShowWaitBar = 0;

% upsampling of input signal to avoid aliasing in upper gammatone filters
if fs < 44100,
	x = resample(x, min([44100, round(1.5*fs)]), fs);
	fs = min([44100, round(1.5*fs)]);
end

% Indicate progress ("waitbar")
if ShowWaitBar,
    h = waitbar(0, 'Computing internal representation...');
    waitbar(0,h);
end

% calculate center frequencies of gammatone filterbank 
[NrFreqChans, CenterFreq, CenterFreq_in_Hz] = GetGammaParam(MinCF, MaxCF, Dens);

% ----------------------------------------------------------------------
% actual signal processing
% ----------------------------------------------------------------------
for FreqChanNr = 1:NrFreqChans,
    
    y = gammatone_r(x, CenterFreq(FreqChanNr), BW, fs);   % gammatone bandpass filter 
	y = haircell(y, fs);                                  % haircell model  
    y = adapt(y, fs, LP_cutoff, Threshold, FS_Level);     % adaptation loops
    
    % downsampling from fs to fsIR in two steps
    y = resample(y, fsTemp, fs);
    y = resample(y, fsIR, fsTemp);
        
    % add this channel to internal representation
    IR(FreqChanNr,:) = y; 

    if ShowWaitBar,
        waitbar(FreqChanNr/NrFreqChans,h);                  % refresh display of progress
    end
    
end  

if ShowWaitBar,
    close(h);   % close waitbar
end

            
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
%%  Some Functions from: Moore and Glasberg, Formulae describing frequency      
%%  selectivity as a function of frequency and level, and their use in          
%%  calculating excitation patterns. Hearing research, 28 (1987) 209-225.
%%  The C-routines the for calculation of the ERB, ERB-scale and the
%%  determination of the center frequencies within the frequency range were taken
%%  from the AIM, Copyright (c) Applied Psychology Unit, Medical Research
%%  Council, 1988-89.     
%%                                                             
%%  This code is a special MATLAB Version, that is partly based on SI and si++       
%%  routines developed by a number of authors of the (ex-)psychoacoustic research
%%  group of the University of Goettingen (3rd Institute of Physics) and
%%  University of Oldenburg (AG Medizinische Physik).                          
%%                                                                           
%%  This software is provided "as is" without expressed or implied warranty.
%%
%%
%%  AUTHORS:                                                                    
%%     Rainer Huber         <rainer.huber@uni-oldenburg.de>                
%%     Michael Kleinschmidt 
%%     Volker Hohmann       <volker.hohmann@uni-oldenburg.de>                  
%%     Martin Hansen        <martin.hansen@fh-oldenburg.de>                 
%%     Juergen Tchorz       
%%     Andreas Krause
%%
%%  ADDRESS:                                                                    
%%     Rainer Huber                                                                           
%%     Medical Physics Section
%%     Faculty V - Institute of Physics
%%     University of Oldenburg                                                    
%%     D-26111 Oldenburg                                                          
%%     Germany         
%%
%%-------------------------------------------------------------------------
                                                           
                                                                             
%%   Tel: ++49 441 2172308                                                     
%%   Fax: ++49 441 2172350                                                     
%%   WWW: http://www.physik.uni-oldenburg.de/Docs/medi/index.html               
%%
%%-------------------------------------------------------------------------
