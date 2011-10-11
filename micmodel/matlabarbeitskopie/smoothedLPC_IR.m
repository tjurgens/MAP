function out_IR = smoothedLPC_IR(filtercoefficients,original_IR);%,tmpIR)
%function out_IR = smoothedLPC_IR(filtercoefficients)
%
%computes from LPC-filtercoefficients an internal representation with 27
%frequency channels. This is a smoothed version of the former internal
%representation that was the basis for calculating the LPC filter
%coefficients
% input: LPC-filtercoefficients
%        original_IR (to extract absolute energy in timestep t_i)
% output: out_IR: smoothed LPC-internal representation

% rms_values = get_rms_from_timesignal(timesignal,sfreq);
% 
% %make sure to have the correct number of rms_values entries
% if length(rms_values) < size(filtercoefficients,2)
%     difference =  size(filtercoefficients,2)- length(rms_values)
%     rms_values = [rms_values zeros(1,difference)];
% elseif length(rms_values) > size(filtercoefficients,2)
%     difference =  length(rms_values)-size(filtercoefficients,2)
%     rms_values = rms_values(1:end-difference);
% end

% rms_values = rms_values.*1000;

%extract energy in frequency channels
for iCounter = 1:size(original_IR,2)
    energy_original(iCounter) = sum(original_IR(:,iCounter));
end
%set to strictly positive values > 1
energy_original = energy_original+abs(min(energy_original))+1;


impulse = [2 zeros(1,971)]; %Impulslaenge ist ganzzahliges Vielfaches von 27
for iCounter = 1:size(filtercoefficients,2)
    impulse_scaled = impulse;
    impulseresponse(:,iCounter) = filter(1,filtercoefficients(:,iCounter),impulse_scaled);
    frequencycharacteristic(:,iCounter) = 20*log10(abs(fft(impulseresponse(:,iCounter))));
end

frequencycharacteristic = frequencycharacteristic(1:(length(impulse))/2,:); %take the first half of ffts output as spectrum


% for debugging
%figure, imagesc(tmpIR);
%figure, imagesc(frequencycharacteristic);

%sample frequencycharacteristic by taking the mean of :
numberofbins = length(impulse)/2/27;
for iCounter = 1:27
   out_IR(iCounter,:) = mean(frequencycharacteristic(1+(iCounter-1)*numberofbins:iCounter*numberofbins,:),1); 
end

%set original energy in frequency channels
for iCounter = 1:size(original_IR,2)
    energy_lpc_smoothed(iCounter) = sum(out_IR(:,iCounter));
    out_IR(:,iCounter) = out_IR(:,iCounter).*energy_original(iCounter)./energy_lpc_smoothed(iCounter);
end
;
    


