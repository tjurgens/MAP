function output = dct_smooth(pattern,dct_coefficients_to_use)

%small function that computes the dct and gives back what is left when
%truncating it.

test=dct(pattern);
output = idct([test(1:dct_coefficients_to_use,:); ...
    zeros(size(pattern,1)-dct_coefficients_to_use,size(pattern,2))]);
