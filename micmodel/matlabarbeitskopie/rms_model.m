function rms_value = rms(signal)
length(signal)
rms_value = sqrt(1/length(signal)*sum(signal.^2));