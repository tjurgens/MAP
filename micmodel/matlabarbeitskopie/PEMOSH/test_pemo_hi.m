% test_pemo_hi

test_freq = 487.5;%erb2freq(2.5725);% erb2freq(33.5725); % 
test_level = 50; 
HL = 50;
T = 2;			% duration of test signal in sec
fs = 40000;

test_amp = 1e-5 * 10^(test_level/20);
t = (1:fs*T)/fs;
testsig = sqrt(2) * test_amp * sin(2*pi*test_freq*t);
testsig = applylev2sig_pemo(testsig,20);
get_sig2lev_pemo(testsig)
MinCF = 0.9 * test_freq;		% (desired) minimum center frequency of the Gammatone filterbank in Hz (first filter)
MaxCF = 1.1 * test_freq;	% (desired) maximum center frequency of the Gammatone filterbank in Hz (last filter)
BW = 1.0;   		% bandwidth of each gammatone filter in ERB (at 60 dB SPL)
Dens = 1.0;			% density of the gammatone filterbank in 1/ERB

% calculate center frequencies of gammatone filterbank 
[NrFreqChans, CenterFreq, CenterFreq_in_Hz] = GetGammaParam(MinCF, MaxCF, Dens);

HL_OHC = min(0.8*HL, 65);					% hearing loss due to loss of outer hair cells (= 80% of total HL)
HL_IHC = HL - HL_OHC;						% hearing loss due to loss of inner hair cells
	
y = gammatone_r(testsig, CenterFreq, BW, fs);		% gammatone bandpass filter	
y = haircell(y, fs);									% haircell model  
%y = testsig;
y = y * 10^(-HL_IHC/20);					% attenuation due to HL_IHC
y = inst_exp_hi(y, HL_OHC);					% instantaneous expansion 

L_In = 20*log10(rms(testsig)/1e-5)
L_Out = 20*log10(rms(y)/1e-5)
