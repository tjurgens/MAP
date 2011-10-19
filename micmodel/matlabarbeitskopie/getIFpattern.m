function downsampledIFpattern = getIFpattern(ANpattern,sfreq,BFlist)
% function that calculates the instantaneous frequency in time slices of the ANpattern
% and stores it into a histogram

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

% window normalization

norm = conv(ones(1,floor(number_of_samples20ms/2)),hamm_window);
norm = norm(5+1:end-5)';
win_size = number_of_samples20ms;
half_win_size = floor(win_size/2);
hop_size = number_of_samples3ms;

%preallocation due to speed
%fach = zeros(half_win_size,size(every_3ms,2)+1);
numChannels = 100;
BFlist100=round(logspace(log10(min(BFlist)),log10(3500),numChannels)); %3500 Hz 
%is the assumed upper limit for formant frequencies and for locking in the AN
IFpattern = zeros(length(BFlist100),size(every_3ms,2)+1);

for iCounter = 1:size(ANpattern,1) %each channel
    %fprintf('Channel No. %i\n',iCounter);
    %time_counter = 1;
    %for jCounter = every_3ms %every 3ms time segment
    
    
    
    %% Guy's code
    % enframe this signal
    
    frames = enframe(ANpattern(iCounter,:),win_size,hop_size);
    
    % compute the autocorrelation
    
    %acf = real(ifft(abs(fft(frames,[],2)).^2,[],2));
    %acf(acf<0)=0;
    %acf = sqrt(acf(:,1:half_win_size));
    
    % smooth with hamming window and take the root
    
    for frame=1:size(frames,1)
        
               
        smoothed_frame = conv(frames(frame,:),hamm_window);
        smoothed_frame = smoothed_frame(halfHamming+1:end-halfHamming);
%         fsra = 20*log10(abs(fft(smoothed_frame-mean(smoothed_frame))));
%         %fsra = abs(fft(smoothed_frame-mean(smoothed_frame)));
%         fsra = fsra(1:floor(length(fsra)/2));
%         
%         t = [0:1/sfreq:length(smoothed_frame)/sfreq-1/sfreq];
%         frequency = [0:1/t(end):1/(2*(t(2)-t(1)))];
%         %identify peaks in the fft
%         df = [0 ; diff(fsra')];
%         idx = find((df(1:end-1)>=0)&(df(2:end)<0));
% %         % interpolate
% %         a=df(idx);
% %         b=df(idx+1);
% %         idx = (idx-1+a./(a-b));
%         [sorted,sortedindex]=sort(fsra(idx),'descend');

        h=hilbert(smoothed_frame-mean(smoothed_frame));
        p=unwrap(angle(h));
        IF = median(diff(p)*sfreq/(2*pi)); %calculate the instantaneous frequency
        %take the mean rate across this frame as a value to be stored in
        %the histogram
        amp = mean(smoothed_frame);
        
        %find the closest value of BFlist to put it into the histogram
        [tmp,idx] = min(abs(IF-BFlist100));
        % just take the highest value of the fourier-transform
         %valid_peak_index = sortedindex(1:min([length(sortedindex) 1]));
         %amp = sorted(1:min([length(sortedindex) 1]));
         
         %valid_peak_index
         %amp
         
         %store valid peaks according to amplitude in a histogram
         %if (~isempty(valid_peak_index))

               IFpattern(idx,frame) = IFpattern(idx,frame)+amp;            
         %   end
        %end
         %transform index into frequencies
         
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




%plot the result
% if ~exist('plothandle'), plothandle=figure; end
% %maxfrequency = 4000;
% %[tmp,number_of_channels_to_display] = min(abs(frequency-maxfrequency));
% %frequency = frequency(1:number_of_channels_to_display);
% 
% set(gcf,'Currentaxes',plothandle);
% 
% YTickIdx = 1:floor(numel(BFlist)/6):numel(BFlist);
% XTickIdx = 1:floor(numel(every_3ms)/6):numel(every_3ms);
% YTickIdxRev = numel(BFlist)+1-YTickIdx;
% if ~isempty(gca)
%     axes(gca);  %#ok<MAXES>
%     imagesc(IFpattern);
%     axis xy
%     set(gca, 'YTick', YTickIdx);
%     set(gca, 'YTickLabel', num2str(BFlist(YTickIdx)', '%0.0f' ));
%     ylabel('frequency (Hz)')
%     set(gca, 'XTick', XTickIdx);
%     set(gca, 'XTickLabel', XTickIdx.*3);
%     xlabel('Time (ms)')
% end

