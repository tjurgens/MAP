function cs = kref2csarea(kref)

%computes the ratio of consecutive cross-sectional areas from reflection
%coefficients
%according to makhoul IEEE 1975

cs = zeros(1,length(kref));
cs(1) = 1;
for iCounter = 2:length(cs)
    cs(iCounter) = cs(iCounter-1)*(kref(iCounter)+1)/(1-kref(iCounter));
end