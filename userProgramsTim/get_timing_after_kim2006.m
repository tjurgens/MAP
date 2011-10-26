function outputpattern = get_timing_after_kim2006(ANpattern,sfreq,BFs)
%this is the reprogrammed exploitation of the timing information after 
%Kim, C., Chiu, Y-H, and Stern, R. "Physiologically-motivated synchrony-based 
%processing for robust automatic speech recognition", Proceedings of the 
% Interspeech 2006, pp.1483-1486.

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

norm = conv(ones(1,floor(number_of_samples25ms/2)),hamm_window);
norm = norm(5+1:end-5)';
win_size = number_of_samples25ms;
half_win_size = floor(win_size/2);
hop_size = number_of_samples10ms;

%preallocation due to speed
fftbinlength = 1000;
stft = zeros(half_win_size,size(every_10ms,2)+1);

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
    t = [0:1/sfreq:size(frames,2)/sfreq-1/sfreq];
        frequency = [0:1/t(end):1/(2*(t(2)-t(1)))];
    
    for frame=1:size(frames,1)
                       
        smoothed_frame = conv(frames(frame,:),hamm_window);
        smoothed_frame = smoothed_frame(halfHamming+1:end-halfHamming);
        
        %calculate fft
        stft_tmp = abs(fft(smoothed_frame-mean(smoothed_frame)));
        stft(:,frame) = stft(:,frame)+stft_tmp(1:round(length(stft_tmp)/2))';
        
         
    end
end

liftered_stft = dct_smooth(stft,40);
%summarize channels so that the frequency axis matches best to the BF axis
%double the accuracy of the savedBfs axis
% zaehler =1;
% for iCounter = 1:length(BFs)-1;
%     BFs_new(zaehler) = BFs(iCounter); 
%     zaehler = zaehler+1;
%     BFs_new(zaehler) = 10^((log10(BFs(iCounter))+log10(BFs(iCounter+1)))/2);
%     zaehler = zaehler+1;
% end
outputpattern = zeros(length(BFs),size(liftered_stft,2));
%find lowest frequency value to look after >200Hz:
[tmp,firstindex]=min(abs(200-frequency));

for iCounter = firstindex:length(frequency);
    %find that BF that fits best to the fft-frequency
    [tmp,tmpindex]=min(abs(BFs-frequency(iCounter)));
    %store result over here
    outputpattern(tmpindex,:) = outputpattern(tmpindex,:)+liftered_stft(iCounter,:);
end

