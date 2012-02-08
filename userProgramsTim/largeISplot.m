%generate a huge 5x3 matrix from variables from workspace

figure(42);
SNR = [30:-10:-10];

%first row: babble noise
subplot(5,3,1), plot(time,babblenoise(100000:sfreq+100000))
hold on, plot(time, envelope_babble(100000:sfreq+100000),'r')
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-.4 .4])
%spectrum
subplot(5,3,2), fourier_analysis(babblenoise,sfreq);
ylim([-20 40])
set(gca,'xTick',[125 250 500 1000 2000 4000]);
set(gca,'xTickLabel',{'125' '250' '500' '1k' '2k' '4k'});
%recognition score
subplot(5,3,3), plot(SNR,score_1babble,'bo-')
hold on, plot(SNR,ratescore1babble,'k+-')
ylim([0 100])
xlim([-20 40])
xlabel('SNR (dB)');
ylabel('recognition rate (%)');
set(gca,'xTick',[-10:10:30]);
set(gca,'xTickLabel',{'-10' '0' '10' '20' 'Quiet'});



%second row: flat broadband babble noise
subplot(5,3,4), plot(time,flatbabblenoise(100000:sfreq+100000))
hold on, plot(time,envelope_flatbabble(100000:sfreq+100000),'r')
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-.4 .4])
%Spectrum
subplot(5,3,5), fourier_analysis(flatbabblenoise,sfreq);
ylim([-20 40])
set(gca,'xTick',[125 250 500 1000 2000 4000]);
set(gca,'xTickLabel',{'125' '250' '500' '1k' '2k' '4k'});
%recognition score
subplot(5,3,6), plot(SNR,score_2flatbabble,'bo-')
hold on, plot(SNR,ratescore2flatbabble,'k+-')
ylim([0 100])
xlim([-20 40])
xlabel('SNR (dB)');
ylabel('recognition rate (%)');
set(gca,'xTick',[-10:10:30]);
set(gca,'xTickLabel',{'-10' '0' '10' '20' 'Quiet'});


%third row:  flat narrowband babble noise
subplot(5,3,7), plot(time,flat_narrow_babble(100000:sfreq+100000))
hold on, plot(time,envelope_flat_narrow_babble(100000:sfreq+100000),'r')
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-.4 .4])
subplot(5,3,8), fourier_analysis(flat_narrow_babble,sfreq);
ylim([-20 40])
set(gca,'xTick',[125 250 500 1000 2000 4000]);
set(gca,'xTickLabel',{'125' '250' '500' '1k' '2k' '4k'});%recognition score
subplot(5,3,9), plot(SNR,score_3flatnarrowbabble,'bo-')
hold on, plot(SNR,ratescore3flatnarrowbabble,'k+-')
ylim([0 100])
xlim([-20 40])
xlabel('SNR (dB)');
ylabel('recognition rate (%)');
set(gca,'xTick',[-10:10:30]);
set(gca,'xTickLabel',{'-10' '0' '10' '20' 'Quiet'});


%fourth row: modulated pink noise
subplot(5,3,10), plot(time,modulatedpinknoise(100000:sfreq+100000))
hold on, plot(time,envelope_modulatedpinknoise(100000:sfreq+100000),'r')
ylabel('Amplitude')
xlabel('Time (s)')
ylim([-.4 .4])
subplot(5,3,11), fourier_analysis(modulatedpinknoise,sfreq);
ylim([-20 40])
set(gca,'xTick',[125 250 500 1000 2000 4000]);
set(gca,'xTickLabel',{'125' '250' '500' '1k' '2k' '4k'});
subplot(5,3,12), plot(SNR,score_4modulatedpink,'bo-')
hold on, plot(SNR,ratescore4modulatedpink,'k+-')
ylim([0 100])
xlim([-20 40])
xlabel('SNR (dB)');
ylabel('recognition rate (%)');
set(gca,'xTick',[-10:10:30]);
set(gca,'xTickLabel',{'-10' '0' '10' '20' 'Quiet'});


%fifth row: pink noise
subplot(5,3,13), plot(time,reallyflatpinknoise(100000:sfreq+100000))
hold on, plot(time,envelope_reallyflatpinknoise(100000:sfreq+100000),'r')
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-.4 .4])
subplot(5,3,14), fourier_analysis(reallyflatpinknoise,sfreq);
ylim([-20 40])
set(gca,'xTick',[125 250 500 1000 2000 4000]);
set(gca,'xTickLabel',{'125' '250' '500' '1k' '2k' '4k'});
subplot(5,3,15), plot(SNR,score_5pinknoise,'bo-')
hold on, plot(SNR,ratescore5pink,'k+-')
ylim([0 100])
xlim([-20 40])
xlabel('SNR (dB)');
ylabel('recognition rate (%)');
set(gca,'xTick',[-10:10:30]);
set(gca,'xTickLabel',{'-10' '0' '10' '20' 'Quiet'});


subarrange(42,5,3);