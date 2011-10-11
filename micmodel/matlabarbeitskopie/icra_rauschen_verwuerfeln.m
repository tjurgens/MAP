function icra_rauschen_verwuerfeln
matlabpath = 'd:\tim\matlab\';

%zufällige auswahl von unkorrelierten rauschabschnitten aus dem
%icranoise_16k.mat-file, bei übertritt über das ende des files wird der
%anfang einfach angeklebt, wobei die phasenlage beachtet wurde.

backnoise = load([matlabpath,'icranoise_16k.mat']);
halbelaenge = floor(length(backnoise.icranoise_re)/2);
rand('state',sum(100*clock));
for i = 1:14
    insamp = floor(rand*length(backnoise.icranoise_re))
    if ((insamp + halbelaenge) < length(backnoise.icranoise_re))
        icranoise_voc{i} = backnoise.icranoise_re(insamp:(insamp + halbelaenge)-1)
        icranoise_test{i} = [backnoise.icranoise_re((insamp + halbelaenge):end)' backnoise.icranoise_re(1:insamp-1)']'
    else
        icranoise_voc{i} =  [backnoise.icranoise_re(insamp:end)' backnoise.icranoise_re(1:halbelaenge-length(backnoise.icranoise_re)+insamp-1)']'
        icranoise_test{i} = backnoise.icranoise_re(halbelaenge-length(backnoise.icranoise_re)+insamp:insamp-1)
    end
end

save icranoisevoc_16k.mat icranoise_voc
save icranoisetest_16k.mat icranoise_test
