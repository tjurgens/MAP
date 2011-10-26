function output = simple_cross_correlation(ANpattern)

for iCounter = 1:size(ANpattern,1)-1 %for every channel
    output(iCounter) = max(xcorr(ANpattern(iCounter,:),ANpattern(iCounter+1,:),'coeff'));
end

