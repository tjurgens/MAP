%sortiert die dateien um einen durchgang zum realistischen spracherkenner
%durchzuführen. tj, 10.11.06

nowdir = pwd;
directory = getDir(pwd);
nr_of_directories = length(directory);

for i = 1:nr_of_directories
    cd(directory{i});
    cd normal_auswahl;
    delete ('*.*');
    cd ..
    cd vocabulary;
    movefile('S02M*L*V6*N2*','..\normal_auswahl');
    cd ../..;   
end