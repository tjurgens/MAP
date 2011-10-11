%skript rename_confusion_matrices

% sammelt die berechneten verwechslungsmatrizen aus den unterverzeichnissen
% und benennt sie nach [var]1 = [var]


   variablennamen = who;
   variablennamenlaenge = length(variablennamen)
   i = 10;
    for j = 1:variablennamenlaenge
        eval([variablennamen{j} num2str(i) ' = ' variablennamen{j} ';']);
        eval(['clear ' variablennamen{j} ';']);
    end
    clear i j variablennamen ans variablennamenlaenge