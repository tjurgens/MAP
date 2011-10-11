function [m,b,sigma_m,sigma_b,r_mb,chi2,Q] = fitlines(x,y,sigma)
%
% fitlines fits lines m*x+b to data y(x) along the first dimension of y,
% returns best slopes m and axis intercepts b,
% in addition the standard deviations of m and b,
% the correlation coefficients r_mb,
% the chi^2-values and the goodness(es)-of-fits Q.
%
% The formulas are taken from numerical recipes, chapter 15.2.
%
% INPUT ARGUMENTS
%
% 1. x       values on the abscissa  : vector
% 2. y       values on the ordinate  : vector, matrix or Nd-array, size(y,1)     = length(x)
% 3. sigma   standard deviations of x: vector, matrix or Nd-array, size(sigma,1) = length(x), default: ones(size(y));
%
% OUTPUT ARGUMENTS
%
% 1. m       slopes of the fitted lines
% 2. b       axis intercepts of the fitted lines
% 3. sigma_m standard deviations of the slopes of the fitted lines
% 4. sigma_b standard deviations of the axis intercepts of the fitted lines
% 5. r_mb    correlation coefficients between sigma_m and sigma_b
% 6. chi2    chi^2-values, residual quadratic error measures (including sigma)
% 7. Q       goodness(es) of fits
%
% AUTHOR  :   Helmut Riedel
% DATE    :   June 2008
%
% USAGE   :   [m,b,sigma_m,sigma_b,r_mb,chi2,Q] = fitlines(x,y,sigma);
% EXAMPLES:   [m,b,sigma_m,sigma_b,r_mb,chi2,Q] = fitlines((0:.01:1)',(0:.01:1)'*2    +3+0.1*randn(101,1),ones(101,1));
%             [m,b,sigma_m,sigma_b,r_mb,chi2,Q] = fitlines((0:.01:1)',(0:.01:1)'*(2:4)+3+0.1*randn(101,3),ones(101,3));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1. set default output arguments, handling of input arguments %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = []; b = []; sigma_m = []; sigma_b = []; r_mb = []; chi2 = []; Q = [];
if nargin < 3 | isempty(sigma)
  sigma = ones(size(y));
end
if nargin < 2
  error([mfilename ': at least inputs x and y must be specified']);
end

%% check x for vector input
N = length(x);
if prod(size(x)) ~= N
  error([mfilename ': x must be a vector']);
end
x = x(:);                              % make x a column vector

%% determine size of other dimensions
datasize = size(y);
notN = datasize(2:end);                % not N
if length(notN) == 1
  notN = [1 notN];                     % make it a size-quantity, leads to a row-vector
end
O = prod(notN);                        % product of the Other dimensions

%% check size of y and sigma
if datasize(1) ~= N
  error([mfilename ': length of x and size(y,1) must be identical']);
end
if datasize ~= size(sigma)             % one could allow e.g.  y [T C W], sigma [C W], but too general, user must repmat himself
  error([mfilename ': size of y and sigma must be identical']);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2. repmat x and respape y and sigma to size [N O] %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x     = repmat(x,[1 O]);            % [N O]
y     = reshape(y,[N O]);           % [N O]
sigma = reshape(sigma,[N O]);       % [N O]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 3. write down the formulas and reshape to original size %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S   = sum(1./sigma.^2);
Sx  = sum(x./sigma.^2); 
Sy  = sum(y./sigma.^2);
Sxx = sum(x.^2./sigma.^2); 
Sxy = sum(x.*y./sigma.^2);

Delta = S.*Sxx - Sx.^2;
m = (S.*Sxy  - Sx.*Sy)./ Delta;     % slopes
m = reshape(m,notN);

if nargout > 1
  b = (Sxx.*Sy - Sx.*Sxy)./ Delta;  % axis intercepts
  b = reshape(b,notN);
end

if nargout > 2
  sigma_m = sqrt(S./Delta);         % standard deviations of slopes
  sigma_m = reshape(sigma_m,notN);
end

if nargout > 3
  sigma_b = sqrt(Sxx./Delta);       % standard deviations of axis intercepts
  sigma_b = reshape(sigma_b,notN);
end

if nargout > 4
  r_mb = -Sx ./ sqrt(S.*Sxx);       % correlation coefficients between a and b
  r_mb = reshape(r_mb,notN);
end

if nargout > 5                      % chi^2-values
  chi2 = sum(((y - repmat(m(:)',[N 1]).*x - repmat(b(:)',[N 1]))./sigma).^2);
  chi2 = reshape(chi2,notN);        % m(:)' and b(:)' since m and b were already reshaped (nargout)
end

if nargout > 6                      % Q-values, goodness(es) of fits
  Q = gammainc((N-2)/2,chi2(:)'/2); % chi2(:)' since chi2 was already reshaped (nargout)
  Q = reshape(Q,notN); 
end
return;
