function outlevel = getSPL(peri),

currdir = pwd;
homedir = ['D:\tim\OLLO\S01F_NO\Whitenoise\',peri,'_',peri,'\'];
cd(homedir)
File = dir('*.wav');

for i = 1:length(File)
    tmp = wavread(File(i).name);
    outlevel(i) = meanpeaklevel(tmp);
end
cd(currdir);