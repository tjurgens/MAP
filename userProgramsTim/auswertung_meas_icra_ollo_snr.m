%Auswertung einer Messung ICRA-OLLO-SNR
function auswertung_meas_icra_ollo_snr(datenstruktur)
for i = 1: length(datenstruktur)
    act_name = ['CM',datenstruktur(i).TestRichtung];
    eval([act_name, '= makeCMfrom_meas(datenstruktur(',num2str(i),').iLogaSpok,datenstruktur(',num2str(i),').iLogaRec);'])
    eval(['hitrate_gesamt',act_name,' = sum(diag(',act_name,'))/sum(sum(',act_name,'));']);
    eval(['[consonants',act_name,',vowels',act_name,'] = makePCM(',act_name,');']);
    eval(['hitrate_consonants',act_name,' = sum(diag(consonants',act_name,'))/sum(sum(consonants',act_name,'));']);
    eval(['hitrate_vowels',act_name,' = sum(diag(vowels',act_name,'))/sum(sum(vowels',act_name,'));']);
    eval(['[voicing',act_name,',manner',act_name,',place',act_name,'] = makePFCM(consonants',act_name,');']);
    eval(['hitrate_voicing',act_name,' = sum(diag(voicing',act_name,'))/sum(sum(consonants',act_name,'))']);
    eval(['hitrate_manner',act_name,' = sum(diag(manner',act_name,'))/sum(sum(consonants',act_name,'))']);
    eval(['hitrate_place',act_name,' = sum(diag(place',act_name,'))/sum(sum(consonants',act_name,'))']);
end
eval(['save ',datenstruktur(1).ClientId,'.mat;']);