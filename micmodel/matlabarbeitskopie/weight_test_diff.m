File = dir('*.wav');
nFiles = length(File)
pcondition.speechlevel = 90;
pcondition.noiselevel = 'nobackgroundnoise';
pcondition.audiogram = zeros(11,2);

for i = 1:nFiles
    i
    [signal,fs] = wavread(File(i).name);
    signal = preproc(signal, fs, 'a_a',pcondition);
    IR = pemo_tim(signal,fs);
    IR = IR(:,41:end);
    diffvec(1:30,i) = sum(diff(IR').^2);
end
