function zufaelligeolsasaetzeauswaehlen
cd('d:\tim\OlSa_raw')
File = dir('*.wav');
nFiles = length(File)

index = randperm(nFiles)

for iCounter = 1:20
    copyfile(File(index(iCounter)).name,'d:\tim\OlSa');
end