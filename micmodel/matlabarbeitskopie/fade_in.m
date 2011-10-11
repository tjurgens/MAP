function outsignal = fade_in(insignal, sfreq, prenoise)
inwindow=ones(1,ceil(0.1*sfreq))-hann(ceil(0.1*sfreq))';
fadewindow=[ones(1,ceil(0.375*sfreq)),inwindow(1:ceil(end/2))];
prenoise = prenoise(1:length(fadewindow));
fakenoise = prenoise .* fadewindow';
outsignal = [fakenoise',insignal']';

