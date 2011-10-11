function outmatrix = make_percentages_CM(inmatrix)
for iCounter = 1:size(inmatrix,1) %counts through rows
    outmatrix(iCounter,:) = inmatrix(iCounter,:)./sum(inmatrix(iCounter,:)).*100;
end