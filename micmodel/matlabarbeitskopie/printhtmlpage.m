function printhtmlpage(filename, vocabulary, File, CM, distance, sfreq, pcondition, filename_voc);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% output for evaluation: prints html-code to filename
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% usage: printhtmlpage(filename, vocabulary, File, CM, distance,
%                      sfreq, pcondition, filename_voc);
%
% filename: filename to save the html-file
% vocabulary: all internal representations of the vocabulary
% File: all filenames of the testfiles
% CM: confusion matrix
% distance: matrix of distance entries
% sfreq: sampling frequency
% pcondition: peripheral condition, 
%           pcondition.speechlevel: level of speech in dB SPL for PeMo
%           pcondition.noiselevel: level of noise in dB SPL for PeMo
%           pcondition.audiogram: 'mean' audiogram for both ears in dB HL
% filename_voc: filename of the used vocabulary
%
% originally (c) by Thomas Rohdenburg, adapted to Speech Recognition by Tim Jürgens
% March 2006
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
global backnoiseshift
tbwidth = 300; %table width
numvocabulary = length(vocabulary);    %number of vocabulary
%right=0;
numFiles = length(File(1:end,1));       %number of testfiles

% print head of html-file
fid = fopen(filename,'w');
fprintf(fid,'<html>\r\n<head><title>%s</title></head>\r\n','OLLO');
fprintf(fid,'<body>\r\n');
fprintf(fid,'<h2 align=center>Speaker%s</h2>\r\n',File(1).name(2:4));

% start with distance table
% 1st row
fprintf(fid,'Time Normalized Distance between Vocabulary Logatome (Abscissa) and Test Logatome (Ordinate) in arb.units.<br>');
fprintf(fid,'<table width=%d>\r\n',tbwidth);
fprintf(fid,'<tr>\r\n');
fprintf(fid,'<th>File</th>');
fprintf(fid,'<th>Logatome</th>');
for i=1:numvocabulary
    fprintf(fid,'<th>%s</th>',vocabulary(i).name);
end
fprintf(fid,'</tr>\r\n');

% all following rows
for kk=1:numFiles

     fprintf(fid,'<td><a href="%s">%s</a></td>',File(kk).name,File(kk).name);
     fprintf(fid,'<td align=center><b>%s</b></td>',iloga2sloga(eval(File(kk).name(7:9))));

     for ii=1:numvocabulary            
         color=cellstr(repmat('F0F0F0',numvocabulary,1));
         [maxi,maxind] = sort(distance(kk,:));
 %       maxind=maxind(end:-1:1);
         color{maxind(1)}='F05522';
         if numvocabulary >4
             color{maxind(2)}='FAAA99';
             color{maxind(3)}='FCCCBB';
         end
         fprintf(fid,'<td align=right; bgcolor=#%s>%0.2f</td>\r\n',color{ii},distance(kk,ii));
     end
     fprintf(fid,'</tr>\r\n');
end
fprintf(fid,'</table>\r\n');

%start with parameter table
fprintf(fid,'<table>\r\n');
fprintf(fid,'<tr><td>Sampling Frequency:</td><td>%d Hz</td></tr>\r\n',sfreq);
fprintf(fid,'<tr><td>Variability of Vocabulary:</td><td>%d</td></tr>\r\n',vocabulary(1).variability);
fprintf(fid,'<tr><td>Variability Tested:</td><td>%s</td></tr>\r\n',File(1).name(12));
fprintf(fid,'<tr><td>Algorithm:</td><td>%s</td></tr>\r\n\n','Dynamic Time Warp');
fprintf(fid,'<tr><td>Speech Level of Testfiles:</td><td>%d</td></tr>\r\n\n',pcondition.speechlevel);
if (ischar(pcondition.noiselevel))
    fprintf(fid,'<tr><td>Noise Level of Testfiles:</td><td>%s</td></tr>\r\n\n',pcondition.noiselevel);
else
    fprintf(fid,'<tr><td>Noise Level of Testfiles:</td><td>%d</td></tr>\r\n\n',pcondition.noiselevel);
end
fprintf(fid,'<tr><td>Audiogram:</td><td>');
for i = 1:length(pcondition.audiogram)
    fprintf(fid,'%d  ',pcondition.audiogram(i));
end
if (length(struct2cell(pcondition)) == 4)
    fprintf(fid,'<tr><td>Number of Modulation Channels:</td><td>%d</td></tr>\r\n\n',pcondition.nrmodchan);
end
fprintf(fid,'</td></tr>\r\n\n');
fprintf(fid,'<tr><td>Filename of Vocabulary:</td><td>%s</td></tr>\r\n\n',filename_voc);
fprintf(fid,'</table><br>\r\n');

if strfind(filename_voc,'a_a');
    fprintf(fid,'<table>\r\n');
    if (ischar(pcondition.noiselevel))
        fprintf(fid,'<tr><td><img src="../vocabulary/%s" height = "400"></td>',['atta_pp_',pcondition.noiselevel,'_',num2str(pcondition.speechlevel),'.jpg']);
        fprintf(fid,'<td><img src="%s" height = "400"></td></tr>',['atta_pp_',pcondition.noiselevel,'_',num2str(pcondition.speechlevel),'.jpg']);
        
    else
        fprintf(fid,'<tr><td><img src="../vocabulary/%s" height = "400"></td>',['atta_pp_',num2str(pcondition.noiselevel),'_',num2str(pcondition.speechlevel),'.jpg']);
        fprintf(fid,'<td><img src="%s" height = "400"></td></tr>',['atta_pp_',num2str(pcondition.noiselevel),'_',num2str(pcondition.speechlevel),'.jpg']);
        
    end
    fprintf(fid,'<tr><td align="center">Vocabulary "atta"</td><td align = "center">Testfile "atta"</td></tr></table>');
end


%%%%%%%%%%%%%%%%%%%%%%%
% calculate hitrate
%%%%%%%%%%%%%%%%%%%%%%
right_recognized = sum(diag(CM));
sum_of_trials = sum(sum(CM));
hitrate = right_recognized/sum_of_trials*100; %hitrate in percent
fprintf(fid,'<br><br><br> Hitrate: %0.1f%%\r\n',hitrate);
fprintf(fid,'<br><br><br> Backnoiseshift: %0.1f%%\r\n',backnoiseshift);
%%%%%%%%% this is optionally for the two columns, which visualize hitrate
% fprintf(fid,'</table>\r\n');
% fprintf(fid,'<br><br><br>\r\n');
% fprintf(fid,'<table width=%d>\r\n',tbwidth);
% fprintf(fid,'<tr>\r\n');
% fprintf(fid,'<td valign="bottom"><img src="../right.gif" width="50" height="%0.0f"></td>\r\n',fix(right*100/numFiles));
% fprintf(fid,'<td valign="bottom"><img src="../wrong.gif" width="50" height="%0.0f"></td>\r\n',fix((numFiles-right)*100/numFiles));
% fprintf(fid,'</tr>\r\n');
% fprintf(fid,'<tr>\r\n');
% fprintf(fid,'<td>%0.1f%%<br>right</td>\r\n',right*100/numFiles);
% fprintf(fid,'<td>%0.1f%%<br>wrong</td>\r\n',(numFiles-right)*100/numFiles);
% fprintf(fid,'</tr>\r\n');
% fprintf(fid,'</table>\r\n');
% -----------------------------
fprintf(fid,'</body>\r\n');
fprintf(fid,'</html>\r\n');
fclose(fid);