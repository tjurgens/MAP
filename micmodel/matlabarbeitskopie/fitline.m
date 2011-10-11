function [m,b,sigma_m,sigma_b,r_mb,chi2,Q] = fitline(x,y,sigma)
%
% fits a line m*x+b to data y(x), x and y vectors.
% returns best slope m and axis intercept b, 
% in addition the standard deviations of m and b,
% the correlation coefficient r_mb,
% and the goodness-of-fit Q.
%
% The formulas are taken from numerical recipes, chapter 15.2.
%
% INPUT ARGUMENTS
%
% 1. x       vector of values on the abscissa
% 2. y       vector of values on the ordinate
% 3. sigma   vector of standard deviations of x, default ones(length(x),1)
%
% OUTPUT ARGUMENTS
%
% 1. m       slope of the fitted line
% 2. b       axis intercept of the fitted line
% 3. sigma_m standard deviation of the slope of the fitted line
% 4. sigma_b standard deviation of the axis intercept of the fitted line
% 5. r_mb    correlation coefficient between sigma_m and sigma_b
% 6. chi2    chi^2-value, residual quadratic error measure (including sigma)
% 7. Q       goodness of fit
%
% AUTHOR :   Helmut Riedel
% DATE   :   June 2008
%
% USAGE  :   [m,b,sigma_m,sigma_b,r_mb,chi2,Q] = fitline(x,y,sigma);
% EXAMPLE:   [m,b,sigma_m,sigma_b,r_mb,chi2,Q] = fitline((0:.01:1)',2*(0:.01:1)'+3+0.1*randn(101,1),ones(101,1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1. handling of input arguments %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin < 3 | isempty(sigma)
  sigma = ones(length(x),1);
end
if nargin < 2
  error([mfilename ': at least input vectors x and y must be specified']);
end

N = length(x);
if prod(size(x)) ~= N
  error([mfilename ': x must be a vector']);
end
if length(y) ~= N
  error([mfilename ': x and y must have the same length']);
end
if length(sigma) ~= N
  error([mfilename ': x and sigma must have the same length']);
end
x = x(:); y = y(:); sigma = sigma(:);   % make them all columns

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2. write down the formulas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S   = sum(1./sigma.^2);
Sx  = sum(x./sigma.^2);
Sy  = sum(y./sigma.^2);
Sxx = sum(x.^2./sigma.^2); 
Sxy = sum(x.*y./sigma.^2);

Delta = S*Sxx - Sx^2;
m = (S*Sxy  - Sx*Sy)  / Delta;
b = (Sxx*Sy - Sx*Sxy) / Delta;

sigma_m = sqrt(S  /Delta);
sigma_b = sqrt(Sxx/Delta);
r_mb = -Sx / sqrt(S*Sxx);

chi2 = sum(((y - m*x - b)./sigma).^2);
Q = gammainc((N-2)/2,chi2/2);
return;

