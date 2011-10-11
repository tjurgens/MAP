s = who;
zahl_zum_anhaengen =10;

indexvec = cellfun(@(x) strcmp(x(end-2:end), 'mfb'),s);
to_rename = {s{indexvec}};                   


            
              
      
  

for i = 1:length(to_rename)
    eval([to_rename{i} num2str(zahl_zum_anhaengen) ' = ' to_rename{i} ';']);
    eval(['clear ' to_rename{i} ';']);
end
clear s zahl_zum_anhaengen to_rename ans indexvec i;

