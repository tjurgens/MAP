function plotaudiogram(audiogram)
freqs = [125 250 500 750 1000 1500 2000 3000 4000 6000 8000];
figure, semilogx(freqs,audiogram,'bx--')
a = get(gca,'Children');
set(a,'MarkerSize',16)
set(a,'LineWidth',4)
axis ij
xlim([100 10000])
ylim([-10 100]);
set(gca,'xTick',[125 250 500 1000 2000 4000 8000])
set(gca,'xTickLabel',{'125' '250' '500' '1k' '2k' '4k' '8k'})
set(gca,'FontSize',20)
xlabel('Frequency (Hz)')
ylabel('Hearing loss (dB HL)')
