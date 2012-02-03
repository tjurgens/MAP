function display_paramchanges(parameterfile)
%displays parameter changes in DRNLParams.a, IHC_cilia_RPParams.Et and dead
%regions as areabarplots

parameterfile = ['MAPparams' parameterfile];
addpath('C:\MAP\parameterStore');
eval(['allparams = ' parameterfile ';']);
global DRNLParams IHC_cilia_RPParams

figure;
%prerequisites: concatenate three different colormaps: hot, cool and gray
hotcolormap = flipud(colormap(hot));
coolcolormap = colormap(cool);
graycolormap = colormap(gray);
bigcolormap = [hotcolormap; coolcolormap; graycolormap];
%prerequisites: the 'standard' distribution of frequency channels in order
%to mark dead regions
lowestBF=250; 	highestBF= 8000; 	numChannels=41;
standardBFlist=round(logspace(log10(lowestBF),log10(highestBF),numChannels));


%a) DRNLParams.a
fullparameterrange_a = [0 5e4];
colorrange_to_use = [5 52];
if length(DRNLParams.a) == 1  %produce a vector if it is not yet a vector
    a = zeros(1,length(standardBFlist))+DRNLParams.a;
else
    a = interp1(allparams.nonlinCF,DRNLParams.a,standardBFlist,'nearest','extrap');
end
%plot DRNLParams.a on a logarithmic color scale
%a = [0:5e4/40:5e4];
vectortoplot = max([zeros(1,length(standardBFlist)); log(a+eps)./log(fullparameterrange_a(2)).*(colorrange_to_use(2)-colorrange_to_use(1))])+colorrange_to_use(1);
vectortoplot = vectortoplot(:);
subplot(3,1,1),image(log2(standardBFlist),[], vectortoplot');
%set(gca,'XScale','log');
set(gca,'yTick',[]);
set(gca,'xTick',log2([250 500 1000 2000 4000 8000]));
set(gca,'xTickLabel',{'250' '500' '1k' '2k' '4k' '8k'});
%xlim([250 8000]);
text(log2(300),1,num2str(a(1)));
text(log2(1000),1,num2str(a(17)));
text(log2(4000),1,num2str(a(33)));
text(log2(9000),1,'DRNLParams.a');


%b) endocochlear potential
fullparameterrange_endo = [0.06 0.1];
colorrange_to_use = [65 110];
vectortoplot = (IHC_cilia_RPParams.Et-fullparameterrange_endo(1))./(fullparameterrange_endo(2)-fullparameterrange_endo(1)).*(colorrange_to_use(2)-colorrange_to_use(1))+colorrange_to_use(1);
subplot(3,1,2),image(log2(standardBFlist),[], zeros(1,length(standardBFlist))+vectortoplot);
%set(gca,'XScale','log');
set(gca,'yTick',[]);
set(gca,'xTick',log2([250 500 1000 2000 4000 8000]));
set(gca,'xTickLabel',{'250' '500' '1k' '2k' '4k' '8k'});
text(log2(500),1,[num2str(IHC_cilia_RPParams.Et.*1000) 'mV']);
text(log2(9000),1,'Endococh.Pot.');


%c) dead regions
colorrange_to_use = [2*64+1 3*64];
fullparameterrange_deadregions = [0 1];
%loop for identifying dead regions
channelcounter = 1;
displayvector = zeros(1,length(standardBFlist));
for iCounter = 1:length(standardBFlist)
    if length(allparams.nonlinCF) >= channelcounter && standardBFlist(iCounter)== allparams.nonlinCF(channelcounter)
        displayvector(iCounter) = 1;
        channelcounter = channelcounter+1;
    else
        displayvector(iCounter) = 0;
    end
end
displayvector = (displayvector-fullparameterrange_deadregions(1))./(fullparameterrange_deadregions(2)-fullparameterrange_deadregions(1)).*(colorrange_to_use(2)-colorrange_to_use(1))+colorrange_to_use(1);
subplot(3,1,3),image(log2(standardBFlist),[],displayvector);
%set(gca,'XScale','log');
set(gca,'yTick',[]);
set(gca,'xTick',log2([250 500 1000 2000 4000 8000]));
set(gca,'xTickLabel',{'250' '500' '1k' '2k' '4k' '8k'});
xlabel('Frequency (Hz)');
text(log2(9000),1,'Dead regions');

colormap(bigcolormap);



subarrange(gcf,3,1,[0.1 0.1 0.8 0.8]);
set(gcf,'Position',[100 500 900 180]);
%set(gca,'Color',[0.5 0.5 0.5]);