function out_signal = preproc(insignal, samplingfrequency, vocabularyset, pcondition,loganumber)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Preprocessing Function
%
%   Cuts signal and adds (on demand) noise before the speech to initialize
%   PeMos adaptation loops
%
%   usage: out_signal = preproc(insignal, samplingfrequency, vocabularyset, pcondition)
%
%   insignal: with samplingfrequency sampled speech signal
%   samplingfrequency: guess what ?!?
%   vocabularyset: set of vocabulary ('a_a','b_b',...)
%   p_condition: peripheral condition, 
%           pcondition.speechlevel: level of speech in dB SPL for PeMo
%           pcondition.noiselevel: level of noise in dB SPL for PeMo
%           pcondition.audiogram: 'mean' audiogram for both ears in dB HL
%           pcondition.nrmodchan: number of modulation channels (optional)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global home_directory
Verbose = 0;
matlabpath = [home_directory 'matlabarbeitskopie' filesep];
if pcondition.noiselevel == 'nobackgroundnoise'
    pre_noise = 'icra';
else
    pre_noise = 'no';%'whitenoise','olnoise'
end

%cut signal
cutted_signal = cutsignal(insignal, samplingfrequency, vocabularyset);

if Verbose,
    sound(cutted_signal, samplingfrequency);
end

% set levelling as was in the measurements -> slightly increment or
% decrement SPL levels in quiet condition
if strcmp(pcondition.noiselevel,'nobackgroundnoise')
    pcondition.logalevel = make_levelling(loganumber,pcondition);
else
    pcondition.logalevel = pcondition.speechlevel;
end
    


% set speech level
if strcmp(pcondition.auditorymodel,'MAP')
    cutted_signal = cutted_signal./sqrt(mean(cutted_signal.^2)).*10^(-(94-pcondition.logalevel)/20);
    %20*log10(sqrt(mean(cutted_signal.^2))/20e-6) %reference pressure: 20uPa
else
    cutted_signal = cutted_signal./rms(cutted_signal)/db2factor(pcondition.logalevel); 
end

disp('.');
% add (on demand) white noise before speech sample to set initial conditions of
% feedback-loops
t = [0:1/samplingfrequency:0.4-1/samplingfrequency]; %time vector length 0.4s
switch pre_noise
    case 'icra';
        icra_noise = load([matlabpath,'icra_noise.mat']);
        icra_noise = icra_noise.icra_noise/rms(icra_noise.icra_noise)/db2factor(pcondition.speechlevel); %set level of pre-noise to the same as speech
        out_signal = fade_in(cutted_signal,samplingfrequency,icra_noise);
    case 'whitenoise';
        whitenoise = (rand(1,length(t))-0.5);
        out_signal = [whitenoise,cutted_signal']'; % here:set level of speech
    case 'olnoise';
        [olnoise,sf] = wavread([matlabpath,'olnoise.wav']) ;
        %downsampling and taking only one channel
        olnoise = resample(olnoise(:,1),samplingfrequency,sf);
        %cutting
        olnoise = 2.5*olnoise(1:0.4*samplingfrequency); %factor 2.5 for setting the same amplitude range as whitenoise
        out_signal = [olnoise',cutted_signal']';
    case 'no'; %nonoise, instead put silence in front
        silence = zeros(1,length(t));
        out_signal = [silence,cutted_signal']';
end

% %add hearing threshold simulating noise
% hear_thres_noise = masknoise(pcondition.audiogram,length(out_signal),[],samplingfrequency)./1e5;   %HERE SET IN THE AUDIOGRAM
% %1e5 is the factor to come from rainer beutelmanns implementation to pemo-level
% hear_thres_noise = hear_thres_noise(:,1); % take only the left ears threshold simulating noise
% out_signal = hear_thres_noise + out_signal;   

if Verbose,
    figure;
    plot(out_signal);
end