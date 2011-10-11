

for i = 1:20
    f_i = (1.5 * 1.41^(-i));
    tar = 0.5;
    prev = input('Trefferquote dieses Trials:');
    slope = 0.056;
    pegelaenderung = round(2*(- (f_i)*(prev-tar)/slope))/2
end