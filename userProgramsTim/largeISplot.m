%generate a huge 6x3 matrix from variables from workspace

figure(42);
%SNR = [30:-10:-10];

%first row: babble noise
subplot(6,3,1), plot(time,babblenoise(100000:sfreq+100000))
hold on, plot(time, envelope_babble(100000:sfreq+100000),'r')
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-.4 .4])
%spectrum
subplot(6,3,2), fourier_analysis(babblenoise,sfreq);
xlabel('Frequency (Hz)')
ylabel('Fourier amplitude (dB)')
ylim([-20 40])
set(gca,'xTick',[125 250 500 1000 2000 4000]);
set(gca,'xTickLabel',{'125' '250' '500' '1k' '2k' '4k'});
%recognition score
subplot(6,3,3), plot(SNR,fourier_score_1babble,'bo-')
hold on, plot(SNR,ratescore1babble,'k+-')
hold on, plot(SNR,MFCCscore1,'rv-')
hold on, plot(SNR,ZCPAscore1,'gs-')
plot(30,fourier_score_quiet,'bo-')
plot(30,ratescorequiet,'k+-')
plot(30,MFCCscorequiet,'rv-')
plot(30,ZCPAscorequiet,'gs-')
ylim([0 100])
xlim([-15 35])
xlabel('SNR (dB)');
ylabel('recognition rate (%)');
set(gca,'xTick',[-10:10:30]);
set(gca,'xTickLabel',{'-10' '0' '10' '20' 'Quiet'});



%second row: flat broadband babble noise
subplot(6,3,4), plot(time,flatbabblenoise(100000:sfreq+100000))
hold on, plot(time,envelope_flatbabble(100000:sfreq+100000),'r')
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-.4 .4])
%Spectrum
subplot(6,3,5), fourier_analysis(flatbabblenoise,sfreq);
xlabel('Frequency (Hz)')
ylabel('Fourier amplitude (dB)')
ylim([-20 40])
set(gca,'xTick',[125 250 500 1000 2000 4000]);
set(gca,'xTickLabel',{'125' '250' '500' '1k' '2k' '4k'});
%recognition score
subplot(6,3,6), plot(SNR,fourier_score_2flatbabble,'bo-')
hold on, plot(SNR,ratescore2flatbabble,'k+-')
hold on, plot(SNR,MFCCscore2,'rv-')
hold on, plot(SNR,ZCPAscore2,'gs-')
plot(30,fourier_score_quiet,'bo-')
plot(30,ratescorequiet,'k+-')
plot(30,MFCCscorequiet,'rv-')
plot(30,ZCPAscorequiet,'gs-')
ylim([0 100])
xlim([-15 35])
xlabel('SNR (dB)');
ylabel('recognition rate (%)');
set(gca,'xTick',[-10:10:30]);
set(gca,'xTickLabel',{'-10' '0' '10' '20' 'Quiet'});


%third row:  flat narrowband babble noise
subplot(6,3,7), plot(time,flat_narrow_babble(100000:sfreq+100000))
hold on, plot(time,envelope_flat_narrow_babble(100000:sfreq+100000),'r')
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-.4 .4])
subplot(6,3,8), fourier_analysis(flat_narrow_babble,sfreq);
xlabel('Frequency (Hz)')
ylabel('Fourier amplitude (dB)')
ylim([-20 40])
set(gca,'xTick',[125 250 500 1000 2000 4000]);
set(gca,'xTickLabel',{'125' '250' '500' '1k' '2k' '4k'});%recognition score
subplot(6,3,9), plot(SNR,fourier_score_3flatnarrowbabble,'bo-')
hold on, plot(SNR,ratescore3flatnarrowbabble,'k+-')
hold on, plot(SNR,MFCCscore3,'rv-')
hold on, plot(SNR,ZCPAscore3,'gs-')
plot(30,fourier_score_quiet,'bo-')
plot(30,ratescorequiet,'k+-')
plot(30,MFCCscorequiet,'rv-')
plot(30,ZCPAscorequiet,'gs-')
ylim([0 100])
xlim([-15 35])
xlabel('SNR (dB)');
ylabel('recognition rate (%)');
set(gca,'xTick',[-10:10:30]);
set(gca,'xTickLabel',{'-10' '0' '10' '20' 'Quiet'});


%fourth row: modulated pink noise
subplot(6,3,10), plot(time,modulatedpinknoise(100000:sfreq+100000))
hold on, plot(time,envelope_modulatedpinknoise(100000:sfreq+100000),'r')
ylabel('Amplitude')
xlabel('Time (s)')
ylim([-.4 .4])
subplot(6,3,11), fourier_analysis(modulatedpinknoise,sfreq);
xlabel('Frequency (Hz)')
ylabel('Fourier amplitude (dB)')
ylim([-20 40])
set(gca,'xTick',[125 250 500 1000 2000 4000]);
set(gca,'xTickLabel',{'125' '250' '500' '1k' '2k' '4k'});
subplot(6,3,12), plot(SNR,fourier_score_4modulatedpink,'bo-')
hold on, plot(SNR,ratescore4modulatedpink,'k+-')
hold on, plot(SNR,MFCCscore4,'rv-')
hold on, plot(SNR,ZCPAscore4,'gs-')
plot(30,fourier_score_quiet,'bo-')
plot(30,ratescorequiet,'k+-')
plot(30,MFCCscorequiet,'rv-')
plot(30,ZCPAscorequiet,'gs-')
ylim([0 100])
xlim([-15 35])
xlabel('SNR (dB)');
ylabel('recognition rate (%)');
set(gca,'xTick',[-10:10:30]);
set(gca,'xTickLabel',{'-10' '0' '10' '20' 'Quiet'});


%fifth row: pink noise
subplot(6,3,13), plot(time,reallyflatpinknoise(100000:sfreq+100000))
hold on, plot(time,envelope_reallyflatpinknoise(100000:sfreq+100000),'r')
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-.4 .4])
subplot(6,3,14), fourier_analysis(reallyflatpinknoise,sfreq);
xlabel('Frequency (Hz)')
ylabel('Fourier amplitude (dB)')
ylim([-20 40])
set(gca,'xTick',[125 250 500 1000 2000 4000]);
set(gca,'xTickLabel',{'125' '250' '500' '1k' '2k' '4k'});
subplot(6,3,15), plot(SNR,fourier_score_5pinknoise,'bo-')
hold on, plot(SNR,ratescore5pink,'k+-')
hold on, plot(SNR,MFCCscore5,'rv-')
hold on, plot(SNR,ZCPAscore5,'gs-')
plot(30,fourier_score_quiet,'bo-')
plot(30,ratescorequiet,'k+-')
plot(30,MFCCscorequiet,'rv-')
plot(30,ZCPAscorequiet,'gs-')
ylim([0 100])
xlim([-15 35])
xlabel('SNR (dB)');
ylabel('recognition rate (%)');
set(gca,'xTick',[-10:10:30]);
set(gca,'xTickLabel',{'-10' '0' '10' '20' 'Quiet'});


%sixth row: white noise
subplot(6,3,16), plot(time,whitenoise_bp(100000:sfreq+100000))
hold on, plot(time,envelope_white(100000:sfreq+100000),'r')
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-.4 .4])
subplot(6,3,17), fourier_analysis(whitenoise_bp,sfreq);
xlabel('Frequency (Hz)')
ylabel('Fourier amplitude (dB)')
ylim([-20 40])
set(gca,'xTick',[125 250 500 1000 2000 4000]);
set(gca,'xTickLabel',{'125' '250' '500' '1k' '2k' '4k'});
subplot(6,3,18), plot(SNR,fourier_score_6whitenoise,'bo-')
hold on, plot(SNR,ratescore6whitenoise,'k+-')
hold on, plot(SNR,MFCCscore6,'rv-')
hold on, plot(SNR,ZCPAscore6,'gs-')
plot(30,fourier_score_quiet,'bo-')
plot(30,ratescorequiet,'k+-')
plot(30,MFCCscorequiet,'rv-')
plot(30,ZCPAscorequiet,'gs-')
ylim([0 100])
xlim([-15 35])
xlabel('SNR (dB)');
ylabel('recognition rate (%)');
set(gca,'xTick',[-10:10:30]);
set(gca,'xTickLabel',{'-10' '0' '10' '20' 'Quiet'});

subarrange(42,6,3);

axeshandles = get(gcf,'Children');
set(axeshandles(2),'YTickLabel',{'-20' '0' '20' '40'})
set(axeshandles(2), 'yAxisLocation', 'right');
set(axeshandles(5),'YTickLabel',{'-20' '0' '20' '40'}, 'yAxisLocation', 'right')
set(axeshandles(8),'YTickLabel',{'-20' '0' '20' '40'}, 'yAxisLocation', 'right')
set(axeshandles(11),'YTickLabel',{'-20' '0' '20' '40'}, 'yAxisLocation', 'right')
set(axeshandles(14),'YTickLabel',{'-20' '0' '20' '40'}, 'yAxisLocation', 'right')
set(axeshandles(17),'YTickLabel',{'-20' '0' '20' '40'}, 'yAxisLocation', 'right')
