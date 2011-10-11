function lorentzianfit(x_data, y_data)

%%% fits a normalized lorentzian function to a normalized PDF x_data,y_data

modelFun =  @(p,x) 1 ./ sqrt(2)./pi./p(1)./(1+1./2.*((x_data-p(2))./p(1)).^2)
%funktioniert nicht modelFun =  @(p,x) 2^(-4/5)./ sqrt(p(1))./pi./(1+1./2.*((x_data-p(2))./p(1)).^4)

startingVals = [10 0];

coefEsts = nlinfit(x_data, y_data, modelFun, startingVals);
xgrid = x_data;

%figure, bar(x_data,y_data);
hold on;
line(xgrid, modelFun(coefEsts, xgrid), 'Color','r')