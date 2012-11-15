function write_htk_header(fid,header) 

% number of samples in file
count = fwrite(fid,header.nSamples,'int');

% sample period in 100ns units 
count = fwrite(fid,header.sampPeriod,'int');

% number of bytes per sample
% for 23 frequency channels a 4 bytes this would be 92
% for 80-dim feature vectors, the value should be 320
count = fwrite(fid,header.sampSize,'short');

% a code indicating the sample kind
% 0 = waveform
% 8198 std. for gabor features
count = fwrite(fid,header.sampKind,'short');
