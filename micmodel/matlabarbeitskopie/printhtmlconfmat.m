function printhtmlconfmat(CM, phonemestring, htmlfilename);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% output for evaluation: prints html-code to filename
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% usage: printhtmlconfmat(CM, phonemestring, htmlfilename);
%
% htmlfilename: filename to save the html-file
% CM: confusion matrix (relative point of view)
%
% originally (c) by Thomas Rohdenburg, adapted to Speech Recognition Purposes by Tim Jürgens
% December 2006
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
tbwidth = 650; %table width
% print head of html-file
fid = fopen(htmlfilename,'w');
fprintf(fid,'<html>\r\n<head><title>%s</title></head>\r\n','OLLO');
fprintf(fid,'<body>\r\n');
fprintf(fid,'<h2 align=center>Confusion Matrix</h2>\r\n');

% start with tables 1st row

fprintf(fid,'<table align=center>\r\n',tbwidth);
fprintf(fid,'<tr>\r\n<td>&nbsp;</td>');
% fprintf(fid,'<th>File</th>');
% fprintf(fid,'<th>Logatome</th>');
numrows = size(CM,1);
numcolumns = size(CM,2);

 for i=1:numcolumns
     fprintf(fid,'<th>%s</th>',phonemestring{i});
 end
 fprintf(fid,'</tr>\r\n');

% all following rows

for kk=1:numrows

     %fprintf(fid,'<td><a href="%s">%s</a></td>',File(kk).name,File(kk).name);
     fprintf(fid,'<td align=center><b>%s</b></td>',phonemestring{kk});

     for ii=1:numcolumns    
         % teile in 16 Graustufen ein
         if 15/16 < CM(kk,ii) && CM(kk,ii) <= 1
                 color = '000000';
                 fontcolor = 'ffffff';
         elseif 14/16 < CM(kk,ii) && CM(kk,ii) <= 15/16
                 color = '111111';
                 fontcolor = 'ffffff';
             elseif 13/16 < CM(kk,ii) && CM(kk,ii) <= 14/16
                 color = '222222';
                 fontcolor = 'ffffff';
             elseif 12/16 < CM(kk,ii) && CM(kk,ii) <= 13/16
                 color = '333333';
                 fontcolor = 'ffffff';
             elseif 11/16 < CM(kk,ii) && CM(kk,ii) <= 12/16
                 color = '444444';
                 fontcolor = 'ffffff';
             elseif 10/16 < CM(kk,ii) && CM(kk,ii) <= 11/16
                 color = '555555';
                 fontcolor = 'ffffff';
             elseif 9/16 < CM(kk,ii) && CM(kk,ii) <= 10/16
                 color = '666666';
                 fontcolor = 'ffffff';
             elseif 8/16 < CM(kk,ii) && CM(kk,ii) <= 9/16
                 color = '777777';
                 fontcolor = 'ffffff';
             elseif 7/16 < CM(kk,ii) && CM(kk,ii) <= 8/16
                 color = '888888';
                 fontcolor = 'ffffff';
             elseif 6/16 < CM(kk,ii) && CM(kk,ii) <= 7/16
                 color = '999999';
                 fontcolor = '000000';
             elseif 5/16 < CM(kk,ii) && CM(kk,ii) <= 6/16
                 color = 'aaaaaa';
                 fontcolor = '000000';
             elseif 4/16 < CM(kk,ii) && CM(kk,ii) <= 5/16
                 color = 'bbbbbb';
                 fontcolor = '000000';
             elseif 3/16 < CM(kk,ii) && CM(kk,ii) <= 4/16
                 color = 'cccccc';
                 fontcolor = '000000';
             elseif 2/16 < CM(kk,ii) && CM(kk,ii) <= 3/16
                 color = 'dddddd';
                 fontcolor = '000000';
             elseif 1/16 < CM(kk,ii) && CM(kk,ii) <= 2/16
                 color = 'eeeeee';
                 fontcolor = '000000';
         elseif 0 <= CM(kk,ii) && CM(kk,ii) <= 1/16
                 color = 'ffffff';
                 fontcolor = '000000';
         else
                 color = 'FF0000';
         end
         if strcmp(color,'ffffff')
              fprintf(fid,'<td width=50 bgcolor=#%s>&nbsp;</td>\r\n',color);
         else
             fprintf(fid,'<td width=50 bgcolor=#%s><font color=#%s><center><b>%0.0f</b></center></font></td>\r\n',color,fontcolor,100*CM(kk,ii));
             %fprintf(fid,'<td width=50 bgcolor=#%s><font color=#%s><center><b>%0.0f</b></center></font></td>\r\n',color,fontcolor,CM(kk,ii));
         end
     end
     fprintf(fid,'</tr>\r\n');
end
fprintf(fid,'</table>\r\n');

% %start with parameter table
% fprintf(fid,'<table>\r\n');
% fprintf(fid,'<tr><td>Sampling Frequency:</td><td>%d Hz</td></tr>\r\n',sfreq);
% fprintf(fid,'<tr><td>Variability of Vocabulary:</td><td>%d</td></tr>\r\n',vocabulary(1).variability);
% fprintf(fid,'<tr><td>Variability Tested:</td><td>%s</td></tr>\r\n',File(1).name(12));
% fprintf(fid,'<tr><td>Algorithm:</td><td>%s</td></tr>\r\n\n','Dynamic Time Warp');
% fprintf(fid,'<tr><td>Speech Level of Testfiles:</td><td>%d</td></tr>\r\n\n',pcondition.speechlevel);
% if (ischar(pcondition.noiselevel))
%     fprintf(fid,'<tr><td>Noise Level of Testfiles:</td><td>%s</td></tr>\r\n\n',pcondition.noiselevel);
% else
%     fprintf(fid,'<tr><td>Noise Level of Testfiles:</td><td>%d</td></tr>\r\n\n',pcondition.noiselevel);
% end
% fprintf(fid,'<tr><td>Audiogram:</td><td>');
% for i = 1:length(pcondition.audiogram)
%     fprintf(fid,'%d  ',pcondition.audiogram(i));
% end
% if (length(struct2cell(pcondition)) == 4)
%     fprintf(fid,'<tr><td>Number of Modulation Channels:</td><td>%d</td></tr>\r\n\n',pcondition.nrmodchan);
% end
% fprintf(fid,'</td></tr>\r\n\n');
% fprintf(fid,'<tr><td>Filename of Vocabulary:</td><td>%s</td></tr>\r\n\n',filename_voc);
% fprintf(fid,'</table><br>\r\n');
% 
% if strfind(filename_voc,'a_a');
%     fprintf(fid,'<table>\r\n');
%     if (ischar(pcondition.noiselevel))
%         fprintf(fid,'<tr><td><img src="../vocabulary/%s" height = "400"></td>',['atta_pp_',pcondition.noiselevel,'_',num2str(pcondition.speechlevel),'.jpg']);
%         fprintf(fid,'<td><img src="%s" height = "400"></td></tr>',['atta_pp_',pcondition.noiselevel,'_',num2str(pcondition.speechlevel),'.jpg']);
%         
%     else
%         fprintf(fid,'<tr><td><img src="../vocabulary/%s" height = "400"></td>',['atta_pp_',num2str(pcondition.noiselevel),'_',num2str(pcondition.speechlevel),'.jpg']);
%         fprintf(fid,'<td><img src="%s" height = "400"></td></tr>',['atta_pp_',num2str(pcondition.noiselevel),'_',num2str(pcondition.speechlevel),'.jpg']);
%         
%     end
%     fprintf(fid,'<tr><td align="center">Vocabulary "atta"</td><td align = "center">Testfile "atta"</td></tr></table>');
% end
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%
% % calculate hitrate
% %%%%%%%%%%%%%%%%%%%%%%
% right_recognized = sum(diag(CM));
% sum_of_trials = sum(sum(CM));
% hitrate = right_recognized/sum_of_trials*100; %hitrate in percent
% fprintf(fid,'<br><br><br> Hitrate: %0.1f%%\r\n',hitrate);

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