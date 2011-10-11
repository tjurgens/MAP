function softsignal = soft_onset(hardsignal,fs,fadeintime_in_seconds)
hardsignal = hardsignal(:);
fadewindow = hann(ceil(2*fadeintime_in_seconds*fs));
fullfadevector = [fadewindow(1:ceil(end/2))',ones(1,length(hardsignal)...
    -length(fadewindow)-1),fadewindow(ceil(end/2):end)'];
softsignal = hardsignal.*fullfadevector';