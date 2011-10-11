function varargout = checksignal(signal,varargin)

%
%                   signal = checksignal(signal)
%          [signal,length] = checksignal(signal)
% [signal,length,channels] = checksignal(signal)
%
%   Returns signal as column vector, optional length and number of
%   channels.
%   Rainer Beutelmann
%

len = length(signal);
[m,n] = size(signal);

if (m == len)
    varargout{1} = signal;
    channels = n;
else
    varargout{1} = signal';
    channels = m;
end

if (nargout >= 2)
    varargout{2} = len
end

if (nargout >= 3)
    varargout{3} = channels;
end