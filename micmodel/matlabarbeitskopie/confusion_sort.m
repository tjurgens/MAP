function c = confusion_sort(CM)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   sorts confusions of the confusion matrix CM
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% here different cases for different kinds of phonemes in the middle
logas_with_1letterphonemes = [71:110];
%logas_with_2letterphonemes = default
logas_with_3letterphonemes = [13, 27, 41, 55, 69]; %sch
c.confusion = [];

for rowindex = 1:size(CM,1)
    colindex = find(CM(rowindex,:));
    for j = 1:length(colindex)
        if (rowindex == colindex(j))
        ;       %no confusion
        else
            loga1 = iloga2sloga(rowindex);
            if find(rowindex == logas_with_1letterphonemes)
            mid_phoneme1 = loga1(2);
            elseif find(rowindex == logas_with_3letterphonemes)
            mid_phoneme1 = loga1(2:4);
            else
                mid_phoneme1 = loga1(2:3);
            end
        
            loga2 = iloga2sloga(colindex(j));
            if find(colindex(j) == logas_with_1letterphonemes)
            mid_phoneme2 = loga2(2);
            elseif find(colindex(j) == logas_with_3letterphonemes)
            mid_phoneme2 = loga2(2:4);
            else
               mid_phoneme2 = loga2(2:3);
            end    
    
            % here put confusions midphoneme1-midphoneme2 and
            % midphoneme2-midphoneme1 together
            tmpcell = sort({mid_phoneme2,mid_phoneme1});
            tmpconfusion = [tmpcell{1} '_' tmpcell{2}];
            flag = 0;
            for tmpcounter = 1:length(c)
                if (strcmp(c(tmpcounter).confusion,tmpconfusion))
                    c(tmpcounter).number = c(tmpcounter).number+CM(rowindex,colindex(j));
                    flag = 1; % gefunden!
                    break;
                else
                    ;
                end
            end
            if (flag == 0)
                c(end+1).confusion = tmpconfusion;
                c(end).number = 1;
            end
        end
    end
    end
    % further evaluation: sort by similar confusions CHOOSE CATEGORIES
        fricatives = {'ff_zz', 'ff_ss', 'ss_zz', 'ff_sch', 'sch_ss', 'sch_zz'};
        fricative_number = 0;
        unvoiced_plosives = {'pp_tt', 'ck_tt', 'ck_pp'};
        unvoiced_plosives_number = 0;
        voiced_plosives = {'bb_dd', 'bb_gg', 'dd_gg'};
        voiced_plosives_number = 0;
        nasals = {'mm_nn'};
        nasals_number = 0;
        long_short_vocals = {'a_ah', 'e_eh', 'i_ie', 'o_oh', 'u_uh'};
        long_short_vocals_number = 0;
        other_number = 0;
        for tmpcounter = 2:length(c),
            if find(~cellfun('isempty',strfind(fricatives,c(tmpcounter).confusion)))
                fricative_number = fricative_number+c(tmpcounter).number;
            elseif find(~cellfun('isempty',strfind(unvoiced_plosives,c(tmpcounter).confusion)))
                unvoiced_plosives_number = unvoiced_plosives_number+c(tmpcounter).number;
            elseif find(~cellfun('isempty',strfind(voiced_plosives,c(tmpcounter).confusion)))
                voiced_plosives_number = voiced_plosives_number+c(tmpcounter).number;
            elseif find(~cellfun('isempty',strfind(nasals,c(tmpcounter).confusion)))
                nasals_number = nasals_number+c(tmpcounter).number;
            elseif find(~cellfun('isempty',strfind(long_short_vocals,c(tmpcounter).confusion)))
                long_short_vocals_number = long_short_vocals_number+c(tmpcounter).number;
            else
                other_number = other_number+c(tmpcounter).number;
            end
        end
        c(end+1).confusion = 'fricatives';
        c(end).number = fricative_number;
        c(end+1).confusion = 'unvoiced_plosives';
        c(end).number = unvoiced_plosives_number;
        c(end+1).confusion = 'voiced_plosives';
        c(end).number = voiced_plosives_number;
        c(end+1).confusion = 'nasals';
        c(end).number = nasals_number;
        c(end+1).confusion = 'long_short_vocals';
        c(end).number = long_short_vocals_number;
        c(end+1).confusion = 'other';
        c(end).number = other_number;
        
        
       %%%%%%%%%%%% AUSWERTUNG %%%%%%%%%%%%%%%%%%5 
        %% weitere verarbeitung möglich mit :

conf_vec = struct2vector(c);
for tmpcounter = 1:length(conf_vec)
    if (findstr(c(tmpcounter).confusion,'a') |findstr(c(tmpcounter).confusion,'e') )
         initialvocalentry = tmpcounter;
         break;
    else
         ;
    end
end


%% consonants evaluation
fighandle1 = figure;
bar(conf_vec(2:initialvocalentry-1));
xlabels = {c(2:initialvocalentry-1).confusion};
xticklabel_rotate(xlabels,90);
ylabel('number of confusions');
title('consonants confusion');

% vocals evaluation
fighandle2 = figure;
bar(conf_vec(initialvocalentry:end-6));
xlabels = {c(initialvocalentry:end-6).confusion};
xticklabel_rotate(xlabels,45);
ylabel('number of confusions');
title('vocal confusion');

arrange(fighandle1,fighandle2);
