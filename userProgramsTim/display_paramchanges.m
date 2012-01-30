function display_paramchanges(parameterfile)
%displays parameter changes in DRNLParams.a, IHC_cilia_RPParams.Et and dead
%regions as areabarplots

parameterfile = ['MAPparams' parameterfile];
addpath('C:\MAP\parameterStore');
eval(['allparams = ' parameterfile]);
global DRNLParams IHC_cilia_RPParams

figure(32);
subplot(3,1,1),imagesc(allparams.nonlinCF,[], DRNLParams.a');
set(gca,'XScale','log');
subplot(3,1,2),imagesc(allparams.nonlinCF,[],ones(1,length(allparams.nonlinCF)).*IHC_cilia_RPParams.Et);
set(gca,'XScale','log');
subplot(3,1,3),imagesc(allparams.nonlinCF,[],ones(1,length(allparams.nonlinCF)));
set(gca,'XScale','log');
subarrange(32,3,1);
%set(gca,'Color',[0.5 0.5 0.5]);