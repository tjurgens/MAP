for i = 1:10
    for j = 1:length(pegel)    
        eval(['hitrate_einzeln(i,j) = (sum(diag(consonantCM' num2str(pegel(j)) 'dBSPL' num2str(i) '))/70 + sum(diag(vowelCM' num2str(pegel(j)) 'dBSPL' num2str(i) '))/80)/2 ;']);
    end
end