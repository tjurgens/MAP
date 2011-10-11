function sort_logatomes
%takes from every speaker one logatome and arranges them to directories, so
%that in every directory there are 10 recordings of the same logatome


directory = getDir(pwd);
nr_of_directories = length(directory);

for i = 1:nr_of_directories,
    cd(directory{i});
    cd Whitenoise;
    groupdirectory = getDir(pwd);
    nr_of_groupdirectories = length(groupdirectory);
    for j = 1:nr_of_groupdirectories
        cd(groupdirectory{j});
        File = dir('*.wav');
        nFiles = length(File);
        randomvec = randperm(length(File));
        streichvektor = [];
        for k = 1:nFiles,
            if (findstr('_CS0',File(randomvec(k)).name))
                loga_number = eval(File(randomvec(k)).name(7:9));
                if (find(loga_number == streichvektor))
                    ;
                else
                    if ~isdir(['d:/logatomstatistik1/',iloga2sloga(loga_number),'/'])      
                        mkdir(['d:/logatomstatistik1/',iloga2sloga(loga_number),'/']);
                    end
                    copyfile(['./',File(randomvec(k)).name],['d:/logatomstatistik1/',iloga2sloga(loga_number),'/']);
                    streichvektor(end+1) = loga_number;
                end
            else
                ;
            end
        end
        cd ..
    end
    cd ../..
end
