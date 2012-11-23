function [mFeat,header]=load_htk_with_header(infile,byteswap,display_flag)

% [mFeat,header]=load_htk_with_header(infile,byteswap,display_flag)
%
% Example: [mFeat,header]=load_htk_with_header('sponly_vmh0sx116.htk',0,1);
%
% reads HTKfile with header and displays (optional)
%
% Michael Kleinschmidt, ICSI, Oct 2001

% open file
if byteswap
  fid=fopen(infile,'r','b');
else
  fid=fopen(infile,'r');
end

% read header
[header.nSamples, count]=fread(fid,1,'int'); 
[header.sampPeriod, count]=fread(fid,1,'int'); 
[header.sampSize, count]=fread(fid,1,'short'); 
[header.sampKind, count]=fread(fid,1,'short'); 

header

% read data
[indata, count]=fread(fid,inf,'float');
count


% close file
fclose(fid);

% calculate feature dimension
dim=header.sampSize/4;

% rearrange vector to matrix
mFeat = reshape(indata,dim,header.nSamples);  

if display_flag
   
  % Plot

  figure
  
  y=1:1:dim;                
  len=header.nSamples*header.sampPeriod/10^7;
  x=0:header.sampPeriod/10^7:len;          
  imagesc(x, y, mFeat);%, [-0.5 1]);
  axis xy;
  colormap jet;
  set(gca,'FontSize', 20); 
  cb=colorbar;
  set(cb,'FontSize', 20); 
  
  xlabel('time in s');
  ylabel('# feature')
  
end









