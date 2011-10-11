function logalevel = make_levelling(loganumber,pcondition);

if strcmp(pcondition.noiselevel,'nobackgroundnoise')
    logalevel = pcondition.speechlevel+pcondition.leveldifferencecorr(loganumber);
else
    error('levelcorrection should only be done without backgroundnoise!');
end

%error('hallo')