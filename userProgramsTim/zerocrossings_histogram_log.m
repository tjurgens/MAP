function [histogram_logscale,periodicities]=zerocrossings_histogram_log(ANpattern,sfreq,BFs)
% this function computes the logarithmized fourier transform of winsize
% long slices of each frequency channel in ANpattern.
% the highest peak in the FFT is identified and the value stored in a
% histogram. the weight for this histogram is the logarithmized
% fft-amplitude.
% input: ANpattern: auditory nerve probability pattern with dimension
%                           channels x samples
%        sfreq: sampling frequency
%        BFs: Best frequencies of the channels of ANpattern
% output fth_logscale: fouriertransformhistogram on a logarithmic frequency
% scale that is basically equal to the input BF frequency scale.

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
hamm_window = hamm_window./sum(hamm_window);
halfHamming = (length(hamm_window)-1)/2;

% window specification
win_size = number_of_samples25ms;
hop_size = number_of_samples10ms;

%spontaneous rate
spont_rate = 120;
%preallocation due to speed
%fftbinlength = 2048;
%fth = zeros(fftbinlength/2,size(every_10ms,2)+1);


%choose the frequency resolution and spacing
lowestperiodicities=250; 	highestperiodicities= 3500; 	numChannels=47;
periodicities=round(logspace(log10(lowestperiodicities),log10(highestperiodicities),numChannels));
%BFs = [250:42:586 BFs(17:end)];
histogram_logscale = zeros(length(periodicities),size(every_10ms,2));

for iCounter = 1:size(ANpattern,1) %each channel
    %fprintf('Channel No. %i\n',iCounter);
        
    % enframe this signal
    frames = enframe(ANpattern(iCounter,:),win_size,hop_size);
    

    for frame=1:size(frames,1)
        
               
        smoothed_frame = conv(frames(frame,:),hamm_window);
        smoothed_frame = smoothed_frame(halfHamming+1:end-halfHamming);
        %identify zero-crossings as extending the spontaneous rate
        idx = find((smoothed_frame(1:end-1)<spont_rate)&(smoothed_frame(2:end)>=spont_rate));
        %fsra = 20*log10(abs(fft(smoothed_frame-mean(smoothed_frame),fftbinlength)));
        %fsra = abs(fft(2*(smoothed_frame-mean(smoothed_frame)),fftbinlength))./length(smoothed_frame)*sqrt(2); %scaling, to actually add up firing rates
        %factor 2 is in order to compensate for the subtraction of the mean
        %length and sqrt are scaling factor in order to compensate for
        %matlabs (stupid) fft function
        %fsra = fsra(1:floor(length(fsra)/2));
        
        %convert to frequency
        frequency = sfreq/mean(diff(idx));
        peakrate = max(smoothed_frame);
        %divide again by 2 in order to get "average" firing rates added...
        %fsra=fsra./2;
        
        %t = [0:1/sfreq:fftbinlength/sfreq-1/sfreq];
        %frequency = [0:1/t(end):1/(2*(t(2)-t(1)))];
        %identify peaks in the fft
        %df = [0 ; diff(fsra')];
        %idx = find((df(1:end-1)>=0)&(df(2:end)<0));
%    
        %[sorted,sortedindex]=sort(fsra(idx),'descend');
        % just take the highest value of the fourier-transform
         %valid_peak_index = sortedindex(1:min([length(sortedindex) 1]));
         %amp = sorted(1:min([length(sortedindex) 1]));
         
         
         %store the amplitude of only one peak of the FFT in a histogram
         if (~isempty(frequency))
         %  for k=1:length(valid_peak_index),
         [tmp,tmpindex]=min(abs(periodicities-frequency));
         histogram_logscale(tmpindex,frame) = histogram_logscale(tmpindex,frame)+peakrate*BFs(iCounter);
               % fth(idx(valid_peak_index(k)),frame) = fth(idx(valid_peak_index(k)),frame)+amp(k)*BFs(iCounter);            
        %    end
        end
         frequency = [];
    end
end


% 
% for iCounter = firstindex:length(frequency);
%     %find that BF that fits best to the fft-frequency
%     [tmp,tmpindex]=min(abs(BFs-frequency));
%     %store result over here
%     fth_logscale(tmpindex,:) = fth_logscale(tmpindex,:)+fth(iCounter,:);
% end
% 
