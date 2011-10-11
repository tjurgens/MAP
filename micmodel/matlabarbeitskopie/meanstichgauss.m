clear;
gauss = randn(1,10000000);
figure, hist(gauss,1000);
std(gauss)
%nehme 200 Stichproben aus den gaußverteilten Daten
for i = 1:50,
    i
    stichgauss(i,:) = gauss((i-1)*10000+1:10000*i);
    %std(stichgauss(i,:));
    meanstich_gauss(i) = mean(stichgauss(i,:));
end
meanstich_gauss
figure, hist(meanstich_gauss,50)
std(meanstich_gauss)