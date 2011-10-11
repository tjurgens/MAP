function CM = makeCMfrom_meas(iLogaspoken,iLogarec)

CM = zeros(150);
for i = 1:length(iLogaspoken)
    actual_row = iLogaspoken(i);
    actual_col = iLogarec(i);
    CM(actual_row,actual_col) = CM(actual_row,actual_col)+1;
end