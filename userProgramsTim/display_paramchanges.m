function display_paramchanges(parameterfile)
%displays parameter changes in DRNLParams.a, IHC_cilia_RPParams.Et and dead
%regions as areabarplots

parameterfile = ['MAPparams' parameterfile];
addpath('C:\MAP\parameterStore');
eval(['allparams = ' parameterfile]);
global DRNLParams IHC_cilia_RPParams

figure(32);
subplot(3,1,1),image(allparams.nonlinCF,[], DRNLParams.a');
set(gca,'XScale','log');
set(gca,'xTick',[125 250 500 1000 2000 4000 8000]);
set(gca,'xTickLabel',{'125' '250' '500' '1k' '2k' '4k' '8k'});
set(gca,'Colormap','jet');
subplot(3,1,2),image(allparams.nonlinCF,[],ones(1,length(allparams.nonlinCF)).*IHC_cilia_RPParams.Et);
set(gca,'XScale','log');
set(gca,'xTick',[125 250 500 1000 2000 4000 8000]);
set(gca,'xTickLabel',{'125' '250' '500' '1k' '2k' '4k' '8k'});
subplot(3,1,3),image(allparams.nonlinCF,[],ones(1,length(allparams.nonlinCF)));
set(gca,'XScale','log');
set(gca,'xTick',[125 250 500 1000 2000 4000 8000]);
set(gca,'xTickLabel',{'125' '250' '500' '1k' '2k' '4k' '8k'});
subarrange(32,3,1);
%set(gca,'Color',[0.5 0.5 0.5]);