function [estimates, model] = fit_psychometrische_funktion(SNR,verstaendlichkeit,ratewahrscheinlichkeit)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Diese Funktion berechnet eine psychometrische Funktion als Fit an
% Messdaten aufgrund der Formel in Toms Diplomarbeit mit Hilfe einer
% Bernoulli-Kostenfunktion und plottet die Daten
%
% Usage: [estimates, model] =
% fit_psychometrische_funktion(SNR,verstaendlichkeit,ratewahrscheinlichkeit)
%
% Input: SNR: Signal-Rausch-Abstände bei denen Verständlichkeiten
%               aufgenommen wurden
%        verstandlichkeit: zugehörige Verständlichkeiten in %
%        ratewahrscheinlichkeit: Ratewahrscheinlichkeit der Messung in % [optional]
% Output: estimates(1): SRT [optional]
%         estimates(2): Steigung der psychometrischen Funktion [optional]
%         model: nicht wichtig [optional]
%
% (c) Tim Jürgens, April 2007
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rand('state',sum(100*clock));
if nargin < 3
    ratewahrscheinlichkeit = 0;
end
%ratewahrscheinlichkeit = ratewahrscheinlichkeit./100;
%verstaendlichkeit = verstaendlichkeit./100;
%ratewahrscheinlichkeit = (5*1/14+8*1/10)/13;
saettigungsdifferenz_zu_1 = 0;

%function [estimates, model] = fitcurvedemo(xdata, ydata)
% Call fminsearch with a random starting point.
start_point = rand(1, 2);

start_point(1) = start_point(1)*mean(SNR);
%start_point(3) = start_point(3)*0.1;
model = @psy_fun;
estimates = fminsearch(model, start_point);
% expfun accepts curve parameters as inputs, and outputs sse,
% the sum of squares error for A * exp(-lambda * xdata) - ydata, 
% and the FittedCurve. FMINSEARCH only needs sse, but we want to 
% plot the FittedCurve at the end.
       
    function [sse, FittedCurve] = psy_fun(params)
        %SRT = params(1);
        %slope = params(2);
        %saettigungsdifferenz_zu_1 = params(3);
        %ErrorVector = FittedCurve - verstaendlichkeit;
        %FittedCurve = @(SNR,params) 1./(1+exp(4*params(2)*(params(1)-SNR))).*(1-ratewahrscheinlichkeit)+ratewahrscheinlichkeit;%A .* exp(-lambda * xdata);
        FittedCurve = @(SNR,params) 1./(1+exp(4*params(2)*(params(1)-SNR))).*(1-ratewahrscheinlichkeit-saettigungsdifferenz_zu_1)+ratewahrscheinlichkeit;
        %sse = sum(ErrorVector .^ 2);
        sse = bernkst_sv(params,FittedCurve,[SNR',verstaendlichkeit']');
    end

%figure;
%plot(SNR,verstaendlichkeit.*100,'o');
hold on
xdata = [min(SNR)-10:0.1:max(SNR)+10];
%FittedCurve = @(SNR,params) 1./(1+exp(4*params(2)*(params(1)-SNR))).*(1-ratewahrscheinlichkeit-params(3))+ratewahrscheinlichkeit;%A .* exp(-lambda * xdata);
%FittedCurve = @(SNR,params) 1./(1+exp(4*params(2)*(params(1)-SNR))).*(1-ratewahrscheinlichkeit)+ratewahrscheinlichkeit;
FittedCurve = @(SNR,params) 1./(1+exp(4*params(2)*(params(1)-SNR))).*(1-ratewahrscheinlichkeit-saettigungsdifferenz_zu_1)+ratewahrscheinlichkeit;
gefittete_kurve = FittedCurve(xdata,estimates);%1./(1+exp(4*estimates(2)*(estimates(1)-xdata))).*(1-ratewahrscheinlichkeit)+ratewahrscheinlichkeit;

plot(xdata, 100.*gefittete_kurve, 'k')
xlabel('SNR (dB)');
ylabel('Recognition rate (%)');
%legend('Messdaten','Gefittete psychometrische Funktion','Location','SouthEast');
 
estimates(2) = estimates(2)*(1-ratewahrscheinlichkeit); %auch die steigung wurde durch das ansetzen der ratewahrscheinlichkeit gestaucht.
disp(sprintf('\n Parameter des Fits'));
disp('----------------------');
disp(sprintf('SRT = %0.1f dB',estimates(1)));
disp(sprintf('Steigung = %0.1f %%/dB',estimates(2)*100));
if ratewahrscheinlichkeit == 0
    ;
else
    disp(sprintf('Der Wert der Steigung ist um die Ratewahrscheinlichkeit korrigiert worden\n\n'))
end
% xlabel('xdata')
% ylabel('f(estimates,xdata)')
% title(['Fitting to function ', func2str(model)]);
%legend('data', ['fit using ', func2str(model)])
end