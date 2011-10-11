function out = glottis(freq,sfreq,T,samples)
%freq: anregungsfrequenz
%sfreq: samplingfrequenz
%T: Gesamtzeit des Glottisimpulses in ms (0.5 is typical)
%samples: Gesamtlänge des out-vektors

N = round(T*sfreq/1000);
N2 = round(N/3.36);
N1 = N-N2;

y(1:N1) = 0.5*(1-cos(pi*(1:N1)/N1));
y(N1+1:N) = cos(pi*((N1+1:N)-N1)/2/N2);

deltaimpulse = [y,zeros(1,floor(sfreq/freq)-length(y))];
pulsfolge = [];

while(length(pulsfolge)<(samples))
    pulsfolge = [pulsfolge,deltaimpulse];
end
pulsfolge = pulsfolge(1:samples);
pulsfolge = pulsfolge/rms(pulsfolge);

out = pulsfolge;