function outnoise = internal_noise(mean,standarddeviation,length)
% this function computes internal noise for usage within a perception model
% mean and standarddeviation are given in model units
% length is given in samples

randn('state',sum(100*clock)); %Tageszeitabhängiger Zustand des Zufallsgenerators 

outnoise = (randn(length,1)+mean).*standarddeviation;
outnoise = outnoise';