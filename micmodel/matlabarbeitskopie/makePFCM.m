function [voicing_confusion_matrix,manner_confusion_matrix,place_confusion_matrix] = makePFCM(consonantphoneme_confusion_matrix)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% summarizes 14x14 consonant confusion matrix to three
% phonemic-feature-confusion-matrices for voicing,manner,place
%
% Tim Jürgens, Sept.2006
%
% usage: [voicing_matrix,manner_matrix,place_matrix] =
%               makePFCM(consonantphoneme_confusion_matrix)
% input: consonantphoneme_confusion_matrix: 14x14 Consonant confusion matrix
% output: voicing_matrix 2x2 Voicing confusion matrix
%         manner_matrix 3x3 Manner confusion matrix
%         place_matrix 3x3 Place of Articulation matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%phonemes adequate for this kind of systematic analysis:
%   d t g k f s b p w m  n 
%   1 2 3 4 5 6 7 8 9 11 12

voicing(2).phonemes = [2,4,5,6,8,10,13];   % z = 10, sch = 13, l = 14
voicing(2).feature = 0;
voicing(1).phonemes = [1,3,7,9,11,12,14];
voicing(1).feature = 1;  %proofed

% z ist nicht einzuordnen, da eigentlich t-s plosiv-frikativ, l hat eigenes
% manner: lateral approximant
manner(1).phonemes = [1,2,3,4,7,8]; %plosiv
manner(1).feature = 0;
manner(2).phonemes = [5,6,9,13]; % sch = 13, frikativ
manner(2).feature = 1;
manner(3).phonemes = [11,12]; %nasal
manner(3).feature = 2;  %proofed

% z ist nicht einzuordnen, da eigentlich t-s plosiv-frikativ, sch ist
% postalveovular
place(1).phonemes = [5,7,8,9,11]; %bilabial
place(1).feature = 0;
place(2).phonemes = [1,2,6,12,14]; % l = 14 medial
place(2).feature = 1;
place(3).phonemes = [3,4]; %velar
place(3).feature = 2;    %proofed


voicing_confusion_matrix = zeros(2);


for i = 1:14  %Schleife über jeden zeileneintrag
    flag = 0;
    %finde richtigen zeileneintrag
    for k = 1:2
        if(find(voicing(k).phonemes == i))
            zeile = k;
            flag = 1; %gefunden!
            break;
        else;
        end
    end
    if(flag)
    for j = 1:14
        %finde richtigen spalteneintrag
        for k = 1:2
            if(find(voicing(k).phonemes == j))
                spalte = k;
                voicing_confusion_matrix(zeile,spalte) = voicing_confusion_matrix(zeile,spalte) + consonantphoneme_confusion_matrix(i,j);
                break;
            else;
            end      
        end
    end
    end
end

manner_confusion_matrix = zeros(3);
for i = 1:13
    flag = 0;
    %finde richtigen zeileneintrag
    for k = 1:3
        if(find(manner(k).phonemes == i))
            zeile = k;
            flag = 1; %gefunden!
            break;
        else;
        end
    end
    if(flag)
    for j = 1:13
        %finde richtigen spalteneintrag
        for k = 1:3
            if(find(manner(k).phonemes == j))
                spalte = k;
                manner_confusion_matrix(zeile,spalte) = manner_confusion_matrix(zeile,spalte) + consonantphoneme_confusion_matrix(i,j);
                break;
            else;
            end      
        end
    end
    end
end

place_confusion_matrix = zeros(3);
for i = 1:14
    flag = 0;
    %finde richtigen zeileneintrag
    for k = 1:3
        if(find(place(k).phonemes == i))
            zeile = k;
            flag = 1; %gefunden!
            break;
        else;
        end
    end
    if(flag)
    for j = 1:14
        %finde richtigen spalteneintrag
        for k = 1:3
            if(find(place(k).phonemes == j))
                spalte = k;
                place_confusion_matrix(zeile,spalte) = place_confusion_matrix(zeile,spalte) + consonantphoneme_confusion_matrix(i,j);
                break;
            else;
            end      
        end
    end
    end
end

voicing_confusion_matrix = make_percentages_CM(voicing_confusion_matrix);
manner_confusion_matrix = make_percentages_CM(manner_confusion_matrix);
place_confusion_matrix = make_percentages_CM(place_confusion_matrix);