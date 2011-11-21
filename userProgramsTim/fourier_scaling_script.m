close all;
sfreq = 44100;
time_axis = 0:1/sfreq:5;
sin_frequency = 1000;
sinsignal = sin(2*pi*sin_frequency.*time_axis);

sinsignal = sinsignal./sqrt(mean(sinsignal.^2));

spectrum = 20*log10(sqrt(2)*abs(fft(sinsignal)./length(sinsignal)));
frequency_axis = [0:sfreq/length(sinsignal):sfreq];
spectrum = spectrum(1:ceil(end/2));
frequency_axis = frequency_axis(1:ceil(end/2));

figure, semilogx(frequency_axis,spectrum);
xlim([100 10000]);



