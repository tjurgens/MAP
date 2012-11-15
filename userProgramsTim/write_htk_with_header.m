function write_htk_with_header(data,header,outfile,byteswap)

% function write_htk_with_header(data,header,file,byteswap)
%
% writes HTKfile with header 
%
% Michael Kleinschmidt, MEDI, Oct 2002


%open file for write
if byteswap == 0
  fid = fopen(outfile,'w','l');
else
  fid = fopen(outfile,'w','b');
end

% write htk header
write_htk_header(fid,header)

% write data
count = fwrite(fid,data,'float');

%close file
fclose(fid);





