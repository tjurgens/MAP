function [initialsample_frame,energy] = compute_energy(signal,sfreq)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% this function computes the energy of signal in frames and gives
% back the initialsamplingvalue of the frame and the energy in this frame
% as a vector over the whole signal
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

Framelength = 0.01*sfreq;                       %Framelength in samples
initialsample_frame = [1:Framelength:length(signal)];

for i = 1:length(initialsample_frame)-1,
    energy(i) = sum(signal(((i-1)*Framelength)+1:i*Framelength).^2);
end

energy(length(initialsample_frame)) = sum(signal(((length(initialsample_frame)-1)*Framelength)+1:length(signal)).^2);
    