function rms_values = get_rms_from_timesignal(timesignal,sfreq);

%clear first 400 ms, because they contain irrelevant noise
timesignal = timesignal(round(sfreq*0.4):end);
windowlength = 0.02*sfreq; %windowlength in samples
%padd zeros with length windowlength in front of the timesignal to
%synchronize it with internal representations obvious level contour
timesignal = [zeros(1,windowlength) timesignal']';
numberofframes = floor(length(timesignal)/windowlength)*2;

for iCounter = 1:numberofframes
    piece = timesignal(1+floor((iCounter-1)*windowlength/2):floor((iCounter-1)*windowlength/2)+windowlength);
    piece = piece.*hann(length(piece));
    rms_values(iCounter) = rms(piece);
end
;