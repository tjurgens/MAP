function kerfmatrix = make_kerf(alpha,length_template,length_test),
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  generates a (length_template x length_test)-matrix:
%  ones on the diagonal
%  1+alpha x distance_from_diagonal on non-diagonal elements
%  
%  for keeping warp_paths in DTW near to the diagonal, limiting optimizing 
%  process if speech samples are not similar.
%
%  Tim Jürgens, September 2006
%
%  input: alpha: parameter that determines steepness of kerf in matrix
%         length_template: length of template (rows)
%         length_test: length of test (columns)
%  output: kerfmatrix: scaling matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
kerfmatrix = ones(length_template,length_test);

a = [0:0.001:1]; % free parameter of the diagonal
for i = 1:length_template   %through the rows
    for j = 1: length_test  %through the columns
        distance = min(sqrt((i-1-(length_template-1).*a).^2+(j-1-(length_test-1).*a).^2));
        kerfmatrix(i,j) = kerfmatrix(i,j)+ alpha*distance;
    end
end

