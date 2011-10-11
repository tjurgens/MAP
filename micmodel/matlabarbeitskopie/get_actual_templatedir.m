function correcttemplatedir = get_actual_templatedir(actualdirectory, templatedirectory)
%this function gives back the correct location of the directory in the
%templatedirectorytree where to get the audiosamples;

indexvec = strfind(actualdirectory,'/');
%take the 6th index and one more to avoid double //
endstring = actualdirectory(indexvec(6)+1:end);

correcttemplatedir = [templatedirectory endstring];