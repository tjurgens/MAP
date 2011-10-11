function Directory = getDir(szBaseDir);
% function Directory = getDir(szBaseDir);
% returns a cell array of the subdirectory names in szBaseDir
% © 2003 HDA, Author: Thomas Rohdenburg
% changed 2006 Author: Tim Jürgens

D = dir(szBaseDir);k=0;
Directory{1} = 0;
for i=1:length(D)
    if(D(i).isdir & ~(D(i).name(1) == '.'))
	k=k+1;
	Directory{k}=D(i).name;
    end
end