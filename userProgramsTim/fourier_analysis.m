function [frequency,z] = fourier_analysis(in, sfreq,color_plot)
%
%plots absolute values of fft of input signal on a semilogarithmic scale
%long term spectrum
%
%use:      [frequency,out] = fourier_analyse(in, sfreq)
%          in: input signal
%          sfreq: samplingfrequency
%          frequency: frequency vector
%          out: fourier-spectrum (complex)
if ~exist('color_plot')
    color_plot = 'b';
end
nfft = 1024; 
y = buffer(in, nfft)'*sparse(diag(hanning(nfft)));
out = fft(y');  %%Normierung auf Wurzel der Länge, da Matlab intern ohne Normierung der Hin-Fouriertransformation arbeitet
t = [0:1/sfreq:nfft/sfreq-1/sfreq];
frequency = [0:1/t(end):1/(2*(t(2)-t(1)))];
%spektrale leistungsdichte wird geplottet, wobei eine amplitude von 1 100
%dB entspricht
z = abs( mean(out,2) ).^2;
semilogx(frequency,20*log10(z(1:floor(nfft/2))),color_plot);
%sqrt(2) weil Gesamtenergie auch in Spiegelfrequenzen enthalten
xlabel('frequency / Hz');
xlim([100 5000])
ylabel('fourier amplitude / dB');





% % FFT pretty for TIM
%  
% nfft = 1024; 
% % x = randn(1000*44100, 1);
% x = sin(   2*pi*2000*(0:(1/44100):10)   );
%  
%  
% y = buffer(x, nfft)'*sparse(diag(hanning(nfft)));
%  
% figure; imagesc(y)
%  
% Y = fft(y');
% z = abs( mean(Y,2) ).^2;
% figure; plot(20*log10(z))
