function [consonantphoneme_confusion_matrix,vowelphoneme_confusion_matrix] = makePCM(loga_CM)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% summarizes 150x150 logatome confusion matrix to one consonantphoneme
% confusion matrix and one vowel phoneme confusion matrix
%
% Tim Jürgens, Sept.2006
%
% usage: [consonantphoneme_confusion_matrix,vowelphoneme_confusion_matrix] = makePCM(loga_CM)
% input: logaCM: 150x150 Logatome confusion matrix
% output: consonantphoneme_confusion_matrix 14x14 Consonant confusion matrix
%         vowelphoneme_confusion_matrix 10x10 Vowel confusion matrix
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
consonantphoneme_CM(1).logas = [1:14:70];
consonantphoneme_CM(1).name = 'd';
consonantphoneme_CM(2).logas = [2:14:70];
consonantphoneme_CM(2).name = 't';
consonantphoneme_CM(3).logas = [3:14:70];
consonantphoneme_CM(3).name = 'g';
consonantphoneme_CM(4).logas = [4:14:70];
consonantphoneme_CM(4).name = 'k';
consonantphoneme_CM(5).logas = [5:14:70];
consonantphoneme_CM(5).name = 'f';
consonantphoneme_CM(6).logas = [6:14:70];
consonantphoneme_CM(6).name = 's';
consonantphoneme_CM(7).logas = [7:14:70];
consonantphoneme_CM(7).name = 'b'; 
consonantphoneme_CM(8).logas = [8:14:70];
consonantphoneme_CM(8).name = 'p';
consonantphoneme_CM(9).logas = [9:14:70];
consonantphoneme_CM(9).name = 'w';
consonantphoneme_CM(10).logas = [10:14:70];
consonantphoneme_CM(10).name = 'z';
consonantphoneme_CM(11).logas = [11:14:70];
consonantphoneme_CM(11).name = 'm';
consonantphoneme_CM(12).logas = [12:14:70];
consonantphoneme_CM(12).name = 'n';
consonantphoneme_CM(13).logas = [13:14:70];
consonantphoneme_CM(13).name = 'sch';
consonantphoneme_CM(14).logas = [14:14:70];
consonantphoneme_CM(14).name = 'l';

vowelphoneme_CM(1).logas = [71:78];
vowelphoneme_CM(2).name = 'a';
vowelphoneme_CM(2).logas = [79:86];
vowelphoneme_CM(2).name = 'e';
vowelphoneme_CM(3).logas = [87:94];
vowelphoneme_CM(2).name = 'i';
vowelphoneme_CM(4).logas = [95:102];
vowelphoneme_CM(2).name = 'o';
vowelphoneme_CM(5).logas = [103:110];
vowelphoneme_CM(2).name = 'u';
vowelphoneme_CM(6).logas = [111:118];
vowelphoneme_CM(2).name = 'ah';
vowelphoneme_CM(7).logas = [119:126];
vowelphoneme_CM(2).name = 'eh';
vowelphoneme_CM(8).logas = [127:134];
vowelphoneme_CM(2).name = 'ie';
vowelphoneme_CM(9).logas = [135:142];
vowelphoneme_CM(2).name = 'oh';
vowelphoneme_CM(10).logas = [143:150];
vowelphoneme_CM(2).name = 'uh';

consonantphoneme_confusion_matrix = zeros(14);


for i = 1:70
    %finde richtigen zeileneintrag
    for k = 1:14
        if(find(consonantphoneme_CM(k).logas == i))
            zeile = k;
            break;
        else;
        end
    end
    for j = 1:70
        %finde richtigen spalteneintrag
        for k = 1:14
            if(find(consonantphoneme_CM(k).logas == j))
                spalte = k;
                consonantphoneme_confusion_matrix(zeile,spalte) = consonantphoneme_confusion_matrix(zeile,spalte) + loga_CM(i,j);
                break;
            else;
            end      
        end
    end
end

vowelphoneme_confusion_matrix = zeros(10);
for i = 71:150
    %finde richtigen zeileneintrag
    for k = 1:10
        if(find(vowelphoneme_CM(k).logas == i))
            zeile = k;
            break;
        else;
        end
    end
    for j = 71:150
        %finde richtigen spalteneintrag
        for k = 1:10
            if(find(vowelphoneme_CM(k).logas == j))
                spalte = k;
                vowelphoneme_confusion_matrix(zeile,spalte) = vowelphoneme_confusion_matrix(zeile,spalte) + loga_CM(i,j);
                break;
            else;
            end      
        end
    end
end