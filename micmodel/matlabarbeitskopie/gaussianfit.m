function gaussianfit(x_data, y_data)

%%% fits a normalized gaussian function to a normalized PDF x_data,y_data
%modelFun =  @(p,x) (1 ./sqrt(2*pi)./p(1)).* exp(-((x-p(2))./p(1)).^2./2);

%%% fits a normalized 2-sided exponential function to a normalized PDF x_data,y_data
modelFun =  @(p,x) (1 ./ (2*p(1))).* exp(-(abs(x-p(2))./p(1)));
startingVals = [10 0];
coefEsts = nlinfit(x_data, y_data, modelFun, startingVals);
xgrid = x_data;

%figure, bar(x_data,y_data);
hold on;
line(xgrid, modelFun(coefEsts, xgrid), 'Color','r')