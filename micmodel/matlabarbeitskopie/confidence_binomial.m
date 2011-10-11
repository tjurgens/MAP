function confidence_binomial(n, conf)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% usage: confidence_binomial(n, prozentzahl,
%        vertrauensbereich)
%        n: Stichprobengroesse
%        conf: Prozentzahl des Konfidenzintervalls (default: 0.95)
%        Berechnung ist exakt nach Sachs: Angewandte Statistik 9.Auflage
%        S.433
%        Vorsicht bei der Anwendung auf Verwechslungsmatrizen! Es dürfen
%        nicht Werte innerhalb einer Zeile miteinander verglichen werden,
%        da zwischen denen keine statistische Unabhängigkeit besteht.
%        Insgesamt ist nur eine Fragestellung: unterscheidet sich eine
%        Prozentzahl signifikant (mit conf% Wahrscheinlichkeit) von einer
%        anderen??
%   output: table with ranges of confidence intervals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if nargin <= 1
    conf = 0.95;   %Defaultwert: 95% Konfidenzintervall
end
p = [0:0.01:1]; %Prozentzahl in den jeweiligen Kästchen
x = n.*p;
%%% 1/finv(p,x1,x2) ist die Fisher-Verteilung aus den Tabellen z.B. in
%%% Sachs oder Bronstein


%% Schleife für jede Prozentzahl
for j=1:length(p)
    if p(j) == 0
        lower_limit(j) = 0;
    else
        lower_limit(j) = x(j)/(x(j)+(n-x(j)+1)*1/finv((1-conf)/2,2*x(j),2*(n-x(j)+1)));
    end
    if p(j) == 1
        upper_limit(j) = 1;
    else
        upper_limit(j) = (x(j)+1)*1/finv((1-conf)/2,2*(n-x(j)),2*(x(j)+1))/(n-x(j)+(x(j)+1)*1/finv((1-conf)/2,2*(n-x(j)),2*(x(j)+1)));
    end
end


%% Tabellarische Ausgabe
disp(sprintf('Tabelle der Konfidenzintervalle der Binomialverteilung für n = %i, %d%%-Vertrauensbereich\n',n,conf*100));
disp('-------------------------------------------------------------------------');
disp(sprintf('\n'))
disp(sprintf('Prozentwert \t Untere Grenze \t Obere Grenze\n'));
for i = 1:length(p)
    disp(sprintf('\t%0.2f \t\t\t %0.2f \t\t\t %0.2f ',p(i)*100,lower_limit(i)*100,upper_limit(i)*100));
end
disp('-------------------------------------------------------------------------');

%% Grafische Ausgabe
%figure;
plot(p*100,upper_limit*100);
hold on;
plot(p*100,lower_limit*100);