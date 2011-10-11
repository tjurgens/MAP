function r = recognize_sort(CM)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  evaluates recognized logatome-confusion-matrix
%  which middle phonemes were best recognized?
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% here different cases for different kinds of phonemes in the middle
logas_with_1letterphonemes = [71:110];
%logas_with_2letterphonemes = default
logas_with_3letterphonemes = [13, 27, 41, 55, 69];
r.recognized = [];  %structure that contains the right recognized middle phonemes

diagonale = diag(CM);
for i = 1:length(diagonale),
   loga = iloga2sloga(i);
   if find(i == logas_with_1letterphonemes)
      mid_phoneme = loga(2);
   elseif find(i == logas_with_3letterphonemes)
      mid_phoneme = loga(2:4);
   else
      mid_phoneme = loga(2:3);
   end
   flag = 0;
   for tmpcounter = 1:length(r)
      if (strcmp(r(tmpcounter).recognized,mid_phoneme))
         r(tmpcounter).number = r(tmpcounter).number+diagonale(i);
         flag = 1; % gefunden!
         break;
      else
            ;
      end
   end
   if (flag == 0)
      r(end+1).recognized = mid_phoneme;
      r(end).number = diagonale(i);
   end
end


%% weitere verarbeitung möglich mit :

rec_vec = struct2vector(r);
for tmpcounter = 1:length(rec_vec)
    if (findstr(r(tmpcounter).recognized,'a'))
         initialvocalentry = tmpcounter;
         break;
    else
         ;
    end
end


%% consonants evaluation
fighandle1 = figure;
bar(rec_vec(2:initialvocalentry-1));
xlabels = {r(2:initialvocalentry-1).recognized};
xticklabel_rotate(xlabels,90);
ylabel('number of correct recognized consonants');

% vocals evaluation
fighandle2 = figure;
bar(rec_vec(initialvocalentry:end));
xlabels = {r(initialvocalentry:end).recognized};
xticklabel_rotate(xlabels,45);
ylabel('number of correct recognized vocals');

arrange(fighandle1,fighandle2);