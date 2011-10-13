function correcttemplatedir = get_actual_templatedir(actualdirectory, templatedirectory)
%this function gives back the correct location of the directory in the
%templatedirectorytree where to get the audiosamples;

if strncmp(computer,'PC',2)
    f = '\';
else  % isunix
    f = '/';
end

indexvec = strfind(actualdirectory,f);
%take the 6th index and one more to avoid double //
endstring = actualdirectory(indexvec(end-4)+1:end);

correcttemplatedir = [templatedirectory endstring];