%wojtcak coincidence model

t_step = 0.001;
t = [-1:t_step:1].*1000; %in ms
b = -3.81
sigma1l_minus = 3.04;%10.71
sigma1l_plus = 8.87;%24.66
sigma11h_minus = 7.79;%12.17
sigma11h_plus = 60.45;%59.95
n11=400;%478;
delta = [-.1:0.01:.1].*1000;

%low-frequency probability density distribution
for jCounter = 1:length(delta)
    for iCounter = 1:length(t)
        if t(iCounter) < delta(jCounter)
            fl(jCounter,iCounter) = 2*(2*pi)^(-1/2)*(sigma1l_minus+sigma1l_plus)^(-1).*exp(-1/2*((t(iCounter)-delta(jCounter))/sigma1l_minus)^2);
        else
            fl(jCounter,iCounter) = 2*(2*pi)^(-1/2)*(sigma1l_minus+sigma1l_plus)^(-1).*exp(-1/2*((t(iCounter)-delta(jCounter))/sigma1l_plus)^2);
        end
    end
end

%high-frequency probability density distribution

for iCounter = 1:length(t)
    if t(iCounter) < 0
        fh(iCounter) = 2*(2*pi)^(-1/2)*(sigma11h_minus+sigma11h_plus)^(-1)*exp(-1/2*(t(iCounter)/sigma11h_minus)^2);
    else
        fh(iCounter) = 2*(2*pi)^(-1/2)*(sigma11h_minus+sigma11h_plus)^(-1)*exp(-1/2*(t(iCounter)/sigma11h_plus)^2);
    end
end

 
for jCounter = 1:length(delta)
    %activation probability density
    P11(jCounter) = sum(fl(jCounter,:).*fh);
    %number of activated onset-coincidence detectors
    n_bar11(jCounter) = n11*P11(jCounter);
    %probability that two tones are judged as being "synchronous"
    z11(jCounter) = n_bar11(jCounter)+b;  %(b is some kind of threshold value, more than -b detectors are necessary to detect a tone as being synchronous)
    PSI11(jCounter) = 1./(1+exp(-z11(jCounter)));
end

