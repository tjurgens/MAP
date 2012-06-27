%This script plots the single consonant recognition data obtained from the
%model
%SNR = [0 -5 -10 -15 -20];
%SNR = [0 -10 -15 -5 5];
%SNR = [0 -5 -10 -15 5];
%SNR = [0 10 5 -10 -5 15];
%SNR = [0 10 5 -10 -15 -5 15];
SNR = [0 10 5 -10 -15 -5 15];
%matrices_to_use = who('Average_cons*');
matrices_to_use = who('BIGcons*');
%first: collect the data in the appropriate format
for iCounter = 1:length(matrices_to_use)
    %eval(['recognition_rates(:,iCounter) = diag(' matrices_to_use{iCounter} ').*2;']);
    eval(['recognition_rates(:,iCounter) = diag(' matrices_to_use{iCounter} ...
        ').*100./sum(' matrices_to_use{iCounter} ''')'';']);
    %SNR(iCounter) = str2num(matrices_to_use{iCounter}(18:19)) - ...
     %   str2num(matrices_to_use{iCounter}(26:27));
     
     %just to make sure that no NaNs are in recognition rates
     for jCounter = 1:14
         if isnan(recognition_rates(jCounter,iCounter))
             recognition_rates(jCounter,iCounter) = 100/14; %guessing
         end
     end
    average_recognition(iCounter) = mean(recognition_rates(:,iCounter));
end

%%%%%%%%%optional: sort the data
[SNR,idx] = sort(SNR);
recognition_rates = recognition_rates(:,idx);
average_recognition = average_recognition(idx);

%second: plot the data
figure;
plot(SNR,average_recognition,'Color','k','LineWidth',6,'Marker','o','LineStyle','-');
xlabel('SNR (dB)','FontSize',16)
ylabel('recognition rate (%)','FontSize',16);
set(gca,'FontSize',16)
SRT = interp1(average_recognition,SNR,50);
text(-14,90,['SRT = ' num2str(SRT,'%10.1f') ' dB SNR'],'FontSize',16);

c = colormap(jet); %this is the colormap where different colors are taken for the different consonants
markers = {'x','.','>','x','+','*','s','p','d','v','^','<','h','o'};
hold on;
xlim([-15 20])
ylim([0 100])

for iCounter = 1:size(recognition_rates,1)
    plot(SNR,recognition_rates(iCounter,:),'Color',c(iCounter*4,:),...
        'Marker',markers{iCounter},'LineStyle','-','LineWidth',2,'MarkerSize',10);

end
legend('average','/d/','/t/','/g/','/k/','/f/','/s/','/b/','/p/','/v/', ...
    '/ts/','/m/','/n/','/sh/','/l/','Location','SouthEast');