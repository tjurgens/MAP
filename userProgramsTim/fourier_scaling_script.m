close all;
sfreq = 44100;
time_axis = 0:1/sfreq:1;
sin_frequency = 1000;
sinsignal = sin(2*pi*sin_frequency.*time_axis);
sin_frequency = 2000;
sinsignal = sinsignal+cos(2*pi*sin_frequency.*time_axis);

sinsignal = sinsignal./sqrt(mean(sinsignal.^2));

spectrum = sqrt(2)*abs(fft(sinsignal)./length(sinsignal));
frequency_axis = [0:sfreq/length(sinsignal):sfreq];
spectrum = spectrum(1:ceil(end/2));
frequency_axis = frequency_axis(1:ceil(end/2));

figure, semilogx(frequency_axis,spectrum);
xlim([100 10000]);


whitenoise = rand(1,1*sfreq+1);
whitenoise = whitenoise./sqrt(mean(whitenoise.^2));

spectrum_wn = sqrt(2)*abs(fft(whitenoise)./length(whitenoise));
frequency_axis = [0:sfreq/length(whitenoise):sfreq];
spectrum_wn = spectrum_wn(1:ceil(end/2));
frequency_axis = frequency_axis(1:ceil(end/2));

figure, semilogx(frequency_axis,spectrum_wn);
xlim([100 10000]);