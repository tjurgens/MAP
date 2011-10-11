function outvec = struct2vector(instruct)

for i = 2:length(instruct)
    outvec(i) = instruct(i).number;
end