for iCounter = 2:80
eval(['tmp = wavread(''' directories(iCounter).name ''');'])
tmp = tmp(:,1);
tmp_cut = cutsignal(tmp,sfreq,'a_a');
% if length(tmp_cut) > 0.25*sfreq
%     tmp = tmp_cut;
% end
x = [x' tmp_cut']';

end