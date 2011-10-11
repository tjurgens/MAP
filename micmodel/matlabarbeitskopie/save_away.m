function save_away(vocabulary,olloset)


% vocnames = fieldnames(voc)
% for j = 1:length(vocnames)
%     eval([vocnames{j} '_' speakerid ' = voc.' vocnames{j} ';']);
% end
cd(['D:\tim\OLLO\S05M_Nmore\' olloset]);
if ~isdir('vocabulary')
     mkdir('vocabulary')
end
cd vocabulary;
if ~isdir('Internal_Representations')
     mkdir('Internal_Representations')
end
cd Internal_Representations;
%clear voc vocnames speakerid j
%to_save = setdiff(who,'olloset');
if exist(['cw' olloset '.mat'],'file')
     newvocabulary = vocabulary;
     load(['cw' olloset '.mat']);
     vocabulary = [vocabulary newvocabulary];
     save(['cw' olloset '.mat'],'vocabulary');
else
     save(['cw' olloset '.mat'],'vocabulary');
end