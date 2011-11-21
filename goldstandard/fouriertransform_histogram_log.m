function [fth_logscale,BFs]=fouriertransform_histogram_log(ANpattern,sfreq,BFs)
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
halfHamming = (length(hamm_window)-1)/2;

% window specification
win_size = number_of_samples25ms;
hop_size = number_of_samples10ms;

%preallocation due to speed
fftbinlength = 2048;
fth = zeros(fftbinlength/2,size(every_10ms,2)+1);

for iCounter = 1:size(ANpattern,1) %each channel
    %fprintf('Channel No. %i\n',iCounter);
        
    % enframe this signal
    frames = enframe(ANpattern(iCounter,:),win_size,hop_size);
    

    for frame=1:size(frames,1)
        
               
        smoothed_frame = conv(frames(frame,:),hamm_window);
        smoothed_frame = smoothed_frame(halfHamming+1:end-halfHamming);
        %fsra = 20*log10(abs(fft(smoothed_frame-mean(smoothed_frame),fftbinlength)));
        fsra = abs(fft(smoothed_frame-mean(smoothed_frame),fftbinlength));
        fsra = fsra(1:floor(length(fsra)/2));
        
        t = [0:1/sfreq:fftbinlength/sfreq-1/sfreq];
        frequency = [0:1/t(end):1/(2*(t(2)-t(1)))];
        %identify peaks in the fft
        df = [0 ; diff(fsra')];
        idx = find((df(1:end-1)>=0)&(df(2:end)<0));
%    
        [sorted,sortedindex]=sort(fsra(idx),'descend');
        % just take the highest value of the fourier-transform
         valid_peak_index = sortedindex(1:min([length(sortedindex) 1]));
         amp = sorted(1:min([length(sortedindex) 1]));
         
         %store the amplitude of only one peak of the FFT in a histogram
         if (~isempty(valid_peak_index))
            for k=1:length(valid_peak_index),
                fth(idx(valid_peak_index(k)),frame) = fth(idx(valid_peak_index(k)),frame)+amp(k)*BFs(iCounter);            
            end
        end
         
    end
end

%choose the frequency resolution and spacing
lowestBF=250; 	highestBF= 3500; 	numChannels=47;
BFs=round(logspace(log10(lowestBF),log10(highestBF),numChannels));
%BFs = [250:42:586 BFs(17:end)];

fth_logscale = zeros(length(BFs),size(fth,2));
%find lowest frequency value to look after >200Hz:
[tmp,firstindex]=min(abs(200-frequency));
for iCounter = firstindex:length(frequency);
    %find that BF that fits best to the fft-frequency
    [tmp,tmpindex]=min(abs(BFs-frequency(iCounter)));
    %store result over here
    fth_logscale(tmpindex,:) = fth_logscale(tmpindex,:)+fth(iCounter,:);
end

