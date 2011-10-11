
% PEMO_MFB	 Oldenburg Perception Model with modulation filterbank 
%
%   USAGE:
%     IR = pemo_mfb(x, fs, [NrModChans])
% 
%   INPUT:  
%              x : input signal (|x| <= 1)
%             fs : sample rate 
%     NrModChans : (optional) number of modulation filterbank channels (default: 8)
%    
%     OUTPUT:
%             IR : NrModChans x N x T - cell array: model output ("internal representation") 
%                  (N = 33 if fs >= 30000, else smaller; T ~ length(x))    
%    
%   DESCRIPTION:
%     The general structure of the model is described in PEMO, with this model
%     differing in the modulation processing stage:
%     Instead of an 8 Hz lowpass filter, a linear filterbank consisting of a
%     2.5 Hz lowpass filter and NrModChans-1 bandpass filters with center frequencies up
%     to 129 Hz (if NrModChans == 8) is used. 
%     The output of each modulation bandpass filter is downsampled to approx.
%     6 times the center frequency of the particular modulation filter, so each 
%     modulation channel of the resulting (3-dimensional) internal representation
%     has a different sample rate.
%    
%     Ref.: Dau et al., JASA 102(5), 1997, pp. 2892 
%    
%   See also: PEMO
%
%   Copyright University of Oldenburg 1998-2005


function IR = pemo_mfb_tim(x, fs, NrModChans);


if nargin < 3,
	NrModChans = 8;  % number of modulation bandpass filters (incl. 2.5 Hz lowpass filter)
elseif NrModChans > 10,
	error('number of requested modulation channels too large (max. = 10)')
end
if nargin < 2,
	error('Not enough input arguments.');
end
 
% ----------------------------------------------------------------------
% settings
% ----------------------------------------------------------------------
Verbatim = 0;       % Verbose mode
lower_cutoff_frequency_hz = 225;%70;
upper_cutoff_frequency_hz = 8000;%6700;
base_frequency_hz = 1000;
%sampling_rate_hz = 16276;
%sampling_rate_hz = 44800;
filters_per_ERB = 1.0;

%MinCF = 145;	 	% (desired) minimum center frequency of the Gammatone filterbank in Hz (cf of first filter)
MinCF = 236;
MaxCF = min([fs/2, 14500]);	 % (desired) maximum center frequency of the Gammatone filterbank in Hz (cf of last filter)
BW = 1.0;   	 	% bandwidth of each gammatone filter in ERB
Dens = 1.0;		 	% density of the gammatone filterbank in 1/ERB
LP_cutoff = 0;		% lowpass cutoff frequency of adaptation loops
FS_Level = 100;		% SPL in dB of full scale (i.e. amplitude = 1) square wave 
Threshold = 0;		% SPL in dB at hearing threshold
fsTemp = [960, 960, 1200, 2000, 3000, 3000, 4800, 8000, 2000, 3000];
  fsIR = [ 100,  100,   100,  100,  200,  300,  600,  800, 2000, 3000];%[20,30,60,100,...]    % sample rates for different modulation channels
% mcf =  [2.5,   5,   10, 16.7, 27.8, 46.3,	77.2, 128.6, 214.3, 357.2]; 	% modulation filter center frequencies	

% upsampling of input signal to avoid aliasing in upper gammatone filters
if fs < 44100,
	x = resample(x, min([44100, round(1.5*fs)]), fs);
	fs = min([44100, round(1.5*fs)]);
end

ShowWaitBar = 0;

% calculate center frequencies of gammatone filterbank
[NrFreqChans, CenterFreq, CenterFreq_in_Hz] = GetGammaParam(MinCF, MaxCF, Dens);
%NrFreqChans
% ----------------------------------------------------------------------
% calculate modulation filter 
% ----------------------------------------------------------------------
mcf(1) = 2.5;	% mcf: modulation bandpass filter center frequencies
				% here: cut-off frequency of the 1. modulation filter (lowpass)
[b{1},a{1}] = butter(2,2*mcf(1)/fs);				% coefficiensts of the 1. modulation filter (lowpass)	    
for ModChanNr = 2:NrModChans,
    if mcf(ModChanNr-1) < 10,
        mcf(ModChanNr) = mcf(ModChanNr-1)*2;		% mcf(2) = 5Hz, mcf(3) = 10Hz
    else
      	mcf(ModChanNr) = mcf(ModChanNr-1)*5/3;		% filter spacing with overlap at -3dB    
    end  
	[b{ModChanNr},a{ModChanNr}] = modfilt(mcf(ModChanNr), fs); 	% coeff. of mod. bandpass filter  
    if fsIR(ModChanNr) > 200,
    	[btp{ModChanNr},atp{ModChanNr}] = butter(2,2*100/fsIR(ModChanNr));	% additional 100 Hz lowpass
																			% (to be applied to envelopes)    
    end
end  

% Indicate progress ("waitbar")
if ShowWaitBar,
	h = waitbar(0, 'Computing internal representation...');
	waitbar(0,h);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MY GFB-code ***************************
analyzer = Gfb_Analyzer_new(fs, lower_cutoff_frequency_hz, ...
                            base_frequency_hz, upper_cutoff_frequency_hz,...
			    filters_per_ERB);
channels = length(analyzer.center_frequencies_hz);
                  
[y, analyzer] = Gfb_Analyzer_process(analyzer, x);
y = real(y);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------------------------------------------
% actual signal processing
% ----------------------------------------------------------------------
for FreqChanNr = 1:channels,
	
	%y = gammatone_r(x, CenterFreq(FreqChanNr), BW, fs);			% gammatone bandpass filter	
	y(FreqChanNr,:) = haircell(y(FreqChanNr,:), fs);  										% haircell model
	y(FreqChanNr,:) = adapt(y(FreqChanNr,:), fs, LP_cutoff);%, Threshold, FS_Level); 			% adaptation loops
    
    % --------------------------------------------------
	% modulation filterbank
	% --------------------------------------------------    
	% only account for modulation channels with mcf <= cf/4 (reject carrier)
    for MaxModChan = 1:NrModChans,
        if mcf(MaxModChan) > CenterFreq_in_Hz(FreqChanNr)/4,
            MaxModChan = MaxModChan - 1;
            break;
        end
    end
    for ModChanNr = 1:MaxModChan,
        if ModChanNr == 1,
            z = filter(b{ModChanNr},a{ModChanNr},y(FreqChanNr,:));	 		% modulation lowpass
		else
        	z = 2*real(filter(b{ModChanNr},a{ModChanNr},y(FreqChanNr,:))); 	% modulation bandpass
        end
        % downsampling from fs to fsIR in two steps
        z = resample(z, fsTemp(ModChanNr), fs);
        if fsTemp(ModChanNr) ~= fsIR(ModChanNr),
            z = resample(z, fsIR(ModChanNr), fsTemp(ModChanNr));
        end              
		% introduce loss of information for higher (i.e. mcf > 10 Hz) modulation channels
        if mcf(ModChanNr) > 10,
    		z = abs(hilbert(z));								% hilbert envelope
            if fsIR(ModChanNr) > 200,
                z = filter(btp{ModChanNr},atp{ModChanNr},z);	% 100 Hz lowpass 
            end
    	end
		% add this channel to internal representation
        IR{ModChanNr}(FreqChanNr,:) = z;
    end  % end for ModChanNr
    
    if ShowWaitBar,
		waitbar(FreqChanNr/NrFreqChans,h);							% refresh display of progress    
	end

end  % end for FreqChanNr

if ShowWaitBar,
	close(h);	% close waitbar
end


%%-------------------------------------------------------------------------
%%
%%	Copyright (C) 1998-2005   	University of Oldenburg, Medical Physics
%%	
%%	Permission to use, copy, and distribute this software/file and its
%%	documentation for any purpose without permission by University of
%%  Oldenburg, Medical Physics is strictly forbidden.
%%
%%	Permission to modify the software is granted, but not the right to
%%	distribute the modified code.
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
%%	This software is provided "as is" without expressed or implied warranty.
%%
%%  AUTHORS:                                                                    
%%     Rainer Huber         <rainer.huber@uni-oldenburg.de>                
%%     Michael Kleinschmidt 
%%     Volker Hohmann		<volker.hohmann@uni-oldenburg.de> 	               
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
