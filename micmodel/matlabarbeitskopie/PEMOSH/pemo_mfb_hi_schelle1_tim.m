
% PEMO_MFBHI_SCHELLE1	Oldenburg Perception Model with modulation filterbank
%                       for hearing impaired (preprocessing part) 
%                       after Derleth et al. (2001), Model 1	 
%
%   USAGE:
%     IR = pemo_hi_schelle1(x, fs, HL, [NrModChans])
% 
%   INPUT:  
%              x : input signal (|x| <= 1)
%             fs : sample rate 
%     NrModChans : (optional) number of modulation filterbank channels (default: 8)
%             HL : Hearing loss (matrix; first row: frequencies, second row: hearing loss in dB (audiogram))

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
%     Furterhmore, impaired hearing is modeled according to Derleth et al. (2001), Model 1
%    
%     Ref.: Dau et al., JASA 102(5), 1997, pp. 2892 
%    
%   See also: PEMO
%
%   Copyright University of Oldenburg 2005


function IR = pemo_mfb_hi_schelle1_tim(x, fs, HL, NrModChans)

global hearing_impairment

if nargin < 4,
	NrModChans = 8;  % number of modulation bandpass filters (incl. 2.5 Hz lowpass filter)
elseif NrModChans > 10,
	error('number of requested modulation channels too large (max. = 10)')
end
if nargin < 3,
	HL = [];
end
if nargin < 2,
	error('Not enough input arguments.');
end
 
% ----------------------------------------------------------------------
% settings
% ----------------------------------------------------------------------
MinCF = 225;	 % (desired) minimum center frequency of the Gammatone filterbank in Hz (cf of first filter)
MaxCF = 8000;%min([fs/2, 14500]);	 % (desired) maximum center frequency of the Gammatone filterbank in Hz (cf of last filter)
BW = 1.0;   	 % bandwidth of each gammatone filter in ERB
Dens = 1.0;		 % density of the gammatone filterbank in 1/ERB
LP_cutoff = 0;		% lowpass cutoff frequency of adaptation loops
%FS_Level = 100;		% SPL in dB of full scale (i.e. amplitude = 1) square wave 
%Threshold = 0;		% SPL in dB at hearing threshold
fsTemp = [960, 960, 1200, 2000, 3000, 3000, 4800, 8000, 2000, 3000];
  %fsIR = [ 20,  30,   60,  100,  200,  300,  600,  800, 2000, 3000];    % sample rates for different modulation channels
  fsIR = [ 100,  100,   100,  100,  200,  300,  600,  800, 2000, 3000];    % sample rates for different modulation channels
% mcf =  [2.5,   5,   10, 16.7, 27.8, 46.3,	77.2, 128.6, 214.3, 357.2]; 	% modulation filter center frequencies	

% upsampling of input signal to avoid aliasing in upper gammatone filters
if fs < 44100,
	x = resample(x, min([44100, round(1.5*fs)]), fs);
	fs = min([44100, round(1.5*fs)]);
end

ShowWaitBar = 0;

% calculate center frequencies of gammatone filterbank
[NrFreqChans, CenterFreq, CenterFreq_in_Hz] = GetGammaParam(MinCF, MaxCF, Dens);

if ~any(HL(2,:)),
	HL = [];
end

if isfield(hearing_impairment,'OHC')
    HL_IHC = hearing_impairment.IHC;
    HL_OHC = hearing_impairment.OHC;
else
    error('hearing impairment not found!')
end


%% ye olde
% if ~isempty(HL),
%     amount_of_OHC_HL = 0.8;%new to test the influence of different OHC JT0909
% 	% interpolate hearing loss at center frequencies
% 	HL = interp1([0 HL(1,:) 50000], [HL(2,1) HL(2,:) HL(2,end)], CenterFreq_in_Hz, 'linear', 'extrap');	
% 	%HL = interp1([0 HL(1,:) 50000], [HL(2,1) HL(2,:) HL(2,end)], CenterFreq_in_Hz);	
% 	
%     HL_OHC = min(amount_of_OHC_HL.*HL,65);    %new to test the influence of different OHC JT0909
% 	%HL_OHC = min(0.8*HL, 65);					% hearing loss due to loss of outer hair cells (= 80% of total HL)
% 	index = (CenterFreq_in_Hz <= 2000);
% 	HL_OHC(index) = min(amount_of_OHC_HL.*HL(index), 55); %new to test the influence of different OHC JT0909
%     %HL_OHC(index) = min(0.8*HL(index), 55);		 
% 	HL_IHC = HL - HL_OHC;						% hearing loss due to loss of inner hair cells
% end
%%

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

% ----------------------------------------------------------------------
% actual signal processing
% ----------------------------------------------------------------------
for FreqChanNr = 1:NrFreqChans,
	
	y = gammatone_r(x, CenterFreq(FreqChanNr), BW, fs);		% gammatone bandpass filter	
    %%%%neu JT0809 -> SPL2HL
    y = hearing_threshold_attenuation(y,CenterFreq_in_Hz(FreqChanNr));
    %%%%
    
	y = haircell(y, fs);									% haircell model  
	% Neu ab 2006: Reihenfolge Abschwächung - Expansion
	if ~isempty(HL),
		y = y * 10^(-HL_IHC(FreqChanNr)/20);				% attenuation due to HL_IHC
		y = inst_exp_hi(y, HL_OHC(FreqChanNr));				% instantaneous expansion 
	end
	y = adapt(y, fs, LP_cutoff); %arguments taken out JT Aug/2009 %, Threshold, FS_Level); 		% adaptation loops
    
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
            z = filter(b{ModChanNr},a{ModChanNr},y);	 		% modulation lowpass
		else
        	z = 2*real(filter(b{ModChanNr},a{ModChanNr},y)); 	% modulation bandpass
        end
                    
		% introduce loss of information for higher (i.e. mcf > 10 Hz) modulation channels
        if mcf(ModChanNr) > 10,
    		z = abs(hilbert(z));								% hilbert envelope
            if fsIR(ModChanNr) > 200,
                z = filter(btp{ModChanNr},atp{ModChanNr},z);	% 100 Hz lowpass 
            end
        end
        
        % downsampling from fs to fsIR in two steps
        z = resample(z, fsTemp(ModChanNr), fs);
        if fsTemp(ModChanNr) ~= fsIR(ModChanNr),
            z = resample(z, fsIR(ModChanNr), fsTemp(ModChanNr));
        end

        %%%%neu JT0809 -> internal noise
        if strcmp(hearing_impairment.internalnoise,'yes_steady')
            int_noise = internal_noise(0,hearing_impairment.internalnoise_var,length(z));
            z = z+int_noise;
        end
        %%%%  
		% add this channel (without feed) to internal representation
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
%%	Copyright (C) 1998-2003   	University of Oldenburg, Medical Physics
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
