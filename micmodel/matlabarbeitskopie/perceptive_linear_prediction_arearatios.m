function [arearatios,a_values,k] = perceptive_linear_prediction_arearatios(internalrepresentation,filterorder)

%% PERCEPTIVE LINEAR PREDICTION AREARATIOS
% arearatios =
% perceptive_speech_feature_model(internalrepresentation,centerfrequencies)
%
% This function computes from an internal representation the consecutive
% area ratio of a vocal tract model using linear prediction
%
% input: -internalrepresentation: Internal respresentation MxN matrix of the speech
%        signal. M dimensions for frequency channels and N dimensions for
%        equidistant time samples
%        -centerfrequencies: centerfrequencies of the M frequency channels in Hertz 
% output: - arearatios: consecutive area ratio of a vocal tract model, the
%         first entry (arearatios(1)) is always 1
%         - a_values: lpc-filter-coefficients
%
% steps: 1.compute the autocorrelation function R(i) from each IR-feature-vector
%          using inverse DFT
%        2.compute LPC filter coefficients a(i) from each autocorrelation
%          function
%        3.compute simultaneously reflection coefficients k(i) from each
%          autocorrelation function
%        4.compute consecutive area ratios of a simple 1-tube vocal tract
%          model
%
%   (c) Tim Jürgens, August 2009
%%%%%%%%%%%%%%%%%%%%

%parameters used here:
%dft_length = 34; % number of points to use in DFT
%number_poles_lpc = 11;%14;
%fundamental_frequency = 100; %fundamental frequency in hz
%framelength = 2/sfreq_IR*sfreq; %framelength in samples




%% computing IR
%internalrepresentation = pemo_tim(insignal,sfreq);
%number_frequency_channels = size(internalrepresentation,1);
%IR_time_length = size(internalrepresentation,2);
%if number_frequency_channels ~= length(centerfrequencies)
%    error('The Number of frequency channels does not match the number of given center frequencies!');
%end

%insignal-add frame
%insignal = [insignal(:)' zeros(1,framelength)];
%out = zeros(1,IR_time_length/sfreq_IR*sfreq+framelength+1); %initialize outvector that is sampled with sfreq

%% computing power spectrum of internal representation -> shift IR to
%% strictly positive values >= 0
power_spectrumIR = (internalrepresentation+abs(min(min(internalrepresentation)))).^2;
%power_spectrumIR = 10.^(internalrepresentation./10);   %this is closest to
%the power-spectrum needed. But overshoots lead to too high values.


%% computing autocorrelation function in the spectral domain according to
% Makhoul, IEEE (1975), p.570, eq. (69), formula correct, tested with real power-spectrum!
% this part destroys the advantage given by the nonlinear frequency spacing
% of auditory filters. Instead of this: Follow the steps given in PLP (Hermansky 1990)
% for tCounter = 1:IR_time_length %loop for every time-sample
%     for iCounter = 0:(dft_length-1) %loop for every dft-point
%         R(iCounter+1,tCounter)= 0;
%         for mCounter = 1:number_frequency_channels %loop that sums up across frequency channels
%             R(iCounter+1,tCounter) = R(iCounter+1,tCounter)+power_spectrumIR(mCounter,tCounter)*cos(iCounter*2*pi*centerfrequencies(mCounter)/sfreq);
%         end
%         R(iCounter+1,tCounter) = R(iCounter+1,tCounter).*1/number_frequency_channels;
%     end

nbands = size(power_spectrumIR,1);
R_IR = real(ifft([power_spectrumIR;power_spectrumIR([(nbands-1):-1:2],:)]));
R_IR = R_IR(1:nbands,:);

    
    %% compute lpc-coefficients and reflection coefficients using
    % levinson-durbin's algorithm

    [a_values,e,k] = levinson(R_IR(1:filterorder+1,:));
    a_values = a_values';
    k = k';
    %% compute vocal tract areas from reflection coefficients
    for tCounter = 1:size(k,1)
        arearatios(:,tCounter) = kref2csarea(k(tCounter,:));
    end
    k = k';
%% %% %% %% %% LPC Synthesis - simply uncomment this block!
%     
%     rsanreg = 1; %ratio of noisy excitation
%     
%     drivein = drive(fundamental_frequency, sfreq,rsanreg,framelength,0.5,0);
%     
% %     % estimate Level of the signal and synthesize
% %     level(tCounter) = mean(internalrepresentation(:,tCounter));
% %     % limit level to [0 100];
% %     if level(tCounter) > 100
% %         level(tCounter) = 100;
% %     elseif level(tCounter) < 0
% %         level(tCounter) = 0;
% %     end
% %     drivein = drivein./rms(drivein).*10^(level(tCounter)/20);
%     
%     %get desired level from errorsignal (direct, because under- and 
%     %overshoots in the internal representation make it impossible to estimate the level intrinsically)
%     anfang = floor(0.5*(tCounter-1)*framelength)+1;
%     ende = anfang+framelength-1;
%     piece = insignal(anfang:ende);
%     a_direct = lpc(piece,number_poles_lpc);
%     errorsignal = filter(a_direct,1,piece); %Fehlersignal;
%     rms_errorsignal = rms(errorsignal);
%     
%     drivein = drivein.*rms_errorsignal;
% 
%     %Synthese
%     out1 = filter(1,a_values(:,tCounter),drivein);
%     
%     
%     
%     %Zusammensetzung der einzelnen Fenster zu einem Gesamtanregungssignal
%     out1 = out1(1:(ende-anfang)+1);
%     out1 = hanning(length(out1)).*out1';
%     out(anfang:ende) = out(anfang:ende)+out1';
%     
    
end
% figure, plot(out);
% soundsc(out,sfreq);
