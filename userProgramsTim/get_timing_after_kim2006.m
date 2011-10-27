function outputpattern = get_timing_after_kim2006(ANpattern,sfreq,BFs)
%this is the reprogrammed exploitation of the timing information after 
%Kim, C., Chiu, Y-H, and Stern, R. "Physiologically-motivated synchrony-based 
%processing for robust automatic speech recognition", Proceedings of the 
% Interspeech 2006, pp.1483-1486. Unfortunately, the paper has some
% shortcomings in explaining the things that they really did...

time_axis = 0:1/sfreq:(size(ANpattern,2)-1)/sfreq;

%find how many samples of AN_pattern are 10ms and 3ms
%one_sample_is_a_time_of = time_axis(2);
[tmp, start_time_index] = min(abs(0-time_axis));
[tmp, stop25_time_index] = min(abs(0.025-time_axis));
number_of_samples25ms = stop25_time_index - start_time_index;

[tmp, stop10_time_index] = min(abs(0.010-time_axis));
number_of_samples10ms = stop10_time_index - start_time_index;
every_10ms = 1:number_of_samples10ms:size(ANpattern,2)-number_of_samples25ms;

hamm_window = hamming(11);
halfHamming = (length(hamm_window)-1)/2;

% window normalization
win_size = number_of_samples25ms;
half_win_size = floor(win_size/2);
hop_size = number_of_samples10ms;

%preallocation due to speed
stft = zeros(half_win_size,size(every_10ms,2)+1);

for iCounter = 1:size(ANpattern,1) %each channel
    %fprintf('Channel No. %i\n',iCounter);

    % enframe this signal
    frames = enframe(ANpattern(iCounter,:),win_size,hop_size);
    
 
    t = [0:1/sfreq:size(frames,2)/sfreq-1/sfreq];
        frequency = [0:1/t(end):1/(2*(t(2)-t(1)))];
    
    for frame=1:size(frames,1)
                       
        smoothed_frame = conv(frames(frame,:),hamm_window);
        smoothed_frame = smoothed_frame(halfHamming+1:end-halfHamming);
        
        %calculate fft
        stft_tmp = abs(fft(smoothed_frame-mean(smoothed_frame)));
        %average fft across channels by putting them on top of each other
        stft(:,frame) = stft(:,frame)+stft_tmp(1:round(length(stft_tmp)/2))';
        
         
    end
end

%lifter = lowpass in the quefrency domain, nerds!
liftered_stft = dct_smooth(stft,40);

outputpattern = zeros(length(BFs),size(liftered_stft,2));
%find lowest frequency value to look after >200Hz:
[tmp,firstindex]=min(abs(200-frequency));

for iCounter = firstindex:length(frequency);
    %find that BF that fits best to the fft-frequency
    [tmp,tmpindex]=min(abs(BFs-frequency(iCounter)));
    %store result over here
    outputpattern(tmpindex,:) = outputpattern(tmpindex,:)+liftered_stft(iCounter,:);
end

