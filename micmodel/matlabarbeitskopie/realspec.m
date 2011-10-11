function r = realspec(spec)
% symmetrisiert spektrum, um später einfach mit ifft zu einem zeits
% nal kommen zu können.
% Rainer Beutelmann

spec = checksignal(spec);

N = length(spec);
r = spec;
r(1) = abs(r(1));
if (rem(N,2) == 0)
    r(N/2+2:N,:) = conj(r(N/2:-1:2,:));
    r(N/2+1,:) = abs(r(N/2+1,:));
else
    r((N+3)/2:N,:) = conj(r((N+1)/2:-1:2,:));
end