function downsampledIFpattern = getIFpattern(ANpattern,sfreq,BFlist)
% function that calculates the instantaneous frequency in time slices of the ANpattern
% and stores it into a histogram with weights according to the mean rates
% of these sclices.

time_axis = 0:1/sfreq:(size(ANpattern,2)-1)/sfreq;

%find how many samples of AN_pattern are 10ms and 3ms
%one_sample_is_a_time_of = time_axis(2);
[tmp, start_time_index] = min(abs(0-time_axis));
[tmp, stop20_time_index] = min(abs(0.020-time_axis));
number_of_samples20ms = stop20_time_index - start_time_index;

[tmp, stop3_time_index] = min(abs(0.003-time_axis));
number_of_samples3ms = stop3_time_index - start_time_index;
every_3ms = 1:number_of_samples3ms:size(ANpattern,2)-number_of_samples20ms;

hamm_window = hamming(11);
halfHamming = (length(hamm_window)-1)/2;

% window specification
win_size = number_of_samples20ms;
hop_size = number_of_samples3ms;

%preallocation due to speed
numChannels = 100;
%initialize very dense spaced logarithmic BFlist to put the calculated
%instantaneous frequencies in
BFlist100=round(logspace(log10(min(BFlist)),log10(3500),numChannels)); %3500 Hz 
%is the assumed upper limit for formant frequencies and for locking in the AN
IFpattern = zeros(length(BFlist100),size(every_3ms,2)+1);

for iCounter = 1:size(ANpattern,1) %each channel
    %fprintf('Channel No. %i\n',iCounter);
    
    % enframe this signal
    frames = enframe(ANpattern(iCounter,:),win_size,hop_size);
   
    for frame=1:size(frames,1)
        
               
        smoothed_frame = conv(frames(frame,:),hamm_window);
        smoothed_frame = smoothed_frame(halfHamming+1:end-halfHamming);
%        
        %compute the analytic signal
        h=hilbert(smoothed_frame-mean(smoothed_frame));
        %compute (continuous) phase
        p=unwrap(angle(h));
        IF = median(diff(p)*sfreq/(2*pi)); %calculate the instantaneous frequency as the median!
        %take the mean rate across this frame as a value to be stored in
        %the histogram
        amp = mean(smoothed_frame);
        
        %find the closest value of BFlist to put it into the histogram
        [tmp,idx] = min(abs(IF-BFlist100));
        
        %put the value of the mean rate as a weight into a histogram
         IFpattern(idx,frame) = IFpattern(idx,frame)+amp;            
      
    end
end

%'downsample' the highly resolved pattern by picking out the maximum in
%each desired bin (should be more robust than just taking the average)
%find the index of the BFlist that fits to 3500 Hz

downsampledIFpattern = zeros(floor(size(IFpattern,1)/5),size(frames,1));
for iCounter = 1:floor(size(IFpattern,1)/5) %loop over BFlist channels
    for frame=1:size(frames,1)
        %take the maximum in every 5 channels for the new pattern
       downsampledIFpattern(iCounter,frame) = max(IFpattern((iCounter-1)*5+1:iCounter*5,frame));
    end
end

