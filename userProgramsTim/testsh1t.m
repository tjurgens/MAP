% FFT pretty for TIM
 
nfft = 1024; 
% x = randn(1000*44100, 1);
x = sin(   2*pi*2000*(0:(1/44100):10)   );
 
 
y = buffer(x, nfft)'*sparse(diag(hanning(nfft)));
 
figure; imagesc(y)
 
Y = fft(y');
z = abs( mean(Y,2) ).^2;
figure; plot(20*log10(z))
